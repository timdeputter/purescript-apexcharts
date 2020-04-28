
module Apexcharts.Annotations where


import Apexcharts (Apexoptions)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Annotations

annotations :: Option Apexoptions (Options Annotations)
annotations = cmap Opt.options (opt "annotations")

position :: Option Annotations String
position = opt "position"

