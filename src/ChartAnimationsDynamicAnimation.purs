
module Apexcharts.Chart.Animations.DynamicAnimation where


import Apexcharts.Chart.Animations (Animations)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data DynamicAnimation

dynamicAnimation :: Option Animations (Options DynamicAnimation)
dynamicAnimation = cmap Opt.options (opt "dynamicAnimation")

enabled :: Option DynamicAnimation Boolean
enabled = opt "enabled"

speed :: Option DynamicAnimation Number
speed = opt "speed"

