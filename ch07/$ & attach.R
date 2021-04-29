galton <- read.csv('http://www.randomservices.org/random/data/Galton.txt',
                   sep='\t')
head(galton)
head(galton)
str(galton)

galton$Father <- galton$Father*2.54
head(galton)
galton$Height <- galton$Height*2.54
head(galton)

male_data <- subset(galton, Gender =="M")
model <- lm(Height ~ Father,data = male_data)
coef(model)
# model : y = 0.448X + 97.178

summary(model)
par(mfrow=c(2,2))
plot(model,lwd=2)

## attach, detach사용한 경우
galton <- read.csv('http://www.randomservices.org/random/data/Galton.txt',
                   sep='\t')
head(galton)
str(galton)
head(galton)
head(Height)

attach(galton)
father <- Father*2.54
head(father)
height <- Height*2.54
head(height)
detach(galton)
head(galton)

male_data <- subset(galton, Gender =="M")
model <- lm(height ~ father,data = male_data)
coef(model)
# model : y = 0.4X + 99.340

summary(model)
par(mfrow=c(2,2))
plot(model,lwd=2)