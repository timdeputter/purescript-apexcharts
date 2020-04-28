
module Apexcharts.Chart.DropShadow where


import Apexcharts.Chart (Chart)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data DropShadow

dropShadow :: Option Chart (Options DropShadow)
dropShadow = cmap Opt.options (opt "dropShadow")

enabled :: Option DropShadow Boolean
enabled = opt "enabled"

enabledOnSeries :: Option DropShadow (Array Number)
enabledOnSeries = opt "enabledOnSeries"

top :: Option DropShadow Number
top = opt "top"

left :: Option DropShadow Number
left = opt "left"

blur :: Option DropShadow Number
blur = opt "blur"

color :: Option DropShadow String
color = opt "color"

opacity :: Option DropShadow Number
opacity = opt "opacity"

