# login/views.py
from django.shortcuts import render, redirect
from . import models
from .forms import UserForm, RegisterForm
import hashlib
from . import hack
from . import xml_data



def index(request):
    pass
    return render(request, 'login/zjh_index.html')


def login(request):
    if request.session.get('is_login', None):
        return redirect("/zjh_index/")
    if request.method == "POST":
        login_form = UserForm(request.POST)
        message = "请检查填写的内容！"
        if login_form.is_valid():
            username = login_form.cleaned_data['username']
            password = login_form.cleaned_data['password']
            try:
                user = models.User.objects.get(zjh_name=username)
                if user.zjh_password == hash_code(password):  # 哈希值和数据库内的值进行比对
                    request.session['is_login'] = True  # 写入session
                    request.session['user_id'] = user.id
                    request.session['user_name'] = user.zjh_name
                    return redirect('/zjh_index/')
                else:
                    message = "密码不正确！"
            except:
                message = "用户不存在！"
        return render(request, 'login/zjh_login.html', locals())

    login_form = UserForm()
    return render(request, 'login/zjh_login.html', locals())


def register(request):
    if request.session.get('is_login', None):
        # 登录状态不允许注册。你可以修改这条原则！
        return redirect("/zjh_index/")
    if request.method == "POST":
        register_form = RegisterForm(request.POST)
        message = "请检查填写的内容！"
        if register_form.is_valid():  # 获取数据
            username = register_form.cleaned_data['username']
            password1 = register_form.cleaned_data['password1']
            password2 = register_form.cleaned_data['password2']
            email = register_form.cleaned_data['email']
            sex = register_form.cleaned_data['sex']
            if password1 != password2:  # 判断两次密码是否相同
                message = "两次输入的密码不同！"
                return render(request, 'login/zjh_register.html', locals())
            else:
                same_name_user = models.User.objects.filter(zjh_name=username)
                if same_name_user:  # 用户名唯一
                    message = '用户已经存在，请重新选择用户名！'
                    return render(request, 'login/zjh_register.html', locals())
                same_email_user = models.User.objects.filter(zjh_email=email)
                if same_email_user:  # 邮箱地址唯一
                    message = '该邮箱地址已被注册，请使用别的邮箱！'
                    return render(request, 'login/zjh_zjh_register.html', locals())

                # 当一切都OK的情况下，创建新用户

                new_user = models.User.objects.create()
                new_user.zjh_name = username
                new_user.zjh_password = hash_code(password1)  # 使用加密密码
                new_user.zjh_email = email
                new_user.zjh_sex = sex
                new_user.save()
                return redirect('/zjh_login/')  # 自动跳转到登录页面

    register_form = RegisterForm()
    return render(request, 'login/zjh_register.html', locals())


def logout(request):
    if not request.session.get('is_login', None):
        return redirect('/zjh_index/')
    request.session.flush()

    return redirect('/zjh_index/')


def hash_code(s, salt='mysite_login'):
    h = hashlib.sha256()
    s += salt
    h.update(s.encode())  # update方法只接收bytes类型
    return h.hexdigest()


def tools(request):
    # 判断是否登录
    if request.session.get('is_login', None):

        if request.method == 'POST' and request.POST['submit'] == 'nmap':

            method = request.POST['submit']
            target_ip = request.POST['target_ip']
            nmap_result = hack.nmap_tcp(target_ip)
            nmap_result_json = hack.ResultToJson(nmap_result)

            # 存入数据库
            target = target_ip
            dic_data = xml_data.ResultToDic(method, target, nmap_result_json)
            xml_data.DicToDatabase(request.session['user_name'], dic_data)

            # 生成xml对象
            xml_file = xml_data.DicToXML(dic_data)
            # xml文件链接
            xml_file_path = xml_data.LoadXMLFile(xml_file)

            return render(request, 'login/zjh_tools.html',{'nmap_result':nmap_result_json, 'target_ip':target_ip, 'xml_file_path':xml_file_path})

        elif request.method == 'POST' and request.POST['submit'] == 'ftp':

            method = request.POST['submit']
            target_ip = request.POST['target_ip']
            target_port = request.POST['target_port']
            ftp_result = hack.ftp_boom(target_ip, target_port)
            ftp_result = hack.ResultToJson(ftp_result)

            # 存入数据库
            target = target_ip + ':' + target_port
            dic_data = xml_data.ResultToDic(method, target, ftp_result)
            xml_data.DicToDatabase(request.session['user_name'], dic_data)

            # 生成xml对象
            xml_file = xml_data.DicToXML(dic_data)
            # xml文件链接
            xml_file_path = xml_data.LoadXMLFile(xml_file)

            return render(request, 'login/zjh_tools.html',{'ftp_result':ftp_result, 'target_ip':target_ip, 'xml_file_path':xml_file_path})

        elif request.method == 'POST' and request.POST['submit'] == 'web':

            method = request.POST['submit']
            target_url = request.POST['target_url']
            data = request.POST['data']
            fail_identification = request.POST['fail_identification']
            web_result = hack.web_boom(target_url, data, fail_identification)
            web_result = hack.ResultToJson(web_result)

            # 存入数据库
            target = target_url
            dic_data = xml_data.ResultToDic(method, target, web_result)
            xml_data.DicToDatabase(request.session['user_name'], dic_data)

            # 生成xml对象
            xml_file = xml_data.DicToXML(dic_data)
            # xml文件链接
            xml_file_path = xml_data.LoadXMLFile(xml_file)


            return render(request, 'login/zjh_tools.html',{'web_result':web_result, 'target_url':target_url, 'xml_file_path':xml_file_path})

        else:
            return render(request, 'login/zjh_tools.html')

    else:
        return redirect('/zjh_index/')


def history(request):

    user_historys = models.History.objects.filter(zjh_name=request.session['user_name'])
    # print(user_history)

    for i in range(len(user_historys)):
        user_historys[i].zjh_dic = hack.ResultToJson(user_historys[i].zjh_dic)

    return render(request, 'login/zjh_history.html', {'user_historys':user_historys})