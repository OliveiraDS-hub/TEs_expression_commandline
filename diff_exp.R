      ###  IONIZING RADIATION   ###
      
##Input count table
counttable = read.csv("est_counts_genes_tes_RAD.csv", header = TRUE, row.names = 1, sep = ",")
counttable = round(counttable,digits = 0)

##colData creation
condition = c("control","control","rad144gy","rad144gy","rad360gy","rad360gy","rad864gy","rad864gy")
colData = data.frame(row.names=colnames(counttable), treatment=factor(condition, levels=c("control","rad144gy","rad360gy","rad864gy")))                     

##Differential expression analysis

library(DESeq2)
dataset <- DESeqDataSetFromMatrix(countData = counttable, colData = colData, design = ~treatment)

dds = DESeq(dataset)

result = results(dds, contrast=c("treatment","rad144gy","control"))
result2 = results(dds, contrast=c("treatment","rad360gy","control"))
result3 = results(dds, contrast=c("treatment","rad864gy","control"))



      ###  STARVATION   ###

##Input count table
counttable = read.csv("total_count.csv", header = TRUE, row.names = 1, sep = ",")

##colData creation
condition = c("control","control","starv_16h","starv_16h")
colData = data.frame(row.names=colnames(counttable), treatment=factor(condition, levels=c("control","starv_16h")))                     

##Differential expression analysis

library(DESeq2)
dataset <- DESeqDataSetFromMatrix(countData = counttable, colData = colData, design = ~treatment)

dds = DESeq(dataset)

result = results(dds, contrast=c("treatment","starv_16h","control"))



      ###  OXIDATIVE STRESSORS   ###
      
##Input count table
counttable = read.csv("est_counts_genes_tes_ROS.csv", header = TRUE, row.names = 1, sep = ",")
counttable = round(counttable,digits = 0)

##colData creation
condition = c("control","control","diox","diox","formald","formald","tol","tol")
colData = data.frame(row.names=colnames(counttable), treatment=factor(condition, levels=c("control","diox","formald","tol")))                     

##Differential expression analysis

library(DESeq2)
dataset <- DESeqDataSetFromMatrix(countData = counttable, colData = colData, design = ~treatment)

dds = DESeq(dataset)

result = results(dds, contrast=c("treatment","diox","control"))
result2 = results(dds, contrast=c("treatment","formald","control"))
result3 = results(dds, contrast=c("treatment","tol","control"))





