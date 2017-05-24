# install on ubuntu 14.04
sudo apt-get install apache2

# configuare
sudo vim /etc/apache2/apache2.conf
    // 将 <Directory /var/www/>
    // 改成 <Directory "你的目录">
    // 可以将 /var/www 中的默认网页复制到 你的目录 中

sudo vim /etc/apache2/sites-available/000-default.conf
    // 将 DocumentRoot /var/www/html
    // 改成 DocumentRoot "你的目录"

sudo /etc/init.d/apache2 restart


# questions
Apache 'You don't have permission to access xx on this server'

## solution
sudo vim /etc/apache2/apache2.cof
rm Require all denied

sudo vim /etc/apache2/sites-available/000-default.conf
modify ServerAdmin yourname@localhost



# question2
AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 127.0.1.1. Set the 'ServerName' directive globally to suppress this messageSegmentation fault (core dumped)

## solution
 vim /etc/apache2/apache2.conf
最后加入一句 ServerName localhost:80
