require(ISwR)
plot(rnorm(1e3))

#1.1.3 Vectorized arithmetic
weight=c(60,72,57,90,95,72)
height=c(1.75,1.8,1.65,1.9,1.74,1.91)

bmi=weight/height^2;bmi

sum(weight)

#arithmetic average
xbar=sum(weight)/length(weight);xbar
mean(weight)

weight-xbar
(weight-xbar)^2
sum((weight-xbar)^2)

#standard deviation
sqrt(sum((weight-xbar)^2)/(length(weight)-1))
sd(weight)


#1.1.4 Standard Procedures
t.test(bmi,mu=22.5)

#mu=22.5 - theoretical mean.p-value is not small, so it is not unlikely
#that true mean is 22.5, but 95% confidence interval is very wide (18.4 to 27.8),
#meaning that we don't have enough information about the true mean
#1.1.5 Graphics

plot(height, weight)
plot(height, weight,pch=2)
hh=c(1.65, 1.7, 1.75, 1.8, 1.85, 1.9)
lines(hh, 22.5*hh^2)

cat(c('qqq','www',5, 'zzz','\n'))#concatenate and print

#1.2 Language essentials
#elements can be named
x=c(red='qqq', blue='www', green='zzz')
names(x)

#combining different types leads to less restrictive type

c(FALSE,3)
c(pi, 'abc')
c(FALSE, 'abc')

#sequence
seq(4,9)
#with step 2
seq(4,10,2)

#replication
oops=c(7,9,13)
rep(oops,3)
rep(oops,1:3)#repeats 1st element once, second twice, third-3times
rep(1:2,c(10,15))
rep(1:2,each=10)
#the same as 
rep(1:2,c(10,10))

#matrices
x=1:12
#dim is column major(1,2,3 in the first column, etc...)
dim(x)=c(3,4);x

#rowwise
x=matrix(1:12,nrow=3,byrow=T);x
#assign letters ABC as rownames
rownames(x)=LETTERS[1:3]
#transpose
t(x)

#lower case letters and month names
letters[1:3]
month.name[1:3]
month.abb[1:3]


#combining vectors
cbind(A=1:4,B=5:8,C=9:12)
rbind(A=1:4,B=5:8,C=9:12)

#1.2.8 Factors
pain=c(0,3,2,2,1) 
fpain=factor(pain, levels=0:3)#even though levels are 0:3, internal representation
#is 1:4- that's what as.numeric will return
levels(fpain)=c('none','mild','medium','severe')
fpain
as.numeric(fpain)
levels(fpain)

#1.2.9 Lists
intake.pre=c(5260,5470,5640,6180,6390,6515,6805,7515,7515,8230,8770)
intake.post=c(3910,4220,3885,5160,5645,4680,5265,5975,6790,6900,7335)

mylist=list(before=intake.pre,after=intake.post)
mylist
mylist$before

#1.2.10 Data Frames
d=data.frame(intake.pre, intake.post);d
d$intake.pre

#1.2.11 Indexing
intake.pre[5]
intake.pre[c(3,5,7)]

v=c(3,5,7)
intake.pre[v]
intake.pre[-v]

#1.2.12 Conditional selection
intake.post[intake.pre>7000]

intake.post[intake.pre > 7000 & intake.post <= 8000]

d[d$intake.pre > 7000,]
sel=d$intake.pre > 7000

sel
del[sel,]
head(d)


#1.2.13 Subset and Transform
data(thuesen)
thue2=subset(thuesen,blood.glucose<7)
thue2
#add a new field to a dataframe
thue3=transform(thuesen, log.gluc=log(blood.glucose));thue3

#1.2.14 Grouped Data And Dataframes
energy
exp.lean=energy$expend[energy$stature=='lean']
exp.obese=energy$expend[energy$stature=='obese']

#the same can be achieved using split function:
l=split(energy$expend, energy$stature)

#1.2.16 Implicit Loops
lapply(thuesen, mean, na.rm=T)
sapply(thuesen,mean,na.rm=T)

m=matrix(rnorm(12),4);m
apply(m,2,min)

#sorting
o=order(intake$post)
intake$post[o]
intake$pre[o]

intake.sorted=intake[o,]
#exercises
#1.1
qqq=c(1:10);qqq
tmpNPos=6
tmpElement=15
qqq=c(qqq[1:tmpNPos-1],tmpElement, qqq[-c(1:tmpNPos-1)]);qqq
#Suggested answer:
x=round(rnorm(20,2))
z=c(x[1:7],1.23,x[8:20])
#or more generic:insert v after index k
v=1.23
k=7
i=seq(along=x);i
z=c(x[k>=i],v,x[k<i]);z


#1.2 check whether 2 vectors are identical if they contain NAs
qqq1=c(1:5,NA,6:10,NA);qqq1
qqq2=c(1:5, NA,6:10);qqq2
qqq3=c(10:1);qqq3

tmpIsEqual=function(x,y){
	tmpIsEqual=F
	if(length(x)==length(y)){
		if((sum(is.na(x)==is.na(y))==length(x))
			&& (sum(na.omit(x)==na.omit(y))==length(x)-sum(is.na(x)))){
				tmpIsEqual=T
		}
	}
	tmpIsEqual
}
#Suggested answer:
x=y=c(7,9,NA,NA,13)
all(is.na(x)==is.na(y)) && all((x==y)[!is.na(x)])
#1.3 of x is a factor with n levels and y is a length n factor, what happens if you compute y[x]

#Suggested answer:

#1.4 the cut func is used to create a factor from a numeric vector. Create a factor in which 
#blood.glucose variable in thuesen is divided into the intervals (4,7],(7,9],(12,20] Change
#the level names to "low", "intermediate", "high" and "very high"

#Suggested answer:

#1.5 Write the logical expression to use to extract girls between 7 and 14 years in the juul dataset

#Suggested answer:

#1.6 What happens if you change the levels of a factor with (levels) and give the same value to two or more levels?

#Suggested answer:

#1.7 Use sapply to simulate the result of taking the man of 100 random numbers from the normal distribution for
#10 independent samples

#Suggested answer:

#1.85 Write the built-in data set thuesen top a tab-separated text file with write.table. View it with a text editor, 
#change NA to ., re-import into R

#Suggested answer:




#2. The R Environment
#2.1. Session Management
#2.1.1 Workspace

ls()
#remove objects from workspace
rm(height,weight)
#remove the whole workspace
rm(list=ls())
#if var names begin with a dot - not listed by ls(), need to use
ls(all=T)
#save workspace image
save.image()
#default name is .RData-will be loaded by default when R is started

#2.1.2 Textual output
#redirect output to file
sink('myfile')
ls()

#restore console output
sink()

#another way to capture console output
qqq=capture.output(ls())
#current working directory
setwd()
#set working directory
mydir='c:/temp/'
setwd(mydir)

#2.1.3 Scripting
#to run an R script, use source(filename)
#history of commangs can be saved/loaded using 
savehistory(file='c:/temp/qqq.Rhistory')
loadhistory(file='c:/temp/qqq.Rhistory')

#2.1.4 Help
help.search('kendal')

#2.1.5 
library(survival)
detach('package:survival')

#2.1.6 Built-In Data
#lazy load - loads on demand
thuesen
#some packages require explicit loading
data(thuesen)

#data goes through directories associated with each package and looks for the data.
#files with .R extension are executed, .tab files read using read.table

#2.1.7 attach and detach
#long and heavy
plot(thuesen$blood.glucose, thuesen$short.velocity)
#attach allows R look for the objects among the vars in a given dataframe
attach(thuesen)
blood.glucose
search()#note thuesen dataframe among the objects in the search path
#.GlobalEnv has a priority, but we can explicitly specify that we need to use
# the dataset 
with(thuesen, plot(blood.glucose, short.velocity))
#detach with no arguments removes the object in position 2
detach()
search()

#2.1.8 subset, transform and within
thue2=subset(thuesen, blood.glucose<7);thue2
thue3=transform(thuesen, log.gluc=log(blood.glucose));thue3
thue4=within(thuesen, { log.gluc=log(blood.glucose)
							m=mean(log.gluc)
							centered.log.gluc=log.gluc-m
							rm(m)
							});thue4
#rm discards intermediate results

#2.2 The Graphics Subsystem

#plot 2 random uniform vectors
x=runif(50,0,2)
y=runif(50,0,2)
plot(x,y,main='Main Title', sub='subtitle', xlab='x-label', ylab='y-label')

#text inside plotting region
text(0.6,0.6,'text at (0.6,0.6)')

abline(h=.6,v=.6)#draws horizontal and vertical lines (h-horizontal, v-vertical), but can draw y=ax+b
# to plot on margins, there is a mtext function - can plot on 4 margins
for(side in 1:4) mtext(-1:4,side=side,at=.7, line=-1:4)
mtext(paste('side',1:4),side=1:4,line=0,font=2)#line parameter controls relative position to the chart box
#font=2-BOLD

#building a plot from pieces
plot(x,y,type='n', xlab='', ylab='',axes=F)#type='n'-no points to be drawn
points(x,y)
axis(1)
axis(2,at=seq(0.2,1.8,0.2))
box()
title(main='Main Title', sub='subtitle', xlab='x-lab',ylab='y-lab')
#multiple color points: plot with type='n' to dimension the area, then plot points separately
#2.2.3 Using Par

par(mar=c(4,4,2,2)+0.1)#reducing margins- defaults are 5,4,4,2
#etc- many more parameters

#2.2.4 Combining Plots
#overlaying histogram with a normal density
x=rnorm(100)
hist(x,freq=F)#freq=F : histogram is a density, not absolute counts

curve(dnorm(x),add=T) #add=T - overlays existing plot
#slightly better - top of density is not clipped, but the tail mighjt still be
curve(dnorm(x))
hist(x,freq=F,add=T)

#even better
h=hist(x,plot=F)
ylim=range(0,h$density, dnorm(0))#determine the range first
hist(x,freq=F,ylim=ylim)
curve(dnorm(x),add=T)

#2.3. R programming
#2.3.1 
#function that has x (can be a function) as a default x label
hist.with.normal=function(x, xlab=deparse(substitute(x)),...)
{
	h=hist(x,plot=F,...)
	s=sd(x)
	m=mean(x)
	ylim=range(0,h$density,dnorm(0,sd=s))
	hist(x,freq=F,ylim=ylim,xlab=xlab,...)
	curve(dnorm(x,m,s),add=T)
}
hist.with.normal(rnorm(100))

#newton's search of a square root
y=123456
x=y/2
while(abs(x*x-y)>1e-10) x=(x+y/x)/2;x;x^2

#the same
x=y/2
repeat{
	x=(x+y/x)/2
	if(abs(x*x-y) < 1e-10) break
	}
x
x^2

#another example
x=seq(0,1,0.05)
plot(x,x,ylab='y', type='l')
for(j in 2:8) lines(x,x^j)


#2.3.2 classes and generic functions
t.test(bmi,mu=22.5)$p.value


#2.4 Data Entry
#2.4.1 reading from text file
#flat file into dataframe - read.table(...)
#file secretin is in the folder rawdata of the package ISwR
#to find the path
tmpPath=system.file('rawdata','secretin.txt',package='ISwR');tmpPath
secretin2=read.table(tmpPath,header=T);secretin2
class(secretin2)
levels(secretin2$time)

#2.4.2 File Format details( read.table)
#header=T
#Field Separator: sep=','
#NA strings: na.strings='.'
#quotes and comments: default - ''#''. quote="'" comment.char='!' - the way to overwrite
#unequal field count: normally-error, fill and flush arguments are used to correct

#pre-cooked variants: read.csv (comma-separated), read.csv2 (separated by ;), header =T
#read.delim and read.delim2

#conversion of input
#colClasses allows to specify type (colClasses=c('numeric','character',...)
#also, stringsAsFactors and as.is switches

#2.4.3 The Data Editor

aq=edit(airquality);aq
#if want to overwrite original data
fix(aq) #<=>aq=edit(aq)
#blank data
dd=data.frame()
fix(dd)

#2.4.4. interfacing with other programs
#simple fallback- use read.table, read.csv, read.csv2, read.delim, read.delim2
#foreign package- for conversion from/to stat formats
require(foreign)
#read from clipboard
read.table('clipboard', header=T)

#2.5 Exercises

#3 Probability and Distributions
#3.1. Random Sampling
