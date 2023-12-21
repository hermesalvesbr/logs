#!/bin/bash

# Nome do arquivo de índice a ser criado
index_file="index.html"

# Iniciar o arquivo index.html com HTML básico e Bootstrap
cat <<EOF > "$index_file"
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Relatório do matsuu/pgbadger</title>
    <!-- Inclui o CSS do Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1 class="mt-5 mb-3">Relatório do PgBadger</h1>
    <p>Relatórios gerados em $(date +"%d/%m/%Y às %H:%M:%S")</p>
    <pre>https://github.com/hermesalvesbr/logs</pre>
    <ul class="list-group">
EOF

# Procurar arquivos .html e .htm e adicionar ao arquivo index.html
find . -type f \( -name "*.html" -o -name "*.htm" \) | while read -r file; do
    # Excluir o arquivo index.html atual da lista
    if [[ $file != "./$index_file" ]]; then
        # Adicionar o link ao arquivo no index.html
        echo "<li class=\"list-group-item\"><a href=\"$file\">$file</a></li>" >> "$index_file"
    fi
done

# Fechar as tags HTML
cat <<EOF >> "$index_file"
    </ul>
</div>
</body>
</html>
EOF

echo "Arquivo $index_file gerado com sucesso."
