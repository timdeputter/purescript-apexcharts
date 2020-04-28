
module Apexcharts.Chart.Locales.Options where


import Apexcharts.Chart.Locales (Locales)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, opt)
import Data.Options as Opt

data Options

options :: Option Locales (Opt.Options Options)
options = cmap Opt.options (opt "options")

months :: Option Options (Array String)
months = opt "months"

shortMonths :: Option Options (Array String)
shortMonths = opt "shortMonths"

days :: Option Options (Array String)
days = opt "days"

shortDays :: Option Options (Array String)
shortDays = opt "shortDays"

