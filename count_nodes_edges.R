#!/usr/bin/env Rscript
# Count nodes and edges in networks

library(tidyverse)

files <- list.files("results/", pattern = "_edges.*\\.csv$", full.names = TRUE)

for(f in files) {
  edges <- read_csv(f)
  n_edges <- nrow(edges)
  n_nodes <- c(edges$Gene1, edges$Gene2) %>% unique() %>% length()
  
  n_pos <- sum(edges$Sign == "Positive")
  n_neg <- sum(edges$Sign == "Negative")
  
  message("File: ", f)
  message("  Total nodes: ", n_nodes)
  message("  Total edges: ", n_edges)
  message("  Positive edges: ", n_pos)
  message("  Negative edges: ", n_neg)
  message("---------------")
}
