
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

