
module Apexcharts.Chart where


import Apexcharts (Apexoptions)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Chart

chart :: Option Apexoptions (Options Chart)
chart = cmap Opt.options (opt "chart")

background :: Option Chart String
background = opt "background"

defaultLocale :: Option Chart String
defaultLocale = opt "defaultLocale"

fontFamily :: Option Chart String
fontFamily = opt "fontFamily"

foreColor :: Option Chart String
foreColor = opt "foreColor"

group :: Option Chart String
group = opt "group"

height :: Option Chart String
height = opt "height"

id :: Option Chart String
id = opt "id"

offsetX :: Option Chart Number
offsetX = opt "offsetX"

offsetY :: Option Chart Number
offsetY = opt "offsetY"

parentHeightOffset :: Option Chart Number
parentHeightOffset = opt "parentHeightOffset"

redrawOnParentResize :: Option Chart Boolean
redrawOnParentResize = opt "redrawOnParentResize"

stacked :: Option Chart Boolean
stacked = opt "stacked"

stackType :: Option Chart String
stackType = opt "stackType"

type' :: Option Chart String
type' = opt "type"

width :: Option Chart String
width = opt "width"

