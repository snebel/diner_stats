
var rows, svg, time1 = '', time2 = '';
//rows = [
//  {letter: 'letter', frequency: 'frequency'},
//  {letter: 'B', frequency: 0.085},
//  {letter: 'A', frequency: 0.185},
//  ...
// ]

var margin = {top: 40, right: 20, bottom: 50, left: 80},
    width = 960 - margin.left - margin.right,
    height = 500 - margin.top - margin.bottom;

var formatPercent = d3.format(".0%");

var x = d3.scale.ordinal()
    .rangeRoundBands([0, width], .1, 1);

var y = d3.scale.linear()
    .range([height, 0]);

var xAxis = d3.svg.axis()
    .scale(x)
    .orient("bottom");

var yAxis = d3.svg.axis()
    .scale(y)
    .orient("left")
    .tickFormat(formatPercent);

function render(data){
  d3.select('svg').remove();
  svg = d3.select("body").append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
    .append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

  data.forEach(function(d){
    d.frequency = +d.frequency;
  });

  x.domain(data.map(function(d) { return d.letter; }));
  y.domain([0, d3.max(data, function(d) { return d.frequency; })]);

  svg.append("g")
    .attr("class", "x axis")
    .attr("transform", "translate(0," + height + ")")
    .call(xAxis);

  svg.append("g")
    .attr("class", "y axis")
    .call(yAxis)
    .append("text")
      .attr("transform", "rotate(-90)")
      .attr("y", 6)
      .attr("dy", ".71em")
      .style("text-anchor", "end")
      .text("% of Revenue");

  svg.selectAll(".bar")
    .data(data)
    .enter().append("rect")
      .attr("class", "bar")
      .attr("x", function(d) { return x(d.letter); })
      .attr("width", x.rangeBand())
      .attr("y", function(d) { return y(d.frequency); })
      .attr("height", function(d) { return height - y(d.frequency); });
}

function sort(data) {
  var x0 = x.domain(data.sort($('#box').prop('checked')
      ? function(a, b) { return b.frequency - a.frequency; }
      : function(a, b) { return d3.ascending(a.letter, b.letter); }
      )
      .map(function(d) { return d.letter; }))
      .copy();
  var transition = svg.transition().duration(1200),
    delay = function(d, i) { return i * 50; };

  transition.selectAll(".bar")
    .delay(delay)
    .attr("x", function(d) { return x0(d.letter); });

  transition.select(".x.axis")
    .call(xAxis)
    .selectAll("g")
    .delay(delay);
}

function fetch(url){
  $.ajax({
    method: 'get',
    url: url,
    dataType: 'json',
    success: function(data){
      rows = data;
      render(data);
    }
  });
}

$('#box').on('change', function(){
  sort(rows)
});

$('#radio-form').on('change', function(e){
  $('#box').removeAttr('checked');
  if (e.target.id === 'items'){
    fetch(document.URL);
  }
  else if (e.target.id === 'menu'){
    fetch('/menus/'+$('#menu').attr('data')+'/sections?time1='+time1+'&time2='+time2);
  }
  else if (e.target.id === 'tables'){
    fetch('/restaurants/'+$('#items').attr('data')+'/tables?time1='+time1+'&time2='+time2);
  }
});

$(function() {
  fetch(document.URL)
  time1 = $('#graph-header').attr('time1');
  time2 = $('#graph-header').attr('time2');
});


