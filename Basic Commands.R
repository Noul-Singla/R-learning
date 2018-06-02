#This script will show the basic commands in R

# define a variable
var <- 1
#to get values out of a variable, just execute/run the variable name
var
# instead of =, for assignment to variable we use <-
#no need to define a datatype explicitly

#while storing text value, it has to be in quote"" 
var<- "a"
var
#in R each variable is vector of size 1 or more.
# to store multiple values, a combine function 'c' is used
var <- c(1,2,3,4,5)
var
var <- c("a","b","c","d","abcd")
var

#you will notie, we can overwrite the variable as many time
#we used the same c or combine to combine int or characters
#we can also store variable length chars in a vector



#Math operation
var<-c(1,2,3,4,5,6,7,8,9,10)
#another way to do this is using a function sequence
var <- seq(1,100,1)
#seq takes (min,max,gap/increment value)
#here sequence from 1 to 100 increment by 1, hence 100 values

#maximum value of a vector
max(var)
#minimum value of a vector
min(var)
#mean value of a vector
mean(var)
#variance value of a vector
var(var)
#standard deviation value of a vector
sd(var)
#sum of all values of vector
sum(var)


#operations on a vector
#we can perform any operation on all values in a vector
var+2
var*2
var/2
var-2
#operation will happen on each value of a vector 

#we can store any output to a new variable
var<- var*2


#selection from a vector

#select 10th value from a vector, here 10 is the index
var[10]

#select firt 5 values from a vector, we can use c() to combine indexes 
var[c(1,2,3,4,5)]
#another way to use values in order is by using a ':' between numbers
1:5
var[1:5]

#some examples
var[c(2,3,14,15)]
var[c(2,3,14:18)]
var[c(1:5,14:18)]

#comparison in a vector
#we we compare a vector to a value, it return true or false

var>100
var<100
var==100

#output size will be equal to length of vector
length(var)
length(var>100)

#how do you know how many are true or false.
#a function table is used to count instances in a vector
table(var>100)
#another alternate is to sum the true and false as true=1, false=0
sum(var>100)

#to know which all are true we can use 'which' function
#which prvides index of all true values
which(var>90)
which(var==90)

#here we get the indexes not the values, how do we get values
#we can use the selection from a vector like
var[10]
var[which(var==90)]
var[which(var>90)]
#selection can also take vector of true,false
#as length of true,false is equal to all values in the vector
#it will consider true as select and false as do not select
var[var>90]
#this is very important to understand to filter/subset data

#to know if 1000 is present in vector
sum(var==1000)
table(var==1000)




