
module Apexcharts.PlotOptions.Pie.Donut.Labels.Name where


import Apexcharts.PlotOptions.Pie.Donut.Labels (Labels)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Name

name :: Option Labels (Options Name)
name = cmap Opt.options (opt "name")

show :: Option Name Boolean
show = opt "show"

fontSize :: Option Name String
fontSize = opt "fontSize"

fontFamily :: Option Name String
fontFamily = opt "fontFamily"

fontWeight :: Option Name Number
fontWeight = opt "fontWeight"

color :: Option Name String
color = opt "color"

offsetY :: Option Name Number
offsetY = opt "offsetY"

