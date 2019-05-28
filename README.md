# MySQL dump Databases and cleaning scripts
Bash scripts to perform a dump of all MySQL databases on a server and to clean it after an amount of time

In order to use this small script, you need to create a USER only for backups and grant it with the following privileges:

```
GRANT LOCK TABLES, SELECT, SHOW DATABASES, RELOAD, SHOW VIEW ON *.* TO 'BACKUPUSER'@'localhost' IDENTIFIED BY 'YourSuperPassword';

Flush privileges;
```

###### Requirements
For CentOS/RHEL
```
yum install bzip2
```
For Ubuntu/Debian
```
apt-get install bzip2
```

###### Cronjob
Create a cronjob to execute the scripts everyday or whenever you need it.

```
# crontab -l
0 23 * * * /root/cronjobs/mysqldumps
30 23 * * * /root/cronjobs/cleandumps
```
