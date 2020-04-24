module Apexcharts.Fill.Gradient where
  

import Apexcharts.Commons (class Width)
import Apexcharts.Fill (GeneralFill)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt


data Gradient
data Image
data Pattern


data Shade = Light | Dark

shadeToString :: Shade -> String
shadeToString = case _ of
  Light -> "light"
  Dark -> "dark"


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


gradient :: Option GeneralFill (Options Gradient)
gradient = cmap Opt.options (opt "gradient")

image :: Option GeneralFill (Options Image)
image = cmap Opt.options (opt "image")

pattern :: Option GeneralFill (Options Pattern)
pattern = cmap Opt.options (opt "pattern")

class Height a b where
  height :: Option a b

instance heightImage :: Height Image Int where
  height = opt "height"      

instance heightPattern :: Height Pattern Int where
  height = opt "height"      

type' :: Option Gradient GradientType
type' = cmap gradientTypeToString (opt "type")


instance widthImage :: Width Image Int where
  width = opt "width"

instance widthPattern :: Width Pattern Int where
  width = opt "width"


style :: Option Pattern PatternStyle
style =  cmap patternStyleToString (opt "style")

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

strokeWidth :: Option Pattern Int
strokeWidth = opt "strokeWidth"

src :: Option Image (Array String)
src = opt "src"  
