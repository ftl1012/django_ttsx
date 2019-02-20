from django.shortcuts import render, HttpResponse
from django.http import response
from df_goods.models import *
from django.core.cache import cache
from django.core.paginator import Paginator


# Create your views here.

def index(request):
    # 获取分类列表，type0表示热门， type01表示点击率高的
    typelist = TypeInfo.objects.all()

    type0 = typelist[0].goodsinfo_set.order_by('-id')[0:4]  # 降序获取最近新添加的商品
    type01 = typelist[0].goodsinfo_set.order_by('-gclick')[0:4]  # 降序获取点击率最高的商品
    type1 = typelist[1].goodsinfo_set.order_by('-id')[0:4]
    type11 = typelist[1].goodsinfo_set.order_by('-gclick')[0:4]
    type2 = typelist[2].goodsinfo_set.order_by('-id')[0:4]
    type21 = typelist[2].goodsinfo_set.order_by('-gclick')[0:4]
    type3 = typelist[3].goodsinfo_set.order_by('-id')[0:4]
    type31 = typelist[3].goodsinfo_set.order_by('-gclick')[0:4]
    type4 = typelist[4].goodsinfo_set.order_by('-id')[0:4]
    type41 = typelist[4].goodsinfo_set.order_by('-gclick')[0:4]
    type5 = typelist[5].goodsinfo_set.order_by('-id')[0:4]
    type51 = typelist[5].goodsinfo_set.order_by('-gclick')[0:4]

    content = {
        'title': '首页',
        'type0': type0, 'type01': type01,
        'type1': type1, 'type11': type11,
        'type2': type2, 'type21': type21,
        'type3': type3, 'type31': type31,
        'type4': type4, 'type41': type41,
        'type5': type5, 'type51': type51,
    }

    return render(request, 'df_goods/index.html', content)


def detail(request, id):
    """商品详情页 商品id"""
    goods = GoodsInfo.objects.get(id=int(id))
    goods.gclick += 1
    print('商品详情页面：', goods.gtype.title)
    goods.save()

    # 详情页面，显示该类型商品浏览最高的2个物品
    recomand_goods = goods.gtype.goodsinfo_set.order_by('-id')[0:2]

    content = {
        'title': '商品详情',
        'type': goods.gtype.title,
        'goods': goods,
        'recomand_goods': recomand_goods,
        'id': id
    }
    response = render(request, 'df_goods/detail.html', content)

    '''
    # 基于Cookie实现
    # 记录最近浏览,在用户中心使用
    # if request.session.has_key('user_id'):   #判断是否已经登录
    #     goods_ids = request.COOKIES.get('goods_ids','')     #获取浏览记录, 获取的值为str型
    #     # print(type(goods_ids))
    #     # print(goods_ids)
    #     goods_id = str(goods.id)        #将int型转化为str类型
    #     if goods_ids != '':     #判断是否有浏览记录,如果则继续判断
    #         goods_ids1 = goods_ids.split(',')   #以逗号分隔切片    切片后为list型
    #         if goods_ids1.count(goods_id) >= 1:     #如果已经存在,删除掉
    #             goods_ids1.remove(goods_id)
    #         goods_ids1.insert(0, goods_id)  #添加到第一个
    #         if len(goods_ids1) >= 6:        #如果超过6个则删除最后一个
    #             del goods_ids1[5]
    #         goods_ids=','.join(goods_ids1)     #  's'.join(seq)  以s作为分隔符，将seq所有的元素合并成一个新的字符串,为str型
    #     else:
    #         goods_ids=goods_id      #如果没有记录则直接加 ,   str型
    #     # print(type(goods_ids))
    #     # print(type(goods_ids))
    #     # print(goods_ids)
    #     response.set_cookie('goods_ids',goods_ids)  #写入cookie
    
    '''

    # 基于Session实现： 记录最近浏览,在用户中心使用
    if request.session.has_key('user_id'):  # 判断是否已经登录
        goods_ids = request.COOKIES.get('goods_ids', '')  # 获取浏览记录, 获取的值为str型
        # print(type(goods_ids))
        # print(goods_ids)
        goods_id = str(goods.id)  # 将int型转化为str类型
        if goods_ids != '':  # 判断是否有浏览记录,如果则继续判断
            goods_ids1 = goods_ids.split(',')  # 以逗号分隔切片    切片后为list型
            if goods_ids1.count(goods_id) >= 1:  # 如果已经存在,删除掉
                goods_ids1.remove(goods_id)
            goods_ids1.insert(0, goods_id)  # 添加到第一个
            if len(goods_ids1) >= 6:  # 如果超过6个则删除最后一个
                del goods_ids1[5]
            goods_ids = ','.join(goods_ids1)  # 's'.join(seq)  以s作为分隔符，将seq所有的元素合并成一个新的字符串,为str型
        else:
            goods_ids = goods_id  # 如果没有记录则直接加 ,   str型
        # print(type(goods_ids))
        # print(type(goods_ids))
        # print(goods_ids)
        response.set_cookie('goods_ids', goods_ids)  # 写入cookie

    # 记录最近浏览,在用户中心使用
    if request.session.has_key('user_id'):  # 判断是否已经登录
        key = str(request.session.get('user_id'))
        goods_ids = request.session.get(key, '')
        # print(type(goods_ids))
        # print(goods_ids)
        goods_id = str(goods.id)  # 将int型转化为str类型
        if goods_ids != '':  # 判断是否有浏览记录,如果则继续判断
            # goods_ids = goods_ids.split(',')  # 以逗号分隔切片    切片后为list型
            if goods_ids.count(goods_id) >= 1:  # 如果已经存在,删除掉
                goods_ids.remove(goods_id)
            goods_ids.insert(0, goods_id)  # 添加到第一个
            if len(goods_ids) >= 6:  # 如果超过6个则删除最后一个
                del goods_ids[5]
        else:
            goods_ids = []
            goods_ids.append(goods_id)
        # print(type(goods_ids))
        # print(goods_ids)
        request.session['goods_ids'] = goods_ids
    return response


def list(request, typeInfo, sortType, pindex):
    # typeInfo: 商品分类 1-6
    # sortType:  默认(时间)， 价格， 人气
    # pindex: 传递过来当前的页码

    typeInfo = TypeInfo.objects.get(id=int(typeInfo))  # 取出同类型的物品
    # 同类型的热门推荐
    goods = None
    new = typeInfo.goodsinfo_set.order_by('-id')[0:2]
    sortType = int(sortType)
    if sortType == 1:
        goods = typeInfo.goodsinfo_set.order_by('-id')
    elif sortType == 2:
        goods = typeInfo.goodsinfo_set.order_by('-gprice')
    elif sortType == 3:
        goods = typeInfo.goodsinfo_set.order_by('gprice')
    else:
        goods = typeInfo.goodsinfo_set.order_by('-gclick')
    paginator = Paginator(goods, 1)  # 分页, 每页有几个元素
    page = paginator.page(int(pindex))

    content = {
        'title': typeInfo.title,
        'new': new,
        'typeinfo': typeInfo,
        'sort': sortType,  # 用于class页签高亮显示
        # 'goods': goods,      # 传递全部的页面
        'page': page,  # 排序后的每页的元素列表
        'paginator': paginator,  # 分页
    }
    return render(request, 'df_goods/list.html', content)


from haystack.views import SearchView
from manas.settings import HAYSTACK_SEARCH_RESULTS_PER_PAGE

class MySearchView(SearchView):
    def build_page(self):
        print('进入搜索页面：')
        #分页重写
        context=super(MySearchView, self).extra_context()   #继承自带的context
        try:
            page_no = int(self.request.GET.get('page', 1))
        except Exception:
            return HttpResponse("Not a valid number for page.")

        if page_no < 1:
            return HttpResponse("Pages should be 1 or greater.")
        a =[]
        for i in self.results:
            a.append(i.object)
        paginator = Paginator(a, HAYSTACK_SEARCH_RESULTS_PER_PAGE)
        # print("--------")
        # print(page_no)
        page = paginator.page(page_no)
        print('搜索的商品信息：', page)
        return (paginator, page)

    def extra_context(self):
        context = super(MySearchView, self).extra_context()  # 继承自带的context
        context['title'] = '商品搜索'
        return context