
module Apexcharts.Xaxis where


import Apexcharts
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Xaxis

xaxis :: Option Apexoptions (Options Xaxis)
xaxis = cmap Opt.options (opt "xaxis")

type' :: Option Xaxis String
type' = opt "type"

categories :: Option Xaxis (Array String)
categories = opt "categories"

tickAmount :: Option Xaxis Number
tickAmount = opt "tickAmount"

tickPlacement :: Option Xaxis String
tickPlacement = opt "tickPlacement"

min :: Option Xaxis Number
min = opt "min"

max :: Option Xaxis Number
max = opt "max"

range :: Option Xaxis Number
range = opt "range"

floating :: Option Xaxis Boolean
floating = opt "floating"

position :: Option Xaxis String
position = opt "position"

