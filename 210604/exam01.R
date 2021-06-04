install.packages("dplyr")

library(dplyr)

list.files()

exam <- read.csv("./csv_exam.csv")

exam %>% filter(class ==3) %>% select(math, english, science)

View(exam)

exam <-exam %>% mutate(avg = (math + english + science)/3)

#반별로 1등 출력
topof1 <- exam %>% filter(class ==1) %>% arrange(desc(avg)) %>% head(1)
topof2 <- exam %>% filter(class ==2) %>% arrange(desc(avg)) %>% head(1)
topof3 <- exam %>% filter(class ==3) %>% arrange(desc(avg)) %>% head(1)
topof4 <- exam %>% filter(class ==4) %>% arrange(desc(avg)) %>% head(1)
topof5 <- exam %>% filter(class ==5) %>% arrange(desc(avg)) %>% head(1)

top <- exam %>% arrange(class,desc(avg))
top[c(1,5,9,13,17),]
result <- (c(top[1,],top[5,],top[9,],top[13,],top[17,]))
#반복문을 사용한 출력
for (i in 1:5){
  print(exam %>% filter(class ==i) %>% arrange(desc(avg)) %>% head(1))
}
#반복 조건
for(i in min(exam$class):max(exam$class)){
  if(i!=4){
  print(exam %>% filter(class ==i) %>% arrange(desc(avg)) %>% head(1))
  }
}

#Grouping
exam %>% group_by(class) %>% summarise(mean = mean(avg))
