#!/bin/bash

# Caminhos das pastas
pasta_origem="/pasta origem"
pasta_destino="/pasta destino"

# Gerar somas de verificação no disco original
echo "Gerando somas de verificação MD5 para a pasta original..."
find "$pasta_origem" -type f -exec md5sum {} + > original_checksums_pasta.md5

# Exibir os arquivos e hashes da pasta original
echo "Arquivos e hashes da pasta original:"
cat original_checksums_pasta.md5
echo "-------------------------------------"

# Gerar somas de verificação no novo disco
echo "Gerando somas de verificação MD5 para a nova pasta..."
find "$pasta_destino" -type f -exec md5sum {} + > new_checksums_pasta.md5

# Exibir os arquivos e hashes da nova pasta
echo "Arquivos e hashes da nova pasta:"
cat new_checksums_pasta.md5
echo "-------------------------------------"

# Comparar somas de verificação
echo "Comparando as somas de verificação para as pastas..."

while IFS= read -r original_line
do
  original_hash=$(echo "$original_line" | awk '{print $1}')
  original_file=$(echo "$original_line" | awk '{print $2}')
  
  new_hash=$(grep "$(basename "$original_file")" new_checksums_pasta.md5 | awk '{print $1}')
  
  if [ "$original_hash" != "$new_hash" ]; then
    echo "Discrepância encontrada no arquivo: $original_file"
    echo "Hash original: $original_hash"
    echo "Hash novo: $new_hash"
  else
    echo "Arquivo verificado: $original_file - Hashs coincidem."
  fi
done < original_checksums_pasta.md5

echo "Comparação concluída."

