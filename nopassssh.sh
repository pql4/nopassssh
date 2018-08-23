#!/bin/bash
clear

cat <<EOF
===================================================================================
	                                      _______ _______ ___ ___
	._____._____._____.___._._____._____.|     __|     __|   |   |
	|     |  _  |  _  |  _  |__ --|__ --||__     |__     |       |
	|__|__|_____|   __|___._|_____|_____||_______|_______|___|___|
        	    |__|
by; pqL
===================================================================================
EOF
echo ""
echo ""
echo ""
echo -e "\033[0;34m-> Usuário Local:\033[0m "
read U
echo -e "\033[0;34m-> Usuário Remoto:\033[0m "
read R
FND=$(find / -print0 -not -path "*/proc/*" | grep -FzZ "$U/.ssh/id_rsa.pub")
if  [[ -e $FND ]];
then
    echo -e "\033[0;34m-> IP ou FQDN do Servidor :\033[0m "
    read I
    echo -e " \033[0;34m-> Porta SSH \033[0m "
    read P
    echo -e " \033[0;32m==================================== \033[0m "
    echo -e " \033[0;32m    DIGITE SUA SENHA \033[0m "
    echo -e " \033[0;32m==================================== \033[0m "
    echo ""
    ssh-copy-id -i $FND ""-p$P"" $R@$I
else
    echo -e "\033[41;1;37m-> O user $U não tem o arquivo id_rsa.pub criado\033[0m"
fi
