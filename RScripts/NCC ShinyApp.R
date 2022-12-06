library(rsconnect)
#rsconnect::setAccountInfo(name='justin-mathias', token='91DA81CBBF33816AE601DB62C0E35CA6', secret='GDXPcOcJ2+cQ4P5/deRiLDG6x3jzDCdur98hwUW4')
rsconnect::deployApp('path/to/your/app')




# Belowground shiny app ---------------------------------------------------


# Literature review datasheet metadata extraction -------------------------
#Read files, starting with row three, where actual column headers are
belowground <- read.xlsx("/Users/justinmathias/Downloads/Literature_Data_extraction_NCC_v3.xlsx",
                         sheet = "Belowground",
                         startRow = 3)

#Create unique columns for Latitude and Longitude
bmap <- belowground %>%
  drop_na(LatLon) %>% #Remove NA values only for LatLon column
  dplyr::select(LatLon, 12:29) %>%
  group_by(LatLon) %>% #Group by unique LatLon and only include one record per site
  filter(row_number() == 1) %>%
  sep.coords(LatLon)
bmap[] <- sapply(bmap, as.numeric) #Assign all columns as numeric
str(bmap)

##Belowground map of study locations----
biomes <- readOGR("/Users/justinmathias/Dropbox/Research/UIdaho Postdoc/Nature Climate Change review/Ecoregions2017/Ecoregions2017.shp") #World biomes from: Dinerstein et al., 2017, An Ecoregion-Based Approach to Protecting Half the Terrestrial Realm

#Create a new dataframe, coords, so we can extract data from bmap
coords <- data.frame(bmap$Lon, bmap$Lat)
coords.sp <- SpatialPoints(coords) #Coords need to be LongLat
proj4string(coords.sp) = proj4string(biomes) #Need to make sure coordinates match.
#Extract biome information.
bmap <- cbind(bmap, over(coords.sp, biomes)$BIOME_NAME)
#Rename biome column
names(bmap)[names(bmap) == "over(coords.sp, biomes)$BIOME_NAME"] <- "Biome"

str(bmap)

###Map of binary information for data included in belowground----
bmap_long <- bmap %>%
  pivot_longer(names_to = "Measurement", values_to = "Binary", -c(Lat,Lon,Biome)) %>%
  separate(Measurement, c("Measurement"), sep = "_Binary_Measurements") #Drop the "_Binary_Measurements" text

msmnts <- unique(bmap_long$Measurement)
for (i in 1:length(msmnts)) {
{x <- paste0(msmnts[[i]])
obs <- sum(bmap_long %>% filter(Measurement == x & Binary == 1) %>% dplyr::select(Binary))
fname <- paste0(x, ".tiff")
ggplotly(
  bmap_long %>% filter(Measurement == x & Binary == 1) %>%
    ggplot() + #Plot
    borders("world", colour = "gray40", fill = "gray99") +
    theme_article() +
    coord_fixed(1.2) +
    geom_point(
      aes(x = Lon, y = Lat),
      size = 1.5,
      color = "#00A087FF"
    ) +
    scale_size_continuous(range = c(1, 8),
                          breaks = c(5, 10, 15)
    ) +
    ggtitle(paste0("Belowground \n", x, "\n", "Obs:", sum(bmap_long %>% filter(Measurement == x & Binary == 1) %>% dplyr::select(Binary))))
)
ggsave(paste0(fname), units = c("in"), width = 5, height = 4, dpi = 300)
}
}

#NCCapp.R: Shiny app for the NCC Review----
ui <- dashboardPage(
  #Begin UI. Include menu items and set appearance
  dashboardHeader(title = "Nature Climate Change Review",
                  titleWidth = 325),
  #Width in pixels
  dashboardSidebar(
    width = 325,
    sidebarMenu(
      menuItem("Map Overview", tabName = "map"),
      menuItem("Aboveground", tabName = "above"),
      menuItem("Belowground", tabName = "below"),
      menuItem("Modeling", tabName = "model"),
      menuItem("Emissions", tabName = "emissions"),
      menuItem("Total Carbon Dynamics", tabName = "Cdynamics"),
      menuItem("Policy Implications", tabName = "policy")

    )
  ),

  dashboardBody(#Begin dashboard body.

    fluidRow(
      box(plotlyOutput("plot1", height = 400), width = 7), #Page width is 12, so 8 is 2/3 of page width

      box(
        width = 5,
        title = "Controls",
        solidHeader = TRUE,
        selectInput(
          inputId = "msmnt",
          label = "Belowground Measurement",
          choices = list(
            "LitterC",
            "O_MineralCombo",
            "O_lyr",
            "Mineral",
            "BurnDepth",
            "SoilC",
            "SoilN",
            "pyC_char_ash",
            "Rs_Rh_Ra_CH4",
            "C02mic_BasalResp",
            "CUEmic",
            "MBC",
            "DOC",
            "Microbial_comp",
            "RootN",
            "RootC",
            "BD",
            "MRT"
          )
        ),
        sliderInput("pt_slider", "Map Point Size", 0.1, 10, 3)
      )
    )),
  skin = "green"
)

server <- function(input, output) {

  output$plot1 <- renderPlotly({

    bmap_long <- read.xlsx("/Users/justinmathias/Desktop/NCC meeting figs/bmap_long.xlsx")
    msmnts <- unique(bmap_long$Measurement)

    x <- paste0(input$msmnt)
    obs <- sum(bmap_long %>% filter(Measurement == x & Binary == 1) %>% dplyr::select(Binary))
    bmap_long %>% filter(Measurement == x & Binary == 1) %>%
      ggplot() + #Plot
      borders("world", colour = "gray40", fill = "gray99") +
      theme_article() +
      coord_fixed(1.2) +
      geom_point(
        aes(x = Lon, y = Lat),
        size = input$pt_slider,
        color = "#00A087FF"
      ) +
      scale_size_continuous(range = c(1, 8),
                            breaks = c(5, 10, 15)
      ) +
      ylim(c(-60,90)) +
      xlab("Longitude") +
      ylab("Latitude") +
      ggtitle(paste0("Belowground \n", x, "\n", "Obs: ", sum(bmap_long %>% filter(Measurement == x & Binary == 1) %>% dplyr::select(Binary))))


  }
  )





  }
shinyApp(ui, server)














