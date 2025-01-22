# Função para instalar e carregar pacotes
ensure_package <- function(pkg) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    install.packages(pkg)
  }
  library(pkg, character.only = TRUE)
}

# Instalar e carregar os pacotes necessários
ensure_package("ComplexHeatmap")
ensure_package("viridis")

# Preparação de dados: Criar uma matriz de exemplo
# Obs: Substitua esta matriz pelos seus próprios dados
set.seed(123)  # Para reprodutibilidade dos dados
d_counts_av0_matrix <- matrix(rnorm(60), nrow = 10, ncol = 6)
rownames(d_counts_av0_matrix) <- paste("Lib", 1:10, sep = "_")
colnames(d_counts_av0_matrix) <- paste("Cepa", 1:6, sep = "_")

# Criação do Heatmap
Heatmap(
  d_counts_av0_matrix,
  name = "RPM",                                 # Nome da escala
  row_title = "Bibliotecas de Pequenos RNAs",   # Título para as linhas
  row_title_gp = gpar(fontsize = 14, fontface = "bold"),
  row_dend_side = "left",
  row_names_side = "left",
  row_names_gp = gpar(fontsize = 10),
  column_title = "Cepas de Wolbachia",          # Título para as colunas
  column_title_gp = gpar(fontsize = 10, fontface = "bold"),
  column_names_gp = gpar(fontsize = 6),
  col = viridis(100)                            # Paleta de cores
)

# Mensagem para indicar que o script foi executado com sucesso
cat("Heatmap gerado com sucesso!\n")
