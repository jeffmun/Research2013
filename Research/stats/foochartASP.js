google.load("visualization", "1", { packages: ["corechart"] });
//google.setOnLoadCallback(drawfoochart_js);


function drawfoochart_jsASP() {
    var datajsASP = google.visualization.arrayToDataTable([
    ['X', 'Y'],
    [0, 0], [10, 10],
    [2, 3], [8, 6],
    [1, 9], [9, 1]
    ]);

    var options = {
        title: 'foochart.js',
        legend: 'none',
        width: 300,
        heigth: 300
    };

    var chart = new google.visualization.ScatterChart
    (document.getElementById("chartDiv_jsASP"));


    chart.draw(datajsASP, options);
}