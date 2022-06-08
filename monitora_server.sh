#!/bin/bash

resposta_http=$(curl --write-out %{http_code} --silent --output /dev/null http://localhost)

#if [ $resposta_http -ne 200 ]
if [ $resposta_http -eq 200 ]
then
	mail -s "Problema no servidor" tecnic.alexsilva@gmail.com<<del
	Houve um problema no servidor e os usuarios pararam de ter acesso ao conteúdo web.
del
#	systemctl restart apache2
fi
