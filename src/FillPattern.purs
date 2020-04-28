
module Apexcharts.Fill.Pattern where


import Apexcharts.Fill (Fill)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Pattern

data Style =     
    VerticalLines
    | HorizontalLines
    | SlantedLines
    | Squares
    | Circles

styleToString :: Style -> String
styleToString = case _ of
    VerticalLines -> "verticalLines"
    HorizontalLines -> "horizontalLines"
    SlantedLines -> "slantedLines"
    Squares -> "squares"
    Circles -> "circles"

pattern :: Option Fill (Options Pattern)
pattern = cmap Opt.options (opt "pattern")

style :: Option Pattern Style
style = cmap styleToString (opt "style")

width :: Option Pattern Number
width = opt "width"

height :: Option Pattern Number
height = opt "height"

strokeWidth :: Option Pattern Number
strokeWidth = opt "strokeWidth"

