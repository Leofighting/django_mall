from django.contrib.auth.models import AbstractUser
from django.db import models
from django.db.models import F


class User(AbstractUser):
    """用户基础信息表"""
    # username = models.CharField("用户名", max_length=32)
    nickname = models.CharField("昵称", max_length=32)
    # password = models.CharField("密码", max_length=256)
    avatar = models.ImageField("用户头像", upload_to="avatar", null=True, blank=True)
    integral = models.IntegerField("用户的积分", default=0)
    level = models.SmallIntegerField("用户级别")

    class Meta:
        db_table = "account_user"
        verbose_name = "用户信息"
        verbose_name_plural = verbose_name

    @property
    def default_addr(self):
        """用户默认地址"""
        addr = None
        user_list = self.user_address.filter(is_valid=True)
        try:
            addr = user_list.filter(is_default=True)[0]
        except IndexError:
            try:
                addr = user_list[0]
            except IndexError:
                pass
        return addr

    def ope_integral_account(self, types, count):
        """积分操作"""
        if types == 1:
            # 充值
            self.integral = F("integral") + abs(count)
        else:
            # 消费
            self.integral = F("integral") - abs(count)
        self.save()
        self.refresh_from_db()

    def __str__(self):
        return self.username


class UserProfile(models.Model):
    """用户的详细信息"""
    SEX_CHOICES = (
        (1, "男"),
        (2, "女"),
    )
    user = models.OneToOneField(User)
    real_name = models.CharField("真实姓名", max_length=32)
    email = models.EmailField("电子邮箱", null=True, blank=True)
    is_email_valid = models.BooleanField("邮箱是否已验证", default=False)
    phone_no = models.CharField("手机号码", max_length=11, null=True, blank=True)
    is_phone_valid = models.BooleanField("手机号码是否已经验证", default=False)
    sex = models.SmallIntegerField("性别", default=1, choices=SEX_CHOICES)
    age = models.SmallIntegerField("年龄", default=0)
    created_at = models.DateTimeField("创建时间", auto_now_add=True)
    updated_at = models.DateTimeField("最后修改时间", auto_now=True)

    class Meta:
        db_table = "account_user_profile"
        verbose_name = "用户详细信息"
        verbose_name_plural = verbose_name


class UserAddress(models.Model):
    """用户的地址信息"""
    user = models.ForeignKey(User, related_name="user_address")
    province = models.CharField("省份", max_length=32)
    city = models.CharField("市区", max_length=32)
    area = models.CharField("区域", max_length=32)
    town = models.CharField("街道", max_length=32, null=True, blank=True)
    address = models.CharField("详细地址", max_length=64)
    username = models.CharField("收件人", max_length=32)
    phone = models.CharField("手机号码", max_length=11)
    is_default = models.BooleanField("是否为默认地址", default=False)
    is_valid = models.BooleanField("是否有效", default=True)
    created_at = models.DateTimeField("创建时间", auto_now_add=True)
    updated_at = models.DateTimeField("最后修改时间", auto_now=True)

    class Meta:
        db_table = "account_user_address"
        ordering = ["is_default", "-updated_at"]
        verbose_name = "用户地址信息"
        verbose_name_plural = verbose_name

    def get_phone_format(self):
        """格式化手机号码"""
        return self.phone[:7] + "****"

    def get_region_format(self):
        """格式胡省市区"""
        return "{self.province} {self.city} {self.area}".format(self=self)

    def __str__(self):
        return self.get_region_format() + self.address


class LoginRecord(models.Model):
    """用户的登陆历史"""
    user = models.ForeignKey(User)
    username = models.CharField("登陆的账号", max_length=32)
    ip = models.CharField("IP", max_length=32)
    address = models.CharField("地址", max_length=32, null=True, blank=True)
    source = models.CharField("登陆来源", max_length=32)
    created_at = models.DateTimeField("登陆时间")

    class Meta:
        db_table = "account_login_record"
        verbose_name = "登陆历史"
        verbose_name_plural = verbose_name


class PasswdChangeLog(models.Model):
    pass
