# coding=utf-8
from haystack import indexes
from .models import GoodsInfo

# #类名必须为需要检索的Model_name+Index，这里需要检索GoodsInfo，，因此命名GoodsInfoIndex
class GoodsInfoIndex(indexes.SearchIndex, indexes.Indexable):
    text = indexes.CharField(document=True, use_template=True)  # 创建一个text字段


    def get_model(self):
        return GoodsInfo

    def index_queryset(self, using=None):
        return self.get_model().objects.all()