from django.shortcuts import render,redirect
from django.http import JsonResponse
from df_user import user_decorator
from df_user.models import *
from df_carts.models import *
# Create your views here.

@user_decorator.login
# 购物车
def cart(request):      # 购物车
    uid =request.session['user_id']
    carts = CartInfo.objects.filter(user_id=uid)
    context = {
        'title':'购物车',
        'page_name':1,
        'carts':carts,
    }
    return render(request, 'df_cart/cart.html', context)

@user_decorator.login
def add(request, gid, count):
    # 分别为商品的id和数量
    uid = request.session.get('user_id')
    gid = int(gid)
    count = int(count)
    carts = CartInfo.objects.filter(user_id=uid, goods_id=gid)
    if len(carts) >= 1:   # 购物车有无商品和用户的信息
        cart = carts[0]   # 选择第一个用户
        cart.count = cart.count + count
    else:
        cart = CartInfo()
        cart.user_id = uid
        cart.goods_id = gid
        cart.count = count
    cart.save()

    # list和detail页面添加购物车信息有2个信息
    # 如果是ajax请求则返回json,否则转向购物车  测试  正常都不转
    if request.is_ajax():
        count = CartInfo.objects.filter(user_id=request.session['user_id']).count()  # 查询当前登录用户购物车的商品类型数量
        return JsonResponse({'count': count})   # 更新detail页面的数据
    else:
        return redirect('/cart/')  # 转到购物车   # 更细list页面数据



def edit(request, gid, count):
    try:
        if request.is_ajax():
            goods = CartInfo.objects.get(id=int(gid))
            goods.count = int(count)
            goods.save()
            data = {'ok': 1}
    except Exception as e:
        data = {'ok': int(count)}
    return JsonResponse(data)


def delete(request, gid):
    try:
        if request.is_ajax():
            goods = CartInfo.objects.get(id=int(gid))
            goods.delete()
            data = {'ok': 1}
            print(1111)
    except Exception as e:
        data = {'ok': 0, 'e': e}
    return JsonResponse(data)


def place_order(request):
    print('从购物车进入订单界面...')
    return render(request, 'df_order/order.html')