library(SparkR)
sparkR.session(appName = "compute-SD1andSD2")

data<-read.csv("~/sparkProj/1.txt");
l<-length(data[,1]);
x<-data[1:l-1,1];
y<-data[2:l,1];
mx<-mean(x);
my<-mean(y);
sd1sq=(x-mx-y+my) %*% (x-mx-y+my);
sd1=sqrt(sd1sq/2/(l-1))[1,1];
# sd1;
# plot(sd1);
sd2sq=(x-mx+y-my)%*%(x-mx+y-my);
sd2=sqrt(sd2sq/2/(l-1))[1,1];
# plot(sd2);

print(sd1)
print(sd2)
sparkR.session.stop()
