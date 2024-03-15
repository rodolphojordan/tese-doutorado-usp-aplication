library(HRW)


new.dataset=SydneyRealEstate[,c('logSalePrice','latitude','longitude','lotSize',
                                'income','PM10')]
#Anlálise descritiva
hist(new.dataset$logSalePrice)


library(ggplot2)
library("viridis")
library(maps)



ggplot(new.dataset, aes(x=latitude,y=longitude)) +
  geom_point(aes(x = latitude, y = longitude, colour = logSalePrice)) +
  coord_fixed() + ylab("Northing") + xlab("Easting") +
  scale_color_viridis()

# AJuste do modelo
m1<-mgcv::gam(logSalePrice~lotSize+income+PM10, data = new.dataset)
hist(new.dataset$logSalePrice)

s(latitude,longitude,bs = "tp")

# Diagnóstico
library(statmod)
res <- qresiduals(m1) 
hist(res, freq = F)
curve(dnorm(x), add = TRUE)
plot(res~m1$fitted.values)
qqnorm(res)
qqline(res)
