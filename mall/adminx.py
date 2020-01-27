import xadmin
from mall.models import Product


class ProductAdmin(object):
    """xadmin 商品管理"""
    # 配置列表中的默认显示列
    list_display = ("name", "types", "price")
    # 配置过滤器
    list_filter = ("types", "status")
    # 搜索配置
    search_fields = ("name", )


# 注册到 xadmin 后台管理
xadmin.site.register(Product, ProductAdmin)
