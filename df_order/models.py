# coding: utf8
from django.db import models


# 订单信息
class OrderInfo(models.Model):
    oid = models.CharField(max_length=20,primary_key=True) # 订单编号
    otime = models.DateTimeField(auto_now=True)  # 订单日期
    ouser = models.ForeignKey("df_user.UserInfo", on_delete=models.CASCADE) # 用户
    oispay = models.BooleanField(default=False)  # 是否支付
    ototal = models.DecimalField(max_digits=7, decimal_places=2)  # 总金额
    oaddress = models.CharField(max_length=150)  # 地址信息

    def __str__(self):
        return self.oid


# 订单详表
class OrderDetailInfo(models.Model):
    ogoods = models.ForeignKey("df_goods.GoodsInfo", on_delete=models.CASCADE)   # 商品信息
    orderinfo = models.ForeignKey("OrderInfo", on_delete=models.CASCADE)  # 订单信息
    oprice = models.DecimalField(max_digits=5, decimal_places=2)  # 价格
    ocount = models.IntegerField()  # 数量