# Gerador de Relatórios HTML para Arquivos CSV

Este script Bash é projetado para processar automaticamente arquivos CSV e gerar relatórios HTML correspondentes usando o `pgbadger`. É ideal para análises de logs ou qualquer situação onde você deseja converter rapidamente dados CSV em um formato HTML mais legível.

## Requisitos

Para usar este script, você precisará ter instalado:

- Bash
- Docker

O script usa Docker para executar `pgbadger`, portanto, certifique-se de que o Docker está instalado e funcionando corretamente em seu sistema.

## Uso

Para executar o script, siga estes passos:

1. Salve o script em um arquivo chamado `generate_reports.sh`.
2. Dê permissão de execução para o script com o comando:

   ```bash
   chmod +x generate_reports.sh
   ```

3. Execute o script passando o diretório de arquivos CSV e o diretório de destino HTML como argumentos:

   ```bash
   ./generate_reports.sh [diretório_csv] [diretório_html]
   ```

   Por exemplo:

   ```bash
   ./generate_reports.sh ieducar html
   ```

O script irá iterar sobre todos os arquivos `.csv` no diretório especificado (`[diretório_csv]`), processá-los e salvar os relatórios HTML no diretório `[diretório_html]`.

## Estrutura do Script

- O script verifica se dois argumentos foram fornecidos (diretórios de origem e destino).
- Cria o diretório de destino se ele não existir.
- Para cada arquivo CSV no diretório de origem:
  - Extrai o nome base do arquivo (sem a extensão `.csv`).
  - Executa o `pgbadger` dentro de um container Docker para processar o arquivo CSV.
  - Salva o relatório HTML resultante no diretório de destino, com o mesmo nome base do arquivo CSV.

## Notas

- Este script foi projetado para trabalhar especificamente com arquivos CSV que são compatíveis com o formato esperado pelo `pgbadger`.
- Certifique-se de ter permissões adequadas para ler os arquivos no diretório CSV e escrever no diretório HTML.
