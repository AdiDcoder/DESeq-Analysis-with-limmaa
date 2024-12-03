library(GEOquery)
library(limma)
library(umap)
# load series and platform data from GEO
gset <- getGEO("GSE21942", GSEMatrix =TRUE, AnnotGPL=TRUE)
if (length(gset) > 1) idx <- grep("GPL570", attr(gset, "names")) else idx <- 1
gset <- gset[[idx]]

# make proper column names to match toptable 
fvarLabels(gset) <- make.names(fvarLabels(gset))

# group membership for all samples
gsms <- "11111111111111100000000000000"
sml <- strsplit(gsms, split="")[[1]]

