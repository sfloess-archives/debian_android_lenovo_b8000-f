#!/tmp-mksh/tmp-mksh

export LOG_DIR=/mnt/sdcard/init.d
export LOG_FILE=${LOG_DIR}/log.txt

export STORAGE_DIR=/storage/sdcard1
export DEB_DIR=${STORAGE_DIR}/debian

mkdir -p ${STORAGE_DIR}

echo Starting `date` > ${LOG_FILE}

mount -t ext4 /dev/block/mmcblk1 ${STORAGE_DIR} >> ${LOG_FILE} 2>&1

mount -t proc  /proc    ${DEB_DIR}/proc/    >> ${LOG_FILE} 2>&1
mount -t sysfs /sys     ${DEB_DIR}/sys/     >> ${LOG_FILE} 2>&1
mount -o bind  /dev     ${DEB_DIR}/dev/     >> ${LOG_FILE} 2>&1
mount -o bind  /dev/pts ${DEB_DIR}/dev/pts/ >> ${LOG_FILE} 2>&1

#chroot  ${DEB_DIR} /bin/su - root

#nohup /system/xbin/busybox chroot ${DEB_DIR} /bin/bash /flossware/startup.sh >> ${LOG_FILE} 
#chroot ${DEB_DIR} /bin/bash /flossware/startup.sh & >> ${LOG_FILE} 
#nohup chroot ${DEB_DIR} /bin/bash -l /flossware/startup.sh & >> ${LOG_FILE} 
#nohup chroot ${DEB_DIR} /bin/su - root -s bash -c /flossware/startup.sh & >> ${LOG_FILE} 
chroot ${DEB_DIR} /bin/su - root -c /flossware/startup.sh >> ${LOG_FILE} 

