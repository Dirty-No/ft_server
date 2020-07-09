echo AUTO_INDEX : $AUTO_INDEX
if  [ "${AUTO_INDEX}" == "OFF" ]
    then
		echo "AUTO_INDEX OFF"
    	mv sites-enabled/default_auto_index_off /etc/nginx/sites-enabled/default
    else
	    echo "AUTO_INDEX ON (default)"
fi
