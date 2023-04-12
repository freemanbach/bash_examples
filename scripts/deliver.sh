#!/bin/bash
#
#
WORKDIR=/var/tmp
FILENAME=helloworld
 
#find last line +1
SCRIPT_END=$( awk '
  BEGIN { err=1; } 
  /^\w*___ARCHIVE___\w*$/ { print NR+1; err=0; exit 0; } 
  END { if (err==1) print "?"; }
' "$0" )
 
# check for error
if [ "$SCRIPT_END" == '?' ]
then
   echo Can\'t find embedded file
   exit 1
fi

# Extract file
tail -n +$SCRIPT_END $0 >"$WORKDIR/${FILENAME}"

# Give it Permission to run
chmod 755 ${WORKDIR}/${FILENAME}
 
# Do something with the file
# https://hackaday.com/2021/04/09/linux-fu-shell-script-file-embedding/
exit 0

# Here's the end of the script followed by the embedded file
___ARCHIVE___
