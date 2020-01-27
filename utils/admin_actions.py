from django.contrib import messages


def set_invalid(model_admin, request, queryset):
    """批量 逻辑删除"""
    queryset.update(is_valid=False)
    messages.success(request, "操作成功")


set_invalid.short_description = "逻辑删除所选对象"


def set_valid(model_admin, request, queryset):
    """批量 逻辑启用"""
    queryset.update(is_valid=True)
    messages.success(request, "操作成功")


set_valid.short_description = "逻辑启用所选对象"
