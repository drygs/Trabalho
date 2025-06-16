#!/bin/bashAdd commentMore actions

if [ "$#" -ne 3 ]; then
    echo "Uso: $0 <container_name> <database> <output_file>"
    echo "Exemplo: $0 meu_container_mysql minha_base_dados backup.sql"
    exit 1
fi

CONTAINER=$1
DATABASE=$2
OUTPUT_FILE=$3

read -p "Usuário MySQL: " USER
read -s -p "Senha MySQL: " PASSWORD
echo


echo "Realizando backup de $DATABASE para $OUTPUT_FILE..."
docker exec $CONTAINER mysqldump -u $USER -p$PASSWORD $DATABASE > $OUTPUT_FILE

if [ $? -eq 0 ]; then
    echo "Backup concluído com sucesso!"
else
    echo "Erro ao realizar o backup."
    exit 1
fi