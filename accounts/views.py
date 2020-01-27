from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse
from django.shortcuts import render, redirect, get_object_or_404

from accounts.forms import UserLoginForm, UserRegisterForm, UserAddressForm
from accounts.models import UserAddress
from utils.verify import VerifyCode


def user_login(request):
    """用户登录"""
    next_url = request.GET.get("next", "index")

    if request.method == "POST":
        form = UserLoginForm(request=request, data=request.POST)
        client = VerifyCode(request)
        code = request.POST.get("vcode", None)
        rest = client.validate_code(code)

        # 检验表单是否通过验证
        if form.is_valid():
            data = form.cleaned_data
            user = authenticate(request, username=data["username"], password=data["password"])
            if user:
                login(request, user)
                request.session["user_id"] = user.id
                return redirect(next_url)
        else:
            print(form.errors)
    else:
        form = UserLoginForm(request)
    return render(request, "login.html", {
        "form": form,
        "next_url": next_url,
    })


def user_register(request):
    """用户注册"""
    if request.method == "POST":
        form = UserRegisterForm(request=request, data=request.POST)
        if form.is_valid():
            form.register()
            return redirect("index")
        else:
            pass
    else:
        form = UserLoginForm(request=request)
    return render(request, "register.html", {
        "form": form,
    })


def user_logout(request):
    """用户退出登录"""
    logout(request)
    return redirect("index")


@login_required
def address_list(request):
    """地址列表"""
    my_addr_list = UserAddress.objects.filter(user=request.user, is_valid=True)

    return render(request, "address_list.html", {
        "my_addr_list": my_addr_list,

    })


@login_required
def address_edit(request, pk):
    """地址新增及修改"""
    user = request.user
    addr = None
    initial = {}
    # 如果 pk 是数字， 则表示修改
    if pk.isdigit():
        # 查询相关的地址信息
        addr = get_object_or_404(UserAddress, pk=pk, user=user, is_valid=True)
        initial["region"] = addr.get_region_format()
    if request.method == "POST":
        form = UserAddressForm(request=request, data=request.POST,
                               instance=addr, initial=initial)
        if form.is_valid():
            form.save()
            return redirect("accounts:address_list")
    else:
        form = UserAddressForm(request=request, instance=addr, initial=initial)
    return render(request, "address_edit.html", {
        "form": form,

    })


@login_required
def address_delete(request, pk):
    """删除地址"""
    addr = get_object_or_404(UserAddress,
                             pk=pk,
                             is_valid=True,
                             user=request.user)
    addr.is_valid = False
    addr.save()
    return HttpResponse("ok")
