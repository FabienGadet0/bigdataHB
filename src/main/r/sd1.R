library(SparkR)

sparkR.session(appName = "compute-SD1andSD2")
data<-read.csv("1.txt");
l<-length(data[,1]);
x<-data[1:l-1,1];
y<-data[2:l,1];
mx<-mean(x);
my<-mean(y);
sd1sq=(x-mx-y+my) %*% (x-mx-y+my);
sd1=sqrt(sd1sq/2/(l-1))[1,1];
sd2sq=(x-mx+y-my)%*%(x-mx+y-my);
sd2=sqrt(sd2sq/2/(l-1))[1,1];

sink('./result/analysis-output')
cat(sprintf("%f  %f", sd1,sd2))
sink()

print(sd1)
print(sd2)
# write.text(sd1, "./test")
# write.text(sd2, "./test")
sparkR.session.stop()
