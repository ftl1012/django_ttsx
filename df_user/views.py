# coding: utf8

import re
from hashlib import sha1
from django.http import JsonResponse, HttpResponseRedirect
from django.shortcuts import render, HttpResponse, redirect
from django.core.paginator import Paginator
from df_user.models import *
from . import user_decorator
from df_order.models import *


# Create your views here.


def register(request):
    return render(request, 'df_user/register.html')


# 注册
def register_handle(request):
    # 接收用户输入
    post = request.POST
    uname = post.get('user_name')
    upwd = post.get('pwd')
    upwd2 = post.get('cpwd')
    uemail = post.get('email')

    # 虽然js已经写了一遍验证，但是当网络不好或者其他原因时，会绕过前端的js验证，所以最好再加上后台验证

    # 判断用户是否填写了信息
    if not (uname and upwd and upwd2 and uemail):
        return redirect('/user/register/')

    # 判断姓名长度
    if len(uname) < 5 or len(uname) > 20:
        return redirect('/user/register/')

    # 验证用户名是否已经存在
    if UserInfo.objects.filter(uname=uname).count() != 0:
        return redirect('/user/register/')

    # 判断两次密码
    if upwd != upwd2 or len(upwd) < 8 or len(upwd) > 20:
        return redirect('/user/register/')

    # 验证邮箱
    if re.match("^[a-z0-9][\w\.\-]*@[a-z0-9\-]+(\.[a-z]{2,5}){1,2}$", uemail) == None:  # re.match匹配失败时返回None
        return redirect('/user/register/')

    # 密码加密
    s1 = sha1()
    s1.update(upwd.encode("utf-8"))  # 必须指定要加密的字符串的字符编码
    upwd3 = s1.hexdigest()  # 获得加密之后的结果

    user = UserInfo()
    # 创建对象,保存到数据库
    user = UserInfo()
    user.uname = uname
    user.upwd = upwd3
    user.uemail = uemail
    user.save()

    # 注册成功，转到登录界面
    return redirect('/user/login/')


def register_exist(request):  # 判断用户名是否已经存在
    uname = request.GET.get('uname')
    count = UserInfo.objects.filter(uname=uname).count()  # count为0或1
    return JsonResponse({'count': count})


def login(request):
    uname = request.COOKIES.get('uname', '')  # 获取cookie
    context = {'title': '用户登录', 'error_name': 0, 'error_pwd': 0, 'uname': uname}
    return render(request, 'df_user/login.html', context)


def login_handle(request):
    # 接受请求信息
    post = request.POST
    uname = post.get('username')
    upwd = post.get('pwd')
    jizhu = post.get('jizhu', 0)  # 当jizhu有值时,即jizhu被勾选等于1时,返回的数据为1,否则采用默认值0

    # 根据用户名查询对象
    users = UserInfo.objects.filter(uname=uname)  # 查询结果为一个列表

    # 判断：如果未查到则说明用户名错误，如果查到则判断密码是否正确，如果密码正确，则返回用户中心
    if len(users) == 1:
        s1 = sha1()
        s1.update(upwd.encode("utf-8"))
        if s1.hexdigest() == users[0].upwd:
            url = request.COOKIES.get('url', '/')  # 获取登录之前进入的页面,如果没有,则进入首页
            red = HttpResponseRedirect(url)  # 用变量记住,方便设置cookie，
            # 记住用户名
            if jizhu != 0:
                red.set_cookie('uname', uname)  # 设置cookie保存用户名
            else:
                red.set_cookie('uname', '', max_age=-1)  # max_age指的是过期时间,当为-1时为立刻过期
            request.session['user_id'] = users[0].id  # 把用户id和名字放入session中
            request.session['user_name'] = uname
            return red  # 没有直接return redirect()，是为了保存cookie信息
        else:
            context = {'title': '用户登录', 'error_name': 0, 'error_pwd': 1, 'uname': uname, 'upwd': upwd}
            return render(request, 'df_user/login.html', context)
    context = {'title': '用户登录', 'error_name': 1, 'error_pwd': 0, 'uname': uname, 'upwd': upwd}
    return render(request, 'df_user/login.html', context)


def logout(request):
    # request.session.flush()     #清空session信息
    del request.session['user_id']
    del request.session['user_name']
    return redirect('/goods')


from df_goods.models import GoodsInfo


@user_decorator.login  # 装饰器用于用户登录验证
def info(request):
    # 之前的Cookie里面设置了userID,可以利用UserID查找到用户、
    userId = request.session['user_id']
    print("用户中心--用户ID:", userId)
    userInfo = UserInfo.objects.get(id=userId)
    user_email = userInfo.uemail
    username = request.session['user_name']
    # print("用户中心-个人信息", userInfo.uemail, '用户：', username)
    '''
        基于Cooki实现
        # goods_ids = request.COOKIES.get('goods_ids', '')    #为str型
        # goods_ids1 = goods_ids.split(',')   #进行切片,获得list型
    '''
    goods_list = request.session.get('goods_ids')
    recent_list = []
    print("用户中心的最近浏览：", goods_list, type(goods_list))
    for goods_id in goods_list:
        print("最近浏览获取商品id:", goods_id)
        good = GoodsInfo.objects.get(id=goods_id)
        print(good.gtype)
        recent_list.append(good)

    content = {
        'title': '用户中心',
        'user_name': username,
        'user_email': user_email,
        'recent_list': recent_list
    }
    return render(request, 'df_user/user_center_info.html', content)


@user_decorator.login
def site(request):
    user = UserInfo.objects.get(id=request.session['user_id'])
    if request.method == 'POST':
        post = request.POST
        user.ushou = post.get('ushou')
        user.uaddress = post.get('uaddress')
        user.uyoubian = post.get('uyoubian')
        user.uphone = post.get('uphone')
        if not (user.ushou and user.uaddress and user.uaddress and user.uphone):
            return redirect('/user/site/')
    context = {'title': '用户中心', 'user': user}
    user.save()
    return render(request, 'df_user/user_center_site.html', context)


@user_decorator.login
def order(request):
    page = 1
    content = {}
    user_id = request.session['user_id']
    user = UserInfo.objects.get(id=user_id)
    print('============', user)
    content['user'] = user
    content['title'] = '用户中心'
    content['order'] = None
    try:
        order = OrderInfo.objects.filter(ouser=user_id).order_by('-oid')  # 拿到用户的订单　分页返回
        print("=========", order)
        paginator = Paginator(order, 2)  # 获取分页对象
        page_id = page if page else 1  # 没参数默认第一页
        page = paginator.page(int(page_id))  # 按参数获取页面
        content["order"] = page
        print("===========", order.filter(ouser_id=1)[0].otime)
        goods = order[0].orderdetailinfo_set.all()[0].ogoods.gtitle
        print("===========", goods)
    except Exception as e:
        print(e)
    return render(request, 'df_user/user_center_order.html', content)
