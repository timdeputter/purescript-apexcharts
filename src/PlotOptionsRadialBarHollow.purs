
module Apexcharts.PlotOptions.RadialBar.Hollow where


import Apexcharts.PlotOptions.RadialBar (RadialBar)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Hollow

hollow :: Option RadialBar (Options Hollow)
hollow = cmap Opt.options (opt "hollow")

margin :: Option Hollow Number
margin = opt "margin"

size :: Option Hollow String
size = opt "size"

background :: Option Hollow String
background = opt "background"

image :: Option Hollow String
image = opt "image"

imageWidth :: Option Hollow Number
imageWidth = opt "imageWidth"

imageHeight :: Option Hollow Number
imageHeight = opt "imageHeight"

imageOffsetX :: Option Hollow Number
imageOffsetX = opt "imageOffsetX"

imageOffsetY :: Option Hollow Number
imageOffsetY = opt "imageOffsetY"

imageClipped :: Option Hollow Boolean
imageClipped = opt "imageClipped"

position :: Option Hollow String
position = opt "position"

