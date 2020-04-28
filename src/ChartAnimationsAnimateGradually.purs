
module Apexcharts.Chart.Animations.AnimateGradually where


import Apexcharts.Chart.Animations (Animations)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data AnimateGradually

animateGradually :: Option Animations (Options AnimateGradually)
animateGradually = cmap Opt.options (opt "animateGradually")

enabled :: Option AnimateGradually Boolean
enabled = opt "enabled"

delay :: Option AnimateGradually Number
delay = opt "delay"

