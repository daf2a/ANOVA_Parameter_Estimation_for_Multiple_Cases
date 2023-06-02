# 1A
resp <- c(1,2,3,4,5,6,7,8,9)
x <- c(78,75,67,77,70,72,78,74,77)
y <- c(100,95,70,90,90,90,89,90,100)
dt <- data.frame(resp,x,y)
dt
diff <- dt[,3]-dt[,2]
diff
std1 <- sd(diff)
std1

#1B
t.test(y, x, paired = TRUE)
t <- ((xbar-ybar)-std1)/sqrt(Q*((1/p1)+(1/p2)))
t

#1C
var.test(y, x)]
t.test(y, x, var.equal = TRUE)

#2A
zsum.test(mean.x=23500, sigma.x = 3900, n.x = 100,  
          + 	alternative = "greater", mu = 20000,
          + 	conf.level = 0.95)

#3B
tsum.test(mean.x=3.64, s.x = 1.67, n.x = 19, mean.y =2.79 , s.y = 1.32, n.y = 27, alternative = "greater", var.equal = TRUE)

#3C
install.packages("mosaic")
library(mosaic)
plotDist(dist='t', df=2, col="blue")

#3D
qchisq(p = 0.05, df = 2, lower.tail=FALSE)

#4A
install.packages("multcompView")
library(readr)
library(ggplot2)
library(multcompView)
library(dplyr)

GTL <- read_csv("GTL.csv")
head(GTL)

str(GTL)

qplot(x = Temp, y = Light, geom = "point", data = GTL) +
  facet_grid(.~Glass, labeller = label_both)

#4B
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)

anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)

#4D
data_summary <- group_by(GTL, Glass, Temp) %>%
  summarise(mean=mean(Light), sd=sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)




