library(tidyverse)
library(plyr)
library(raster)
library(rgee)
library(sf)

# Register with the gmail count in EE -------------------------------------
ee_Initialize(user = 'antony.barja8@gmail.com')

# Create new grid ---------------------------------------------------------
peru <- st_read('_gpkg/peru.gpkg') %>% 
  st_make_grid(n = 6)


# Downloading raster data - elevation -------------------------------------
for (i in 1:length(peru)) {
  region <- peru[i] %>% sf_as_ee()
  def <- ee$Image("USGS/SRTMGL1_003")$
    rename(sprintf("dem_%s",i))$
    clip(region)
  
  url <- def$getDownloadUrl(
    list(
      name = 'elev',
      image = def,
      scale = 100
    )
  )
  
  if (!dir.exists('PeruDEM')){
    dir.create('PeruDEM')
  }
  
  download.file(
    url = url,
    destfile = paste0('PeruDEM/tilen_',i,'.tar'),
    method = 'curl'
  )
  
}

lista <- paste0(
  "PeruDEM/",
  list.files(
    path = 'PeruDEM/',
    pattern = '.tar')
)


# Unzip elevation data and mosaic all rasters -----------------------------

l_ply(.data = lista, .fun = unzip, exdir = 'PeruDEM/')
list_tif <- list.files(
  path = "PeruDEM",
  pattern = ".tif$",
  full.names = TRUE
) 

read_tif <- lapply(list_tif, raster)
peru <- st_read('_gpkg/peru.gpkg')
dem_peru <- do.call(merge, c(read_tif, tolerance = 1)) %>%
  crop(peru) %>%
  mask(peru)
# plot(dem_peru)
file.remove(lista)
file.remove(list_tif)

# Write new raster of Peru  -----------------------------------------------
writeRaster(dem_peru,'PeruDEM/PeruDEM.tif')