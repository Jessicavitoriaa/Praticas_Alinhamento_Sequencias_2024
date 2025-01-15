# Instalação e carregamento das bibliotecas necessárias
if (!requireNamespace("ComplexHeatmap", quietly = TRUE)) {
  install.packages("ComplexHeatmap")
}
if (!requireNamespace("viridis", quietly = TRUE)) {
  install.packages("viridis")
}
library(ComplexHeatmap)
library(viridis)

# Criar uma matriz de exemplo (substitua esta parte pelos seus dados).
# Aqui estou criando uma matriz aleatória apenas para fins ilustrativos.
set.seed(123)  # Para reprodutibilidade
d_counts_av0_matrix <- matrix(rnorm(60), nrow = 10, ncol = 6)
rownames(d_counts_av0_matrix) <- paste("Lib", 1:10, sep = "_")
colnames(d_counts_av0_matrix) <- paste("Cepa", 1:6, sep = "_")

# Construir o Heatmap
Heatmap(
  d_counts_av0_matrix,
  name = "RPM",                                 # Nome da escala
  row_title = "Bibliotecas de Pequenos RNAs",   # Título para linhas
  row_title_gp = gpar(fontsize = 14, fontface = "bold"),
  row_dend_side = "left",
  row_names_side = "left",
  row_names_gp = gpar(fontsize = 10),
  column_title = "Cepas de Wolbachia",          # Título para colunas
  column_title_gp = gpar(fontsize = 10, fontface = "bold"),
  column_names_gp = gpar(fontsize = 6),
  col = viridis(100)                            # Paleta de cores
)
