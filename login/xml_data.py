from xml.dom.minidom import *
import time
import hashlib
from . import models


def ResultToDic(method, target, result):
    dic = {
        'method' : method,
        'target' : target,
        'result' : result
    }
    return dic


# 由扫描结果生成xml文件对象
def DicToXML(dic_data):

    xml_file = Document()
    # 根节点
    root = xml_file.createElement('Hack_Result')
    xml_file.appendChild(root)
    # 二级节点
    root_2_1 = xml_file.createElement('title')
    root_2_1.appendChild(xml_file.createTextNode('Method:' + dic_data['method'] +'\tTarget:' + dic_data['target']))
    # 二级节点
    root_2_2 = xml_file.createElement('result')
    root_2_2.appendChild(xml_file.createTextNode( dic_data['result'] ))
    # 节点绑定
    root.appendChild(root_2_1)
    root.appendChild(root_2_2)

    return xml_file


# 落地xml文件
def LoadXMLFile(xml_file):

    h = hashlib.sha256()
    s = str(time.time())
    h.update(s.encode())
    xml_file_path = 'static/tmp/' + h.hexdigest() + '.xml'

    fp=open(xml_file_path, 'w', encoding='utf-8')
    xml_file.writexml(fp, indent='', addindent='\t', newl='\n', encoding='utf-8')
    fp.close()

    return xml_file_path


# 存入数据库
def DicToDatabase(username, dic_data):
    
    new_history = models.History.objects.create()
    new_history.zjh_name = username
    # print(dic_data)
    # print(type(dic_data))
    new_history.zjh_dic = dic_data
    new_history.save()
    
    return


# 从数据库中取出xml
def DataTOXML():
    return xml_file


# # XML文件下载功能
# def XMLLink(xml_file_path):

#     file = open(xml_file_path , 'rb')
#     xml_response = FileResponse(file)
#     xml_response['Content-Type'] = 'application/octet-stream'
#     xml_response['Content-Disposition'] = 'attachment;filename="'+ xml_file_path +'"'

#     return  xml_response


# def XMLToDic(XMLFile):

#     return xml_dic
