
module Apexcharts.Chart where


import Apexcharts (Apexoptions)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Chart


data StackType = NormalStack | HundertPercent

stackTypeToString :: StackType -> String
stackTypeToString = case _ of
  NormalStack -> "normal"
  HundertPercent -> "100%"

data ChartType = Line
    | Area
    | Bar
    | Radar
    | Histogram
    | Pie
    | Donut
    | RadialBar
    | RangeBar
    | Scatter
    | Bubble
    | Heatmap
    | Candlestick

chartTypeToString :: ChartType -> String
chartTypeToString = case _ of
    Line ->    "line"
    Area ->    "area"
    Bar ->    "bar"
    Radar ->    "radar"
    Histogram ->    "histogram"
    Pie ->    "pie"
    Donut ->    "donut"
    RadialBar ->    "radialBar"
    RangeBar -> "rangeBar"
    Scatter ->    "scatter"
    Bubble ->    "bubble"
    Heatmap ->    "heatmap"
    Candlestick ->    "candlestick"

chart :: Option Apexoptions (Options Chart)
chart = cmap Opt.options (opt "chart")

background :: Option Chart String
background = opt "background"

defaultLocale :: Option Chart String
defaultLocale = opt "defaultLocale"

fontFamily :: Option Chart String
fontFamily = opt "fontFamily"

foreColor :: Option Chart String
foreColor = opt "foreColor"

group :: Option Chart String
group = opt "group"

class ChartHeight a where
    height :: Option Chart a  

instance heightStr :: ChartHeight String where
    height = opt "height"

instance heightInt :: ChartHeight Int where
    height = opt "height"

instance heightNum :: ChartHeight Number where
    height = opt "height"


id :: Option Chart String
id = opt "id"

offsetX :: Option Chart Number
offsetX = opt "offsetX"

offsetY :: Option Chart Number
offsetY = opt "offsetY"

parentHeightOffset :: Option Chart Number
parentHeightOffset = opt "parentHeightOffset"

redrawOnParentResize :: Option Chart Boolean
redrawOnParentResize = opt "redrawOnParentResize"

stacked :: Option Chart Boolean
stacked = opt "stacked"

stackType :: Option Chart StackType
stackType = cmap stackTypeToString (opt "stackType")

type' :: Option Chart ChartType
type' = cmap chartTypeToString (opt "type")

width :: Option Chart String
width = opt "width"

