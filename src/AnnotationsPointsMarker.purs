
module Apexcharts.Annotations.Points.Marker where


import Apexcharts.Annotations.Points (Points)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Marker

marker :: Option Points (Options Marker)
marker = cmap Opt.options (opt "marker")

size :: Option Marker Number
size = opt "size"

fillColor :: Option Marker String
fillColor = opt "fillColor"

strokeColor :: Option Marker String
strokeColor = opt "strokeColor"

strokeWidth :: Option Marker Number
strokeWidth = opt "strokeWidth"

shape :: Option Marker String
shape = opt "shape"

radius :: Option Marker Number
radius = opt "radius"

offsetX :: Option Marker Number
offsetX = opt "OffsetX"

offsetY :: Option Marker Number
offsetY = opt "OffsetY"

cssClass :: Option Marker String
cssClass = opt "cssClass"

