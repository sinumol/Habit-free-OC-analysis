# Habit-free-OC_Analysis_APJCP
Codes used for the manuscript titled "Genomic landscape of oral squamous cell carcinoma in never smokers and never drinkers" is deposited here
# Cancer Genomics Analysis Pipeline

This repository contains the analysis pipeline used for whole-exome sequencing
and downstream analyses reported in Genomic landscape of oral squamous cell carcinoma in never smokers and never drinkers.

TCGA processed datset and NCBI RAW datset was used for the analysis

## WES data Analysis steps for the replication study
- Quality control (FastQC)
- Alignment (BWA-MEM, GRCh38)
- Somatic variant calling (GATK Mutect2, Tumor only with PoN)
- Variant annotation (ANNOVAR )
- Downstream analyses (TMB, COSMIC signatures, Survival analysis)

## RNA-seq Analysis Pipeline 

Normalization and differential expression (DESeq2)
- Functional enrichment (GO, GSEA, pathway analysis)
- Visualization (PCA, heatmaps, volcano plots)

## Citation
If you use this pipeline, please cite:
Sinumol George et al., [Asian Pacific Journal of Cancer Prevention, 2026]
