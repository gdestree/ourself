$(document).ready(function (){
    var wMaior = 400;
    var wMenor = 200;

    userName = $('#chart-radar').attr('user-name')

    var colorscale = d3.scale.category10();
    var legendOptions = [userName, 'Community'];

    var size = 2;

    toneData = $('#chart-radar').attr('user-data')
    toneData = JSON.parse(toneData);

    globalData = $('#chart-radar').attr('global-data')
    globalData = globalData.substring(0, globalData.length - 1);
    globalData = JSON.parse(globalData);

    if (size > 0) {
        var json = [
            [
                {"axis":"Anger","value":toneData["anger"]},
                {"axis":"Fear","value":toneData["fear"]},
                {"axis":"Disgust","value":toneData["disgust"]},
                {"axis":"Sadness","value":toneData["sadness"]},
                {"axis":"Joy","value":toneData["joy"]},
                {"axis":"Analytical","value":toneData["analytical"]},
                {"axis":"Confidence","value":toneData["confidence"]},
                {"axis":"Tentative","value":toneData["tentative"]},
                {"axis":"Openness","value":toneData["openess"]},
                {"axis":"Conscientiousness","value":toneData["conscientiousness"]},
                {"axis":"Extraversion","value":toneData["extraversion"]},
                {"axis":"Agreeableness","value":toneData["agreableness"]},
                {"axis":"Emotional Range","value":toneData["emotional_range"]}
            ],[
                {"axis":"Anger","value":globalData["avg_anger"]},
                {"axis":"Fear","value":globalData["avg_fear"]},
                {"axis":"Disgust","value":globalData["avg_disgust"]},
                {"axis":"Sadness","value":globalData["avg_sadness"]},
                {"axis":"Joy","value":globalData["avg_joy"]},
                {"axis":"Analytical","value":globalData["avg_analytical"]},
                {"axis":"Confidence","value":globalData["avg_confidence"]},
                {"axis":"Tentative","value":globalData["avg_tentative"]},
                {"axis":"Openness","value":globalData["avg_openess"]},
                {"axis":"Conscientiousness","value":globalData["avg_conscientiousness"]},
                {"axis":"Extraversion","value":globalData["avg_extraversion"]},
                {"axis":"Agreeableness","value":globalData["avg_agreableness"]},
                {"axis":"Emotional Range","value":globalData["avg_emotional_range"]}
            ]
        ];
    }

    function drawRadarCharts() {
        drawRadarChart('#chart-radar', wMaior, wMaior);
    };

    function drawRadarChart(divId, w, h) {
        var textSizeLevels = "10px !important";
        var textSizeTooltip = "13px !important";
        var textSizeLegend = "11px !important";
        var circleSize = 5;
        var strokeWidthPolygon = "2px";

        var RadarChart = {
            draw: function(id, data, options) {
                var cfg = {
                    w: w,
                    h: h,
                    factor: 1,
                    factorLegend: 0.85,
                    levels: 3,
                    maxValue: 1.0,
                    radians: 2 * Math.PI,
                    opacityArea: 0.7,
                    ToRight: 2,
                    TranslateX: 60,
                    TranslateY: 30,
                    ExtraWidthX: 10,
                    ExtraWidthY: 100,
                    color: d3.scale.category10()
                };

                if ('undefined' !== typeof options) {
                    for (var i in options) {
                        if ('undefined' !== typeof options[i]) {
                            cfg[i] = options[i];
                        }
                    }
                }

                cfg.maxValue = Math.max(cfg.maxValue, d3.max(data, function(i){return d3.max(i.map(function(o){return o.value;}));}));
                var allAxis = (data[0].map(function(i, j){return i.axis;}));
                var total = allAxis.length;
                var radius = cfg.factor*Math.min(cfg.w/2, cfg.h/2);
                d3.select(id)
                    .select("svg").remove();

                var g = d3.select(id)
                    .append("svg")
                    .attr("width", cfg.w+cfg.ExtraWidthX)
                    .attr("height", cfg.h+cfg.ExtraWidthY)
                    .attr("class", "graph-svg-component")
                    .append("g")
                    .attr("transform", "translate(" + cfg.TranslateX + "," + cfg.TranslateY + ")");

                var tooltip;

                // Circular segments
                for (var j=0; j<cfg.levels-1; j++) {
                    var levelFactor = cfg.factor*radius*((j+1)/cfg.levels);
                    g.selectAll(".levels")
                    .data(allAxis)
                    .enter()
                    .append("svg:line")
                    .attr("x1", function(d, i){return levelFactor*(1-cfg.factor*Math.sin(i*cfg.radians/total));})
                    .attr("y1", function(d, i){return levelFactor*(1-cfg.factor*Math.cos(i*cfg.radians/total));})
                    .attr("x2", function(d, i){return levelFactor*(1-cfg.factor*Math.sin((i+1)*cfg.radians/total));})
                    .attr("y2", function(d, i){return levelFactor*(1-cfg.factor*Math.cos((i+1)*cfg.radians/total));})
                    .attr("class", "line")

                    .style("stroke", "grey")
                    .style("stroke-opacity", "0.75")
                    .style("stroke-width", "0.3px")
                    .attr("transform", "translate(" + (cfg.w/2-levelFactor) + ", " + (cfg.h/2-levelFactor) + ")");
                }

                // Text indicating at what % each level is
                for (var j=0; j<cfg.levels; j++) {
                    var levelFactor = cfg.factor*radius*((j+1)/cfg.levels);
                    g.selectAll(".levels")
                    .data([1]) //dummy data
                    .enter()
                    .append("svg:text")
                    .attr("x", function(d){return levelFactor*(1-cfg.factor*Math.sin(0));})
                    .attr("y", function(d){return levelFactor*(1-cfg.factor*Math.cos(0));})
                    .attr("class", "legend")
                    .style("font-family", "sans-serif")
                    .style("font-size", textSizeLevels)
                    .attr("transform", "translate(" + (cfg.w/2-levelFactor + cfg.ToRight) + ", " + (cfg.h/2-levelFactor) + ")")
                    .attr("fill", "#737373")
                    .text((j+1)*cfg.maxValue/cfg.levels);
                }

                series = 0;

                var axis = g.selectAll(".axis")
                .data(allAxis)
                .enter()
                .append("g")
                .attr("class", axis);

                axis.append("line")
                .attr("x1", cfg.w/2)
                .attr("y1", cfg.h/2)
                .attr("x2", function(d, i){return cfg.w/2*(1-cfg.factor*Math.sin(i*cfg.radians/total));})
                .attr("y2", function(d, i){return cfg.h/2*(1-cfg.factor*Math.cos(i*cfg.radians/total));})
                .attr("class", "line")
                .style("stroke", "grey")
                .style("stroke-width", "1px");

                axis.append("text")
                .attr("class", "legend")
                .text(function(d){return d;})
                .style("font-family", "sans-serif")
                .style("font-size", textSizeLegend)
                .attr("text-anchor", "middle")
                .attr("dy", "1.5em")
                .attr("transform", function(d, i){return "translate(0, -10)";})
                .attr("x", function(d, i){return cfg.w/2*(1-cfg.factorLegend*Math.sin(i*cfg.radians/total))-60*Math.sin(i*cfg.radians/total);})
                .attr("y", function(d, i){return cfg.h/2*(1-Math.cos(i*cfg.radians/total))-20*Math.cos(i*cfg.radians/total);});

                data.forEach(function(y, x) {
                    dataValues = [];
                    g.selectAll(".nodes")
                    .data(y, function(j, i) {
                        dataValues.push([
                            cfg.w/2*(1-(parseFloat(Math.max(j.value, 0))/cfg.maxValue)*cfg.factor*Math.sin(i*cfg.radians/total)),
                            cfg.h/2*(1-(parseFloat(Math.max(j.value, 0))/cfg.maxValue)*cfg.factor*Math.cos(i*cfg.radians/total))
                        ]);
                    });
                    dataValues.push(dataValues[0]);
                    g.selectAll(".area")
                    .data([dataValues])
                    .enter()
                    .append("polygon")
                    .attr("class", "radar-chart-series_"+series)
                    .style("stroke-width", strokeWidthPolygon)
                    .style("stroke", cfg.color(series))
                    .attr("points",function(d) {
                        var str="";
                        for (var pti=0;pti<d.length;pti++) {
                            str=str+d[pti][0]+","+d[pti][1]+" ";
                        }
                        return str;
                    })
                    .style("fill", function(j, i) {
                        return cfg.color(series);
                    })
                    .style("fill-opacity", cfg.opacityArea)
                    .on('mouseover', function (d) {
                        z = "polygon."+d3.select(this).attr("class");
                        g.selectAll("polygon")
                        .transition(200)
                        .style("fill-opacity", 0.1);
                        g.selectAll(z)
                        .transition(200)
                        .style("fill-opacity", 0.9);
                    })
                    .on('mouseout', function() {
                        g.selectAll("polygon")
                        .transition(200)
                        .style("fill-opacity", cfg.opacityArea);
                    });

                    series++;
                });

                series=0;

                data.forEach(function(y, x) {
                    g.selectAll(".nodes")
                    .data(y).enter()
                    .append("svg:circle")
                    .attr("class", "radar-chart-series_"+series)
                    .attr('r', cfg.radius)
                    .attr("alt", function(j){return Math.max(j.value, 0);})
                    .attr("cx", function(j, i){
                        dataValues.push([
                            cfg.w/2*(1-(parseFloat(Math.max(j.value, 0))/cfg.maxValue)*cfg.factor*Math.sin(i*cfg.radians/total)),
                            cfg.h/2*(1-(parseFloat(Math.max(j.value, 0))/cfg.maxValue)*cfg.factor*Math.cos(i*cfg.radians/total))
                        ]);
                        return cfg.w/2*(1-(Math.max(j.value, 0)/cfg.maxValue)*cfg.factor*Math.sin(i*cfg.radians/total));
                    })
                    .attr("cy", function(j, i){
                        return cfg.h/2*(1-(Math.max(j.value, 0)/cfg.maxValue)*cfg.factor*Math.cos(i*cfg.radians/total));
                    })
                    .attr("data-id", function(j){
                        return j.axis;
                    })
                    .style("fill", cfg.color(series)).style("fill-opacity", .9)
                    .on('mouseover', function (d){
                        newX =  parseFloat(d3.select(this).attr('cx')) - 10;
                        newY =  parseFloat(d3.select(this).attr('cy')) - 5;

                        tooltip.attr('x', newX)
                        .attr('y', newY)
                        .text(d.value)
                        .transition(200)
                        .style('opacity', 1);

                        z = "polygon." + d3.select(this).attr("class");
                        g.selectAll("polygon")
                        .transition(200)
                        .style("fill-opacity", 0.1);
                        g.selectAll(z)
                        .transition(200)
                        .style("fill-opacity", 0.7);
                    })
                    .on('mouseout', function(){
                        tooltip.transition(200)
                        .style('opacity', 0);
                        g.selectAll("polygon")
                        .transition(200)
                        .style("fill-opacity", cfg.opacityArea);
                    })
                    .append("svg:title")
                    .text(function(j){
                        return Math.max(j.value, 0);
                    });

                    series++;
                });

                //Tooltip
                tooltip = g.append('text')
                .style('opacity', 0)
                .style('font-family', 'sans-serif')
                .style('font-size', textSizeTooltip);
            }
        };

        // Options for the Radar chart, other than default
        var myOptions = {
            w: w,
            h: h,
            ExtraWidthX: 180,
            labelScale: 0.7,
            levels: 0,
            levelScale: 0.85,
            facetPaddingScale: 1.9,
            maxValue: 1.0,
            showAxes: true,
            showAxesLabels: true,
            showLegend: true,
            showLevels: true,
            showLevelsLabels: false,
            showPolygons: true,
        };

        RadarChart.draw(divId, json, myOptions);

        ////////////////////////////////////////////
        /////////// Initiate legend ////////////////
        ////////////////////////////////////////////

        var svg = d3.select('#chart-radar')
        .selectAll('svg')
        .append('svg')
        .attr("width", w+300)
        .attr("height", h)
        .style("font-size", textSizeLegend);

        // Initiate Legend
        var legend = svg.append("g")
        .attr("class", "legend")
        .attr("height", 100)
        .attr("width", 200)
        .attr('transform', 'translate(90,20)');

        // Create colour squares
        legend.selectAll('rect')
        .data(legendOptions)
        .enter()
        .append("rect")
        .attr("x", w - 8)
        .attr("y", function(d, i) {
            return i * 20;
        })
        .attr("width", 10)
        .attr("height", 10)
        .style("fill", function(d, i) {
            return colorscale(i);
        });

        // Create text next to squares
        legend.selectAll('text')
        .data(legendOptions)
        .enter()
        .append("text")
        .attr("x", w + 3)
        .attr("y", function(d, i) {
            return i * 20 + 9;
        })
        .attr("font-size", textSizeLegend)
        .attr("fill", "#737373")
        .text(function(d) {
            return d;
        });
    };

    drawRadarCharts();

})
