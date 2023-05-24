kmd=read.csv("Kmeans_data.csv")
#To get output very important is anual income and spending score hence
data=kmd[c(4,5)]
#To decide optimum number of clusters
wcss=vector()
#documentation  (help(kmeans))
for(i in 1:10){
  wcss[i]=sum(kmeans(data,i)$withinss)
}
#To plot elbow curve 
plot(1:10,wcss,type="p",xlab="no of clusters",ylab="wcss")
# type="p" means point "l" means line "b" means both
plot(1:10,wcss,type="b",xlab="no of clusters",ylab="wcss")
#apply kmeans
km=kmeans(data,5)
km$cluster
# making a new column in kmd
kmd$cluster_no=km$cluster
#install.packages("cluster")
#library("cluster")
clusplot(data,km$cluster,lines = 0,shade = TRUE,color = TRUE,labels = 2,xlab = 'Income',ylab = 'Spending score')
subset(kmd,cluster_no==5)
