
module Apexcharts.Chart.Animations where


import Apexcharts.Chart (Chart)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Animations

data Easing =     Linear
    | Easein
    | Easeout
    | Easeinout

easingToString :: Easing -> String
easingToString = case _ of
       Linear -> "linear"
       Easein -> "easein"
       Easeout -> "easeout"
       Easeinout -> "easeinout"

animations :: Option Chart (Options Animations)
animations = cmap Opt.options (opt "animations")

enabled :: Option Animations Boolean
enabled = opt "enabled"

easing :: Option Animations Easing
easing = cmap easingToString (opt "easing")

speed :: Option Animations Number
speed = opt "speed"

