
module Apexcharts.Chart.Selection where


import Apexcharts.Chart (Chart)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Selection


data SelectionType = X | Y | XY

selectionTypeToString :: SelectionType -> String
selectionTypeToString = case _ of
    X -> "x"
    Y -> "Y"
    XY -> "xy"

selection :: Option Chart (Options Selection)
selection = cmap Opt.options (opt "selection")

enabled :: Option Selection Boolean
enabled = opt "enabled"

type' :: Option Selection SelectionType
type' = cmap selectionTypeToString (opt "type")

