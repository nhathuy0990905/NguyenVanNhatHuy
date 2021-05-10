<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="">
<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>Thống kê doanh thu</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- icon cho trang -->
	<link rel="shortcut icon" href="librarys/logo.png">
	<!-- Toàn bộ link css -->
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/magnific-popup.css">
	<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
	<link rel="stylesheet" href="assets/css/font-awesome.min.css">
	<link rel="stylesheet" href="assets/css/pe-icon-7-stroke.css">
	<link rel="stylesheet" href="lib/css/nivo-slider.css" type="text/css" />
	<link rel="stylesheet" href="lib/css/preview.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="assets/css/animate.css">
	<link rel="stylesheet" href="assets/css/meanmenu.min.css">
	<link rel="stylesheet" href="assets/css/bundle.css">
	<link rel="stylesheet" href="assets/css/style.css">
	<link rel="stylesheet" href="assets/css/responsive.css">
	<script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<body style="background: url('librarys/hinhnen.png');background-repeat: no-repeat;background-attachment: fixed;background-size: 100% 100%;">
	
	
	
    <!-- Biểu đồ tháng  -->
    <figure class="highcharts-figure">
        <div id="container"></div>
    </figure>

    <br>
    <!-- Biểu đồ năm  -->
    <figure class="highcharts-figure">
        <div id="container-2"></div>
    </figure>


    <!-- <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <script src="https://code.highcharts.com/modules/accessibility.js"></script> -->
    <script src="./librarys/highcharts.js"></script>
    <script src="./librarys/modules.exporting.js"></script>
    <script src="./librarys/modules.export-data.js"></script>
    <script src="./librarys/modules.accessibility.js"></script>

	<script>
    /* Biểu đồ tháng */
    Highcharts.chart('container', {
        chart: {
            type: 'column'
        },
        title: {
            text: 'Doanh Thu Tháng 5/2021 - Nhat Huy Bakery'
        },

        xAxis: {
            type: 'category',
            labels: {
                rotation: 0, // xoay chữ
                style: {
                    fontSize: '13px',
                    fontFamily: 'Verdana, sans-serif'
                }
            }
        },
        yAxis: {
            min: 0,
            max: 10,
            title: {
                text: 'Tổng tiền ( Triệu VND )'
            }
        },

        series: [{
            name: 'Doanh Thu Theo Ngày (5/2021)',
            data: [
                ['1', 2.4],
                ['2', 3.0],
                ['3', 2.5],
                ['4', 3.7],
                ['5', 2.7],
                ['6', 2.0],
                ['7', 3.1],
                ['8', 4.9],
                ['9', 3.2],
                ['10', 2.1],
                ['11', 2.5],
                ['12', 2.6],
                ['13', 2.7],
                ['14', 3.9],
                ['15', 3.5],
                ['16', 4.6],
                ['17', 6.0],
                ['18', 2.7],
                ['19', 3.6],
                ['20', 4.0],
                ['21', 0],
                ['22', 0],
                ['23', 0],
                ['24', 0],
                ['25', 0],
                ['26', 0],
                ['27', 0],
                ['28', 0],
                ['29', 0],
                ['30', 0],
                ['31', 0],
            ],
            dataLabels: {
                enabled: true,
                rotation: -90, // Xoay chữ
                color: '#FFFFFF',
                align: 'right',
                format: '{point.y:.1f}', 
                y: 5,
                style: {
                    fontSize: '13px',
                    fontFamily: 'Verdana, sans-serif'
                }
            }
        }]
    });



  	/* Biểu đồ năm */
    Highcharts.chart('container-2', {
        chart: {
            type: 'column'
        },
        title: {
            text: 'Doanh Thu Năm 2021 - Nhat Huy Bakery'
        },
        accessibility: {
            announceNewData: {
                enabled: true
            }
        },
        xAxis: {
            type: 'category'
        },
        yAxis: {
            min: 0,
            max: 100,
            title: {
                text: 'Tổng tiền ( Triệu VND )'
            }

        },
        legend: {
            enabled: false
        },
        plotOptions: {
            series: {
                borderWidth: 0,
                dataLabels: {
                    enabled: true,
                    format: '{point.y:.1f}'
                }
            }
        },

        tooltip: {
            headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
            pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}</b> Triệu VND<br/>'
        },

        series: [
            {
                name: "Doanh Thu Theo Tháng (2021)",
                colorByPoint: true,
                data: [
                    {
                        name: "Tháng 1",
                        y: 63.74,
                        drilldown: "Tháng 1"
                    },
                    {
                        name: "Tháng 2",
                        y: 50.57,
                        drilldown: "Tháng 2"
                    },
                    {
                        name: "Tháng 3",
                        y: 70.23,
                        drilldown: "Tháng 3"
                    },
                    {
                        name: "Tháng 4",
                        y: 45.58,
                        drilldown: "Tháng 4"
                    },
                    {
                        name: "Tháng 5",
                        y: 49.02,
                        drilldown: "Tháng 5"
                    },
                    {
                        name: "Tháng 6",
                        y: '',
                        drilldown: "Tháng 6"
                    },
                    {
                        name: "Tháng 7",
                        y: '',
                        drilldown: "Tháng 7"
                    },
                    {
                        name: "Tháng 8",
                        y: '',
                        drilldown: "Tháng 8"
                    },
                    {
                        name: "Tháng 9",
                        y: '',
                        drilldown: "Tháng 9"
                    },
                    {
                        name: "Tháng 10",
                        y: '',
                        drilldown: "Tháng 10"
                    },
                    {
                        name: "Tháng 11",
                        y: '',
                        drilldown: "Tháng 11"
                    },
                    {
                        name: "Tháng 12",
                        y: '',
                        drilldown: "Tháng 12"
                    },
                    
                ]
            }
        ],
        
    });
    </script>
</body>

</html>