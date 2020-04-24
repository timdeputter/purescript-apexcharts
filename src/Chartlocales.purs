module Apexcharts.Chart.Locales where
  


import Apexcharts.Chart (Chart)

import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt
import Prelude (map)


data Locale
data LocaleOptions
data Toolbar

locales :: Option Chart (Array (Options Locale))
locales =  cmap (map Opt.options) (opt "locales")

name :: Option Locale String
name = opt "name"


options :: Option Locale (Options LocaleOptions)
options = cmap Opt.options (opt "options")

toolbar :: Option LocaleOptions (Options Toolbar) 
toolbar = cmap Opt.options (opt "toolbar")

shortMonths :: Option LocaleOptions (Array String)
shortMonths = opt "shortMonths"

months :: Option LocaleOptions (Array String)
months = opt "months"

shortDays :: Option LocaleOptions (Array String)
shortDays = opt "shortDays"

days :: Option LocaleOptions (Array String)
days = opt "days"

selection :: Option Toolbar String
selection = opt "selection" 

selectionZoom :: Option Toolbar String
selectionZoom = opt "selectionZoom"

zoomIn :: Option Toolbar String
zoomIn = opt "zoomIn"

zoomOut :: Option Toolbar String
zoomOut = opt "zoomOut"

download :: Option Toolbar String
download = opt "download"

pan :: Option Toolbar String 
pan = opt "pan"

reset :: Option Toolbar String 
reset = opt "reset"