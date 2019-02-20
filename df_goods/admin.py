from django.contrib import admin
from df_goods.models import *

# Register your models here.


class TypeInfoAdmin(admin.ModelAdmin):
    list_display = ['id', 'title']  # admin中显示那些属性


class GoodsInfoAdmin(admin.ModelAdmin):
    list_per_page = 100              # admin中每页放多少条数据
    list_display = ['id', 'gtitle', 'gprice', 'gunit','gclick', 'gkucun', 'gcontent', 'gtype']


admin.site.register(TypeInfo, TypeInfoAdmin)
admin.site.register(GoodsInfo, GoodsInfoAdmin)