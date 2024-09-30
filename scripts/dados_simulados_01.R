


# Carrega os pacotes necessários ------------------------------------------

library(here)      # Permite utilizar caminhos relativos no projeto
library(tidyverse) # Metapacote que inclui dplyr, ggplot2, etc.


# dados simulados ---------------------------------------------------------

# fixa a semente para reproducibilidade
set.seed(123)

# cria uma sequência de datas
datas <- seq.Date(
  from = as.Date("2023-01-01"),
  to = as.Date("2023-12-31"),
  by = "day"
)

# simula dados de vendas
dados_vendas <- data.frame(
  data = sample(datas, 1000, replace = TRUE),
  municipio = sample(c("Formiga", "Arcos", "Pimenta", "Piumhi"), 1000, replace = TRUE),
  representante = sample(paste("Representante", 1:20), 1000, replace = TRUE),
  produto = sample(c("Produto A", "Produto B", "Produto C"), 1000, replace = TRUE),
  unidades = sample(1:100, 1000, replace = TRUE),
  preco_unitario = sample(seq(10, 100, by = 5), 1000, replace = TRUE)
)

# calcula receita
dados_vendas <- dados_vendas %>%
  mutate(receita_bruta = unidades * preco_unitario)



# Armazenamento dos Dados Limpos ------------------------------------------

## define o caminho para salvar os dados limpos no formato .csv
path_csv <- here::here("dados/brutos/vendas.csv")
write_csv(dados_vendas, path_csv)