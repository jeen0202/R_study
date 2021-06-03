# 변수
# 변수 생성
# 변수명 <- 자료
text <- "안녕"
num <- 50
num
isCheck <- T
isCheck
isCheck <- F
isCheck

vec <- c("아메리카노","에스프레소","카페라떼","바닐라라떼","플랫화이트")
vec[3]

#Quiz
# 첫번째, 세번쨰, 다섭번째의 값을 출력하시오
answer <- c(vec[1],vec[3],vec[5])

vec[c(1,3,5)]
View(vec)
#Boolean Index
x <- c(40,32,15,23,17,32,15,8,12,48)
x[x >=20]
#Sequence
y <- seq(1,100)
y <- 1:100
#dataFrame
No <- c(1,2,3,4)
Name <-c("Apple","Peach","Banana","Grape")
Price <-c(500,200,100,50)
Qty <- c(5,2,4,7)
sales <- data.frame(No,Name,Price,Qty)
View(sales)
sales[1,]
sales[,1]
sales$No
#1행과 2행 출력
sales[c(1,2),]
# 1열과 2열 출력
sales[,c(1,2)]
#1열~3열 출력
sales[,1:3]

kia <- read.csv('./기아타이거즈연봉.csv')

#상위 6개
head(kia)
#하위 6개
tail(kia)
#출력 개수 지정
head(kia,15)
#data 구조 파악
str(kia)
View(kia)
summary(kia)

boxplot(kia)
boxplot(kia$연봉)

#wordcolud 시각화를 위한 package 설치
install.packages('wordcloud')
library(wordcloud)
word <- c("광어","족발","짜장","냉면","국밥","치킨")
pre <- c(150,70,60,65,110,200)
#wordcloud(단어,빈도)
wordcloud(word,pre)
#wordcloud 내부 option
wordcloud(word, pre, random.order = F,colors =c("black","blue","red"))
wordcloud(kia$선수명,kia$연봉, random.order = F, colors=c("darkgray","forestgreen","blue","yellow","black"))

#전처리를 위한 package 설치
install.packages('dplyr')
library(dplyr)

list.files()
exam <- read.csv("./csv_exam.csv")
View(exam)
# dplyr 내부 함수 사용을 위한 연산자자(Pipe) : %>%
#filter의 조건식이 참인 항목을 반환
exam %>% filter(class == 1)
exam %>% filter(class != 1)
# &(and) |(or)
exam %>% filter(class ==1 | class == 3)
exam %>% filter(class ==1 & math >= 50)


install.packages("ggplot2")
library(dplyr)
library(ggplot2)
View(mpg)
#dataFrame으로 변환
mpg2 <- as.data.frame(mpg)
str(mpg2)
#filtering
dis4 <-mpg2 %>% filter(displ <=4)
dis5 <-mpg2 %>% filter(displ >=5)
#평균 도출
mean(dis4$hwy)
mean(dis5$hwy)
#연비 비교
audi <- mpg2 %>% filter(manufacturer == 'audi')
toyota <- mpg2 %>% filter(manufacturer == 'toyota')
mean(audi$cty)
mean(toyota$cty)

#Select
exam %>% select(math)
#복수의 항목 Select
exam %>% select(math,english)
#항목 제외
exam %>% select(-math)
# 연산 복수 실행(filter,select)
exam %>% filter(class == 1) %>% select(math)

install.packages('googleVis')
library(googleVis)
library(dplyr)

Fruits
Apples <- Fruits %>% filter(Fruit =='Apples')
Apples %>% filter(Sales == max(Apples$Sales)) %>% select(Date) 
Oranges <- Fruits %>% filter(Fruit =='Oranges')
Bananas <- Fruits %>% filter(Fruit =='Bananas')

#정렬(default ASC)
exam %>% arrange(math)
#내림차순
exam %>% arrange(desc(math))
#연속정렬
exam %>% arrange(math, english)

View(exam)
#파생변수 추가
exam <-exam %>% mutate(avg =(math +english + science)/3)
View(exam)
#class가 1인 학생중 평균이 가장 높은 학생
exam %>% filter(class ==1) %>% filter(avg==max(avg))
head(exam %>% filter(class ==1) %>% arrange(desc(avg)),1)
exam %>% filter(class ==1) %>% arrange(desc(avg)) %>% head(1)
