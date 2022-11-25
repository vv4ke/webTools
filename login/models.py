# login/models.py

from django.db import models


# Create your models here.


class User(models.Model):
    """
    用户表
    """

    gender = (
        ('male', '男'),
        ('female', '女'),
    )

    zjh_name = models.CharField(max_length=128, unique=True)
    zjh_password = models.CharField(max_length=256)
    zjh_email = models.EmailField(unique=True)
    zjh_sex = models.CharField(max_length=32, choices=gender, default='男')
    c_time = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'zjh_login_user'
        ordering = ['c_time']
        verbose_name = '用户'
        verbose_name_plural = '用户'


class History(models.Model):
    '''
    用户使用记录表
    '''

    zjh_name = models.CharField(max_length=128)
    zjh_dic = models.CharField(max_length=10240)
    c_time = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.zjh_name

    class Meta:
        db_table = 'zjh_history'
        ordering = ['c_time']
        verbose_name = '用户'
        verbose_name_plural = '用户'
