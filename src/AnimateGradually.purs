module Apexcharts.Chart.Animations.AnimateGradually where

import Apexcharts.Chart.Animations (Animations)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt, options)

data AnimateGradually


animateGradually :: Option Animations (Options AnimateGradually)
animateGradually = cmap options (opt "animateGradually")

enabled :: Option AnimateGradually Boolean
enabled = opt "enabled"

graduallyDelay :: Option AnimateGradually Number
graduallyDelay = opt "delay"
