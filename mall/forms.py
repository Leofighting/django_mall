from django import forms

from mall.models import Product


class ProductAdminForm(forms.ModelForm):
    """商品编辑"""
    class Meta:
        model = Product
        exclude = ["created_at", "updated_at"]
        widgets = {
            "types": forms.RadioSelect,
        }

    def clean_price(self):
        """验证商品价格"""
        price = self.cleaned_data["price"]
        if int(price) <= 0:
            raise forms.ValidationError("商品价格必须大于 0")
        return price
