url("https://www.youtube.com/watch?v=lsMRk2Mmfdc")

setwd("/media/soren/Soren_Drive/SOSCIP/Stripe_rust/Results/YR15/RNA-seq/Cuffdiff")
getwd()
dir()

# source("http://bioconductor.org/biocLite.R")
# biocLite()
# biocLite("cummeRbund")

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install()
BiocManager::install(c("cummeRbund", "AnnotationDbi"))


library(cummeRbund)

?readCufflinks
file <- readCufflinks(dbFile = "YR15.sqlite")
file

# CuffSet instance with:
# 4 samples
# 143994 genes
# 308581 isoforms
# etc ...


dispersionPlot(genes(file)) #or isoforms

fpkmSCVPlot(genes(file))
fpkmSCVPlot(isoforms(file))

csDensity(genes(file))
csDensity(genes(file), replicates=T)

csScatterMatrix(genes(file))
csBoxplot(genes(file))

csDendro(genes(file))
csDendro(genes(file), replicates = )


## Heatmap
# first importing the list of genes of interest as a vector into R:
RI_SM <- scan("RI_SM_heatmap", character(), quote = "") # RI_SM_heatmap has only the 1st column name of the genes.
# getting the info of the genes from the sqlite file:
my_genes <- getGenes(file, RI_SM)
# heat-mapping:
csHeatmap(my_genes, clustering = "row", heatscale=c(low='blue',mid='gray',high='red'))

# example: 
# csHeatmap(testcommon,rescaling='none',clustering='none',labCol=F,labRow=T,logMode=T,pseudocount=1.0,border=FALSE,heatscale=c(low='green',mid='black',high='red'),heatMidpoint=NULL)
