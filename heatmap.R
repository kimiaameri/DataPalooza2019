
#------------------------------------------#
#             load libraries               #
#------------------------------------------#
library(ggplot2)
library(dplyr)

#------------------------------------------#
#               read datasets              #
#------------------------------------------#

lifeExpentency<- read.csv("~/Downloads/Life expectancy-per state-2014.csv", header = TRUE, stringsAsFactors=FALSE )

counties <- map_data("county")
#------------------------------------------#
#               creat heatmap              #
#------------------------------------------#
counti.lifeExpentancy.map <- left_join(lifeExpentency, counties, by = c("location"="subregion"  ))

qplot(long, lat, geom = "polygon", data = counti.lifeExpentancy.map, 
      group = group, fill = Life.expectancy) + coord_map() +
  #facet_grid(. ~ sex)

## ------------------------------------------------------------------------
qplot(long, lat, geom = "polygon", data = counti.lifeExpentancy.map, 
      group = group, fill = Life.expectancy) + coord_map() + 
  
  scale_fill_gradient2(midpoint=median(counti.lifeExpentancy.map$Life.expectancy), low = "steelblue", high = "darkorange") + 
  ggthemes::theme_map()  +
  ggtitle("Map for life expentancy foe each county") +
  theme(legend.position="right")

