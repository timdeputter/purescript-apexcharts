
module Apexcharts.Chart.Zoom.ZoomedArea where


import Apexcharts.Chart.Zoom (Zoom)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data ZoomedArea

zoomedArea :: Option Zoom (Options ZoomedArea)
zoomedArea = cmap Opt.options (opt "zoomedArea")

