#!/bin/bash

conversao(){
#CAMINHO =~/alura/shell-script/imagens-livros/
cd ~/alura/shell-script/imagens-livros/

if [ ! -d png ]
then
	mkdir png
fi

for imagem in *.jpg
do
	imagem_sem_extensao=$(ls $imagem | awk -F. '{ print $1 }')
	convert $imagem_sem_extensao.jpg png/$imagem_sem_extensao.png
done
}

conversao 2>erro_conversao.txt
if [ $? -eq 0 ]
then
	echo "Conversão realizada com sucesso"
else
	echo "Houve falha no processoi"
fi


