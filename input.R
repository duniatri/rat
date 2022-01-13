#define work hours activity
a = 4
b = 2 
c = 1
d = 8 
e = 16
f = 4
g = 8
h = 6
i = 4
j = 5
k = 7
l = 3

#list project name
projname = c("proj1", "proj2", "proj3", "proj4", "proj5")

#working hours per month
permonthwrkhrs = 8*5*4

#determine activity per week per project
week1jan22 = as.numeric(c(a+b+g, b+c, a+d, l+k+a, i+f+c))
week2jan22 = as.numeric(c(a+l, b+c+g, i+j, d+i, a+d))
week3jan22 = as.numeric(c(b+i, i+d, b+f, e+h, c+h))
week4jan22 = as.numeric(c(e, g, b, c, f))

#put all together in one
input = cbind(projname, week1jan22, week2jan22, week3jan22, week4jan22)
input = as.data.frame(input)

#calculate weekly working hours
wrkhrsweek1jan22 = sum(week2jan22)
wrkhrsweek2jan22 = sum(week1jan22)
wrkhrsweek3jan22 = sum(week3jan22)
wrkhrsweek4jan22 = sum(week4jan22)

#per month working hours
pmwh = sum(wrkhrsweek4jan22, wrkhrsweek2jan22, wrkhrsweek1jan22, wrkhrsweek3jan22)

#capacity
cap = (pmwh/permonthwrkhrs)*100
