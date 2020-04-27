module Apexcharts.Fill.Gradient where
  


import Apexcharts.Fill (GeneralFill)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt


data Gradient


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


gradient :: Option GeneralFill (Options Gradient)
gradient = cmap Opt.options (opt "gradient")


class Height a b where
  height :: Option a b



type' :: Option Gradient GradientType
type' = cmap gradientTypeToString (opt "type")


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


