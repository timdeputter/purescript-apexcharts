module Test.Main where



import Apexcharts (Align(..), Apexoptions, Axis, AxisType(..), Curve(..), FontWeight(..), GradientType(..), Gridposition(..), LineCap(..), OrientationType(..), PatternStyle(..), Shade(..), TextAnchor(..), align, autoScaleYaxis, background, blur, borderColor, borderRadius, borderWidth, bottom, categories, color, colors, column, curve, dashArray, data', dataLabels, distributed, download, dropShadow, enabled, enabledOnSeries, fill, fontFamily, fontSize, fontWeight, foreColor, gradientToColors, grid, height, inverseColors, labels, left, lineCap, lines, name, offsetX, offsetY, opacity, opacityFrom, opacityTo, padding, pan, position, reset, right, row, selection, selectionZoom, series, shade, shadeIntensity, show, speed, src, stops, stroke, strokeDashArray, strokeWidth, style, text, textAnchor, title, toolbar, top, type', width, x, xaxis, y, yaxis, zoom, zoomIn, zoomOut)
import Apexcharts.Chart (ChartType(..), Easing(..), Fill, StackType(..), animateGradually, animations, brush, chart, days, defaultLocale, dynamicAnimation, easing, graduallyDelay, group, id, locales, max, min, months, options, parentHeightOffset, redrawOnParentResize, selectionStroke, shortDays, shortMonths, sparkline, stackType, stacked, target, tools, zoomStroke, zoomin, zooming, zoomout)
import Apexcharts.Fill (FillType(..))
import Apexcharts.Fill as F
import Data.Options (Options, (:=))
import Data.Options as Opt
import Effect (Effect)
import Effect.Aff (Aff)
import Foreign (Foreign)
import Prelude (Unit, discard, ($), (<>))
import Test.Spec (describe, it)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Reporter (specReporter)
import Test.Spec.Runner (run)

main :: Effect Unit
main = run [specReporter] do
  describe "basic chart" do
    let 
      expected = "{\"chart\":{\"type\":\"line\"}," 
        <> "\"series\":[{\"name\":\"sales\",\"data\":[30,40,35,50,49,60,70,91,125]}],"
        <> "\"xaxis\":{\"categories\":[1991,1992,1993,1994,1995,1996,1997,1998,1999]}}"
      basicChart =  (
        chart := (type' := Line) 
        <> series := [
          name := "sales"
          <> data' := [30,40,35,50,49,60,70,91,125]
        ]
        <> xaxis := (
          categories := [1991,1992,1993,1994,1995,1996,1997,1998,1999]
        )
      )
    it "is possible" $ basicChart `shouldBeOption` expected
      
  describe "Apexoptions" do
    describe "chart" do
      describe "animations" do
        it "enabled" $ (chart := (animations := (enabled := true))) `shouldBeOption` "{\"chart\":{\"animations\":{\"enabled\":true}}}"
        it "easing" $ (chart := (animations := (easing := Linear))) `shouldBeOption` "{\"chart\":{\"animations\":{\"easing\":\"linear\"}}}"
        it "speed" $ (chart := (animations := (speed := 800.0))) `shouldBeOption` "{\"chart\":{\"animations\":{\"speed\":800}}}"
        describe "animateGradually" do
          it "enabled" $ (chart := (animations := (animateGradually := (enabled := true)))) 
            `shouldBeOption` "{\"chart\":{\"animations\":{\"animateGradually\":{\"enabled\":true}}}}"
          it "delay" $ (chart := (animations := (animateGradually := (graduallyDelay := 150.0)))) 
            `shouldBeOption` "{\"chart\":{\"animations\":{\"animateGradually\":{\"delay\":150}}}}"
        describe "dynamicAnimation" do
          it "enabled" $ (chart := (animations := (dynamicAnimation := (enabled := true)))) 
            `shouldBeOption` "{\"chart\":{\"animations\":{\"dynamicAnimation\":{\"enabled\":true}}}}"
          it "speed" $ (chart := (animations := (dynamicAnimation := (speed := 350.0)))) 
            `shouldBeOption` "{\"chart\":{\"animations\":{\"dynamicAnimation\":{\"speed\":350}}}}"
      it "background" $ (chart := (background := "#fff")) `shouldBeOption` "{\"chart\":{\"background\":\"#fff\"}}" 
      describe "brush" do
        it "enabled" $ (chart := (brush := (enabled := true))) `shouldBeOption` "{\"chart\":{\"brush\":{\"enabled\":true}}}"
        it "target" $ (chart := (brush := (target := "chartId"))) `shouldBeOption` "{\"chart\":{\"brush\":{\"target\":\"chartId\"}}}"
        it "autoScaleYaxis" $ (chart := (brush := (autoScaleYaxis := true))) `shouldBeOption` "{\"chart\":{\"brush\":{\"autoScaleYaxis\":true}}}"
      it "defaultLocale" $ (chart := (defaultLocale := "en")) `shouldBeOption` "{\"chart\":{\"defaultLocale\":\"en\"}}"     
      describe "dropshadow" do
        it "enabled" $ (chart := (dropShadow := (enabled := true))) `shouldBeOption` "{\"chart\":{\"dropShadow\":{\"enabled\":true}}}"
        it "enabledOnSeries" $  (chart := (dropShadow := (enabledOnSeries := [3.0,2.0]))) 
          `shouldBeOption` "{\"chart\":{\"dropShadow\":{\"enabledOnSeries\":[3,2]}}}"
        it "top" $  (chart := (dropShadow := (top := 4))) 
          `shouldBeOption` "{\"chart\":{\"dropShadow\":{\"top\":4}}}"
        it "left" $  (chart := (dropShadow := (left := 5))) 
          `shouldBeOption` "{\"chart\":{\"dropShadow\":{\"left\":5}}}"
        it "blur" $  (chart := (dropShadow := (blur := 6))) 
          `shouldBeOption` "{\"chart\":{\"dropShadow\":{\"blur\":6}}}"
        it "color" $ (chart := (dropShadow := (color := ["#fff"]))) 
          `shouldBeOption` "{\"chart\":{\"dropShadow\":{\"color\":[\"#fff\"]}}}"
        it "opacity" $  (chart := (dropShadow := (opacity := 7.0))) 
          `shouldBeOption` "{\"chart\":{\"dropShadow\":{\"opacity\":7}}}"
      it "fontFamily" $ (chart := (fontFamily := "Helvetica, Arial")) `shouldBeOption` "{\"chart\":{\"fontFamily\":\"Helvetica, Arial\"}}"
      it "foreColor" $ (chart := (foreColor := "#373d3f")) `shouldBeOption` "{\"chart\":{\"foreColor\":\"#373d3f\"}}"
      it "group" $ (chart := (group := "g1")) `shouldBeOption` "{\"chart\":{\"group\":\"g1\"}}"
      describe "height" do
        it "as number" $ (chart := (height := 33.0)) `shouldBeOption` "{\"chart\":{\"height\":33}}"
        it "as string" $ (chart := (height := "44px")) `shouldBeOption` "{\"chart\":{\"height\":\"44px\"}}"
      it "id" $ (chart := (id := "c1")) `shouldBeOption` "{\"chart\":{\"id\":\"c1\"}}"
      describe "locales" do
        it "name" $ (chart := (locales := [name := "en"])) `shouldBeOption` "{\"chart\":{\"locales\":[{\"name\":\"en\"}]}}" 
        describe "options" do
          it "months" $ (chart := (locales := [options := (months := ["Ja", "Fe"])])) 
            `shouldBeOption` "{\"chart\":{\"locales\":[{\"options\":{\"months\":[\"Ja\",\"Fe\"]}}]}}" 
          it "shortMonths" $ (chart := (locales := [options := (shortMonths := ["J", "F"])])) 
            `shouldBeOption` "{\"chart\":{\"locales\":[{\"options\":{\"shortMonths\":[\"J\",\"F\"]}}]}}" 
          it "days" $ (chart := (locales := [options := (days := ["Mo", "Di"])])) 
            `shouldBeOption` "{\"chart\":{\"locales\":[{\"options\":{\"days\":[\"Mo\",\"Di\"]}}]}}" 
          it "shortDays" $ (chart := (locales := [options := (shortDays := ["M", "D"])])) 
            `shouldBeOption` "{\"chart\":{\"locales\":[{\"options\":{\"shortDays\":[\"M\",\"D\"]}}]}}" 
          describe "toolbar" do
            it "download" $ (chart := (locales := [options := (toolbar := (zoomIn := "z" <> download := "Dl"))])) 
              `shouldBeOption` "{\"chart\":{\"locales\":[{\"options\":{\"toolbar\":{\"zoomIn\":\"z\",\"download\":\"Dl\"}}}]}}"
            it "selection" $ (chart := (locales := [options := toolbar := (zoomIn := "z" <> selection := "s")]))
              `shouldBeOption` "{\"chart\":{\"locales\":[{\"options\":{\"toolbar\":{\"zoomIn\":\"z\",\"selection\":\"s\"}}}]}}" 
            it "selectionZoom" $ (chart := (locales := [options := (toolbar := (selectionZoom := "sz"))])) 
              `shouldBeOption` "{\"chart\":{\"locales\":[{\"options\":{\"toolbar\":{\"selectionZoom\":\"sz\"}}}]}}" 
            it "zoomIn" $ (chart := (locales := [options := (toolbar := (zoomIn := "zi"))])) 
              `shouldBeOption` "{\"chart\":{\"locales\":[{\"options\":{\"toolbar\":{\"zoomIn\":\"zi\"}}}]}}" 
            it "zoomOut" $ (chart := (locales := [options := (toolbar := (zoomOut := "zo"))])) 
              `shouldBeOption` "{\"chart\":{\"locales\":[{\"options\":{\"toolbar\":{\"zoomOut\":\"zo\"}}}]}}" 
            it "pan" $ (chart := (locales := [options := (toolbar := (zoomIn := "z" <> pan := "p"))])) 
              `shouldBeOption` "{\"chart\":{\"locales\":[{\"options\":{\"toolbar\":{\"zoomIn\":\"z\",\"pan\":\"p\"}}}]}}" 
            it "reset" $ (chart := (locales := [options := (toolbar := (zoomIn := "z" <> reset := "r"))])) 
              `shouldBeOption` "{\"chart\":{\"locales\":[{\"options\":{\"toolbar\":{\"zoomIn\":\"z\",\"reset\":\"r\"}}}]}}" 
      it "offsetX" $ (chart := (offsetX := 0.0)) `shouldBeOption` "{\"chart\":{\"offsetX\":0}}"          
      it "offsetY" $ (chart := (offsetY := 1.0)) `shouldBeOption` "{\"chart\":{\"offsetY\":1}}"          
      it "parentHeightOffset" $ (chart := (parentHeightOffset := 2.0)) `shouldBeOption` "{\"chart\":{\"parentHeightOffset\":2}}"          
      it "redrawOnParentResize" $ (chart := (redrawOnParentResize := true)) `shouldBeOption` "{\"chart\":{\"redrawOnParentResize\":true}}"          
      let
        fil :: Options Fill
        fil = (color := "#24292e" <> opacity := 0.1)
      it "selection" $ (chart := (selection := (enabled := true <> type' := X
        <> fill := fil
        <> selectionStroke := (width := 1.0 <> dashArray := 3.0 <> color := "#294820" <> opacity := 0.4 )
        <> xaxis := (min := 1.0 <> max := 3.0)
        <> yaxis := (min := 7.0 <> max := 11.0)))) 
          `shouldBeOption` ("{\"chart\":{\"selection\":{\"enabled\":true,\"type\":\"x\","
            <> "\"fill\":{\"color\":\"#24292e\",\"opacity\":0.1},"
            <> "\"stroke\":{\"width\":1,\"dashArray\":3,\"color\":\"#294820\",\"opacity\":0.4},"
            <> "\"xaxis\":{\"min\":1,\"max\":3},"
            <> "\"yaxis\":{\"min\":7,\"max\":11}}}}")
      it "sparkline" $ (chart := (sparkline := (enabled := true))) `shouldBeOption` "{\"chart\":{\"sparkline\":{\"enabled\":true}}}"
      it "stacked" $ (chart := (stacked := true)) `shouldBeOption` "{\"chart\":{\"stacked\":true}}"
      it "stackType" $ (chart := (stackType := NormalStack)) `shouldBeOption` "{\"chart\":{\"stackType\":\"normal\"}}"
      describe "toolbar" do
        it "show" $ (chart := (toolbar := (show := true <> tools := (download := true)))) 
          `shouldBeOption` "{\"chart\":{\"toolbar\":{\"show\":true,\"tools\":{\"download\":true}}}}"
        it "offsetX" $ (chart := (toolbar := (offsetX := 3.0 <> tools := (download := true)))) 
          `shouldBeOption` "{\"chart\":{\"toolbar\":{\"offsetX\":3,\"tools\":{\"download\":true}}}}"
        it "offsetY" $ (chart := (toolbar := (offsetY := 4.0 <> tools := (download := true)))) 
          `shouldBeOption` "{\"chart\":{\"toolbar\":{\"offsetY\":4,\"tools\":{\"download\":true}}}}"
        it "tools" $ (chart := (toolbar := (tools := (zoomin := true <> zoom := true <> download := true <> selection := true 
          <> zoomout := true <> pan := true <> reset := true)))) 
            `shouldBeOption` ("{\"chart\":{\"toolbar\":{\"tools\":{\"zoomin\":true,\"zoom\":true,\"download\":true," 
              <> "\"selection\":true,\"zoomout\":true,\"pan\":true,\"reset\":true}}}}")
      it "type" $ (chart := (type' := Line)) `shouldBeOption` "{\"chart\":{\"type\":\"line\"}}"
      it "width" $ (chart := (width := "100%")) `shouldBeOption` "{\"chart\":{\"width\":\"100%\"}}"
      describe "zoom" do
        it "enabled" $ (chart := (zooming := (enabled := true))) `shouldBeOption` "{\"chart\":{\"zoom\":{\"enabled\":true}}}"
        it "type" $ (chart := (zooming := (type' := X))) `shouldBeOption` "{\"chart\":{\"zoom\":{\"type\":\"x\"}}}"
        it "autoScaleYaxis" $ (chart := (zooming := (autoScaleYaxis := true))) `shouldBeOption` "{\"chart\":{\"zoom\":{\"autoScaleYaxis\":true}}}"
        let 
          fi :: Options Fill
          fi = (color := "#fff" <> opacity := 0.4)
        it "fill" $ (chart := (zooming := (fill := fi))) 
          `shouldBeOption` "{\"chart\":{\"zoom\":{\"fill\":{\"color\":\"#fff\",\"opacity\":0.4}}}}"
        it "stroke" $ (chart := (zooming := (zoomStroke := (color := "#fff" <> opacity := 0.4 <> width := 1.0)))) 
          `shouldBeOption` "{\"chart\":{\"zoom\":{\"stroke\":{\"color\":\"#fff\",\"opacity\":0.4,\"width\":1}}}}"
    let 
      opts :: Options Apexoptions
      opts = colors := ["#fff", "#aaa"]
    it "colors" $ opts `shouldBeOption` "{\"colors\":[\"#fff\",\"#aaa\"]}"
    it "labels" $ (labels := ["Beer", "Bar"]) `shouldBeOption` "{\"labels\":[\"Beer\",\"Bar\"]}"
    
    describe "series" do
      it "name" $ (series := [name := "Series 1"]) `shouldBeOption` "{\"series\":[{\"name\":\"Series 1\"}]}"
      describe "data" do
        it "single values" $ (series := [data' := [23.0, 42.0]]) `shouldBeOption` "{\"series\":[{\"data\":[23,42]}]}"
        it "paired values" $ (series := [data' := [[22.0,23.0], [11.0, 42.0]]]) `shouldBeOption` "{\"series\":[{\"data\":[[22,23],[11,42]]}]}"
        it "paired values xy" $ (series := [data' := [(x := 22.0 <> y := 23.0), (x := 11.0 <> y := 42.0)]]) 
          `shouldBeOption` "{\"series\":[{\"data\":[{\"x\":22,\"y\":23},{\"x\":11,\"y\":42}]}]}"
    
    describe "xaxis" do
      let 
        getAxis :: Options Axis -> Options Apexoptions
        getAxis a = (xaxis := a)
      it "type" $ (getAxis (type' := Category)) `shouldBeOption` "{\"xaxis\":{\"type\":\"category\"}}"
      it "categories" $ (getAxis (categories := ["Apples", "Bananas"])) `shouldBeOption` "{\"xaxis\":{\"categories\":[\"Apples\",\"Bananas\"]}}"
    
    describe "dataLabels" do
      it "enabled" $ (dataLabels := (enabled := true)) `shouldBeOption` "{\"dataLabels\":{\"enabled\":true}}"
      it "enabledOnSeries" $ (dataLabels := (enabledOnSeries := [1.0, 3.0])) `shouldBeOption` "{\"dataLabels\":{\"enabledOnSeries\":[1,3]}}"
      it "textAnchor" $ (dataLabels := (textAnchor := Middle)) `shouldBeOption` "{\"dataLabels\":{\"textAnchor\":\"middle\"}}"
      it "distributed" $ (dataLabels := (distributed := true)) `shouldBeOption` "{\"dataLabels\":{\"distributed\":true}}" 
      it "offsetX" $ (dataLabels := (offsetX := 1.0)) `shouldBeOption` "{\"dataLabels\":{\"offsetX\":1}}"
      it "offsetY" $ (dataLabels := (offsetY := 3.0)) `shouldBeOption` "{\"dataLabels\":{\"offsetY\":3}}"
      it "style" $ (dataLabels := (style := (fontSize := "14px" <> fontFamily := "Helvetica, Arial" 
        <> fontWeight := Bold <> colors := ["#aaa", "#bbb"]))) 
          `shouldBeOption` ("{\"dataLabels\":{\"style\":{\"fontSize\":\"14px\",\"fontFamily\":\"Helvetica, Arial\","
            <> "\"fontWeight\":{},\"colors\":[\"#aaa\",\"#bbb\"]}}}")
      it "background" $ (dataLabels := (background := (enabled := true <> foreColor := "#fff" <> padding := 4 <>
          borderRadius := 2 <> borderWidth := 1 <> borderColor := "#fff" <> opacity := 0.9 <> dropShadow := (
          enabled := false <> top := 1 <> left := 1 <> blur := 1 <> color := "#000" <> opacity := 0.45))))
          `shouldBeOption` ("{\"dataLabels\":{\"background\":{\"enabled\":true,\"foreColor\":\"#fff\",\"padding\":4,"
            <> "\"borderRadius\":2,\"borderWidth\":1,\"borderColor\":\"#fff\",\"opacity\":0.9,\"dropShadow\":{"
            <> "\"enabled\":false,\"top\":1,\"left\":1,\"blur\":1,\"color\":\"#000\",\"opacity\":0.45}}}}")
      it "dropShadow" $ (dataLabels := (dropShadow := (enabled := false <> top := 1 <> left := 1 
        <> blur := 1 <> color := "#000" <> opacity := 0.45))) `shouldBeOption` 
            "{\"dataLabels\":{\"dropShadow\":{\"enabled\":false,\"top\":1,\"left\":1,\"blur\":1,\"color\":\"#000\",\"opacity\":0.45}}}"

    describe "fill" do
      let
        withFill :: Options F.GeneralFill -> Options Apexoptions
        withFill f = (fill := f)
      it "colors" $ (withFill $ colors := ["#aaa", "#bbb"]) `shouldBeOption` "{\"fill\":{\"colors\":[\"#aaa\",\"#bbb\"]}}"
      it "opacity" $ (withFill $ F.opacity := 0.9) `shouldBeOption` "{\"fill\":{\"opacity\":0.9}}"
      it "type" $ (withFill $ type' := Solid) `shouldBeOption`  "{\"fill\":{\"type\":\"solid\"}}"
      it "gradient" $ (withFill $ F.gradient := (shade := Dark <> type' := GradientHorizontal <> shadeIntensity := 0.5
        <> gradientToColors := ["#aaa", "#bbb"] <> inverseColors := true <> opacityFrom := 1.0 <> opacityTo := 2.0
        <> stops := [0, 50, 100])) `shouldBeOption`  ("{\"fill\":{\"gradient\":{\"shade\":\"dark\",\"type\":\"horizontal\","
        <> "\"shadeIntensity\":0.5,\"gradientToColors\":[\"#aaa\",\"#bbb\"],\"inverseColors\":true,"
        <> "\"opacityFrom\":1,\"opacityTo\":2,\"stops\":[0,50,100]}}}")
      it "image" $ (withFill $ F.image := (src := ["img.png"] <> width := 10 <> height := 12)) 
        `shouldBeOption` "{\"fill\":{\"image\":{\"src\":[\"img.png\"],\"width\":10,\"height\":12}}}"
      it "pattern" $ (withFill $ F.pattern := (style := VerticalLines <> width := 10 <> height := 12 <> strokeWidth := 2)) 
        `shouldBeOption` "{\"fill\":{\"pattern\":{\"style\":\"verticalLines\",\"width\":10,\"height\":12,\"strokeWidth\":2}}}"

    describe "grid" do
      it "basics" $ (grid := (show := true <> borderColor := "#90A4AE" <> strokeDashArray := 3.0 <> position := Front)) 
        `shouldBeOption` "{\"grid\":{\"show\":true,\"borderColor\":\"#90A4AE\",\"strokeDashArray\":3,\"position\":\"front\"}}"
      it "xaxis" $ (grid := (position := Front <> xaxis := (lines := (show := false)))) 
        `shouldBeOption` "{\"grid\":{\"position\":\"front\",\"xaxis\":{\"position\":{\"show\":false}}}}"
      it "yaxis" $ (grid := (position := Front <> yaxis := (lines := (show := false)))) 
        `shouldBeOption` "{\"grid\":{\"position\":\"front\",\"yaxis\":{\"position\":{\"show\":false}}}}"
      it "row" $ (grid := (row := (colors := ["#aaa"] <> opacity := 0.5))) 
        `shouldBeOption` "{\"grid\":{\"row\":{\"colors\":[\"#aaa\"],\"opacity\":0.5}}}"
      it "column" $ (grid := (column := (colors := ["#aaa"] <> opacity := 0.5))) 
        `shouldBeOption` "{\"grid\":{\"column\":{\"colors\":[\"#aaa\"],\"opacity\":0.5}}}"
      it "padding" $ (grid := (padding := (top := 0 <> right := 0 <> bottom := 0 <> left := 0)))
        `shouldBeOption` "{\"grid\":{\"padding\":{\"top\":0,\"right\":0,\"bottom\":0,\"left\":0}}}"

    describe "stroke" do
      it "show" $ (stroke := (show := true)) `shouldBeOption` "{\"stroke\":{\"show\":true}}"
      it "curve"  $ (stroke := (curve := Smooth)) `shouldBeOption` "{\"stroke\":{\"curve\":\"smooth\"}}"
      it "lineCap" $ (stroke := (lineCap := Butt)) `shouldBeOption` "{\"stroke\":{\"lineCap\":\"butt\"}}"
      it "colors" $ (stroke := (colors := ["#fff", "#aaa"])) `shouldBeOption` "{\"stroke\":{\"colors\":[\"#fff\",\"#aaa\"]}}"
      it "width"  $ (stroke := (width := 2.0)) `shouldBeOption` "{\"stroke\":{\"width\":2}}"
      it "dashArray"   $ (stroke := (dashArray := 3.0)) `shouldBeOption` "{\"stroke\":{\"dashArray\":3}}"

    describe "title" do
      it "text" $ (title := (text := "Der Text")) `shouldBeOption` "{\"title\":{\"text\":\"Der Text\"}}"
      it "align" $ (title := (align := Left)) `shouldBeOption` "{\"title\":{\"align\":\"left\"}}"


shouldBeOption :: forall a. Options a -> String -> Aff Unit
shouldBeOption opti expected = (stringify $ Opt.options opti) `shouldEqual` expected

foreign import stringify :: Foreign -> String


