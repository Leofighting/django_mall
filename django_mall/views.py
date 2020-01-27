from datetime import datetime
import logging

from django.shortcuts import render

from accounts.models import User
from mall.models import Product
from system.models import Slider, News
from utils import constants

logger = logging.getLogger("django")


def index(request):
    """首页"""
    # 查询轮播图
    slider_list = Slider.objects.filter(types=constants.SLIDER_TYPE_INDEX)

    # 首页的新闻
    now_time = datetime.now()
    news_list = News.objects.filter(types=constants.NEWS_TYPE_NEWS,
                                    is_top=True,
                                    is_valid=True,
                                    start_time__lte=now_time,
                                    end_time__gte=now_time)

    # 酒水推荐
    js_list = Product.objects.filter(
        status=constants.PRODUCT_STATUS_SELL,
        is_valid=True,
        tags__code="jstj",
    )
    # 精选推荐
    jx_list = Product.objects.filter(
        status=constants.PRODUCT_STATUS_SELL,
        is_valid=True,
        tags__code="jxtj",
    )
    # 猜你喜欢
    cn_list = Product.objects.filter(
        status=constants.PRODUCT_STATUS_SELL,
        is_valid=True,
        tags__code="cnxh",
    )

    return render(request, "index.html", {
        "slider_list": slider_list,
        "news_list": news_list,
        "js_list": js_list,
        "jx_list": jx_list,
        "cn_list": cn_list,
    })