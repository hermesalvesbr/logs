#!/bin/bash

# Verifica se os parâmetros necessários foram passados
if [ "$#" -ne 2 ]; then
    echo "Uso: $0 [diretório com arquivos CSV] [diretório de saída HTML]"
    exit 1
fi

# O diretório com os arquivos CSV é o primeiro parâmetro
csv_directory="$1"

# O diretório de saída para os arquivos HTML é o segundo parâmetro
html_directory="$2"

# Verifica se o diretório html existe, se não, cria
mkdir -p "$html_directory"

# Loop para iterar sobre todos os arquivos CSV
for csv_file in "$csv_directory"/*.csv; do
    # Extrai o nome base do arquivo (sem extensão)
    base_name=$(basename "$csv_file" .csv)

    # Comando para processar o arquivo CSV e gerar o relatório HTML
    cat "$csv_file" | docker run -i --rm matsuu/pgbadger - --format csv --prefix '%t [%p]: user=%u,db=%d,app=%a,client=%h ' -o - -x html > "$html_directory/${base_name}.html"
done
