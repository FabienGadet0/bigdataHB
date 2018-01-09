library(SparkR)
sparkR.session(appName = "compute-SD1andSD2")

IntervRR <- function(x ){
rr=0;
i=1;
l=length(x)
while(i<l-2){

if(0==i%%2){
tempi=x[i];
tempii=x[i+1];
rr=rr+(tempi-tempii);
}
i=i+1;
}
meanRR<-(rr/((l-2)/2));
return(meanRR)
}

data<-read.csv("datafrom/1.txt");
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
cat(sprintf("%f  %f  RR(x) : %f  RR(y) : %f", sd1,sd2, IntervRR(x), IntervRR(y)))
sink()

print(sd1)
print(sd2)
# write.text(sd1, "./test")
# write.text(sd2, "./test")
sparkR.session.stop()
