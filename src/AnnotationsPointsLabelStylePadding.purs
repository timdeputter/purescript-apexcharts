
module Apexcharts.Annotations.Points.Label.Style.Padding where


import Apexcharts.Annotations.Points.Label.Style (Style)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Padding

padding :: Option Style (Options Padding)
padding = cmap Opt.options (opt "padding")

left :: Option Padding Number
left = opt "left"

right :: Option Padding Number
right = opt "right"

top :: Option Padding Number
top = opt "top"

bottom :: Option Padding Number
bottom = opt "bottom"

