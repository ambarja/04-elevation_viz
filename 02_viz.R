library(qgisprocess)
library(sf)
library(ggplot2)
library(ggridges)
library(tidyverse)
library(qgis)
peru <- read_sf('_gpkg/peru.gpkg') %>% 
  st_transform(32718)
dem <- raster('PeruDEM/PeruDEM.tif')

make_grid <- qgis_function('native:creategrid')
test <- make_grid(
  TYPE = 1,
  EXTENT = extent(peru),
  HSPACING = 20*1000,
  VSPACING = 25*1000,
  CRS = 'EPSG:32718',
  OUTPUT = qgis_tmp_vector() 
) %>% 
  qgis_output("OUTPUT") %>% 
  st_read()

# mapview::mapview(test)

new_grid <- test %>%
  filter(id <=82) %>% 
  st_intersection(peru)







