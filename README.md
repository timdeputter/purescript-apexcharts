# purescript-apexcharts [![GitHub](https://img.shields.io/github/license/timdeputter/purescript-apexcharts)](https://github.com/timdeputter/purescript-apexcharts/blob/master/LICENSE) [<img src="https://pursuit.purescript.org/packages/purescript-apexcharts/badge" alt="purescript-apexcharts on Pursuit"> </img>](https://pursuit.purescript.org/packages/purescript-apexcharts)

Purescript bindings for apexcharts.js - "A modern JavaScript charting library to build interactive charts and visualizations with simple API" (https://apexcharts.com)


## State

Basically all options should work. 
Only some options that take functions (events, formatters) are missing. PRS welcome!
</br></br>

## Download and Installation

Install apexcharts first (https://apexcharts.com/docs/installation/).

```bash
npm install apexcharts --save
bower install --save purescript-apexcharts
```
</br>

## Basic example

The basic example from the apexcharts.js readme:

```javascript
var options = {
  chart: {
    type: 'bar'
  },
  series: [
    {
      name: 'sales',
      data: [30, 40, 35, 50, 49, 60, 70, 91, 125]
    }
  ],
  xaxis: {
    categories: [1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999]
  }
}

var chart = new ApexCharts(document.querySelector('#chart'), options)
chart.render()
```

The equivalent in purescript:

```purescript
let chart = (
        chart := (type' := Bar) 
        <> series := [
          name := "sales"
          <> data' := [30,40,35,50,49,60,70,91,125]
        ]
        <> xaxis := (
          categories := [1991,1992,1993,1994,1995,1996,1997,1998,1999]
        )
    )
in render $ createChart "#chart" chart
```
</br>

More examples [here](https://github.com/timdeputter/purescript-apexcharts/tree/master/examples).

## Documentation

Module documentation is [published on Pursuit](http://pursuit.purescript.org/packages/purescript-apexcharts).



## License

Check [LICENSE](LICENSE) file for more information.
