#! /bin/bash
########################
# Dump script for backup all the databases on a MySQL/MariaDB server 
# All the dumps will be stored inside /var/www/mediadumps as a .bz2 file
# @Dark452 / imunoz@redeshost.cl
########################

TIMESTAMP=$(date +"%F")
BACKUP_DIR="/var/www/mediadumps/"
MYSQL_USER="BACKUPUSER"
MYSQL_PASSWORD="YourPassword"


#all the databases that are NOT included in the list after the Database: information_schema, performance_schema and test
databases=`mysql --user=$MYSQL_USER -p$MYSQL_PASSWORD -e "SHOW DATABASES;" | grep -Ev "(Database|information_schema|performance_schema|test)"`

#for each database in the list, we perform the dump inside the BACKUP_DIR folder
#If the database folder doesn't exist it will create it before dumping!

for db in $databases; do
  echo "Dumping.... $db"
  if [ ! -d "$BACKUP_DIR/$db" ]
  then
        echo "creating Directory $db"
        mkdir -p $BACKUP_DIR/$db
  fi
  mysqldump --force --opt --user=$MYSQL_USER -p$MYSQL_PASSWORD --databases $db | bzip2 > "/$BACKUP_DIR/$db/$db-$TIMESTAMP".bz2
done

echo "Finish!"
