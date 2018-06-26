google.load("visualization", "1", { packages: ["corechart"] });
//google.setOnLoadCallback(drawfoochart_js);


function drawfoochart_js() {
    var datajs = google.visualization.arrayToDataTable([
    ['X', 'Y'],
    [4, 5],[10,10],
    [12,6]
    ]);

    var options = {
        title: 'foochart.js',
        hAxis: { title: 'X', minValue: 0, maxValue: 20 },
        vAxis: { title: 'Y', minValue: 0, maxValue: 20 },
        legend: 'none',
        width: 300,
        heigth: 300
    };

    //var chart = new google.visualization.ScatterChart
    //    (document.getElementById("<%= chartDiv_js.ClientID %>"));

    var chart = new google.visualization.ScatterChart
    (document.getElementById("chartDiv_js"));


    chart.draw(datajs, options);
}