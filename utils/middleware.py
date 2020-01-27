# 中间件
from django.http import HttpResponse

from accounts.models import User


def ip_middleware(get_response):
    """IP拦截"""
    def middleware(request):
        # 请求到达前的业务逻辑
        ip = request.META.get("REMOTE_ADDR", None)
        ip_disable_list = []
        if ip in ip_disable_list:
            return HttpResponse("not allowed", status=403)

        response = get_response(request)
        # 在视图函数调用之后的业务逻辑
        return response

    return middleware


class MallAuthMiddleware(object):
    """自定义的登陆验证中间件"""
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request, *args, **kwargs):
        user_id = request.session.get("user_id", None)
        if user_id:
            user = User.objects.get(pk=user_id)
        else:
            user = None

        request.my_user = user
        response = self.get_response(request)

        return response
