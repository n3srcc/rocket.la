#!/bin/bash
# Eduardo Mondragon
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
		echo "Descarga de deployment .yaml"
		read -p "Pega la URL del yaml: " YAML_FILE
        wget $YAML_FILE &> /dev/null
        filename=$(basename "$YAML_FILE")

        if [[ "$?" != 0 ]]; then
            echo "Error downloading YAML: $filename"
        else
            echo "YAML Downloaded: $filename"
        fi
	;;
	2)
        #!/usr/bin/env bash
        read -p "Nombre del archivo de deployment: " D_YAML
		echo "Setting Up Config to local ENV"
        if [[ -f "$D_YAML" ]]; then
            source <(sed -nE '/env:/,$ s/ (- name|value): (.*)/\2/p' $D_YAML | sed  "s/ //g" | awk '{ ORS = (NR%2 ? "=" : RS) } 1' | sed -E -n 's/[^#]+/export &/ p')
            source setenv.sh
        else
            echo "No existe el archivo: $D_YAML"
        fi
	;;
esac

