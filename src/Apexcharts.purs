module Apexcharts where

import Prelude

import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt
import Effect (Effect)
import Foreign (Foreign)

data Apexoptions
data Chart
data Axis
data Animations
data AnimateGradually
data DynamicAnimation
data Brush
data Dropshadow
data Locale
data LocaleOptions
data Toolbar
data Selection
data Fill
data Stroke
data SelectionAxis
data Sparkline
data ChartToolbar
data Tools
data Zoom
data Series
data Paired


foreign import data Apexchart :: Type


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


data StackType = Normal | Percent

stackTypeToString :: StackType -> String
stackTypeToString = case _ of
    Normal -> "normal"
    Percent -> "100%"


data OrientationType = X | Y | XY

orientationTypeToString :: OrientationType -> String
orientationTypeToString = case _ of
    X -> "x"
    Y -> "y"
    XY -> "xy"


data AxisType = Category | Datetime | Numeric

axisTypeToString :: AxisType -> String
axisTypeToString = case _ of
    Category -> "category"
    Datetime -> "datetime"
    Numeric -> "numeric"


data Easing = Linear
    | Easein
    | Easeout
    | Easeinout

easingToString :: Easing -> String
easingToString = case _ of
    Linear -> "linear"
    Easein -> "easein"
    Easeout -> "easeout"
    Easeinout -> "easeinout"


class Enabled a where
  enabled :: Option a Boolean

instance enableAnimations :: Enabled Animations where
  enabled = opt "enabled"

instance enableAnimateGradually :: Enabled AnimateGradually where
  enabled = opt "enabled"

instance enableDynamicAnimation :: Enabled DynamicAnimation where
  enabled = opt "enabled"

instance enableDropShadow :: Enabled Dropshadow where
  enabled = opt "enabled"

instance enableBrush :: Enabled Brush where
  enabled = opt "enabled"

instance enableSelection :: Enabled Selection where
  enabled = opt "enabled"

instance enableSparkline :: Enabled Sparkline where
  enabled = opt "enabled"      

instance enableZoom :: Enabled Zoom where
  enabled = opt "enabled"      


class Speed a where
  speed :: Option a Number      

instance speedAnimations :: Speed Animations where
  speed = opt "speed"

instance speedDynamicAnimation :: Speed DynamicAnimation where
  speed = opt "speed"


class Height a b where
  height :: Option a b

instance heightChartNumber :: Height Chart Number where
  height = opt "height"      

instance heightChartString :: Height Chart String where
  height = opt "height"      


class SelectionClass a b where
  selection :: Option a b

instance toolbarSelection :: SelectionClass Toolbar String where
  selection = opt "selection" 

instance chartToolbarSelection :: SelectionClass ChartToolbar String where
  selection = opt "selection" 

instance chartSelection :: SelectionClass Chart (Options Selection) where
  selection = cmap Opt.options (opt "selection")

instance toolsSelection :: SelectionClass Tools Boolean where
  selection = opt "selection"


class Color a b where
  color :: Option a b

instance dropshadowColor :: Color Dropshadow (Array String) where
    color = opt "color"

instance fillColor :: Color Fill String where
    color = opt "color"

instance strokeColor :: Color Stroke String where
    color = opt "color"


class Opacity a b where
  opacity :: Option a b

instance opacityDropshadow :: Opacity Dropshadow Number where
    opacity = opt "opacity"

instance opacityFill :: Opacity Fill Number where
    opacity = opt "opacity"

instance opacityStroke :: Opacity Stroke Number where
    opacity = opt "opacity"


class Type a b where
  type' :: Option a b

instance typeChart :: Type Chart ChartType where
    type' = cmap chartTypeToString (opt "type")

instance typeSelection :: Type Selection OrientationType  where
    type' = cmap orientationTypeToString (opt "type")

instance typeZoom :: Type Zoom OrientationType where
    type' = cmap orientationTypeToString (opt "type")

instance typeAxis :: Type Axis AxisType where
    type' = cmap axisTypeToString (opt "type")


class ToolbarClass a b where
    toolbar :: Option a b

instance localoptionsToolbar :: ToolbarClass LocaleOptions (Options Toolbar) where
    toolbar = cmap Opt.options (opt "toolbar")

instance localoptionsCharttoolbar :: ToolbarClass Chart (Options ChartToolbar) where
    toolbar = cmap Opt.options (opt "toolbar")


class OffsetX a b where
  offsetX :: Option a b

instance chartOffsetX :: OffsetX Chart Number where
    offsetX = opt "offsetX"

instance chartToolbarOffsetX :: OffsetX ChartToolbar Number where
    offsetX = opt "offsetX"


class OffsetY a b where
  offsetY :: Option a b

instance chartOffsetY :: OffsetY Chart Number where
    offsetY = opt "offsetY"

instance chartToolbarOffsetY :: OffsetY ChartToolbar Number where
    offsetY = opt "offsetY"


class Download a b where
    download :: Option a b

instance downloadToolbar :: Download Toolbar String where
    download = opt "download"

instance downloadChartToolbar :: Download ChartToolbar Boolean where
    download = opt "download"

instance downloadTools :: Download Tools Boolean where
    download = opt "download"


class Pan a b where
  pan :: Option a b

instance panToolbar :: Pan Toolbar String where
    pan = opt "pan"

instance panTools :: Pan Tools Boolean where
    pan = opt "pan"


class Reset a b where
  reset :: Option a b

instance resetToolbar :: Reset Toolbar String where
    reset = opt "reset"

instance resetTools :: Reset Tools Boolean where
    reset = opt "reset"


class Width a b where
  width :: Option a b

instance widthStroke :: Width Stroke Number where
  width = opt "width"

instance widthChartNum :: Width Chart Number where
  width = opt "width"

instance widthChartStr :: Width Chart String where
  width = opt "width"


class ZoomClass a b where
  zoom :: Option a b

instance toolsZoom :: ZoomClass Tools Boolean where
  zoom = opt "zoom"
  

class AutoScale a b where
  autoScaleYaxis :: Option a b

instance brushAutoscale :: AutoScale Brush Boolean where
    autoScaleYaxis = opt "autoScaleYaxis"

instance zoomAutoscale :: AutoScale Zoom Boolean where
    autoScaleYaxis = opt "autoScaleYaxis"


class StrokeClass a where
    stroke :: Option a (Options Stroke)

instance selectionStroke :: StrokeClass Selection where
    stroke = cmap Opt.options (opt "stroke")  

instance selectionZoomClass :: StrokeClass Zoom where
    stroke = cmap Opt.options (opt "stroke")  


class FillClass a  where
    fill :: Option a (Options Fill) 

instance selectionFill :: FillClass Selection where
    fill = cmap Opt.options (opt "fill")

instance zoomFill :: FillClass Zoom where
    fill = cmap Opt.options (opt "fill")


class Name a where
    name :: Option a String

instance localname :: Name Locale where
  name = opt "name"

instance seriesname :: Name Series where
  name = opt "name"


class SeriesData a where
    data' :: Option Series (Array a)

instance singleNumValuesSeries :: SeriesData Number where
    data' = opt "data"

instance singleIntValuesSeries :: SeriesData Int where
    data' = opt "data"

instance pairedNumValuesSeries :: SeriesData (Array Number) where
    data' = opt "data"

instance pairedIntValuesSeries :: SeriesData (Array Int) where
    data' = opt "data"

instance pairedValuesXYSeries :: SeriesData (Options Paired) where
    data' = cmap (\arr -> arr <#> Opt.options) (opt "data")


class PairedX a where
  x :: Option Paired a

instance pairedXString :: PairedX String where
  x = opt "x"

instance pairedXNum :: PairedX Number where
  x = opt "x"

instance pairedXInt :: PairedX Int where
  x = opt "x"


class PairedY a where
  y :: Option Paired a

instance pairedYString :: PairedY String where
  y = opt "y"

instance pairedYNum :: PairedY Number where
  y = opt "y"

instance pairedYInt :: PairedY Int where
  y = opt "y"


class Categories a where
  categories :: Option Axis (Array a)

instance intcats :: Categories Int where
    categories = opt "categories"

instance strcats :: Categories String where
    categories = opt "categories"
  
instance numcats :: Categories Number where
    categories = opt "categories"



chart :: Option Apexoptions (Options Chart)
chart = cmap Opt.options (opt "chart")

series :: Option Apexoptions (Array (Options Series))
series = cmap (\arr -> arr <#> Opt.options) (opt "series")

xAxis :: Option Selection (Options SelectionAxis)
xAxis = cmap Opt.options (opt "xaxis")

xaxis :: Option Apexoptions (Options Axis)
xaxis = cmap Opt.options (opt "xaxis")
   
colors :: Option Apexchart (Array String)
colors = opt "colors"

labels :: Option Apexchart (Array String)
labels = opt "labels"

background :: Option Chart String
background = opt "background"

brush :: Option Chart (Options Brush)
brush = cmap Opt.options (opt "brush")

target :: Option Brush String
target = opt "target"

defaultLocale :: Option Chart String
defaultLocale = opt "defaultLocale"

dropShadow :: Option Chart (Options Dropshadow)
dropShadow = cmap Opt.options (opt "dropShadow")

enabledOnSeries :: Option Dropshadow (Array Number)
enabledOnSeries = opt "enabledOnSeries"

top :: Option Dropshadow Number
top = opt "top"

left :: Option Dropshadow Number
left = opt "left"

blur :: Option Dropshadow Number
blur = opt "blur"

fontFamily :: Option Chart String
fontFamily = opt "fontFamily"

foreColor :: Option Chart String
foreColor = opt "foreColor"

group :: Option Chart String
group = opt "group"

id :: Option Chart String
id = opt "id"

locales :: Option Chart (Array (Options Locale))
locales =  cmap (\arr -> arr <#> Opt.options) (opt "locales")

options :: Option Locale (Options LocaleOptions)
options = cmap Opt.options (opt "options")

shortMonths :: Option LocaleOptions (Array String)
shortMonths = opt "shortMonths"

months :: Option LocaleOptions (Array String)
months = opt "months"

shortDays :: Option LocaleOptions (Array String)
shortDays = opt "shortDays"

days :: Option LocaleOptions (Array String)
days = opt "days"

selectionZoom :: Option Toolbar String
selectionZoom = opt "selectionZoom"

zoomIn :: Option Toolbar String
zoomIn = opt "zoomIn"

zoomOut :: Option Toolbar String
zoomOut = opt "zoomOut"

parentHeightOffset :: Option Chart Number
parentHeightOffset = opt "parentHeightOffset"

redrawOnParentResize :: Option Chart Boolean
redrawOnParentResize = opt "redrawOnParentResize"

dashArray :: Option Stroke Number
dashArray = opt "dashArray"

yaxis :: Option Selection (Options SelectionAxis)
yaxis = cmap Opt.options (opt "yaxis")

min :: Option SelectionAxis Number
min = opt "min"

max :: Option SelectionAxis Number
max = opt "max"

sparkline :: Option Chart (Options Sparkline)
sparkline = cmap Opt.options (opt "sparkline")

stacked :: Option Chart Boolean
stacked = opt "stacked"

stackType :: Option Chart StackType
stackType = cmap stackTypeToString (opt "stackType")

show :: Option ChartToolbar Boolean
show = opt "show"

tools :: Option ChartToolbar (Options Tools)
tools = cmap Opt.options (opt "tools")

zoomin :: Option Tools Boolean
zoomin = opt "zoomin"

zoomout :: Option Tools Boolean
zoomout = opt "zoomout"

zooming :: Option Chart (Options Zoom) 
zooming = cmap Opt.options (opt "zoom")

animations :: Option Chart (Options Animations)
animations = cmap Opt.options (opt "animations")

easing :: Option Animations Easing
easing = cmap easingToString (opt "easing")

animateGradually :: Option Animations (Options AnimateGradually)
animateGradually = cmap Opt.options (opt "animateGradually")

graduallyDelay :: Option AnimateGradually Number
graduallyDelay = opt "delay"

dynamicAnimation :: Option Animations (Options DynamicAnimation)     
dynamicAnimation = cmap Opt.options (opt "dynamicAnimation")


createChart :: String -> Options Apexoptions -> Apexchart
createChart selector opts = _createChart selector (Opt.options opts)

foreign import _createChart :: String -> Foreign -> Apexchart

foreign import render :: Apexchart -> Effect Unit

foreign import _updateOptions :: Apexchart -> Foreign -> Effect Unit
