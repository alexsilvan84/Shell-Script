#!/bin/bash

converte_imagem(){
    local caminho_imagem=$1
    local imagem_sem_extensao=$(ls $caminho_imagem | awk -F '{print $1 }')
    convert $imagem_sem_extensao.jpg $imagem_sem_extensao.png
}

arredura(){
cd $1
    for arquivo in *
    do	
       local caminho_arquivo=$(find ~/alura/shell-script/imagens-livros -name $arquivo)

	    if [ -d $arquivo ]
	    then
		    varredura $caminho_arquivo	
	    else
            converte_imagem $caminho_arquivo
	    fi
done
}

varrer_diretorio ~/alura/shell-script/imagens-livros
if [ $? -eq 0 ]
then
    echo "Conversão realizada com sucesso"
else
    echo "Erro na conversão"
fi
