
#if you dot have this library already use 
#install.packages("ggplot2") 

#need to load the library(ggplot2)
library(ggplot2)


#a few examples of how ggplot works
#using a dataset mpr contained in ggplot in R 
#plotting displ or engine capacity and highway Milage

#first we use ggplot to create a base or frame with axis
#for this we need to tell the data and aesthetic source to the ggplot
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



#alternatively we can give aesthetic with geom as well
ggplot(data=mpg) +
  geom_point(aes(x=displ,y=hwy))

#a few frequency charts, bar is majorly used for categorical
  ggplot(data=mpg,aes(x=displ))+
    geom_bar()
  
  #histogram is used for continous variable
  ggplot(data=mpg,aes(x=hwy))+
    geom_histogram()
  
  #we can define range for each bar
  ggplot(data=mpg,aes(x=hwy))+
    geom_histogram(binwidth=5)


#To add third dimension to plots we can use the color
#using cyl(continous) to differentiate the points based on color 
ggplot(data=mpg,aes(x=displ,y=hwy,col=cyl)) +
  geom_point()

#using class(categorical) to differentiate the points based on color 
ggplot(data=mpg,aes(x=displ,y=hwy,col=class)) +
  geom_point()

#another way to do this is add the shape but shape can only take categorical
ggplot(data=mpg,aes(x=displ,y=hwy,shape=class)) +
  geom_point()


#we can have 4 diemension using both of these together
ggplot(data=mpg,aes(x=displ,y=hwy,shape=trans,col=class)) +
  geom_point()



#we saw earlier ggplot is a layer based approach, so we can plot multiple plot on top
ggplot(data=mpg,aes(x=displ,y=hwy)) +
  geom_point()+
  geom_line()

#a useful geom is geom_smooth which shows the trend of data
ggplot(data=mpg,aes(x=displ,y=hwy)) +
  geom_point()+
  geom_smooth()

#another imporatant feature is multiple plots
#for this we use facet_wrap and note  ~ before the seprater column name
ggplot(data=mpg,aes(x=displ,y=hwy)) +
  geom_point()+
  facet_wrap(.~class)
#here a separate plot for each value of class is plotted

# we can also use facet_grid which has all charts in 1 row
ggplot(data=mpg,aes(x=displ,y=hwy)) +
  geom_point()+
  facet_grid(.~class)

# we can also use facet_grid which has all charts in 1 column
ggplot(data=mpg,aes(x=displ,y=hwy)) +
  geom_point()+
  facet_grid(.~class)

# we can also have 2 variable where the true use of grid over wrap is
ggplot(data=mpg,aes(x=displ,y=hwy)) +
  geom_point()+
  facet_grid(drv~class)











