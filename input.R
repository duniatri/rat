#working hours per week and month
permonthwrkhrs = 8*5*4
perweekwrkhrs = 8*5

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

#determine activity per week per project
week1jan22 = as.numeric(c(a+b+g, b+c, a+d, l+k+a, i+f+c))
week2jan22 = as.numeric(c(a+l, b+c+g, i+j, d+i, a+d))
week3jan22 = as.numeric(c(b+i, i+d, b+f, e+h, c+h))
week4jan22 = as.numeric(c(e, g+e, b+e+f+a, c+e, f+b+g+i))

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

#capacity per week in percentage
capwk1jan = (wrkhrsweek1jan22/perweekwrkhrs)*100
capwk2jan = (wrkhrsweek2jan22/perweekwrkhrs)*100
capwk3jan = (wrkhrsweek3jan22/perweekwrkhrs)*100
capwk4jan = (wrkhrsweek4jan22/perweekwrkhrs)*100
capweekjan = c(capwk1jan, capwk2jan, capwk3jan, capwk4jan)

#capacity per month in percentage
capmonth = (pmwh/permonthwrkhrs)*100

#plot the weekly capacity
weekdate = seq(as.Date("2022/1/1"), as.Date("2022/1/28"), "week")
weeklygraph = as.data.frame(cbind(weekdate, capweekjan))
ggplot(data = weeklygraph, aes_string(weekdate, capweekjan)) + geom_line()