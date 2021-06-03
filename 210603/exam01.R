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
