#!/usr/bin/env Rscript
# Compute Spearman correlations and generate edge list

library(tidyverse)

# Input expression file
expr_file <- "data/gene_expression.csv"

# Output file
out_file <- "results/filtered_edges.csv"

# Load data
expr <- read_csv(expr_file)

# Transpose to have genes as columns
expr_t <- expr %>% column_to_rownames("GeneID") %>% t() %>% as.data.frame()

# Compute Spearman correlation
corr_matrix <- cor(expr_t, method = "spearman", use = "pairwise.complete.obs")

# Convert to edge list
edge_list <- as.data.frame(as.table(corr_matrix)) %>%
  filter(Var1 != Var2) %>%
  rename(Gene1 = Var1, Gene2 = Var2, Correlation = Freq) %>%
  mutate(Sign = ifelse(Correlation > 0, "Positive", "Negative"))

# Save
write_csv(edge_list, out_file)
message("Spearman network saved to: ", out_file)
