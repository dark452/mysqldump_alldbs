# MySQL dump Databases and cleaning scripts
Bash scripts to perform a dumb of all MySQL databases on a server and to clean it after an amount of time

In order to use this small script, you need to create a USER only for backups and grant it with the following privilegues:

<code>
GRANT LOCK TABLES, SELECT, SHOW DATABASES, RELOAD, SHOW VIEW ON *.* TO 'BACKUPUSER'@'localhost' IDENTIFIED BY 'YourSuperPassword';
</code>

<code>
Flush privileges;
</code>

Create a cronjob to execute the scripts everyday or whatever you need.

<code>
# crontab -l
0 23 * * * /root/cronjobs/mysqldumps
30 23 * * * /root/cronjobs/cleandumps
</code>
