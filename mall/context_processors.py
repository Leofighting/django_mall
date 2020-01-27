from django.db.models import Sum

from utils import constants


def shop_cart(request):
    """当前用户的购物车信息"""
    cart_list = []
    cart_total = None
    cart_count = 0

    user = request.user

    if user.is_authenticated:
        # 购物车商品列表
        cart_list = user.carts.filter(
            status=constants.ORDER_STATUS_INIT
        )

        cart_total = cart_list.aggregate(sum_amount=Sum("amount"),
                                         sum_count=Sum("count"))

        cart_count = cart_list.count()

    return {
        "cart_list": cart_list,
        "cart_total": cart_total,
        "cart_count": cart_count
    }