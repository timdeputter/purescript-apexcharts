module Apexcharts.Chart.Fill where
  




import Data.Options (Option, opt)



data Fill


color :: Option Fill String
color = opt "color"

opacity :: Option Fill Number
opacity = opt "opacity"
