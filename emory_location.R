require(leaflet)
require(dplyr)
latlon <- c(33.79667, -84.32346) # emory
ecc_label <- "Room 2052, Wayne Rollins Building"
ecc_popup <- "Take the elevator to the second floor, \nthen exit left and take the first left."

map <- leaflet() %>%  # initiate the leaflet map object
  setView(latlon[2],latlon[1],zoom=15) %>%
  addTiles() %>%  # add the actual map tiles to the leaflet object
  addMarkers(latlon[2],latlon[1],label=ecc_label,popup=ecc_popup) %>% 
  addProviderTiles("CartoDB.Positron")
map 