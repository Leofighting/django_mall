from django.conf.urls import url

from mall import views

urlpatterns = [
    # 商品列表
    url(r'^prod/list/$', views.ProductList.as_view(), name="product_list"),
    # 加载 HTML 片段
    url(r'^prod/load/list/$', views.ProductList.as_view(
        template_name="product_load_list.html"
    ), name="product_load_list"),

    # 商品详情
    url(r'^prod/detail/(?P<pk>\S+)/$', views.product_detail, name="product_detail"),
    # 商品详情
    url(r'^prod/classify/$', views.product_classify, name="product_classify"),
]
