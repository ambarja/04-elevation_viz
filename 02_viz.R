library(qgisprocess)
library(sf)
library(ggplot2)
library(ggridges)
library(tidyverse)
library(raster)
library(viridis)

# Reading spatial data ----------------------------------------------------
peru <- read_sf('_gpkg/peru.gpkg') %>% 
  st_transform(32718)

dem <- raster('PeruDEM/PeruDEM.tif')

# Create new grid ---------------------------------------------------------
make_grid <- qgis_function('native:creategrid')
test <- make_grid(
  TYPE = 1,
  EXTENT = extent(peru),
  HSPACING = 50*1000,
  VSPACING = 50*1000,
  CRS = 'EPSG:32718',
  OUTPUT = qgis_tmp_vector() 
) %>% 
  qgis_output("OUTPUT") %>% 
  st_read()

mapview::mapview(test)

# Select id max of vertical lines -----------------------------------------
new_grid <- test %>%
  filter(id <=41) %>% 
  st_intersection(peru)

# Points along line -------------------------------------------------------
make_ptos <- qgis_function("qgis:generatepointspixelcentroidsalongline")
make_ptos(
  INPUT_RASTER = dem,
  INPUT_VECTOR = new_grid,
  OUTPUT = qgis_tmp_vector()
    ) %>% 
  qgis_output("OUTPUT") %>% 
  st_read() -> puntos

get_value <- raster::extract(dem,puntos,sp = T)
get_value_sf <- get_value %>% st_as_sf()
get_value_sf <- get_value_sf %>% 
  mutate(Lon = unlist(map(get_value_sf$geometry,1)),
         Lat = unlist(map(get_value_sf$geometry,2))
         )

df_values <- get_value_sf %>% 
  st_set_geometry(NULL)

# New styles 
CraterLake_Joy <- df_values %>% 
  mutate(PeruDEM = if_else(PeruDEM<0,0,PeruDEM)) %>% 
  ggplot() + 
  aes(x = Lon, y = Lat ,group = Lat,height = PeruDEM,
      fill = PeruDEM,position = "stack") +
  geom_density_ridges_gradient(stat = "identity",
                               scale = 60,lwd=0.2,
                               color = "black",
                               alpha = 0.7) +
  scale_fill_viridis(option = "rocket",direction = -1) +
  theme_void() + 
  theme(legend.position = "top") + 
  guides(
    fill = guide_colourbar(
      title = "Elevation (m)",
      title.position = "top",
      barwidth = 20,
      barheight = 1,
      title.hjust = .5
      )
    ) +
  theme(legend.text = element_text(size = 12),
        legend.title = element_text(size = 12)
        )

# Export map 
ggsave(
  'rocket.png',
  last_plot(),
  height = 13,
  width = 9,
  bg = "white"
)























