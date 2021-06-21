#!/bin/bash
source /etc/rsync/config

inotifywait  -mrq -e 'create,delete,modify,attrib,moved_to' --timefmt '%Y-%m-%d %H:%M' --format '%T %w%f %Xe' ${SOURCE_DIR} | while read line
do
   filename="`echo $line | awk '{print $3}'`"
   if [[ ${filename: -1} != "~" ]];then
     rsync -avz --delete ${SOURCE_DIR} ${REMOTE_USER}@${REMOTE_IP}::${REMOTE_DIR} --password-file=${REMOTE_PWD_FILE}
   fi
done

