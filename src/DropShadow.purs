module Apexcharts.DropShadow where

import Apexcharts

import Apexcharts.Commons (class Color)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt



data Dropshadow


instance enableDropShadow :: Enabled Dropshadow where
  enabled = opt "enabled"



instance dropshadowColorArray :: Color Dropshadow (Array String) where
    color = opt "color"

instance dropshadowColor :: Color Dropshadow String where
    color = opt "color"

instance opacityDropshadow :: Opacity Dropshadow Number where
    opacity = opt "opacity"


instance enabledOnSeriesDropshadow :: EnabledOnSeries Dropshadow where
    enabledOnSeries = opt "enabledOnSeries"


class DropShadowClass a where
  dropShadow :: Option a (Options Dropshadow)

instance dropshadowBackground :: DropShadowClass Background where
  dropShadow = cmap Opt.options (opt "dropShadow")

instance dropshadowDataLabels :: DropShadowClass DataLabels where
  dropShadow = cmap Opt.options (opt "dropShadow")


instance dropShadowTop :: Top Dropshadow where
  top = opt "top"  


instance dropshadowLeft :: Leftclass Dropshadow where
  left = opt "left"

blur :: Option Dropshadow Int
blur = opt "blur"
