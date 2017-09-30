// Dimensions of plot

var margin = {top: 10, right: 30, bottom: 30, left: 40},
    width_padding = margin.left - margin.right,
    height_padding = margin.top - margin.bottom,
    width = 1300 - width_padding,
    height = 500 - height_padding;

// number subplots

var subplots = ["Tipo de Bien", "Modo de Adquisición", "Rango de valor"];

// position subplots

var trans_tipoBien = "translate(" + width/6 + "," + (height/2.35) + ")";
var trans_modoAdq = "translate(" + width/2.05 + "," + (height/2.35) + ")";
var trans_rangoVal = "translate(" + (width-width/5) + "," + (height/2.35) + ")";


// create svg and append it to the body of the document
// group svg

var svg = d3.select("#arcs")
        .append("svg:svg")
        .attr("width", width + width_padding)
        .attr("height", height + height_padding)
        .append("g")
        .attr('class', 'arcPlot')
        .attr('class', 'canvas')
        .attr("transform", "translate( 40, 0)");

svg.select('svg');

// get data

d3.csv('inmuebles.csv', function(error, data){
      if (error) {throw error;}
      else{

      // group data by tipoBien, formaAdqusicion and valor

      var by_asset = d3.nest()
      .key(function(d){return d.tipoBien;})
      .rollup(function(leaves){return leaves.length;})
      .entries(data);

      var by_aqui = d3.nest()
      .key(function(d){return d.formaAdquisicion;})
      .rollup(function(leaves){return leaves.length;})
      .entries(data);

      var by_value = d3.nest()
      .key(function(d){return d.valor;})
      .rollup(function(leaves){return leaves.length;})
      .entries(data);

      // create new object to calculate start and end angle

      // calculate porcentaje by_asset
      var valores_asset = by_asset.map(function(d){
            return d.value;
      });

      var total_asset = d3.sum(valores_asset);

      var porcentaje_asset = by_asset.map(function(d){
            var objeto = {key:d.key, value:d.value*100/total_asset};
            return objeto;
      });

      // calculate porcentaje by_aqui

      var valores_aqui = by_aqui.map(function(d){
            return d.value;
      });

      var total_aqui = d3.sum(valores_aqui);

      var porcentaje_aqui = by_aqui.map(function(d){
            var objeto = {key:d.key, value:d.value*100/total_aqui};
            return objeto;
      });

      // calculate porcentaje by_value

      var valores_value = by_value.map(function(d){
            return d.value;
      });

      var total_value = d3.sum(valores_value);

      var porcentaje_value = by_value.map(function(d){
            var objeto = {key:d.key, value:d.value*100/total_value};
            return objeto;
      });

      // paths
      function paths(percentages){
            return percentages.map(function(d){
			var degrees = (d.value/100) * 360.0;
			var radians = degrees * (Math.PI / 180);
			var data = {key: d.key, value: d.value, startAngle: 0, endAngle: radians};
			return data;
			});
      };

      //by asset

      var arcAsset = paths(porcentaje_asset);

      var sortedAsset = arcAsset.sort(function(x, y){
            return d3.descending(x.value, y.value);
      });

      //by aqui

      var arcAqui = paths(porcentaje_aqui);

      var sortedAqui = arcAqui.sort(function(x, y){
            return d3.descending(x.value, y.value);
      });

      //by value

      var arcValue = paths(porcentaje_value);

      var sortedValue = arcValue.sort(function(x, y){
            return d3.descending(x.value, y.value);
      });


      // draw arc

      //set arch characteristics

      var arcMax = 100;
      var arcPad = 4;
      var arcWidth = 11;

      // set arcs

      var arc = d3.arc()
	.innerRadius(function(d, i){
            return arcMax - (i)*(arcWidth);})
	.outerRadius(function(d, i){
		return arcMax - (i+1)*(arcWidth)+arcPad;})
	.startAngle(function(d){
            return d.startAngle;})
	.endAngle(function(d){
            return d.endAngle;});

      // draw

      //color palettes for plots

      var colAsset = ['#18709F', '#1E94D3', '#5AAADF', '#87C0EA', '#B1D5F1'];
      var colValue = ['#AE1F4E', '#E72A67', '#EC6282', '#F190A2', '#F6B9C2'];
      var colAqui = ['#4A8842', '#64B557', '#84C179', '#A4CF9A', '#C1DEBC'];

      //legend axis

      var labelAxis = [20, 30, 40, 50, 60, 70, 80, 90, 100, 10];


      //create axis

      var linesAsset = svg.append('g')
      .attr('class', 'axis-line')
      .attr('transform', trans_tipoBien)
      .selectAll('g')
      .data(d3.range(0, 360, 36))
      .enter().append('g')
      .attr('transform', function(d){return 'rotate('+ (d-18) + ')';});

      linesAsset.append('line')
      .style('stroke', 'black')
      .attr('x2', 110);


      linesAsset.append('text')
      .attr('x', 116)
      .attr('dy', '0.20em')
      .style('font-size', '10px')
      .style('font-family', 'monospace')
      .attr('transform', function(d){return 'rotate(' + ((-1*d)+18) + ',120, 0)';})
      .data(labelAxis)
      .text(function(d){return d + '%';})
      .style("text-anchor", function(d) { return d < 110 && d > 40 ? "middle" : null; });


      // create plot for asset
      var arcsAsset = svg.append('g')
      .attr('class', 'arc')
      .selectAll('path.asset-path')
	.data(sortedAsset)
	.enter()
	.append('path')
      .attr('fill', function(d,i){return colAsset[i]})
      .attr('transform', trans_tipoBien)
      .attr('d', arc)
      .on('mouseover', handleMouseOver)
      .on('mouseout', handleMouseOut);


      //create title

      var titleAsset = svg.append('g')
      .attr('class', 'titles')
      .attr('transform', 'translate('+ ((width/6)-80) +','+ height/8 + ')')
      .append('text')
      .text(subplots[0])
      .style('font-size', '25px')
      .style('font-family', 'monospace');


      //create legend
      d3.select('svg')
      .append('g')
      .attr('class', 'legendAsset')
      .attr('transform', 'translate(' + 70 + ',' + (height-130) + ')');

      var assetSorted = sortedAsset.map(function(d){return d.key.toUpperCase();});
      var upperAsset = assetSorted.map(function(d){if (d==='DEPARTAMENTO'){
            return 'DEPTO.';
      } else{
            return d;
      }});
      //console.log(upperAsset);
      var scaleAsset = d3.scaleOrdinal()
      .domain(upperAsset)
      .range(colAsset);

      var legendAsset = d3.legendColor()
      .orient('horizontal')
      .scale(scaleAsset)
      .shapeHeight(10)
      .shapeWidth(10)
      .shapePadding(68);

      d3.select('.legendAsset')
      .call(legendAsset);

      // Create Aquisition plot

       //create axis

      var linesAqui = svg.append('g')
      .attr('class', 'axis-line')
      .attr('transform', trans_modoAdq)
      .selectAll('g')
      .data(d3.range(0, 360, 36))
      .enter().append('g')
      .attr('transform', function(d){return 'rotate('+ (d-18) + ')';});

      linesAqui.append('line')
      .style('stroke', 'black')
      .attr('x2', 110);

      linesAqui.append('text')
      .attr('x', 116)
      .attr('dy', '0.20em')
      .style('font-size', '11px')
      .style('font-family', 'monospace')
      .attr('transform', function(d){return 'rotate(' + ((-1*d)+18) + ',120, 0)';})
      .data(labelAxis)
      .text(function(d){return d + '%';})
      .style("text-anchor", function(d) { return d < 110 && d > 40 ? "middle" : null; });

      //create arcs for aquisition

      var arcsAqui = svg.append('g')
      .attr('class', 'arc')
      .selectAll('path.aqui-path')
      .data(sortedAqui)
      .enter()
      .append('path')
      .attr('fill', function(d,i){return colAqui[i]})
      .attr('transform', trans_modoAdq)
      .attr('d', arc)
      .on('mouseover', handleMouseOver)
      .on('mouseout', handleMouseOut);

      //create title

       var titleAqui = svg.append('g')
      .attr('class', 'titles')
      .attr('transform', 'translate('+ ((width/2)-150) +','+ height/8 + ')')
      .append('text')
      .text(subplots[1])
      .style('font-size', '25px')
      .style('font-family', 'monospace');

      //create legend
      d3.select('svg')
      .append('g')
      .attr('class', 'legendAqui')
      .attr('transform', 'translate(' + (width/4)*1.6 + ',' + (height-130) + ')');

      var aquiSorted = sortedAqui.map(function(d){return d.key.toUpperCase();});
      var scaleAqui = d3.scaleOrdinal()
      .domain(aquiSorted)
      .range(colAqui);

      var legendAqui = d3.legendColor()
      .orient('horizontal')
      .scale(scaleAqui)
      .shapeHeight(10)
      .shapeWidth(10)
      .labelWrap(30)
      //.title('Tipo de bien')
      .shapePadding(79);

      d3.select('.legendAqui')
      .call(legendAqui);

       //create axis

      var linesValue = svg.append('g')
      .attr('class', 'axis-line')
      .attr('transform', trans_rangoVal)
      .selectAll('g')
      .data(d3.range(0, 360, 36))
      .enter().append('g')
      .attr('transform', function(d){return 'rotate('+ (d-18) + ')';});

      linesValue.append('line')
      .style('stroke', 'black')
      .attr('x2', 110);

      linesValue.append('text')
      .attr('x', 116)
      .attr('dy', '0.20em')
      .style('font-size', '11px')
      .style('font-family', 'monospace')
      .attr('transform', function(d){return 'rotate(' + ((-1*d)+18) + ',120, 0)';})
      .data(labelAxis)
      .text(function(d){return d + '%';})
      .style("text-anchor", function(d) { return d < 110 && d > 40 ? "middle" : null; });

      //create arcs

      var arcsValue = svg.append('g')
      .attr('class', 'arc')
      .selectAll('path.value-path')
      .data(sortedValue)
      .enter()
      .append('path')
      .attr('fill', function(d,i){return colValue[i]})
      .attr('transform', trans_rangoVal)
      .attr('d', arc)
      .on('mouseover', handleMouseOver)
      .on('mouseout', handleMouseOut);


      //create title

       var titleValue = svg.append('g')
      .attr('class', 'titles')
      .attr('transform', 'translate('+ 4.3*width/6 +','+ height/8 + ')')
      .append('text')
      .text(subplots[2])
      .style('font-size', '25px')
      .style('font-family', 'monospace');

      //create legend
      d3.select('svg')
      .append('g')
      .attr('class', 'legendValue')
      .attr('transform', 'translate(' + (width/8)*5.7 + ',' + (height-130) + ')');

      var valueSorted = sortedValue.map(function(d){return d.key})
      var notNull = valueSorted.map(function(d){if (d==='NULL'){
            return 'NO DECLARADO';
      } else{
            return d;
      }});
      var scaleValue = d3.scaleOrdinal()
      .domain(notNull)
      .range(colValue);

      var legendValue = d3.legendColor()
      .orient('horizontal')
      .scale(scaleValue)
      .shapeHeight(10)
      .shapeWidth(10)
      .labelWrap(60)
      //.title('Tipo de bien')
      .shapePadding(70);

      d3.select('.legendValue')
      .call(legendValue);

      //mouse over and mouse out functions

      function handleMouseOver(d){
            var container = svg.append('g')
            .attr('id', 'info')
            .append('text')
            .attr('x', d3.event.pageX)
            .attr('y', d3.event.pageY)
            .text(parseFloat(d.value).toFixed(2)+ '%')
            .style('font-family', 'monospace')
            .style('font-size', '12px')
            .style('font-weight', 'bold')
            ;

      };

      function handleMouseOut(document){
            d3.select('#info').remove();
      };

      d3.selectAll('text')
      .style('font-family', 'monospace');

      }
})
