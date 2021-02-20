#!/bin/bash
echo " , __             _            _"
echo "/|/  \           | |          | |"
echo " |___/  __   __  | |   _ _|_  | |  __,"
echo " | \   /  \_/    |/_) |/  |   |/  /  |"
echo " |  \_/\__/ \___/| \_/|__/|_/o|__/\_/|_/"
echo "=============================================="
echo "- 1. DESCARGAR YAML KUBERNETES"
echo "- 2. EXTRAER CONFIGURACION Y ASIGNARLAS LOCALMENTE"
echo "=============================================="
echo ""

read -p "Elije una opcion: " option
case $option in
	1)
		echo "Descarga de deploymeny YAML"
		read -p "Pega la URL del YAML " YAML_FILE
        wget $YAML_FILE &> /dev/null
        filename=$(basename "$YAML_FILE")
        #http://localhost/mysql-deployment.yaml

        if [[ "$?" != 0 ]]; then
            echo "Error downloading YAML: $filename"
        else
            echo "YAML Downloaded: $filename"
        fi
	;;
	2)
		echo "Parse deploment YAML"
        while read assign; do
        echo "$assign";
        done < <(sed -nr '/env:/,$ s/  ([A-Z_]+): (.*)/\1=\2/ p' mysql-deployment.yaml)
	;;
esac

