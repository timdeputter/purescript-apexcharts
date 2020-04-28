
module Apexcharts.DataLabels.DropShadow where


import Apexcharts.DataLabels (DataLabels)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data DropShadow

dropShadow :: Option DataLabels (Options DropShadow)
dropShadow = cmap Opt.options (opt "dropShadow")

enabled :: Option DropShadow Boolean
enabled = opt "enabled"

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

