# Spearman Correlation Network Analysis

This repository contains scripts to compute, filter, and visualize gene co-expression networks using Spearman correlation. It is tailored for plant, pathogen, and hyperparasite gene expression data.

## Directory Structure

- `data/` – Input gene expression files (`gene_expression.csv`).
- `results/` – Output networks, filtered edges, and summary statistics.
- `scripts/` – R scripts for analysis:
  - `compute_spearman_network.R` – Compute Spearman correlations and generate edge list.
  - `filter_strong_edges.R` – Filter network for genes of interest.
  - `generate_subnetworks.R` – Extract subnetworks (e.g., positive/negative, plant-pathogen, pathogen-hyperparasite).
  - `count_nodes_edges.R` – Count nodes and edges in networks.
  - `node_colors.R` – Assign node categories for Cytoscape coloring (plant, pathogen, hyperparasite).

## Getting Started

1. Clone the repository:

```bash
git clone https://github.com/<your_username>/spearman_correlation_networks.git
cd spearman_correlation_networks
Add your gene expression file:

Place your expression CSV in data/gene_expression.csv. Format:

GeneID	Sample1	Sample2	...
DN001	5.2	4.8	...
APSI_1	6.1	5.9	...

Compute the Spearman correlation network:

bash
Copy code
Rscript scripts/compute_spearman_network.R
Filter for specific genes of interest:

bash
Copy code
Rscript scripts/filter_strong_edges.R
Generate subnetworks (positive/negative edges, plant-pathogen, pathogen-hyperparasite, etc.):

bash
Copy code
Rscript scripts/generate_subnetworks.R
Count nodes and edges:

bash
Copy code
Rscript scripts/count_nodes_edges.R
Prepare node color mapping for Cytoscape:

bash
Copy code
Rscript scripts/node_colors.R
Node Coloring for Cytoscape
Plant genes (Eucgr.*) – Blue

Pathogen genes (APSI_*) – Orange

Hyperparasite genes (DN*) – Green

These colors are color-blind friendly.

Output
results/strong_edges.csv – Full Spearman network filtered by threshold.

results/filtered_edges.csv – Network filtered for genes of interest.

results/positive_edges.csv & negative_edges.csv – Positive/negative subnetworks.

results/plant_pathogen_edges.csv, pathogen_hyper_edges.csv, etc. – Subnetworks by gene category.
