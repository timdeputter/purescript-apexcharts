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
data GeneralFill
data Fill
data Stroke
data MainStroke
data SelectionAxis
data Sparkline
data ChartToolbar
data Tools
data Zoom
data Series
data Paired
data DataLabels
data Title
data Style
data Background
data Gradient
data Image
data Pattern
data Grid
data Gridaxis
data Lines
data RowOrColumn
data Padding

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


data StackType = NormalStack | HundredPercent

stackTypeToString :: StackType -> String
stackTypeToString = case _ of
    NormalStack -> "normal"
    HundredPercent -> "100%"


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

data TextAnchor = Start | Middle | End


textAnchorToString :: TextAnchor -> String
textAnchorToString = case _ of
    Start -> "start"
    Middle -> "middle"
    End -> "end"


data Curve = Smooth | Straight | Stepline

curveToString :: Curve -> String
curveToString = case _ of
  Smooth -> "smooth"
  Straight -> "straight"
  Stepline -> "stepline"

data LineCap = Butt | Square | Round

lineCapToString :: LineCap -> String
lineCapToString = case _ of
  Butt -> "butt"
  Square -> "square"
  Round -> "round"

data Align = Left | Center | Right

alignToString :: Align -> String
alignToString = case _ of
  Left -> "left"
  Center -> "center"
  Right -> "right"


data FontWeight = Normal | Bold | Bolder | Lighter

fontWeightToString :: FontWeight -> String
fontWeightToString = case _ of
  Normal -> "normal"
  Bold -> "bold"
  Bolder -> "bolder"
  Lighter -> "lighter"


data FontWeightNum = N100 | N200 | N300 | N400 | N500 | N600 | N700 | N800 | N900

fontWeightNumToString :: FontWeightNum -> Int
fontWeightNumToString = case _ of
  N100 -> 100
  N200 -> 200
  N300 -> 300
  N400 -> 400
  N500 -> 500
  N600 -> 600
  N700 -> 700
  N800 -> 800
  N900 -> 900


data FillType = Solid | Gradient | Pattern | Image

fillTypeToString :: FillType -> String
fillTypeToString = case _ of
  Solid -> "solid"
  Gradient -> "gradient"
  Pattern -> "pattern"
  Image -> "image"


data Shade = Light | Dark

shadeToString :: Shade -> String
shadeToString = case _ of
  Light -> "light"
  Dark -> "dark"

data GradientType = GradientHorizontal
    | GradientVertical
    | Diagonal1
    | Diagonal2

gradientTypeToString :: GradientType -> String
gradientTypeToString = case _ of
  GradientHorizontal -> "horizontal"
  GradientVertical -> "vertical"
  Diagonal1 -> "diagonal1"
  Diagonal2 -> "diagonal2"

data PatternStyle = VerticalLines
    | HorizontalLines
    | SlantedLines
    | Squares
    | Circles

patternStyleToString :: PatternStyle -> String
patternStyleToString = case _ of
  VerticalLines -> "verticalLines"
  HorizontalLines -> "horizontalLines"
  SlantedLines -> "slantedLines"
  Squares -> "squares"
  Circles -> "circles"

data Gridposition = Front | Back

gridpositionToString :: Gridposition -> String
gridpositionToString = case _ of
  Front -> "front"
  Back -> "back"


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

instance enableDataLabels :: Enabled DataLabels where
  enabled = opt "enabled"      

instance backgroundEnabled :: Enabled Background where
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

instance heightImage :: Height Image Int where
  height = opt "height"      

instance heightPattern :: Height Pattern Int where
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

instance dropshadowColorArray :: Color Dropshadow (Array String) where
    color = opt "color"

instance dropshadowColor :: Color Dropshadow String where
    color = opt "color"

instance fillColor :: Color Fill String where
    color = opt "color"

instance generalfillColor :: Color GeneralFill String where
    color = opt "color"


instance strokeColor :: Color Stroke String where
    color = opt "color"


class Opacity a b where
  opacity :: Option a b

instance opacityDropshadow :: Opacity Dropshadow Number where
    opacity = opt "opacity"

instance opacityFill :: Opacity Fill Number where
    opacity = opt "opacity"

instance opacityGeneralFill :: Opacity GeneralFill Number where
    opacity = opt "opacity"

instance opacityStroke :: Opacity Stroke Number where
    opacity = opt "opacity"

instance opacityBackground :: Opacity Background Number where
    opacity = opt "opacity"

instance opacityRowOrColumn :: Opacity RowOrColumn Number where
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

instance typeGeneralFill :: Type GeneralFill FillType where
    type' = cmap fillTypeToString (opt "type")

instance typeGeneralFillArray :: Type GeneralFill (Array FillType) where
    type' = cmap (map fillTypeToString) (opt "type")

instance gradientType :: Type Gradient GradientType where
    type' = cmap gradientTypeToString (opt "type")


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

instance dataLabelsOffsetX :: OffsetX DataLabels Number where
    offsetX = opt "offsetX"


class OffsetY a b where
  offsetY :: Option a b

instance chartOffsetY :: OffsetY Chart Number where
    offsetY = opt "offsetY"

instance chartToolbarOffsetY :: OffsetY ChartToolbar Number where
    offsetY = opt "offsetY"

instance dataLabelsOffsetY :: OffsetY DataLabels Number where
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

instance widthMainstroke :: Width MainStroke Number where
  width = opt "width"

instance widthChartNum :: Width Chart Number where
  width = opt "width"

instance widthChartStr :: Width Chart String where
  width = opt "width"

instance widthImage :: Width Image Int where
  width = opt "width"

instance widthPattern :: Width Pattern Int where
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


class FillClass a b where
    fill :: Option a (Options b) 

instance selectionFill :: FillClass Selection Fill where
    fill = cmap Opt.options (opt "fill")

instance zoomFill :: FillClass Zoom Fill where
    fill = cmap Opt.options (opt "fill")

instance generalFill :: FillClass Apexoptions GeneralFill where
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
    data' = cmap (map Opt.options) (opt "data")


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

class EnabledOnSeries a where
  enabledOnSeries :: Option a (Array Number)

instance enabledOnSeriesDropshadow :: EnabledOnSeries Dropshadow where
    enabledOnSeries = opt "enabledOnSeries"

instance enabledOnSeriesDataLabels:: EnabledOnSeries DataLabels where
    enabledOnSeries = opt "enabledOnSeries"


class ShowClass a where
  show :: Option a Boolean

instance showChartToolbar :: ShowClass ChartToolbar where
  show = opt "show"

instance showMainStroke :: ShowClass MainStroke where
  show = opt "show"

instance showGrid :: ShowClass Grid where
  show = opt "show"

instance showLines :: ShowClass Lines where
  show = opt "show"


class DashArray a b where
  dashArray :: Option a b

instance dashArrayStroke :: DashArray Stroke Number where
  dashArray = opt "dashArray"  

instance dashArrayStrokeArray :: DashArray Stroke (Array Number) where
  dashArray = opt "dashArray"  

instance dashArrayMainstroke :: DashArray MainStroke Number where
  dashArray = opt "dashArray"  

instance dashArrayMainstrokeArray :: DashArray MainStroke (Array Number) where
  dashArray = opt "dashArray"  


class CurveClass a  where
  curve :: Option MainStroke a

instance simpleCurve :: CurveClass Curve where
  curve = cmap curveToString (opt "curve")

instance arrayCurve :: CurveClass (Array Curve) where
  curve = cmap (map curveToString) (opt "curve")


class Colors a where
  colors :: Option a (Array String)


instance apexchartColors :: Colors Apexoptions where
  colors = opt "colors"  

instance strokeColors :: Colors MainStroke where
  colors = opt "colors"  

instance styleColors :: Colors Style where
  colors = opt "colors"  

instance generalFillColors :: Colors GeneralFill where
  colors = opt "colors"  

instance rowOrColumnColors :: Colors RowOrColumn where
  colors = opt "colors"  


class FontFamily a where
  fontFamily :: Option a String

instance chartFontFamily :: FontFamily Chart where
  fontFamily = opt "fontFamily"
  
instance styleFontFamily :: FontFamily Style where
  fontFamily = opt "fontFamily"


class FontWeightClass a where
  fontWeight :: Option Style a

instance fontWeightString :: FontWeightClass FontWeight where
  fontWeight = opt "fontWeight"

instance fontWeightNum :: FontWeightClass Number where
  fontWeight = opt "fontWeight"


class BackgroundClass a b where
  background :: Option a b

instance chartBackground :: BackgroundClass Chart String where
  background = opt "background"

instance dataLabelsBackground :: BackgroundClass DataLabels (Options Background) where
  background = cmap Opt.options (opt "background")


class ForeColor a where
  foreColor :: Option a String

instance chartForecolor :: ForeColor Chart where
  foreColor = opt "foreColor"
  
instance backgroundForecolor :: ForeColor Background where
  foreColor = opt "foreColor"


class DropShadowClass a where
  dropShadow :: Option a (Options Dropshadow)

instance dropshadowChart :: DropShadowClass Chart where
  dropShadow = cmap Opt.options (opt "dropShadow")

instance dropshadowBackground :: DropShadowClass Background where
  dropShadow = cmap Opt.options (opt "dropShadow")

instance dropshadowDataLabels :: DropShadowClass DataLabels where
  dropShadow = cmap Opt.options (opt "dropShadow")


class StyleClass a b where
  style :: Option a b

instance dataLabelsStyle :: StyleClass DataLabels (Options Style) where  
  style =  cmap Opt.options (opt "style")

instance patternStyle :: StyleClass Pattern PatternStyle where  
  style =  cmap patternStyleToString (opt "style")


class BorderColor a where
  borderColor :: Option a String

instance backgroundBorderColor :: BorderColor Background where
  borderColor = opt "borderColor"

instance gridBorderColor :: BorderColor Grid where
  borderColor = opt "borderColor"


class Xaxis a b where 
  xaxis :: Option a (Options b)

instance apexoptionsXaxis :: Xaxis Apexoptions Axis where
  xaxis = cmap Opt.options (opt "xaxis")

instance selectionXaxis :: Xaxis Selection SelectionAxis where
  xaxis = cmap Opt.options (opt "xaxis")

instance gridXaxis :: Xaxis Grid Gridaxis where
  xaxis = cmap Opt.options (opt "xaxis")


class Yaxis a b where 
  yaxis :: Option a (Options b)

instance gridYaxis :: Yaxis Grid Gridaxis where
  yaxis = cmap Opt.options (opt "yaxis")

instance selectionYaxis :: Yaxis Selection SelectionAxis where
  yaxis = cmap Opt.options (opt "yaxis")

class PaddingClass a b where
  padding :: Option a b

instance backgroundpadding :: PaddingClass Background Int where
  padding = opt "padding"

instance gridpadding :: PaddingClass Grid (Options Padding) where
  padding = cmap Opt.options (opt "padding")


class Top a where
  top :: Option a Int  

instance dropShadowTop :: Top Dropshadow where
  top = opt "top"  

instance paddingTop :: Top Padding where
  top = opt "top"  


class Leftclass a where
  left :: Option a Int  

instance dropshadowLeft :: Leftclass Dropshadow where
  left = opt "left"

instance paddingLeft :: Leftclass Padding where
  left = opt "left"


chart :: Option Apexoptions (Options Chart)
chart = cmap Opt.options (opt "chart")

series :: Option Apexoptions (Array (Options Series))
series = cmap (map Opt.options) (opt "series")

dataLabels :: Option Apexoptions (Options DataLabels)
dataLabels = cmap Opt.options (opt "dataLabels")

fontSize :: Option Style String
fontSize = opt "fontSize"

title :: Option Apexoptions (Options Title)
title = cmap Opt.options (opt "title")

text :: Option Title String
text = opt "text"

borderRadius :: Option Background Int
borderRadius = opt "borderRadius"

borderWidth :: Option Background Int
borderWidth = opt "borderWidth"

align :: Option Title Align
align =  cmap alignToString (opt "align")

selectionStroke :: Option Selection (Options Stroke)
selectionStroke = cmap Opt.options (opt "stroke")  

zoomStroke :: Option Zoom (Options Stroke)
zoomStroke = cmap Opt.options (opt "stroke")  

stroke :: Option Apexoptions (Options MainStroke)
stroke = cmap Opt.options (opt "stroke")  

lineCap :: Option MainStroke LineCap
lineCap = cmap lineCapToString (opt "lineCap")  
   
labels :: Option Apexchart (Array String)
labels = opt "labels"

brush :: Option Chart (Options Brush)
brush = cmap Opt.options (opt "brush")

target :: Option Brush String
target = opt "target"

defaultLocale :: Option Chart String
defaultLocale = opt "defaultLocale"

blur :: Option Dropshadow Int
blur = opt "blur"

group :: Option Chart String
group = opt "group"

id :: Option Chart String
id = opt "id"

locales :: Option Chart (Array (Options Locale))
locales =  cmap (map Opt.options) (opt "locales")

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

gradient :: Option GeneralFill (Options Gradient)
gradient = cmap Opt.options (opt "gradient")

shadeIntensity :: Option Gradient Number
shadeIntensity = opt "shadeIntensity"

gradientToColors :: Option Gradient (Array String)
gradientToColors = opt "gradientToColors"

inverseColors :: Option Gradient Boolean
inverseColors = opt "inverseColors"

opacityFrom :: Option Gradient Number
opacityFrom = opt "opacityFrom"

opacityTo :: Option Gradient Number
opacityTo = opt "opacityTo"

stops :: Option Gradient (Array Int)
stops = opt "stops"

shade :: Option Gradient Shade
shade = cmap shadeToString (opt "shade")

image :: Option GeneralFill (Options Image)
image = cmap Opt.options (opt "image")

pattern :: Option GeneralFill (Options Pattern)
pattern = cmap Opt.options (opt "pattern")

strokeWidth :: Option Pattern Int
strokeWidth = opt "strokeWidth"

src :: Option Image (Array String)
src = opt "src"  

grid :: Option Apexoptions (Options Grid)
grid = cmap Opt.options (opt "grid")

strokeDashArray :: Option Grid Number
strokeDashArray = opt "strokeDashArray"

position :: Option Grid Gridposition
position = cmap gridpositionToString (opt "position")  

lines :: Option Gridaxis (Options Lines)
lines = cmap Opt.options (opt "position")  

row :: Option Grid (Options RowOrColumn)
row = cmap Opt.options (opt "row")  

column :: Option Grid (Options RowOrColumn)
column = cmap Opt.options (opt "column")  

right :: Option Padding Int
right = opt "right"

bottom :: Option Padding Int
bottom = opt "bottom"

parentHeightOffset :: Option Chart Number
parentHeightOffset = opt "parentHeightOffset"

redrawOnParentResize :: Option Chart Boolean
redrawOnParentResize = opt "redrawOnParentResize"

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

textAnchor :: Option DataLabels TextAnchor
textAnchor = cmap textAnchorToString (opt "textAnchor")

distributed :: Option DataLabels Boolean
distributed = opt "distributed"


createChart :: String -> Options Apexoptions -> Apexchart
createChart selector opts = _createChart selector (Opt.options opts)

foreign import _createChart :: String -> Foreign -> Apexchart

foreign import render :: Apexchart -> Effect Unit

foreign import _updateOptions :: Apexchart -> Foreign -> Effect Unit
