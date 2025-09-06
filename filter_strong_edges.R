#!/usr/bin/env Rscript
# Filter edges for genes of interest

library(tidyverse)

# Files
edges_file <- "results/filtered_edges.csv"
genes_file <- "data/pathhypssp.txt"
out_file <- "results/strong_edges.csv"

# Load
edges <- read_csv(edges_file)
genes <- read_lines(genes_file)

# Filter edges where either gene is in genes of interest
strong_edges <- edges %>%
  filter(Gene1 %in% genes | Gene2 %in% genes)

# Save
write_csv(strong_edges, out_file)
message("Filtered strong edges saved to: ", out_file)
