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

subway <- read.csv("1-4호선승하차승객수.csv")
subway
subway %>% group_by(line_no) %>% summarise(total_in = sum(in.), total_out= sum(out))
# 승차인원의 총합과 하차인원의 총합 출력
subway %>% summarize(total_in = sum(in.), total_out = sum(out))

install.packages("foreign")
install.packages("ggplot2")
install.packages("dplyr")
library(foreign)
library(ggplot2)
library(dplyr)
list.files()
#sav 파일 불러오기
korea <- read.spss("Koweps_hpda12_2017_beta1.sav",to.data.frame = T)
str(korea)
View(korea)

korea <- korea %>% rename(gender = h12_g3, birth = h12_g4, income = h12_pers_income1, code_job = h12_eco9)
korea
View(korea)
class(korea$gender)

#빈도수 체크 함수
table(korea$gender)
#조건 함수 ifelse(조건,true값,false값)
korea$gender <- ifelse(korea$gender == 1,"male","female")
table(korea$gender)
#연봉 검토
qplot(korea$income)

summary(korea$income)
#통계가 불가능한 결측치 제거
korea$income <- ifelse(korea$income == 0, NA, korea$income)
summary(korea$income)
#결측치확인
is.na(korea$income)
is.na(korea$gender)

#korea Data에서 연봉에 결측치가 없는 행만 추출하여 성별별 연봉평균 출력
gender_income <- korea %>% filter(!is.na(korea$income)) %>% group_by(gender) %>% summarise(mean_income=mean(income))
#시각화 ggplot(data = 원본데이터, aes(x=x축, y=y축)) + geom_col()
ggplot(data = gender_income, aes(x=gender, y= mean_income)) + geom_col()

#데이터 JOIN
list.files()
code_job <- read.csv("code_jop.csv")
korea <- left_join(korea, code_job, id="code_job")

job_income <- korea %>% filter(!is.na(job)& !is.na(income)) %>% group_by(job) %>% summarise(mean_income = mean(income))
View(job_income)
#상위 10개 직업 출력
top10 <- job_income %>% arrange(desc(mean_income)) %>% head(10)
#시각화 및 최적화(회전 및 정렬)
ggplot(data=top10, aes(x=reorder(job,mean_income),y=mean_income))+geom_col() + coord_flip()
