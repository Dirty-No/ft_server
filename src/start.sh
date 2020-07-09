if [ ! -z "$AUTO_INDEX_OFF" ];
    then echo AUTO_INDEX_OFF
    mv sites-enabled/default_auto_index_off /etc/nginx/sites-enabled/default
    else echo AUTO_INDEX_ON
fi