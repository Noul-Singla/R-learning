
#if you dot have this library already use 
#install.packages("ggplot2") 

#need to load the library(ggplot2)
#library(ggplot2)


#a few examples of how ggplot works
#using a dataset already present in R and plotting displ or engine capacity and highway Milage

#first we use ggplot to create a base or frame with axis
#param : provide the data and what x and y axis will represent, it will create grid line itself
ggplot(data=mpg,aes(x=displ,y=hwy)) 

# now we can plot on this by adding a layer on this
ggplot(data=mpg,aes(x=displ,y=hwy)) +
  #param : layer needs 3 para atleast, type of chart ex. line point
  #param : stat which tells if any data needs to be modified if not "identity"
  #position which tells if it has to be plotted at its own position
  #param : stat changes like if you need boxplot and position can be changed if too many overlaps are there
layer(geom="line",stat="identity",position="identity")

#example of scatter chart
ggplot(data=mpg,aes(x=displ,y=hwy)) +
  layer(geom="point",stat="identity",position="identity")

#example of bar chart
ggplot(data=mpg,aes(x=displ,y=hwy)) +
  layer(geom="bar",stat="identity",position="identity")

#example of boxlpot chart of hwy v. drv (it makes sense to use categorical variable on x here)
ggplot(data=mpg,aes(x=drv,y=hwy)) +
  layer(geom="boxplot",stat="boxplot",position="identity")



#to make things easier we have special functions which define default goem,stat and position
#these are geom functions ex. geom_lin, geom_point,geom_bar,geom_boxplot

#rewriting the above plots using geom, learning about stat and identity and position is useful to make changes if needed
ggplot(data=mpg,aes(x=displ,y=hwy)) +
  geom_line()

ggplot(data=mpg,aes(x=displ,y=hwy)) +
  geom_point()

ggplot(data=mpg,aes(x=drv,y=hwy)) +
  geom_boxplot()

#note : geom_bar is for bar with frequency and geom_col is used for individual bars

ggplot(data=mpg,aes(x=displ,y=hwy)) +
  geom_col()
#alternatively we can override the stat here for bar to show values and not count frequency
ggplot(data=mpg,aes(x=displ,y=hwy)) +
  geom_bar(stat="identity")



#ggplot(data=mpg,aes(x=displ,y=hwy,col=class)) +
#  layer(geom="point",stat="identity",position="identity",aes(col=class))+
#  layer(geom="line",stat="smooth",position="identity",
#         param=list(method="auto",formula=y~x,se=TRUE))+facet_grid(~cyl)

#ggplot(data=mpg,aes(x=displ,y=hwy,col=class)) + 
#  layer(geom="point",stat="identity",position="identity")+
#  layer(geom="line",stat="smooth",position="identity",
#        param=list(method="auto",formula=y~x,se=TRUE))

#ggplot(data=mpg,aes(x=displ,y=hwy)) + 
#  layer(geom="point",stat="identity",position="identity")+
#  layer(geom="line",stat="smooth",position="identity",
#        param=list(method="auto",formula=y~x,se=TRUE))


ggplot(data=mpg,aes(x=displ,y=hwy,col=class)) +
  geom_point()+geom_smooth()+facet_grid(~cyl)
ggplot(data=mpg,aes(x=displ,y=hwy)) +
  geom_point(aes(col=class))+geom_smooth(aes(col=class))+facet_grid(~cyl)


ggplot(data=mpg,aes(x=class,y=hwy))+
                    geom_boxplot()
ggplot(data=mpg,aes(x=class,y=hwy))+
                    geom_boxplot() +
                        facet_wrap(~cyl)
ggplot(data=mpg,aes(x=class,y=hwy,col=class))+
                    geom_boxplot()
#do not use smooth with boxplot, it does not make sense
ggplot(data=mpg,aes(x=class,y=hwy,col=class))+
                    geom_boxplot()+
                    geom_smooth()


ggplot(data=mpg,aes(x=displ,y=hwy,col=drv))+geom_point()+geom_smooth()
#option 1 create separate aes for each function 
ggplot(data=mpg)+geom_point(aes(x=displ,y=hwy,col=drv))+geom_smooth(aes(x=displ,y=hwy))
#option 2 create a default aes and overwrite or add where needed
ggplot(data=mpg,aes(x=displ,y=hwy))+geom_point(aes(col=drv))+geom_smooth()


#option 2 create a default aes and overwrite or add where needed
ggplot(data=mpg,aes(x=displ,y=hwy))+geom_point(aes(col=drv))+geom_smooth(data=mpg[mpg$class=="suv",])

str(mpg)
class(mpg)
sum(mpg$class=="suv")
length(mpg$class=="suv")

#when overplotting data
ggplot(data=mpg,aes(x=displ,y=hwy))+geom_point()
#add jitter to move points  in chaotic fashion
ggplot(data=mpg,aes(x=displ,y=hwy))+geom_point(position="jitter")
ggplot(data=mpg,aes(x=displ,y=hwy))+geom_jitter()
#add transparency to points 
ggplot(data=mpg,aes(x=displ,y=hwy))+geom_point(alpha=1/10)

# par wont work with ggplot, check which works par(mfrow=c(1,2))
#use grid arrange, try it
plot1 = ggplot(data=mpg,aes(x=displ,y=hwy))+geom_point(position="jitter")
#add transparency to points 
plot2 = ggplot(data=mpg,aes(x=displ,y=hwy))+geom_point(alpha=1/10)
grid.arrange(plot1,plot2)


ggplot(diamonds,mapping=aes(carat,price))+geom_point()
# here you can add transparency
ggplot(diamonds,mapping=aes(carat,price))+geom_point(alpha=1/100)
ggplot(diamonds,mapping=aes(carat,price))+geom_point(size=1/100)


#

            # CH 3


ggplot(data=mpg)+geom_histogram(aes(hwy))

ggplot(data=mpg)+geom_histogram(aes(hwy,y=..density..))

ggplot(data=mpg)+geom_bar(aes(drv))
#fail as bar consider each value as its separate group
ggplot(data=mpg)+geom_bar(aes(drv,y=..prop..))
#check computed variable in help
?geom_bar
#solution make total 1 group
ggplot(data=mpg)+geom_bar(aes(drv,y=..prop..,group=1))


#same problem
ggplot(data=mpg)+geom_bar(aes(drv,y=..prop..,group=drv))
#or 
ggplot(data=mpg)+geom_bar(aes(drv,y=..prop..,group="drv"))


ggplot(data=mpg)+geom_bar(aes(drv,y=..count..))
#same as
ggplot(data=mpg)+geom_bar(aes(drv))




ggplot(data=mpg,aes(x=displ,y=hwy))+geom_point()
ggplot(data=mpg,aes(x=displ,y=hwy))+geom_line()
ggplot(data=mpg,aes(x=displ,y=hwy))+stat_smooth(geom="line")
ggplot(data=mpg,aes(x=displ,y=hwy))+stat_smooth(geom="smooth")


# if we have alreay defined stats, we can use stat="identity" and plot a bar graph which 
# will overwrite the previous info and show the values as it is
# we can use geom_col which is bar with identity stat


ggplot(data=mpg)+geom_point(aes(displ,hwy))
#bad view
ggplot(data=mpg)+geom_point(aes(displ,hwy,size=cyl))
#better view
ggplot(data=mpg)+geom_point(aes(displ,hwy,col=cyl))
#better view
ggplot(data=mpg)+geom_point(aes(displ,hwy,col=as.factor(cyl)))




#same or default behaviour
ggplot(data=mpg)+geom_bar(aes(drv,fill=hwy>=25))
ggplot(data=mpg)+geom_bar(aes(drv,fill=hwy>=25),position="stack")
#overlapping behaviour
ggplot(data=mpg)+geom_bar(aes(drv,fill=hwy>=25),position="identity")
#side to side behaviour
ggplot(data=mpg)+geom_bar(aes(drv,fill=hwy>=25),position="dodge")

ggplot(data=mpg,aes(displ))+
  geom_point(aes(y=hwy,colour="blue"))+
  geom_point(aes(y=cty,colour="red"))

ggplot(data=mpg,aes(displ))+
  geom_point(aes(y=hwy),colour="blue")+
  geom_point(aes(y=cty),colour="red")

ggplot(data=mpg,aes(displ))+
  geom_point(aes(y=hwy,colour="highway"),shape=1)+
  geom_point(aes(y=cty,colour="city"),shape=2)

ggplot(data=mpg,aes(displ))+
  geom_point(aes(y=hwy),colour="red",shape=1)+
  geom_point(aes(y=cty),shape=2,colour="blue")


ggplot(data=mpg,aes(displ))+
  geom_point(aes(y=hwy,colour="highway",shape="1"))+
  geom_point(aes(y=cty,colour="city",shape="2"))


#check notes for answer



#library(maps)
#check notes






#faceting or lattice graphics

ggplot(data=mpg,aes(displ,hwy))+geom_point()+facet_grid(drv~cyl)

#create groups from range
ggplot(data=mpg,aes(displ,hwy))+geom_point()+facet_grid(~cut_number(cty,3))

#create data in 3 groups
ggplot(mpg)+geom_bar(aes(x=cut_number(cty,3)))
#create data with interval of 3
ggplot(mpg)+geom_bar(aes(x=cut_width(cty,3)))

