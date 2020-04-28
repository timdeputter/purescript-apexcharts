
module Apexcharts.PlotOptions.RadialBar.DataLabels.Total where


import Apexcharts.PlotOptions.RadialBar.DataLabels (DataLabels)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Total

total :: Option DataLabels (Options Total)
total = cmap Opt.options (opt "total")

show :: Option Total Boolean
show = opt "show"

label :: Option Total String
label = opt "label"

color :: Option Total String
color = opt "color"

fontSize :: Option Total String
fontSize = opt "fontSize"

fontFamily :: Option Total String
fontFamily = opt "fontFamily"

fontWeight :: Option Total Number
fontWeight = opt "fontWeight"

