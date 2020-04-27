module Apexcharts.Chart where


import Apexcharts (Apexoptions)
import Apexcharts.DropShadow (Dropshadow)
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


class ChartWidth a where
  width :: Option Chart a

instance widthChartNum :: ChartWidth Number where
  width = opt "width"

instance widthChartStr :: ChartWidth String where
  width = opt "width"


class ChartHeight a where
  height :: Option Chart a

instance heightChartNumber :: ChartHeight Number where
  height = opt "height"      

instance heightChartString :: ChartHeight String where
  height = opt "height"      


chart :: Option Apexoptions (Options Chart)
chart = cmap Opt.options (opt "chart")

type' :: Option Chart ChartType
type' = cmap chartTypeToString (opt "type")

offsetX:: Option Chart Number
offsetX = opt "offsetX"

offsetY :: Option Chart Number
offsetY = opt "offsetY"

fontFamily :: Option Chart String
fontFamily = opt "fontFamily"

background :: Option Chart String
background = opt "background"

foreColor :: Option Chart String
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

dropShadow :: Option Chart (Options Dropshadow)
dropShadow = cmap Opt.options (opt "dropShadow")

enabled :: Option Sparkline Boolean
enabled = opt "enabled"      

