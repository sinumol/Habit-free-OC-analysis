#####################molecular subtype classification of HF ####
#########14-10-2025###############
### Author:Sinumol George
# Load required libraries
library(data.table)
library(dplyr)
library(FactoMineR)
library(factoextra)

#--------------------------
# STEP 1: Load expression data
#--------------------------
expr_df <- fread("Matrix.txt")
# Average duplicate genes
expr_clean <- expr_df %>%
  group_by(GeneSymbol) %>%
  summarise(across(everything(), mean, na.rm = TRUE))  ### will take time

# Convert to matrix
expr <- as.data.frame(expr_clean)
rownames(expr) <- expr$GeneSymbol
expr <- expr[, -1]

#--------------------------
centroids <- read.csv("C:/Users/sinum/OneDrive/Desktop/Risen/revision/mol-subtype/Keck_Enhanced_Subtype_Centroids.csv")
rownames(centroids) <- centroids$Gene   #$`ï»¿Gene for new centroid
centroids <- centroids[, -1]

#--------------------------
# STEP 3: Match common genes
#--------------------------
common_genes <- intersect(rownames(expr), rownames(centroids))
expr_sub <- expr[common_genes, ]
centroids_sub <- centroids[common_genes, ]

cat("Number of common genes used for classification:", length(common_genes), "\n")

#--------------------------
# STEP 4: Compute subtype correlation per sample
#--------------------------
sample_subtypes <- sapply(colnames(expr_sub), function(sample) {
  scores <- apply(centroids_sub, 2, function(c) cor(expr_sub[, sample], c, method = "pearson"))
  names(which.max(scores))
})
