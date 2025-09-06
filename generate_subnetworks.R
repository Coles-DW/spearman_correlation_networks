#!/usr/bin/env Rscript
# Generate subnetworks by sign or gene category

library(tidyverse)

edges <- read_csv("results/strong_edges.csv")

# Positive / Negative subnetworks
edges %>%
  filter(Sign == "Positive") %>%
  write_csv("results/strong_edges_positive.csv")

edges %>%
  filter(Sign == "Negative") %>%
  write_csv("results/strong_edges_negative.csv")

# Helper function to filter by gene prefix
filter_by_prefix <- function(df, keep1, keep2) {
  df %>% filter((str_detect(Gene1, keep1) & str_detect(Gene2, keep2)) |
                  (str_detect(Gene1, keep2) & str_detect(Gene2, keep1)))
}

# Plant-Pathogen
plant_pathogen <- filter_by_prefix(edges, "Eucgr\\.", "APSI_")
write_csv(plant_pathogen, "results/plant_pathogen_edges.csv")

# Hyperparasite-Plant
hyper_plant <- filter_by_prefix(edges, "DN", "Eucgr\\.")
write_csv(hyper_plant, "results/hyperparasite_plant_edges.csv")

# Pathogen-Hyperparasite
pathogen_hyper <- filter_by_prefix(edges, "APSI_", "DN")
write_csv(pathogen_hyper, "results/pathogen_hyper_edges.csv")
