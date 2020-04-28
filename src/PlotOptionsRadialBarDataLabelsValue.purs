
module Apexcharts.PlotOptions.RadialBar.DataLabels.Value where


import Apexcharts.PlotOptions.RadialBar.DataLabels (DataLabels)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Value

value :: Option DataLabels (Options Value)
value = cmap Opt.options (opt "value")

show :: Option Value Boolean
show = opt "show"

fontSize :: Option Value String
fontSize = opt "fontSize"

fontFamily :: Option Value String
fontFamily = opt "fontFamily"

fontWeight :: Option Value Number
fontWeight = opt "fontWeight"

color :: Option Value String
color = opt "color"

offsetY :: Option Value Number
offsetY = opt "offsetY"


