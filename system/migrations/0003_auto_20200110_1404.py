# -*- coding: utf-8 -*-
# Generated by Django 1.11.27 on 2020-01-10 06:04
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('system', '0002_imagefile'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='imagefile',
            options={'verbose_name': '图片', 'verbose_name_plural': '图片'},
        ),
        migrations.AlterModelOptions(
            name='news',
            options={'ordering': ['-reorder'], 'verbose_name': '新闻通知', 'verbose_name_plural': '新闻通知'},
        ),
        migrations.AlterModelOptions(
            name='slider',
            options={'ordering': ['-reorder'], 'verbose_name': '轮播图', 'verbose_name_plural': '轮播图'},
        ),
    ]
