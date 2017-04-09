# Php multipartform dos



# Slow Http denial
慢速攻击

AWVS 扫描工具可以扫描出来

## Script
github torshammer.py


## 防御
对 web 服务器的 http 头部传输的最大许可时间进行限制，修改最大为 20 秒，超过制定时间的 http header 还没有传输完成，直接可以判断为慢速攻击，将其加入到黑名单

