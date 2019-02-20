from django.urls import path
from django.conf.urls import url
from df_goods import views
from df_goods.views import MySearchView

urlpatterns = [
    url(r'^$', views.index),
    # 第一个d+为类型的id,用括号括起来后，就会传递这个参数个对应的函数
    # name='detail'后，可以直接在html里面调用
    url('detail/(\d+)/', views.detail, name='detail'),
    # 在detail页面，查看某个商品的全部信息
    # 说明:  商品分类_排序标准_当前的页码
    url(r'^list(\d+)_(\d+)_(\d+)/$', views.list, name='list'),      # 第一个d+为类型的id,

    # 搜索的实现
    url(r'^search/', MySearchView(), name='haystack_search'),                  # 搜索页
]
