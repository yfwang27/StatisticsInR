Session3: Correlation and Linear Regression
========================================================
author: MRC Clinical Sciences Centre (http://mrccsc.github.io/)
date: 12/July/2016
width: 1440
height: 1100
autosize: true
font-import: <link href='http://fonts.googleapis.com/css?family=Slabo+27px' rel='stylesheet' type='text/css'>
font-family: 'Slabo 27px', serif;
css:style.css

Outline
========================================================
- correlation

- linear regression


Correlation (1/6)
=========================================================

A common task in statistical analysis is to investigate the linear relationship between pairs of numeric vectors.

This can be done by identifying the correlation between numeric vectors using the **cor()** function in R.

In this example we use **cor()** to identify the Pearson correlation between two variables.  The **method** argument may be set to make use of different correlation methods.

- Perfectly posively correlated vectors will return 1
- Perfectly negatively correlated vectors will return -1
- Vectors showing no or little linear correlation will be close to 0.


Correlation between vectors (2/6)
=========================================================


```r
> x <- rnorm(100,10,2)
> z <- rnorm(100,10,2)
> y <- x
> cor(x,y) #
```

```
[1] 1
```

```r
> cor(x,-y)
```

```
[1] -1
```

```r
> cor(x,z)
```

```
[1] -0.1111192
```
***
![plot of chunk unnamed-chunk-2](Session3_linear_regression-figure/unnamed-chunk-2-1.png)

Correlation example (3/6)
=========================================================

Example of blood pressure of 15 males taken by machine and expert. We would like to see whether there is a relationship between machine and expert measured blood pressure.


```r
> #install.packages("UsingR")
> library("UsingR")
> data(blood)
> head(blood)
```

```
  Machine Expert
1      68     72
2      82     84
3      94     89
4     106    100
5      92     97
6      80     88
```

```r
> cor(blood$Machine,blood$Expert)
```

```
[1] 0.9068599
```
***
![plot of chunk unnamed-chunk-4](Session3_linear_regression-figure/unnamed-chunk-4-1.png)

Correlation over a matrix (4/6)
=========================================================
left: 70%
Often we wish to apply correlation analysis to all columns or rows in a matrix in a pair-wise manner. To do this in R, we can simply pass the **cor()** function a single argument of the numeric matrix of interest. The **cor()** function will then perform all pair-wise correlations between columns.

- subset iris dataset

```r
> data(iris)
> head(iris)
```

```
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
4          4.6         3.1          1.5         0.2  setosa
5          5.0         3.6          1.4         0.2  setosa
6          5.4         3.9          1.7         0.4  setosa
```

```r
> iris4cor<-iris[,c(1:4)]; 
> # or
> # iris4cor<-iris[,-5]
```


Correlation over a matrix (5/6)
=========================================================

```r
> cor(iris4cor)
```

```
             Sepal.Length Sepal.Width Petal.Length Petal.Width
Sepal.Length    1.0000000  -0.1175698    0.8717538   0.8179411
Sepal.Width    -0.1175698   1.0000000   -0.4284401  -0.3661259
Petal.Length    0.8717538  -0.4284401    1.0000000   0.9628654
Petal.Width     0.8179411  -0.3661259    0.9628654   1.0000000
```
<img src="Session3_linear_regression-figure/unnamed-chunk-7-1.png" title="plot of chunk unnamed-chunk-7" alt="plot of chunk unnamed-chunk-7" width="720px" />

Correlation (6/6)
========================================================

```r
> pairs(iris4cor)
```

![plot of chunk unnamed-chunk-8](Session3_linear_regression-figure/unnamed-chunk-8-1.png)


Linear regression (1/17)
=========================================================

We have seen how we can find the linear correlation between two sets of variables using **cor()** function.

R also provides a comprehensive set of tools for regression analysis including the well used linear modeling function **lm()**

- least square method

*minimize the vertical distance between the fitted line and data points* 

<img src="Session3_linear_regression-figure/unnamed-chunk-9-1.png" title="plot of chunk unnamed-chunk-9" alt="plot of chunk unnamed-chunk-9" width="650px" />


Linear regression (2/17)
=========================================================
left: 70%
We use *kid.weights* dataset as example and see whether we can use kids height to predict kids weight

```r
> #install.packages("UsingR")
> #library("UsingR")
> data(kid.weights)
> str(kid.weights)
```

```
'data.frame':	250 obs. of  4 variables:
 $ age   : num  58 103 87 138 82 52 28 79 107 45 ...
 $ weight: num  38 87 50 98 47 30 24 45 144 24 ...
 $ height: num  38 43 48 61 47 24 29 48 59 24 ...
 $ gender: Factor w/ 2 levels "F","M": 2 2 2 2 1 1 2 1 2 2 ...
```

```r
> # or using head() function
> head(kid.weights)
```

```
  age weight height gender
1  58     38     38      M
2 103     87     43      M
3  87     50     48      M
4 138     98     61      M
5  82     47     47      F
6  52     30     24      F
```
***
<img src="Session3_linear_regression-figure/unnamed-chunk-11-1.png" title="plot of chunk unnamed-chunk-11" alt="plot of chunk unnamed-chunk-11" width="820px" />


Linear regression (3/17)
=========================================================
The **lm()** function fits a linear regression to your data and provides useful information on the generated fit.

In the example below we fit a linear model using  **lm()** on the *kid.weights* dataset with *weight* (Y) as the dependent variable and *height* (X) as the explanatory variable.

```r
> lmResult<-lm(formula = weight ~ height, data = kid.weights)
> lmResult
```

```

Call:
lm(formula = weight ~ height, data = kid.weights)

Coefficients:
(Intercept)       height  
    -31.342        1.909  
```


Interpret output of lm() (4/17)
=========================================================

As we have seen, printing the model result provides the intercept and slope of line.
To get some more information on the model we can use the **summary()** function

```r
> summary(lmResult)
```

```

Call:
lm(formula = weight ~ height, data = kid.weights)

Residuals:
    Min      1Q  Median      3Q     Max 
-24.837  -7.361  -2.384   3.616  68.708 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept) -31.34191    3.17493  -9.872   <2e-16 ***
height        1.90904    0.08343  22.882   <2e-16 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 14.09 on 248 degrees of freedom
Multiple R-squared:  0.6786,	Adjusted R-squared:  0.6773 
F-statistic: 523.6 on 1 and 248 DF,  p-value: < 2.2e-16
```

Interpret output of lm() - coefficients (5/17)
=========================================================
left: 70%

```r
> lmResult$coefficients
```

```
(Intercept)      height 
 -31.341912    1.909044 
```
From the **$coefficients** of object *lmResult*, we know the equation for the best fit is

**$$Y = -31.342 + 1.909044 *X$$**

**$$f(x)  = b_0 + b_1x$$**

$$b_0\text{: the value of f(x) when x =0}$$


```r
# the Intercept -31.341912 is the expected weight of a 0 inch height
# not interesting to any biological questions
```

$$b_1\text{: the amount of f(x) will change when x changes 1 unit}$$


```r
# For every inch increased in the kids height, we expect 1.9 pounds increased in the kids weight
```
***
<img src="Session3_linear_regression-figure/unnamed-chunk-17-1.png" title="plot of chunk unnamed-chunk-17" alt="plot of chunk unnamed-chunk-17" width="720px" />


Interpret output of lm() - residuals (6/17)
=========================================================

The **residuals** are the difference between the predicted and actual values.
To retrieve the residuals we can access the slot or use the **resid()** function.


```r
> summary(resid(lmResult))
```

```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-24.840  -7.361  -2.384   0.000   3.616  68.710 
```

```r
> summary(lmResult$residual)
```

```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-24.840  -7.361  -2.384   0.000   3.616  68.710 
```
Ideally you would want your residuals to be normally distributed around 0.

$$
E[e_{i}]=0
$$

More about residuals (7/17)
=========================================================

Plot the residuals


```r
plot(kid.weights$height,kid.weights$weight,ylim=c(-30,150),
     ylab="weigth (pounds)",xlab="height (inches)")
abline(lmResult,col="blueviolet",lwd=3, lty=1)
```

<img src="Session3_linear_regression-figure/unnamed-chunk-19-1.png" title="plot of chunk unnamed-chunk-19" alt="plot of chunk unnamed-chunk-19" width="1000" />

More about residuals (8/17)
=========================================================

Plot the residuals

<img src="Session3_linear_regression-figure/unnamed-chunk-20-1.png" title="plot of chunk unnamed-chunk-20" alt="plot of chunk unnamed-chunk-20" width="1020" />

More about residuals (9/17)
=========================================================

Plot the residuals

<img src="Session3_linear_regression-figure/unnamed-chunk-21-1.png" title="plot of chunk unnamed-chunk-21" alt="plot of chunk unnamed-chunk-21" width="1020" />
***
$$
Error_i = y_i - \hat{y}
\\

Error_i^2  = (y_i - \hat{y})^2
\\
\text{- sum of the square of the residuals (SSE)}
\\
SSE  = \sum_{i=1}^{n}(y_i-\hat{y})^2
$$



More about residuals (10/17)
=========================================================

Plot the residuals against the independent variable (X), i.e. the height


```r
plot(kid.weights$height,lmResult$residual,ylim=c(-30,150),
     ylab="residuals (weight pounds)",xlab="height (inches)")
abline(h=0,col="blueviolet",lwd=3, lty=1)
```

<img src="Session3_linear_regression-figure/unnamed-chunk-22-1.png" title="plot of chunk unnamed-chunk-22" alt="plot of chunk unnamed-chunk-22" width="1000px" />

More about residuals (11/17)
=========================================================

Plot the residuals against the independent variable (X), i.e. the height

<img src="Session3_linear_regression-figure/unnamed-chunk-23-1.png" title="plot of chunk unnamed-chunk-23" alt="plot of chunk unnamed-chunk-23" width="1020" />

More about residuals (12/17)
=========================================================

Plot the residuals against the independent variable (X)

<img src="Session3_linear_regression-figure/unnamed-chunk-24-1.png" title="plot of chunk unnamed-chunk-24" alt="plot of chunk unnamed-chunk-24" width="720px" />

***
$$
Error_i = y_i - \hat{y}
\\

Error_i^2  = (y_i - \hat{y})^2
\\
\text{- sum of the square of the residuals (SSE)}
\\
SSE  = \sum_{i=1}^{n}(y_i-\hat{y})^2
$$



More about residuals- residuals (13/17)
=========================================================

Residuals from the model

![plot of chunk unnamed-chunk-25](Session3_linear_regression-figure/unnamed-chunk-25-1.png)
- Sum of the square of the residuals (SSE)
$$
SSE  = \sum_{i=1}^{n}(y_i-\hat{y})^2
$$

***

Residuals from the mean

![plot of chunk unnamed-chunk-26](Session3_linear_regression-figure/unnamed-chunk-26-1.png)

- Total Sum of Squares (TSS)

$$
  \begin{aligned}
  TSS  = \sum_{i=1}^{n}(y_i-\overline y)^2
  \end{aligned}
$$



Interpret output of lm() - R-squared (14/17)
=========================================================

- The **R-squared** value represents the proportion of variability in the response variable that is explained by the explanatory variable.

- A high **R-squared** here indicates that the line fits closely to the data.


```r
> summary(lmResult)$r.squared
```

```
[1] 0.6785746
```

More about R-squared - Calculating R-squared (15/17)
=========================================================

The fraction of variability in the independent variable (Y; or the *weight* in this example) that can be explained by the explanatory variable (X; or the *height* in this example).

$$
TSS=\text{Total Sum of Squares}=\sum_{i=1}^n(y_i-\overline y)^2
\\
SSE=\text{Sum of the Square of the residuals}=\sum_{i=1}^n(y_i-\hat{y})^2
$$


```r
> SSE<-sum(lmResult$residuals^2)
> TSS<-sum((kid.weights$weight - mean(kid.weights$weight))^2)
> R_square<-1-(SSE/TSS)
> R_square
```

```
[1] 0.6785746
```

```r
> summary(lmResult)$r.squared
```

```
[1] 0.6785746
```


Interpret output of lm() - F-statistics (16/17)
=========================================================

The results from linear models also provides a measure of significance for a variable not being relevant


```r
> summary(lmResult)$fstatistic
```

```
   value    numdf    dendf 
523.5631   1.0000 248.0000 
```

More about F-statistics - Calculating F-stat (17/17)
=========================================================

$$
F=\frac{MSM}{MSE}=\frac{\text{mean of the explained variance}}{\text{mean of the unexplained variance}}=\frac{({\displaystyle\frac{SSM}1})}{({\displaystyle\frac{SSE}{n-2}})}
$$


```r
> n=nrow(kid.weights)
> SSM <- sum((predict(lmResult) - mean(kid.weights$weight))^2)
> MSE <-sum(lmResult$residuals^2)/(n-2)
> 
> MSM <-SSM/1
> 
> MSM/MSE
```

```
[1] 523.5631
```

```r
> summary(lmResult)$fstatistic
```

```
   value    numdf    dendf 
523.5631   1.0000 248.0000 
```


Statistics (Extra) - A fit line
=========================================================

![alt text](imgs/fittedline.png)


Statistics (Extra) - Calculating R-squared
=========================================================

![alt text](imgs/rsquared.png)








TBC
=========================================================
Use the *Petal.Width* to predict the *Petal.Length* from the iris data as example

We will focus on *Iris.versicolor* as example

***
- subset data *iris*

```r
> iris_versi<-iris[iris$Species=="versicolor", c("Petal.Length","Petal.Width")]
> dim(iris_versi)
```

```
[1] 50  2
```

```r
> head(iris_versi)
```

```
   Petal.Length Petal.Width
51          4.7         1.4
52          4.5         1.5
53          4.9         1.5
54          4.0         1.3
55          4.6         1.5
56          4.5         1.3
```

TBC
=========================================================

If we only know the Petal.Length, and would like to use this information to predict the Petal.Length


```r
> head(iris_versi[,"Petal.Length"])
```

```
[1] 4.7 4.5 4.9 4.0 4.6 4.5
```

```r
> PetalLen.mean<-mean(iris_versi$Petal.Length)
> PetalLen.mean
```

```
[1] 4.26
```
***

```r
> plot(iris_versi$Petal.Length,ylab="Petal Length of Iris.versicolor")
> abline(h=PetalLen.mean, col="forestgreen",lwd=3)
```

![plot of chunk unnamed-chunk-33](Session3_linear_regression-figure/unnamed-chunk-33-1.png)


TBC
=========================================================

If we only know the *Petal.Length*, and would like to use this information to predict the *Petal.Length*

![plot of chunk unnamed-chunk-34](Session3_linear_regression-figure/unnamed-chunk-34-1.png)
***

$$\text{In this case, the expected value is mean } = \overline y $$

- residuals (Error)

$$
  \begin{aligned}

  Error_i & = y_i - \overline y
  \\ \\
  \end{aligned}
$$

TBC
=========================================================

Zoom in [just see first 4 data points]

![plot of chunk unnamed-chunk-35](Session3_linear_regression-figure/unnamed-chunk-35-1.png)
***

$$\text{In this case, the expected values is mean } = \overline y $$

- residuals (Error)

$$
  \begin{aligned}
  \\
  Error_i & = y_i - \overline y
  \end{aligned}
$$
- square of the residuals

$$
  \begin{aligned}
  Error_i^2  = (y_i - \overline y)^2
  \end{aligned}
$$

- sum of the square of the residuals (SSE)

$$
  \begin{aligned}
  SSE  = \sum_{i=1}^{n}(y_i-\overline y)^2
  \end{aligned}
$$


Statistics (Extra) - Calculating R-squared
=========================================================

![alt text](imgs/fstatistic.png)



Time for an exercise!
========================================================

Exercise on this session can be found [here](exercises/Session3_exercise3.html)



Answers to exercise.
========================================================

Answers can be found [here](answers/Session3_answers3.html)

R code for solutions can be found here  [here]

