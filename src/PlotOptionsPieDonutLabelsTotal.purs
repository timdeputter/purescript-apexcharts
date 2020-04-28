
module Apexcharts.PlotOptions.Pie.Donut.Labels.Total where


import Apexcharts.PlotOptions.Pie.Donut.Labels (Labels)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Total

total :: Option Labels (Options Total)
total = cmap Opt.options (opt "total")

show :: Option Total Boolean
show = opt "show"

showAlways :: Option Total Boolean
showAlways = opt "showAlways"

label :: Option Total String
label = opt "label"

fontSize :: Option Total String
fontSize = opt "fontSize"

fontFamily :: Option Total String
fontFamily = opt "fontFamily"

fontWeight :: Option Total Number
fontWeight = opt "fontWeight"

color :: Option Total String
color = opt "color"


