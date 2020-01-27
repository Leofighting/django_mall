# -*- coding: utf-8 -*-
# Generated by Django 1.11.27 on 2020-01-10 06:04
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mall', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='product',
            options={'ordering': ['-reorder'], 'verbose_name': '商品信息', 'verbose_name_plural': '商品信息'},
        ),
        migrations.AlterField(
            model_name='product',
            name='classes',
            field=models.ManyToManyField(blank=True, null=True, related_name='classes', to='mall.Classify', verbose_name='分类'),
        ),
        migrations.AlterField(
            model_name='product',
            name='img',
            field=models.ImageField(upload_to='%Y%m/product', verbose_name='主图'),
        ),
        migrations.AlterField(
            model_name='product',
            name='tags',
            field=models.ManyToManyField(blank=True, null=True, related_name='tags', to='mall.Tag', verbose_name='标签'),
        ),
    ]