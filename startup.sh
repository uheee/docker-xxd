#!/bin/bash

XXD_HOME=/var/xxd
FLAG_FILE=$XXD_HOME/.flag
FLAG_INFO="This file is only used to start the script recognition service is installed, please do not delete."
XXD_CONFIG=$XXD_HOME/config/xxd.conf


if [ ! -f "$FLAG_FILE" ]; then
    echo 'unzip xxd package...'
    mkdir -p $XXD_HOME
    tar -zxf /tmp/xxd.tar.gz -C $XXD_HOME
    chmod +x $XXD_HOME/xxd
    # write env variables to config
    mv -f /tmp/xxd.conf $XXD_CONFIG
    sed -i "s|_LISTEN_IP_|$LISTEN_IP|g"  `grep _LISTEN_IP_ -l $XXD_CONFIG`
    sed -i "s|_CHAT_PORT_|$CHAT_PORT|g" `grep _CHAT_PORT_ -l $XXD_CONFIG`
    sed -i "s|_COMMON_PORT_|$COMMON_PORT|g" `grep _COMMON_PORT_ -l $XXD_CONFIG`
    sed -i "s|_IS_HTTPS_|$IS_HTTPS|g" `grep _IS_HTTPS_ -l $XXD_CONFIG`
    sed -i "s|_UPLOAD_PATH_|$UPLOAD_PATH|g" `grep _UPLOAD_PATH_ -l $XXD_CONFIG`
    sed -i "s|_UPLOAD_FILE_SIZE_|$UPLOAD_FILE_SIZE|g" `grep _UPLOAD_FILE_SIZE_ -l $XXD_CONFIG`
    sed -i "s|_RANZHI_URL_|$RANZHI_ADDRESS:$RANZHI_PORT/xuanxuan.php,$XUANXUAN_TOKEN,default|g" `grep _RANZHI_URL_ -l $XXD_CONFIG`
    sed -i "s|_LOG_PATH_|$LOG_PATH|g" `grep _LOG_PATH_ -l $XXD_CONFIG`
    sed -i "s|_CERT_PATH_|$CERT_PATH|g" `grep _CERT_PATH_ -l $XXD_CONFIG`
    echo $FLAG_INFO > $FLAG_FILE
    echo 'unzip xxd package...done!'
fi

echo "xxd starting..."
$XXD_HOME/xxd
