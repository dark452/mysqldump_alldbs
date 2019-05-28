#!/bin/sh
#
# Perform cleanup of the backup folders
# @DaRk452 - imunoz@redeshost.cl
#
############

# Number of days to keep data under /var/www/mediadumps
KeepDays="30"

#
# Clean up files older than $KeepDays
#
CleanUp () {
  find /var/www/mediadumps/ -type f -mtime +${KeepDays} > /tmp/${MyName}.clean
  if [ `cat /tmp/${MyName}.clean | wc -l` -gt 0 ]; then
     echo "Cleaning old files: "
     awk '{printf "    --> %s\n",$1}' /tmp/${MyName}.clean
     find /var/www/mediadumps/* -type f -mtime +${KeepDays} | xargs rm
  else
     echo "Nothing to clean."
  fi
  echo ""
  rm /tmp/${MyName}.clean
}

####MAIN#####


CleanUp
