#!/bin/bash

memoria_total=$(free | grep -i mem | awk '{ print $2 }')
echo Memoria total é $memoria_total
memoria_consumida=$(free | grep -i mem | awk '{ print $3 }')
echo Memoria consumida é $memoria_consumida
relacao_memoria_atual_total=$(bc <<< "scale=2;$memoria_consumida/$memoria_total *100" | awk -F. '{ print $1 }')

if [ $relacao_memoria_atual_total -gt 10 ]
then
mail -s "Consumo de memória acima do limite" tecnic.alexsilva@gmail.com<<del
O consumo de memória está acima do limite que foi especificado. Atualmente o consumo e de $(free -h | grep -i mem | awk '{ print $3 }')
del

fi
