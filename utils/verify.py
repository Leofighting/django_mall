import os
import random
from io import BytesIO

from PIL import Image, ImageDraw, ImageFont
from django.conf import settings
from django.http import HttpResponse


class VerifyCode(object):
    """验证码"""
    def __init__(self, dj_request):
        self.dj_request = dj_request
        # 验证码图片尺寸
        self.img_width = 100
        self.img_height = 30
        # 验证码长度
        self.code_len = 4
        # django 中 session 的名称
        self.session_key = "verify_code"

    def gen_code(self):
        """生成验证码"""
        # 1.获取4个随机字符
        code = self._get_vcode()
        # 2.将验证码储存在 session
        self.dj_request.session[self.session_key] = code
        # 3.准备随机元素：背景色、随机字符颜色、干扰线
        font_color = ["navy", "purple", "coral", "black", "green", "blue", "grey"]
        bg_color = (random.randrange(222, 255), random.randrange(222, 255), random.randrange(222, 255))
        font_path = os.path.join(settings.BASE_DIR, "static", "font", "timesbi.ttf")
        # 4.创建图片
        img = Image.new("RGB", (self.img_width, self.img_height), bg_color)
        draw = ImageDraw.Draw(img)
        # 5.画干扰线
        for i in range(random.randrange(1, 4)):
            # 线条颜色
            line_color = random.choice(font_color)
            # 线条位置
            point = (
                random.randrange(0, self.img_width*0.2),
                random.randrange(0, self.img_height*0.5),
                random.randrange(self.img_width*0.8, self.img_width),
                random.randrange(self.img_height*0.5, self.img_height)
            )
            width = random.randrange(1, 3)
            draw.line(point, fill=line_color, width=width)
        # 6.画验证码
        for index, char in enumerate(code):
            code_color = random.choice(font_color)
            # 字体
            font_size = random.randrange(15, 25)
            font = ImageFont.truetype(font_path, font_size)
            point = (
                index*self.img_width/self.code_len+random.randrange(1, 10),
                random.randrange(0, self.img_height/3)
            )
            draw.text(point, char, font=font, fill=code_color)

        buf = BytesIO()
        img.save(buf, "gif")
        return HttpResponse(buf.getvalue(), "image/gif")

    def _get_vcode(self):
        # 使用随机数生成验证码字符串
        random_str = "ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnpqrstuvwxyz23456789"
        code_list = random.sample(list(random_str), self.code_len)
        code = "".join(code_list)
        return code

    def validate_code(self, code):
        """验证验证码是否正确"""
        # 均使用字符串的小写进行比较
        code = str(code).lower()
        vcode = self.dj_request.session.get(self.session_key, "")
        return vcode.lower() == code
