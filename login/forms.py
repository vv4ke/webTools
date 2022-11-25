from captcha.fields import CaptchaField
from django import forms


class UserForm(forms.Form):
    username = forms.CharField(label="用户名", max_length=128, widget=forms.TextInput(attrs={'class': 'form-control'}))
    password = forms.CharField(label="密码", max_length=256, widget=forms.PasswordInput(attrs={'class': 'form-control'}))
    captcha = CaptchaField(label='验证码')


class RegisterForm(forms.Form):
    gender = (
        ('male', "男"),
        ('female', "女"),
    )
    username = forms.CharField(label="用户名", max_length=128, widget=forms.TextInput(attrs={'class': 'form-control'}))
    password1 = forms.CharField(label="密码", max_length=256, widget=forms.PasswordInput(attrs={'class': 'form-control'}))
    password2 = forms.CharField(label="确认密码", max_length=256, widget=forms.PasswordInput(attrs={'class': 'form-control'}))
    email = forms.EmailField(label="邮箱地址", widget=forms.EmailInput(attrs={'class': 'form-control'}))
    sex = forms.ChoiceField(label='性别', choices=gender)
    captcha = CaptchaField(label='验证码')


# class NmapScanFrom(forms.Form):
#     target_ip = forms.CharField(label="目标IP",max_length=128, widget=forms.TextInput(attrs={'class': 'form-control'}))


# class FTPBoomFrom(forms.Form):
#     target_ip = forms.CharField(label="目标IP",max_length=128, widget=forms.TextInput(attrs={'class': 'form-control'}))
#     target_port = forms.CharField(label="目标端口",max_length=128, widget=forms.TextInput(attrs={'class': 'form-control'}))


# class WebBoomFrom(forms.Form):
#     target_url = forms.CharField(label="目标url",max_length=128, widget=forms.TextInput(attrs={'class': 'form-control'}))