module Apexcharts.Chart.Animations where

import Apexcharts
import Apexcharts.Chart (Chart)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt



data Animations
data AnimateGradually
data DynamicAnimation

data Easing = Linear
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

instance enableAnimations :: Enabled Animations where
  enabled = opt "enabled"

instance speedAnimations :: Speed Animations where
  speed = opt "speed"

easing :: Option Animations Easing
easing = cmap easingToString (opt "easing")

animateGradually :: Option Animations (Options AnimateGradually)
animateGradually = cmap Opt.options (opt "animateGradually")

dynamicAnimation :: Option Animations (Options DynamicAnimation)     
dynamicAnimation = cmap Opt.options (opt "dynamicAnimation")

instance enableAnimateGradually :: Enabled AnimateGradually where
  enabled = opt "enabled"

graduallyDelay :: Option AnimateGradually Number
graduallyDelay = opt "delay"

instance enableDynamicAnimation :: Enabled DynamicAnimation where
  enabled = opt "enabled"

instance speedDynamicAnimation :: Speed DynamicAnimation where
  speed = opt "speed"
