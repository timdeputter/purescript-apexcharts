
module Apexcharts.Annotations.Shapes where

import Prelude (map)

import Apexcharts.Annotations (Annotations)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Shapes

data ShapeType = Rect | Circle

shapeTypeToString :: ShapeType -> String
shapeTypeToString = case _ of
    Rect ->  "rect"
    Circle ->  "circle"

shapes :: Option Annotations (Array (Options Shapes))
shapes = cmap (map Opt.options) (opt "shapes")

x :: Option Shapes Number
x = opt "x"

y :: Option Shapes Number
y = opt "y"

type' :: Option Shapes ShapeType
type' = cmap shapeTypeToString (opt "type")

width :: Option Shapes String
width = opt "width"

height :: Option Shapes Number
height = opt "height"

appendTo :: Option Shapes String
appendTo = opt "appendTo"

backgroundColor :: Option Shapes String
backgroundColor = opt "backgroundColor"

opacity :: Option Shapes Number
opacity = opt "opacity"

borderColor :: Option Shapes String
borderColor = opt "borderColor"

borderRadius :: Option Shapes Number
borderRadius = opt "borderRadius"

borderWidth :: Option Shapes Number
borderWidth = opt "borderWidth"

