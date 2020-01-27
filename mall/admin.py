from django.contrib import admin

from mall.forms import ProductAdminForm
from mall.models import Product, Classify, Tag
from utils.admin_actions import set_invalid, set_valid


@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    """商品信息管理"""
    list_display = ("name", "types", "price", "status", "is_valid")

    # 修改每页数据大小
    list_per_page = 5
    # 快捷搜索
    list_filter = ("status", )
    actions = [set_invalid, set_valid]
    readonly_fields = ["remain_count"]
    # 自定义表单
    form = ProductAdminForm


@admin.register(Classify)
class ClassifyAdmin(admin.ModelAdmin):
    """商品分类"""
    list_display = ("parent", "name", "code", "is_valid")


@admin.register(Tag)
class TagAdmin(admin.ModelAdmin):
    """商品标签"""
    list_display = ("name", "code", "is_valid")
