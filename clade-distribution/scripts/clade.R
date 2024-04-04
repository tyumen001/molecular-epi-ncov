# Library
library(streamgraph)
library(reshape2)
library(ggplot2)
library(htmlwidgets)
library(webshot)

########################################### 1.Chinese clade distribution
china_clade <- c("date", 
                 "21L(BA.2)", 
                 "22A(BA.4)", 
                 "22B(BA.5.2.48)", 
                 "22B(BF.7)", 
                 "22B(Other)", 
                 "22C(BA.2.12.1)", 
                 "22D(BA.2.75)", 
                 "22E(BQ.1)", 
                 "22F(XBB)", 
                 "23A(XBB.1.5)", 
                 "23B(XBB.1.16)", 
                 "23C(CH.1.1)", 
                 "23D(XBB.1.9)", 
                 "23E(XBB.2.3)", 
                 "23F(EG.5.1)", 
                 "23G(XBB.1.5.70)", 
                 "23H(HK.3)", 
                 "recombinant")
df <- read.csv2("/data/china_weekly_clade_distribution.csv", sep = ",")
colnames(df)
colnames(df) <-china_clade
df_melt <- melt(df,
                id.vars = "date", 
                mesure.vars = china_clade
)
p1 <- streamgraph(df_melt, key="variable", value="value", date="date" , 
                  offset = "silhouette", interpolate = "cardinal",
                  #interactive = TRUE, scale = "date", top = 20, right = 40,
                  #bottom = 30, left = 50, sort = TRUE, complete = TRUE,
                  #order = c("compat", "asis", "inside-out", "reverse"),
                  #offset="silhouette",
                  interactive = TRUE) %>% 
  sg_fill_manual(c(
    #21L
    "#ABAFBB",
    "#ABAFBB",
    #22B(BA.5.2.48)
    "#5182FF",
    #22B(BF.7)
    "#B5BBF2",
    #22B(Other)
    "#EBEEFF",
    "#ABAFBB",
    #22D
    "#71CFD5",
    #22E
    "#8CE3AB",
    #22F
    "#AFEC84",
    #23A
    "#D5EE69",
    #23B
    "#FBE956",
    "#ABAFBB",
    #23D
    "#FFAE43",
    #23E
    "#FF7437",
    #23F
    "#FF322C",
    "#ABAFBB",
    #23H
    "#F54764",
    #recombinant
    "#857555"
  )) %>%
  sg_axis_y(5, ) %>%
  sg_axis_x(30,
            "Year",
            "%b %Y"
  )
p1
saveWidget(p1, file=paste0( getwd(), "/figure/china.html"))
webshot::webshot("/figure/china.html", "china.png", zoom = 4, cliprect = "viewport")




########################################### 2.Cantonese clade distribution
guangdong_clade <- c("date", 
                     "21L(BA.2)", 
                     "22B(BA.5.2.48)", 
                     "22B(BF.7)", 
                     "22B(Oters)",
                     "22D(BA.2.75)", 
                     "22E", 
                     "22F(XBB)", 
                     "23A(XBB.1.5)", 
                     "23B(XBB.1.16)", 
                     "23C(CH.1.1)", 
                     "23D(XBB.1.9)", 
                     "23E(XBB.2.3)", 
                     "23F(EG.5.1)", 
                     "23H(HK.3)", 
                     "recombinant")

df <- read.csv2("data/guangdong2_weekly_clade_distribution.csv", sep = ",")
colnames(df)
colnames(df) <-guangdong_clade
df_melt <- melt(df,
                id.vars = "date", 
                mesure.vars = guangdong_clade
)
p2 <- streamgraph(df_melt, key="variable", value="value", date="date" , 
                  offset = "silhouette", interpolate = "cardinal",
                  #interactive = TRUE, scale = "date", top = 20, right = 40,
                  #bottom = 30, left = 50, sort = TRUE, complete = TRUE,
                  #order = c("compat", "asis", "inside-out", "reverse"),
                  #offset="silhouette",
                  interactive = TRUE) %>% 
  sg_fill_manual(c(
    #21L
    "#ABAFBB",
    #22B(BA.5.2.48)
    "#5182FF",
    #22B(BF.7)
    "#B5BBF2",
    #22B(Other)
    "#EBEEFF",
    #22D
    "#71CFD5",
    #22E
    "#8CE3AB",
    #22F
    "#AFEC84",
    #23A
    "#D5EE69",
    #23B
    "#FBE956",
    "#ABAFBB",
    #23D
    "#FFAE43",
    #23E
    "#FF7437",
    #23F
    "#FF322C",
    #23H
    "#F54764",
    #recombinant
    "#857555"
  )) %>%
  sg_axis_y(5, ) %>%
  sg_axis_x(30,
            "Year",
            "%b %Y"
  )
p2
saveWidget(p2, background = "white","/figure/guangdong.html")
webshot::webshot("/figure/guangdong2.html", "guangdong.png", zoom = 4, cliprect = "viewport")




########################################### 2.Global clade distribution
world_clade <- c("date", 
                 "19A(B)", 
                 "19B(A)", 
                 "20A(B.1)", 
                 "20B(B.1.1)", 
                 "20C", 
                 "20J(P.1)", 
                 "21J(Delta)", 
                 "21K(BA.1)", 
                 "21L(BA.2)", 
                 "22A(BA.4)", 
                 "22B(BA.5.2.48)", 
                 "22B(BF.7)", 
                 "22B(Other)", 
                 "23C(BA.2.12.1)", 
                 "22D(BA.2.75)", 
                 "22E(BQ.1)", 
                 "22F(XBB)", 
                 "23A(XBB.1.5)", 
                 "23B(XBB.1.16)", 
                 "23C(CH.1.1)", 
                 "23D(XBB.1.9)", 
                 "23E(XBB.2.3)", 
                 "23F(EG.5.1)", 
                 "23G(XBB.1.5.70)", 
                 "23H(HK.3)", 
                 "23I", 
                 "recombinant")
df <- read.csv2("data/world_weekly_clade_distribution.csv", sep = ",")
colnames(df)
colnames(df) <-world_clade
df_melt <- melt(df,
                id.vars = "date", 
                mesure.vars = world_clade
)
p3 <- streamgraph(df_melt, key="variable", value="value", date="date" , 
                  offset = "silhouette", interpolate = "cardinal",
                  #interactive = TRUE, scale = "date", top = 20, right = 40,
                  #bottom = 30, left = 50, sort = TRUE, complete = TRUE,
                  #order = c("compat", "asis", "inside-out", "reverse"),
                  #offset="silhouette",
                  interactive = TRUE) %>% 
  sg_fill_manual(c(
    #21L
    "#ABAFBB",
    "#ABAFBB",
    "#ABAFBB",
    "#ABAFBB",
    "#ABAFBB",
    "#ABAFBB",
    "#ABAFBB",
    "#ABAFBB",
    "#ABAFBB",
    "#ABAFBB",
    #22B(BA.5.2.48)
    "#5182FF",
    #22B(BF.7)
    "#B5BBF2",
    #22B(Other)
    "#EBEEFF",
    "#ABAFBB",
    #22D
    "#71CFD5",
    #22E
    "#8CE3AB",
    #22F
    "#AFEC84",
    #23A
    "#D5EE69",
    #23B
    "#FBE956",
    "#ABAFBB",
    #23D
    "#FFAE43",
    #23E
    "#FF7437",
    #23F
    "#FF322C",
    "#ABAFBB",
    #23H
    "#F54764",
    "#ABAFBB",
    #recombinant
    "#857555"
  )) %>%
  sg_axis_y(5, ) %>%
  sg_axis_x(30,
            "Year",
            "%b %Y"
  )
p3
saveWidget(p3, file=paste0( getwd(), "/figure/world.html"))
webshot::webshot("figure/world.html", "world.png", zoom = 4, cliprect = "viewport")

