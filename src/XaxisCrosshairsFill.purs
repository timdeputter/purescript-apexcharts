
module Apexcharts.Xaxis.Crosshairs.Fill where


import Apexcharts.Xaxis.Crosshairs (Crosshairs)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Fill

fill :: Option Crosshairs (Options Fill)
fill = cmap Opt.options (opt "fill")

type' :: Option Fill String
type' = opt "type"

color :: Option Fill String
color = opt "color"

