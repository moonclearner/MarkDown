# 

## Paramiko ssh ģ��
��������ssh ��������

ssh  ��֤�Ĺ����Ǽ��ܵ�
ssh  �໥ͨ�ŵ�����������
��Կ��˽Կ������Կ�׵Ĺ�ϵ ���ܺͽ��ܵĹ�ϵ

## ʹ�ù�Կ��˽Կ��������

- `ssh-keygen` ����һ�Թ�Կ��˽Կ
- ��id-rsa.pub ��Կ���͵�����ssh���ӵĵط�
- ��Կ���ʹ��� `ssh-copy-id djj@192.168.204.128` 
- ֮����ʹ�� ssh djj@192.168.204.128 ����Ҫ��������

# ubuntu install Paramiko 
- sudo apt-get install python-dev
- sudo apt-get install libssl-dev
- pip install Paramiko

# ubuntu dpkg 
- dpkg -l  ��ʾ���а�װ�����
- dpkg -l|grep
- dpkg -P deletename  ж�����

# ���
- ���ݻ�ģʽ�����ڱ����˺�
- web ssh shellinbox
- ���� ���ݻ����콢

# ���������߳�
t.join()
�ȴ�t�߳���ɣ���һ�������Ĺ���,������ȷ�����е��߳����֮������������Ĳ���

����֮���ͨ��  from multiprocess import manger
