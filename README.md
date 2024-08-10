# Verificador de Hashes

Este script em Bash permite verificar a integridade dos arquivos entre duas pastas, comparando as somas de verificação (hashes MD5) dos arquivos. Isso é útil para garantir que os arquivos foram copiados corretamente entre diferentes locais. Útil especialmente para trabalhos periciais em que é necessário garantir a cópia de arquivos.

## Como Usar

1. **Clone o repositório:**

   ```bash
   git clone https://github.com/LeoVichi/Verificador-de-Hashes.git
   cd verificador-de-hashes
   ```

2. **Edite as variáveis `pasta_origem` e `pasta_destino` no script `verificar_hashes.sh`** para apontar para os diretórios que deseja comparar.

3. **Execute o script:**

   ```bash
   bash verificar_hashes.sh
   ```

   O script irá gerar e comparar as somas de verificação para os arquivos nas pastas especificadas e exibirá qualquer discrepância encontrada.

## Requisitos

- Unix/Linux shell (Bash)
- Ferramentas básicas como `md5sum`, `awk`, `grep`

## Licença

Este projeto é licenciado sob os termos da licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.
