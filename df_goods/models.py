from django.db import models
from DjangoUeditor.models import UEditorField
# Create your models here.


# index首页商品分类信息
class TypeInfo(models.Model):
    title = models.CharField('类型名称', max_length=30)
    idDelete = models.BooleanField('是否删除', default=False) # 是否删除,默认不删

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = '分类信息'
        verbose_name_plural = '分类信息'


 # 商品信息
class GoodsInfo(models.Model):
    gtitle = models.CharField('商品名称', max_length=20)
    gpic = models.ImageField('商品图片', upload_to='df_goods', null=True, blank=True)  # 商品图片
    gprice = models.DecimalField('商品价格', max_digits=7, decimal_places=2)  # 总共最多有7位,小数占2位
    gunit = models.CharField('商品单位', max_length=20, default='500g')  # 商品的单位
    gclick = models.IntegerField('点击量')  # 商品点击量,便于排人气
    isDelete = models.BooleanField('是否删除', default=False)
    gjianjie = models.CharField('简介', max_length=200)  # 商品简介
    gkucun = models.IntegerField('库存')  # 商品库存
    gadv = models.BooleanField(verbose_name='商品推荐', default=False)   # 商品推荐
    gtype = models.ForeignKey(TypeInfo, verbose_name='所属分类', on_delete=models.CASCADE)
    gcontent = UEditorField('详细介绍', height=300, width=1000)

    class Meta:
        verbose_name = '商品信息'
        verbose_name_plural = '商品信息'
