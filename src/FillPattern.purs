
module Apexcharts.Fill.Pattern where


import Apexcharts.Fill (Fill)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Pattern

pattern :: Option Fill (Options Pattern)
pattern = cmap Opt.options (opt "pattern")

style :: Option Pattern String
style = opt "style"

width :: Option Pattern Number
width = opt "width"

height :: Option Pattern Number
height = opt "height"

strokeWidth :: Option Pattern Number
strokeWidth = opt "strokeWidth"

