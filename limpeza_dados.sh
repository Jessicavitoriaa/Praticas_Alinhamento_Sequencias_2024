# Avaliação de qualidade das leituras com FastQC
# Este comando executa uma verificação básica de qualidade em arquivos FASTQ
fastqc SRRXXXXXXX.fastq

# Limpeza e corte de sequências de baixa qualidade com Trim Galore
# O comando abaixo realiza o corte das bases de baixa qualidade (q=25), remove sequências indesejadas (trim-n), e ajusta outros parâmetros que melhoram a qualidade dos dados
trim_galore --fastqc -q 25 --trim-n --max_n 0 -j 1 --length 18 --dont_gzip SRRXXXXXXX.fastq

# trim_galore: É uma ferramenta usada para remover sequências de baixa qualidade e adaptadores de arquivos de leitura de sequência. Ele é particularmente útil para pré-processar dados de sequenciamento antes de análises mais profundas.

# --fastqc: Este parâmetro indica que a ferramenta deve executar uma análise adicional de qualidade com o FastQC após o processamento das leituras. Isso ajuda a verificar como as leituras foram melhoradas após o corte.

# -q 25: Define o limiar de qualidade. Baseia-se no escore de Phred e essa opção remove bases que têm uma qualidade média menor que 25. Quanto maior o número, maior é a qualidade exigida.

# --trim-n: Remove bases 'N' (ou seja, bases indeterminadas) a partir das extremidades 5' ou 3'. Bases 'N' são frequentemente de baixa qualidade e podem distorcer análises subsequentes.

# --max_n 0: Especifica que leituras contendo qualquer 'N' devem ser removidas completamente. Neste caso, qualquer leitura com ao menos um 'N' será descartada.

# -j 1: Especifica o número de threads de execução paralelo. Definido como 1, o que significa execução em um único thread.

# --length 18: Este parâmetro descarta leituras que tenham comprimento menor que 18 nucleotídeos após o corte. Isso é útil para evitar leituras que são muito curtas para uma análise significativa.

# --dont_gzip: Indica que o arquivo de saída não deve ser comprimido em formato gzip. Isso é importante se você deseja manter o arquivo no formato plaintext para revisões rápidas.

# SRRXXXXXXX.fastq: É o nome do arquivo de entrada que contém os dados de sequência em formato FASTQ. O trim_galore aplicará o processamento a este arquivo.
