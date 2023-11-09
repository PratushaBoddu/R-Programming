# Question :1 Try to write a code for printing sequence of numbers from 1 to 50 with the differences of 3, 5, 10 
seq(1,50,by=3)
seq(1,50,by=5)
seq(1,50,by=10)

#=====================================#
# Question :2 What are the different data objects in R? and write syntax and example for each and every object
#Data types :  1. Numeric
              #2. Integer
              #3. Charector
              #4. Logical
              #5. `complex`

#Numeric : All the numbers will come under this data type
a<-1
class(a)
q<-25000  #salary
class(a)
a<-134.456 #Height
class(a)

# Defining an integer (takes only Integer value)
a<-1L
a
class(a)
x<-1.2L
x
class(x) # overwrites the type of class

#Defining a complex number
1+2i
x<-1+2i
class(x)
Re(x) # print real value in x
Im(x) # print Imaginary Numbers

# defining a charector (lower/uppercase,letters,special characters)
a<-'a'
class(a)

# Defining Logical value(true/false,0/1)
a<-TRUE #T
a
a <- 0
class(a)
b<- FALSE #F
class(a)
class(b)
as.integer(TRUE)
0
x<-as.logical(0)
class(x)

#==================================================#
#Question :3 Create Data frame with 3 columns and 5 rows and write a code to fetch and delete 
#row and a column using index and add new column and row to the existed data frame
x<-matrix(c(1:3),nrow=5,ncol =3,byrow = F,dimnames = list(c('r1','r2','r3','r4','r5'),
                                                          c('c1','c2','c3')))
x
df <- as.data.frame(x)
df
print(df[1,])           #fetching a row
print(df[,1])           #fetching a column

df
df1 <- df[(-1),]
df1                  #deleting a row by its index
df2 <- df[,(-1)]
df2                 #deleting a column by its index
c4 <- c(1,2,3,1,2)
df3 = cbind(df,c4)
df3                #Adding a new column
r6 <- c(1,2,3)
df4 = rbind(df,r6)
df4                  #Adding a new row
# ================================================== #
#Question :4 Write nested if else statements to print whether the given number is negative, positive or Zero 
num = -23
if(num>0){
  print("Positive Number")
}else if(num==0){
  print("Zero")
}else{
  print("Negative Number")
}

#==================================================#
# Question : 5 write a program to input any value and check whether it is character, numeric or special character
Any_value <- readline("Please enter any value:")

# Remove leading and trailing whitespace
Any_value <- trimws(Any_value)

if (grepl("[A-Za-z]", Any_value)) {
  cat("The input value", Any_value, "is an Alphabet\n")
} else if (grepl("[0-9]", Any_value)) {
  cat("The input value", Any_value, "is numeric\n")
} else {
  cat("The input value", Any_value, "is alphanumeric or a special character\n")
}

#===========================================#
#Question :6 write difference between break and next also write examples for both 

# Next statement is also a jump statement which is used to skip the current iteration in the loop 
# and move to the next iteration without exiting from the loop itself.

#Example for next 
for (i in 1:6){
  if (i == 3 | i == 6){
    print(paste("skip the loop",i))
    next
  }
  print(paste("values",i))
}

# Example for break 
# Break is a jump statement where in it terminates  the loop at particular iteration

for(a in 1:10)
{
 if(a == 5){
   print(paste("coming out of the loop", a))
   break
 }
  print(paste("Values", a))
}
     
#===========================================#
#Question: 7 write a program to print a given vector in reverse format  : x= c(1,5.6,3,10,3.5,5)

x= c(1,5.6,3,10,3.5,5)
reverse = rev(x)
print(reverse)

#=========================================#
# Question : 8 write a program to get the mode value of the given vector (‘a’,’b’,’c’,’t’,’a’,’c’,’r’,’a’,’c’,’t’,’z’,’r’,’v’,’t’,’u’,’e’,’t’)
find_mode <- function(x) {
  u <- unique(x)
  tab <- tabulate(match(x, u))
  print(tab)
  u[tab == max(tab)]
}

data <- c("a","b","c","t","a","c","r","a","c","t","z","r","v","t","u","e","t");

find_mode(data) 

#========================================#
# Question : 9 Write a function to filter only data belongs to ‘setosa’ in species of Iris dataset.( using dplyr package) 

library("datasets")
data("iris")
df <- data("iris")
df
summary(iris)  
head(iris)
dim(iris)
names(iris)
find_species <- function(Species)
{
  filtered <- filter(iris,Species == Species)
  head(filtered,3)
}

find_species("setosa")

#=====================================#
# Question : 10.Create a new column for iris dataset with the name of Means_of_obs, 
#which contains mean value of each row.( using dplyr package)
df <- iris[,1:4]
df

Date_Frame <- data.frame(iris)
Date_Frame
New_col = cbind(Date_Frame,Means_of_obs <- rowMeans(df)) #Adding new column
New_col

#===================================#
# Question :11 Filter data for the “versicolor” and get only ‘sepel_length’ and Sepel _width’ columns.
#( using dplyr package)
#install.packages("dplyr",verbose = T)
library(dplyr)
data(iris)
iris_versicolor <- iris %>%
  filter(Species == "versicolor") %>%
  select(Sepal.Length,Sepal.Width)
  
print(iris_versicolor)

#============================================#
# Question : 12 : create below plots for the mtcars also write your inferences for each and every plot 
#(use ggplot package) Use Different ( Size , Colour )
data("mtcars")
df <- data.frame(mtcars)
df
summary(df)
describe(mtcars)
help(mtcars)
install.packages("tidyverse")
library(tidyverse)
#Scatter plot
ggplot(data = mtcars, mapping = aes(x = hp,y = mpg, size = disp))+geom_point(color = "blue")+labs(title = "Miles per Gallon vs Horsepower",
x="Horsepower",y="Miles per Gallon")
# From this we can conclude that, as the when horsepower increases mpg (miles per galloon) decreases.
#Box plot
ggplot(data = mtcars, mapping = aes(x= as.factor(am),y = mpg))+geom_boxplot(fill="blue",alpha=0.2) +
xlab("Transmission 0 = automatic,1 = manual")
# From this we can conclude that there is significant increase in mpg for vehicles with a manual transmission 
#than automatic.
#Bar plot
ggplot(data = mtcars, mapping = aes(x = as.factor(cyl)))+ geom_bar(fill = "green",alpha = 0.2, color= "blue") + xlab("Number of cylinders") + ylab("count")
# from this plot we conclude that  vehicles with 8 cylinders are the highest in number.
# From this we conclude that 
#Histogram plot
ggplot(data = mtcars, aes(x = hp))+geom_histogram(binwidth = 5,color = "green")+ 
  labs(title = "Histogram of hp",x = "hp",y = "count")
# from this plot we conclude that most of the vehicles have horsepower between 100 to 200.
#linegraph
ggplot(data = mtcars, aes(x = mpg,y=disp,color=hp))+geom_point(size = 2.5)+ geom_line(aes(y=hp))
  labs(title = "line graph of hp",x = "mpg",y = "disp")
# from this plot we conclude the disp and hp decreases with increase in mile per gallon.
  
#===================================#
ls()
?NA
gl()
vector()
df <- datasets :: mtcars
df
head(df,n = 10)
names(df)
ls(df)
ncol(df)
nrow(df)
str(df)
mean(df)
subset.data <- subset(df,select = c("mpg","hp"))  
subset.data
mean(subset.data$mpg)  
quantile(subset.data$mpg, prob = c(.25,.50,.75,.95))  
library(dplyr)
mynewdata <- tbl_df(df)
mynewdata
df <-  datasets::iris
df
myirisdata <- tbl_df(df)
myirisdata
head(mynewdata)
head(myirisdata)
filter(mynewdata,cyl>4)
filter(mynewdata,cyl>4 & gear >4)
filter(myirisdata, Species %in% c("setosa","virginica"))
select(mynewdata,cyl,mpg,hp) # to show thw columns
select(mynewdata,-cyl,-mpg,-hp) # to hide the columns
select(mynewdata,-c(cyl,mpg,hp)) # hide range of columns
select(mynewdata,cyl:gear)
mynewdata %>%                   # perform multiple operations in oneline.
  select(cyl,wt)%>%
  filter(wt >2)

mynewdata %>%                  
  select(cyl,wt)%>%           # arrange
  arrange(wt)
