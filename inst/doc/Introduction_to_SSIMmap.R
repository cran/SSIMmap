## ----setup, echo = FALSE------------------------------------------------------
suppressPackageStartupMessages(library(SSIMmap))
knitr::opts_chunk$set(warning = FALSE, message = FALSE) 

## -----------------------------------------------------------------------------
library(SSIMmap)
library(sf)
library(terra)
data("Toronto")
plot(Toronto, border=NA)

## -----------------------------------------------------------------------------
single<-system.file("/ex/single2nm.tif", package="SSIMmap")
group<-system.file("/ex/groups2nm.tif", package="SSIMmap")
whale_single<-terra::rast(single)
whale_groups<-terra::rast(group)
plot(whale_single)
plot(whale_groups)

## -----------------------------------------------------------------------------
args(ssim_bandwidth)

## -----------------------------------------------------------------------------
# ssim_bandwidth(Toronto,"CIMD_SDD","PP_SDD",max_bandwidth= 200)
# ssim_bandwidth(Toronto,"CIMD_SDD","P_commute",max_bandwidth= 200)


## -----------------------------------------------------------------------------
args(ssim_constant)

## -----------------------------------------------------------------------------
ssim_constant(Toronto,"CIMD_SDD","PP_SDD")

## -----------------------------------------------------------------------------
args(ssim_polygon)

## -----------------------------------------------------------------------------
ssim_polygon(Toronto,"CIMD_SDD","PP_SDD") 
ssim_polygon(Toronto,"CIMD_SDD","P_commute") 
df<-ssim_polygon(Toronto,"CIMD_SDD","PP_SDD",global = FALSE)
df_2<-ssim_polygon(Toronto,"CIMD_SDD","P_commute",global = FALSE) 

plot(df,border=NA)
plot(df_2,border=NA)

## -----------------------------------------------------------------------------
args(ssim_raster)

## -----------------------------------------------------------------------------
ssim_raster(whale_single,whale_groups)
result_raster<-ssim_raster(whale_single,whale_groups,global = FALSE)
plot(result_raster)

## ---- warning = FALSE, fig.show = "hold", out.width = "45%"-------------------
library(ggplot2)
library(RColorBrewer)

#Visualize the SSIM result (the CIMD vs. Pampalon) on the map
ggplot() +
  geom_sf(data = df, aes(fill = SSIM), color = NA) +
  scale_fill_gradientn(colors = brewer.pal(8, "PRGn"), limits = c(-1, 1)) +
  theme_void() +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    axis.text.x = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks = element_blank()
  )

#Visualize the SSIM result (the CIMD vs. commuting pattern) on the map
ggplot() +
  geom_sf(data = df_2, aes(fill = SSIM), color = NA) +
  scale_fill_gradientn(colors =brewer.pal(8, "PRGn"), limits = c(-1, 1)) +
  theme_void() +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    axis.text.x = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks = element_blank()
  )


