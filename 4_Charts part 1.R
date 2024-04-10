# A simple example
# Build a dataframe first using 4 vectors
dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)
opinion <- c("Excellent", "No effect", "Some effect", "No effect", "Some effect")

# Create the dataframe from vectors
drugs <- data.frame(dose, drugA, drugB, opinion)
drugs
str(drugs)

# Difficult to understand a general plot of data
plot(drugs)

# Show drugs data with circles for data points, joined with 
# a blue line
attach(drugs)
#windows(16,10)
plot(dose, type = "o", col = "blue")
plot(dose, type = "b", col = "green")

? plot

# option type="b" indicates that both points and lines should be plotted.
dose
drugA

# If we want to plot categorical data then convert to factor first
plot(opinion, drugA, type = "b", col = "green")

#opinion <- as.factor(opinion)
#class(opinion)
#str(drugs)'''

drugs$opinion <- as.factor(drugs$opinion)
class(drugs$opinion)
str(drugs)

#las = 0: The labels are always parallel to the axis.
#las = 1: The labels are always horizontal.
#las = 2: The labels are always perpendicular to the axis.
#las = 3: The labels are always vertical

plot(drugs$opinion, las = 2)

# par function - customise many features of a graph 
# including (fonts, colours, axes, and labels) 
# We can also plot more than 1 line on the chart using par 

? par
help(par)

# Note - parameters set with the par() function apply to all graphs
#parameters specified in the plot() functions only apply to a specific graph

# adding no.readonly=TRUE produces a list of current graphical settings and can be modified
# Here I'm storing the contents of par to a variable

#windows(16,10)
opar <- par(no.readonly = TRUE)
par(new = FALSE)

windows(16,10)
plot(dose, drugB, type = "b")

# lty = line type
# lwd = line width

# lty=2 dashed line
# pch=17 solid triangle
par(lty = 2, pch = 17)
plot(dose, drugA, type = "b")
par(opar)

-------------------------------------
# Specify graphical parameters using 
# optionname=value
plot(dose, drugA, type = "b", lty = 2, pch = 17)

# dotted line, 3 times wider than default 
#Connecting points are filled squares
plot(drugA, type = "b", lty = 3, lwd = 3, pch = 15, cex = 1, ylim = c(0, 100))
title(main = "Drug dosage", col.main = "blue", font.main = 4)

# Graph Drug B with red dashed line and square points
lines(drugB, type = "o", pch = 22, lty = 2, col = "red")

# Now we'll manually edit the chart so that it can automatically change to suitvalues in the vectors

# Calculate range from 0 to max value of drug A and drug B
graph_range <- range(0, drugA, drugB)
graph_range

# Graph drug A using y axis that ranges from 0 to max 
# value in drug A or drug B vector.  Turn off axes and 
# annotations (axis labels) so we can specify them ourself
plot(drugA, type = "o", col = "blue", ylim = graph_range,  axes = FALSE,ann = FALSE)

# Graph Drug B with red dashed line and square points
lines(drugB, type = "o", pch = 22, lty = 2, col = "red")

# Make x axis with ml labels
axis(1, at = 1:5, lab = c("20 ml", "40 ml", "60 ml", "80 ml", "100 ml"))

# Make y axis with horizontal labels that display ticks at 
# every 5 marks. 5*0:graph_range[2] is equivalent to c(0, 5, 10, ..., 60).
axis(2, las = 1, at =  5* 0:graph_range[2])


# Create box around plot
box()

# Label the x and y axes with dark green text
title(xlab = "Dosage (ml)", col.lab = rgb(0, 0.5, 0))
title(ylab = "Drugs", col.lab = rgb(0, 0.5, 0))

# Create a legend at (1, graph_range[2]) that is slightly smaller 
# (cex) and uses the same line colours and points used by 
# the actual plots 
legend(1, graph_range[2], c("Drug A", "Drug B"), cex = 0.8,
       col = c("blue", "red"), pch = 21:22, lty = 1:2)

# Create a title with a red, bold/italic font
title(main = "Drug dosage", col.main = "red", font.main = 4)


# Lets enhance the simple example 
# Save current graphical parameter settings - restore later
opar <- par(no.readonly = TRUE)
# Modify default graphical parameters - graph is 2" wide & 3" tall
par(pin = c(2, 3))
# Lines will be twice the default width and 
# symbols will be 1.5 times default size
par(lwd = 2, cex = 1.5)
# Axis text set to italic and scaled to 75 % of the default
par(cex.axis = .75, font.axis = 3)
# first plot created using filled red circles and dashed lines
plot(dose, drugA, type = "b", pch = 19, lty = 2, col = "red")
# second plot is created using filled green diamonds
# and a blue border and blue dashed lines
plot(dose, drugB, type = "b", pch = 23, lty = 6, col = "blue", bg = "green")
# restore the original graphical parameter settings
par(opar)

# Complete example of creating a line chart including axes and labels
plot(dose, drugA, type = "b",
     col = "red", lty = 2, pch = 2, lwd = 2,
     main = "Clinical Trials for Drug A",
     sub = "This is hypothetical data",
     xlab = "Dosage", ylab = "Drug Response",
     xlim = c(0, 60), ylim = c(0, 70))

# Example of drug data chart
# Input data
dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)
opar <- par(no.readonly = TRUE)
# Increases line, text, symbol, and label size
par(lwd = 2, cex = 1.5, font.lab = 2)
# Generates the graph

plot(dose, drugA, type = "b",
     pch = 15, lty = 1, col = "red", ylim = c(0, 60),
     main = "Drug A vs. Drug B",
     xlab = "Drug Dosage", ylab = "Drug Response")
# Add a line
lines(dose, drugB, type = "b",
      pch = 17, lty = 2, col = "blue")
      abline(h = c(30), lwd = 1.5, lty = 2, col = "gray")
      

?mtcars
View(mtcars)
attach(mtcars)
opar <- par(no.readonly = TRUE)
# Include the graphical parameter
# mfrow = c(nrows, ncols) to create a matrix of 
# nrows × ncols plots that are filled in by row
# Here we have 2 rows by 2 cols to display our charts

windows(16,10)
par(mfrow = c(2, 2))
# Our 4 charts
plot(wt, mpg, main = "Scatterplot of wt vs. mpg")
plot(wt, disp, main = "Scatterplot of wt vs. disp")
# hist() includes a default title - use main = "" to suppress it
# or ann = FALSE to suppress all titles and labels
hist(wt, main = "Histogram of wt")
boxplot(wt, main = "Boxplot of wt")
# Reset parameters
par(opar)
detach(mtcars)

# arrange three plots in three rows and one column
attach(mtcars)
opar <- par(no.readonly = TRUE)
windows(16,10)
par(mfrow = c(3, 1))
hist(wt)
hist(mpg)
hist(disp)
par(opar)
detach(mtcars)


install.packages("vcd")

library(vcd)
# table() returns a contingency table, an object 
# of class "table", an array of integer values. 
# Note that the result is always an array, 
# a 1D array if one factor is given

help(table)
View(Arthritis)
attach(Arthritis)

counts <- table(Arthritis$Improved)
counts

# Simple bar chart
barplot(counts,
        main = "Simple Bar Plot",
        xlab = "Improvement", ylab = "Frequency")

# Horizontal bar plot
barplot(counts,
        main = "Horizontal Bar Plot",
        xlab = "Frequency", ylab = "Improvement",
        horiz = TRUE)

# If categorical variable to be plotted is a factor or ordered factor
# you can create a vertical bar plot quickly with the plot() function
# Produces same bar charts as previous ones using Table function
str(Arthritis)
plot(Arthritis$Improved, main = "Simple Bar Plot",
     xlab = "Improved", ylab = "Frequency")


plot(Arthritis$Improved, horiz = TRUE, main = "Horizontal Bar Plot",
     xlab = "Frequency", ylab = "Improved")

# Stacked and grouped bar plots
library(vcd)
counts <- table(Arthritis$Improved, Arthritis$Treatment)
counts

# If height is a matrix rather than a vector
# the resulting graph will be a stacked (below) or grouped bar plot

windows(16,10)
barplot(counts,
        main = "Stacked Bar Plot",
        xlab = "Treatment", ylab = "Frequency",
        col = c("red", "yellow", "green"),
        legend = rownames(counts))

# If beside=TRUE, each column of the matrix represents 
# a group, and the values in each column are 
# juxtaposed rather than stacked.

# Grouped bar plot

barplot(counts,
        main = "Grouped Bar Plot",
        xlab = "Treatment", ylab = "Frequency",
        col = c("red", "yellow", "green"),
        legend = rownames(counts), beside = TRUE)



# Pie charts
# 2 rows by 2 cols - for 4 charts
windows(16,10)
par(mfrow = c(2, 2))

# First chart - shows title with chart broken into
# slices vector
slices <- c(10, 12, 4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
pie(slices, labels = lbls,
    main = "Simple Pie Chart")

# Add percentages to the pie chart
# Calculate each percent for labels on chart
pct <- round(slices / sum(slices) * 100)
# Create label structure
lbls2 <- paste(lbls, " ", pct, "%", sep = "")
# Create the pie chart
pie(slices, labels = lbls2, col = rainbow(length(lbls2)),
    main = "Pie Chart with Percentages")

?rainbow()

# Create a table structure for state.region (showing summary)
state.region
mytable <- table(state.region)
mytable
# Use table headers for chart labels
lbls3 <- paste(names(mytable), "\n", mytable, sep = "")
lbls3
# Create the 3D pie chart
pie(mytable, labels = lbls3,
    main = "Pie Chart from a Table\n (with sample sizes)")

# Histograms
# Set 2 x 2 display
windows(16,10)
par(mfrow = c(2, 2))
# Show simple historgram
# with default values
# Each bin (bar) represents a range 
# Eg first bar is values within (10-15), second is (15-20) etc
hist(mtcars$mpg)

# Show histogram with 12 breaks
# Red bars on chart, x-axis = "Miles per gallon"
# and main heading = "Coloured histogram with 12 bins"
# More breaks = more detail as more space to show data
mtcars$mpg
hist(mtcars$mpg,
     breaks = 12, # no of bins on chart
     col = "red",
     xlab = "Miles Per Gallon",
     main = "Coloured histogram with 12 bins")





# Boxplot ------------------------------------
# Show a boxplot with title and y label
# Lowest line = lower hinge
# Lowest line in box = lower quartile
# Middle line in box = median
# Top line in box = upper quartile
# Top line in chart = upper hinge
windows(16,10)
par(mfrow = c(2, 2))
boxplot(mtcars$mpg, main = "Box plot", ylab = "Miles per Gallon")
# Show stats for the boxplot
boxplot.stats(mtcars$mpg)


mpg
cyl
# Draw a separate boxplot for variable
# mpg for each value of cyl
# using data from mtcars data frame
boxplot(mpg ~ cyl, data = mtcars,
        main = "Car Mileage Data",
        xlab = "Number of Cylinders",
        ylab = "Miles Per Gallon")

