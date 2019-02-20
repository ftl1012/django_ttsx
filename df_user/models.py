from django.db import models

# Create your models here.


class UserInfo(models.Model):
    uname = models.CharField(max_length=20)  # 用户名
    upwd = models.CharField(max_length=40)  # 密码
    uemail = models.CharField(max_length=30)  # 邮箱
    ushou = models.CharField(max_length=20, default='')  # 收件人    #default给属性一个默认值
    uaddress = models.CharField(max_length=100, default='')  # 地址
    uyoubian = models.CharField(max_length=6, default='')  # 邮编
    uphone = models.CharField(max_length=11, default='')  # 电话


    def __str__(self):
        return self.uname

    # Django模型类的Meta是一个内部类，它用于定义一些Django模型类的行为特性。
    class Meta:
        # 给你的模型类起一个更可读的名字
        verbose_name = '用户信息'
        # 选项是指定，模型的复数形式是什么
        verbose_name_plural = '用户信息'



