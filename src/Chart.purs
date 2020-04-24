module Apexcharts.Chart where

import Apexcharts

import Apexcharts.Commons (class Height, class Width)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt


data Chart
data Sparkline


data StackType = NormalStack | HundredPercent


stackTypeToString :: StackType -> String
stackTypeToString = case _ of
    NormalStack -> "normal"
    HundredPercent -> "100%"

data ChartType = Line
    | Area
    | Bar
    | Radar
    | Histogram
    | Pie
    | Donut
    | RadialBar
    | Scatter
    | Bubble
    | Heatmap
    | Candlestick

chartTypeToString :: ChartType -> String
chartTypeToString = case _ of
    Line -> "line"
    Area -> "area"
    Bar -> "bar"
    Radar -> "radar"
    Histogram -> "histogram"
    Pie -> "pie"
    Donut -> "donut"
    RadialBar -> "radialBar"
    Scatter -> "scatter"
    Bubble -> "bubble"
    Heatmap -> "heatmap"
    Candlestick -> "candlestick"

chart :: Option Apexoptions (Options Chart)
chart = cmap Opt.options (opt "chart")


instance heightChartNumber :: Height Chart Number where
  height = opt "height"      

instance heightChartString :: Height Chart String where
  height = opt "height"      


type' :: Option Chart ChartType
type' = cmap chartTypeToString (opt "type")




instance chartOffsetX :: OffsetX Chart Number where
    offsetX = opt "offsetX"

instance chartOffsetY :: OffsetY Chart Number where
    offsetY = opt "offsetY"


instance widthChartNum :: Width Chart Number where
  width = opt "width"

instance widthChartStr :: Width Chart String where
  width = opt "width"

instance chartFontFamily :: FontFamily Chart where
  fontFamily = opt "fontFamily"

instance chartBackground :: BackgroundClass Chart String where
  background = opt "background"

instance chartForecolor :: ForeColor Chart where
  foreColor = opt "foreColor"


defaultLocale :: Option Chart String
defaultLocale = opt "defaultLocale"

group :: Option Chart String
group = opt "group"

id :: Option Chart String
id = opt "id"


parentHeightOffset :: Option Chart Number
parentHeightOffset = opt "parentHeightOffset"

redrawOnParentResize :: Option Chart Boolean
redrawOnParentResize = opt "redrawOnParentResize"

sparkline :: Option Chart (Options Sparkline)
sparkline = cmap Opt.options (opt "sparkline")

stacked :: Option Chart Boolean
stacked = opt "stacked"

stackType :: Option Chart StackType
stackType = cmap stackTypeToString (opt "stackType")







instance enableSparkline :: Enabled Sparkline where
  enabled = opt "enabled"      









class AutoScale a b where
  autoScaleYaxis :: Option a b

