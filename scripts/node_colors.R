#!/usr/bin/env Rscript
# Assign node categories for Cytoscape

library(tidyverse)

edges <- read_csv("results/strong_edges.csv")

nodes <- c(edges$Gene1, edges$Gene2) %>% unique() %>% as.data.frame()
colnames(nodes) <- "GeneID"

nodes <- nodes %>%
  mutate(Category = case_when(
    str_detect(GeneID, "Eucgr\\.") ~ "Plant",
    str_detect(GeneID, "APSI_") ~ "Pathogen",
    str_detect(GeneID, "^DN") ~ "Hyperparasite",
    TRUE ~ "Other"
  ))

write_csv(nodes, "results/node_categories.csv")
message("Node categories saved to: results/node_categories.csv")
