from django.shortcuts import render
from df_user import user_decorator
# Create your views here.
from df_user.models import UserInfo
from df_order.models import *
from df_carts.models import *
from df_goods.models import *


def test(request):
    return render(request, 'df_order/place_order.html')


@user_decorator.login
def orderInfo(request, id, count):
    print('进入订单页面', '商品ID:', id, '商品数量：', count)
    """
       根据购物车提交的信息显示订单提交页的信息
       id和count 为直接从商品详情页跳转来的　商品id和数量
   """
    content = {}
    content["title"] = "提交订单"
    user_id = request.session.get('user_id', default=None)  # 获取用户信息ID
    user = UserInfo.objects.get(id=user_id)  # 根据ID获取用户信息
    content["user"] = user

    if (not id) and (not count):  # 没有商品id代表从购物车跳转的
        data = request.GET  # 从购物车数据库根据id获取信息并返回
        content["carts"] = [CartInfo.objects.get(id=data[i]) for i in data]
        content["active"] = 1
        print('购物车跳转过来的数据......')
    else:
        content["goods"] = GoodsInfo.objects.get(id=id)  # 根据id查到商品组合成数据
        content["count"] = count
        content["active"] = 2
        print('购物车数据:', content["goods"])

    return render(request, 'df_order/order.html', content)


import time
from django.db import transaction
from django.http import JsonResponse


@user_decorator.login
@transaction.atomic()  # 使用事务执行数据库操作
def ordercl(request, id):  # 设置事务的起始点
    tran_id = transaction.savepoint()
    user_id = request.session.get('user_id')   # 查询用户信息
    user = UserInfo.objects.get(id=user_id)
    oid = "".join(str(time.time()).split("."))    # 使用time.time生成一个订单号
    oid = oid + '0' if len(oid) == 11 else oid

    try:
        order = OrderInfo()
        order.oid = oid
        order.ouser = user
        order.ototal = 10    # 邮费
        order.oaddress = (u"%s ( %s 收) %s" %(user.uaddress, user.ushou, user.uphone))
        order.save()
        if not id:
            data = request.POST
            for i in data:
                if i.startswith("cart"):
                    order_goods = OrderDetailInfo()
                    cart = CartInfo.objects.get(id=data[i])   # 获取购物车信息
                    if cart.goods.gkucun < cart.count:        # 如果订单数量大于库存数量
                        transaction.savepoint_rollback(tran_id)# 回滚事务
                        return JsonResponse({'data':0})        # 返回未提交成功
                    order_goods.ogoods = cart.goods             # 关联商品表
                    order_goods.orderinfo = order               # 关联订单表
                    order_goods.oprice = cart.goods.gprice      # 商品单价
                    order_goods.ocount = cart.count             # 购买数量
                    order.ototal += cart.goods.gprice * cart.count # 更新订单总金额
                    goods_info = cart.goods                      # 获取商品表对象
                    goods_info.gkucun -= cart.count             # 从商品库存中减去订单中商品数量
                    goods_info.save()
                    cart.delete()
                    order.save()
                    order_goods.save()

    except Exception as e:
        print(e);
        transaction.savepoint_rollback(tran_id)  # 回滚事务
        return JsonResponse({"data": 0})
    return JsonResponse({'data':1})



