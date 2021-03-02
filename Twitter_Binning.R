w<-read.csv(file = "C:/Users/hp/Downloads/tweet.csv")
frequency_of_retweets=table(w$retweets)
View(frequency_of_retweets)
f=data.frame(frequency_of_retweets)
View(f)
s<-f$Freq
for (i in 2:length(s)) {
  s[i]=s[i-1]+s[i]
}
f=data.frame(f,c(s))
bin1= w[FALSE,]
bin2= w[FALSE,]
bin3= w[FALSE,]
bin4= w[FALSE,]
bin5= w[FALSE,]
bin6= w[FALSE,]
bin7= w[FALSE,]
bin8= w[FALSE,]
bin9= w[FALSE,]
bin10= w[FALSE,]

# 0 number_of_retweets = 15827  (61.6%)
#table(w$retweets==0)
#FALSE  TRUE 
#9867 15827 
# 1 number_of_retweets = 4677    (18.2%)
# 2 number_of_retweets = 1683    (6.55%)
# 3 number_of_retweets = 776    (3.02%)
# 4 number_of_retweets = 498    (1.93%)
# 5 number_of_retweets = 286    (1.11%)
# 6 number_of_retweets = 218    (0.84%)
# 7 number_of_retweets = 158    (0.61%)
# 8 number_of_retweets = 119    (0.46%)
# 9 number_of_retweets = 100    (0.38%)
# 10 number_of_retweets = 103   (0.40%)
#Hello sir, as much as I have understood the scattering of this data, 
#for the lower number of retweets, this data is dense and as the number
#of retweets increases,data becomes more scatter.

#as much as I have read the approaches of binning the data was divided
#into approx equal number of elements.but I feel it is unfair to divide
#data evenly because value 0 itself has 61.8% so if we divide this data
#into minimum 2 parts with equal number of elements, 0 itself will be
#in 2 different bins 
#and values greater than 100 are approx 1% where max element is 62666
#so by every logic, 100 would be equal to 62666 which doesn't seem nice
#so I have tried to divide data into parts using binary search basically.

max_element=max(w$retweets)
library(dplyr)

a=nrow(w)
i=1
b=0
y=0
x=0
ans=0
while(i<=10) {
  for(j in 2:length(f$c.s.)-1){
    if(f$c.s.[j]>=as.integer((a-b)/2+b) ){
      ans=ans+1
      y=x
      x=f$Var1[j]  #to store the element who is in the mid of the given range.
      if(i==1){
        w %>% filter(w$retweets>=as.integer(y) & w$retweets<as.integer(x))->bin1
        View(bin1)
        break
      }
      if(i==2){
        w %>% filter(w$retweets>=as.integer(y) & w$retweets<as.integer(x))->bin2
        View(bin2)
        break
      }
      if(i==3){
        w %>% filter(w$retweets>=as.integer(y) & w$retweets<as.integer(x))->bin3
        View(bin3)
        break
      }
      if(i==4){
        w %>% filter(w$retweets>=as.integer(y) & w$retweets<as.integer(x))->bin4
        View(bin4)
        break
      }
      if(i==5){
        w %>% filter(w$retweets>=as.integer(y) & w$retweets<as.integer(x))->bin5
        View(bin5)
        break
      }
      if(i==6){
        w %>% filter(w$retweets>=as.integer(y) & w$retweets<as.integer(x))->bin6
        View(bin6)
        break
      }
      if(i==7){
        w %>% filter(w$retweets>=as.integer(y) & w$retweets<as.integer(x))->bin7
        View(bin7)
        break
      }
      if(i==8){
        w %>% filter(w$retweets>=as.integer(y) & w$retweets<as.integer(x))->bin8
        View(bin8)
        break
      }
      if(i==9){
        w %>% filter(w$retweets>=as.integer(y) & w$retweets<as.integer(x))->bin9
        View(bin9)
        break
      }
      if(i==10){
        w %>% filter(w$retweets>=as.integer(y))->bin10
        View(bin10)
        break
      }
    }
  }
  b=(a-b)/2+b
  i=i+1
}