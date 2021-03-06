% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/simiMatrix.R
\name{simiMatrix}
\alias{simiMatrix}
\title{Similarity matrix generator}
\usage{
simiMatrix(data)
}
\arguments{
\item{data}{A data matrix (n*k) with n examples and k dimensions}
}
\value{
\item{S}{The similarity matrix (n*n) of the input data set}
}
\description{
Generate a similarit matrix used by Shrinkage Clustering
}
\examples{
# load BCWD dataset (569 samples, 30 dimensions, 2 clusters)
data("bcwd_data")
label = data$label
data = data[, c(1:30)]

# compute similarity matrix
S = simiMatrix(data)

# view distribution of similarity scores in S
hist(S)

# run shrinkage clustering
set.seed(10)
clust = SuperCluster(s=S,w=100,k=20,iter=500,random=1)
clust_membership = clust$c[,1]

# quantitatively assess the accuracy of the clustering result
eval_scores = evaluation(clust_membership, label)
eval_scores$NMI # Normalized mutual information
eval_scores$RI # Rand index
eval_scores$F1 #F1 score

# generate a PCA plot to visualize the clustering result
scplot(data, clust_membership)

## Note: scplot is based on ggbiplot package. Use the command below to install ggbiplot
# library(devtools)
# install_github('ggbiplot','vqv')
# library(ggbiplot)

}
\references{
Hu, Chenyue W., Hanyang Li, and Amina A. Qutub. “Shrinkage Clustering: A Fast and Size-Constrained Clustering Algorithm for Biomedical Applications.” BMC Bioinformatics 19 (2018): 19. PMC. Web. 7 May 2018.
}
