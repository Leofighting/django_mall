# -*- coding: utf-8 -*-
# Generated by Django 1.11.27 on 2020-01-10 09:06
from __future__ import unicode_literals

import ckeditor.fields
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('mall', '0002_auto_20200110_1404'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='classify',
            options={'ordering': ['-reorder'], 'verbose_name': '商品分类', 'verbose_name_plural': '商品分类'},
        ),
        migrations.AlterModelOptions(
            name='tag',
            options={'ordering': ['-reorder'], 'verbose_name': '商品标签', 'verbose_name_plural': '商品标签'},
        ),
        migrations.AlterField(
            model_name='classify',
            name='parent',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='children', to='mall.Classify'),
        ),
        migrations.AlterField(
            model_name='product',
            name='content',
            field=ckeditor.fields.RichTextField(verbose_name='商品描述'),
        ),
    ]
