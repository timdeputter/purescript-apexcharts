
module Apexcharts.Theme.Monochrome where


import Apexcharts.Theme (Theme)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Monochrome

monochrome :: Option Theme (Options Monochrome)
monochrome = cmap Opt.options (opt "monochrome")

enabled :: Option Monochrome Boolean
enabled = opt "enabled"

color :: Option Monochrome String
color = opt "color"

shadeTo :: Option Monochrome String
shadeTo = opt "shadeTo"

shadeIntensity :: Option Monochrome Number
shadeIntensity = opt "shadeIntensity"

