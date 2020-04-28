
module Apexcharts.PlotOptions.RadialBar.Track.DropShadow where



import Apexcharts.PlotOptions.RadialBar.Track (Track)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data DropShadow

dropShadow :: Option Track (Options DropShadow)
dropShadow = cmap Opt.options (opt "dropShadow")

enabled :: Option DropShadow Boolean
enabled = opt "enabled"

top :: Option DropShadow Number
top = opt "top"

left :: Option DropShadow Number
left = opt "left"

blur :: Option DropShadow Number
blur = opt "blur"

opacity :: Option DropShadow Number
opacity = opt "opacity"

