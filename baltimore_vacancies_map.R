library(leafletR)
library(rgdal) 
library(rgeos) 
library(sp)

dat<-readOGR("Maps", "CBSA_12580_albers") 
subdat<-spTransform(dat, CRS("+init=epsg:4326"))
subdat_data<-subdat@data[,c("gisjoin","housing_un", "frac_vacan")]

subdat<-gSimplify(subdat,tol=0.00001, topologyPreserve=TRUE)
subdat<-SpatialPolygonsDataFrame(subdat, data=subdat_data)

writeOGR(subdat, "CBSA_12580_full.geo", layer="", driver="GeoJSON")

cuts<-quantile(subdat$frac_vacan, probs = seq(0, 1, 0.20), na.rm = TRUE)

popup<-c("housing_un", "frac_vacan")

sty<-styleGrad(prop="frac_vacan", breaks=cuts, right=FALSE, style.par="col",
               style.val=rev(heat.colors(5)), leg="Frac. Vacant (2010)", lwd=1)

# ----- Create the map in html
map<-leaflet(data="CBSA_12580_full.geo", dest=".", style=sty,
             title="index", base.map="osm",
             incl.data=TRUE,  popup=popup)


