<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>景點介紹</title>
    <style>
        html,
        body {
            height: 100%;
            margin: 0;
            padding: 0;
        }
        #map {
            height: 80%;
        }
        .content {} h1 {
            margin-top: -50px;
        }
        #choosereligion {
            width: 200px;
            background: #595959;
            color: white;
            font-family: Sans-Serif;
            font-size: 20px;
            line-height: 30px;
            height: 30px;
            cursor: pointer;
            border-radius: 5px;
            margin-top: -40px;
            margin-bottom: 20px;
            margin-left: 450px;
        }
        .logo ul li {
            float: left;
            display: inline;
            margin-right: 43px;
            margin-bottom: 10px;
            font-size: 18px;
        }
        #choosereligion .open {
            border-radius: 5px 5px 0 0;
        }
        #choosereligion .option {
            border: 1px solid black;
        }
        #choosereligion .option {
            background: #595959;
            display: none;
            padding-left: 5px;
            font-size: 15px;
            /*Tamaño de fuente pequeño para la segunda línea*/
            
            line-height: 20px;
            color: white;
            border-top: none;
        }
        #choosereligion .option.shown:first-line {
            /*Aquí sobreescribimos el tamaño del
	texto de la primera línea*/
            
            font-size: 20px;
            line-height: 30px;
        }
        #choosereligion .option.shown:hover:first-line {
            color: #000;
        }
        #choosereligion .shown {
            display: block;
        }
        #choosereligion .option:hover {
            background: #3355ff;
            background: linear-gradient(hsl(220, 100%, 70%), hsl(220, 100%, 50%));
        }
        #choosereligion .option.shown:last-child {
            border-radius: 0 0 5px 5px
        }
        input {
            margin-top: 10px;
        }
    </style>
    <link href="style.css" rel="stylesheet" type="text/css" media="screen" />
</head>

<body>
<!--     <div class="wrapper"> -->
<!--         <div class="header-wrapper"> -->
<!--             <div id="header" class="container"> -->
<!--                 <div id="logo"> -->
<!--                     <h1><a href="index.html">高雄文化地圖</a></h1> -->
<!--                 </div> -->
<!--                 <div id="menu"> -->
<!--                     <ul> -->
<!--                         <li class="current_page_item"><a href="religion.html">宗教介紹</a> -->
<!--                         </li> -->
<!--                         <li><a href="map.html">文化地圖</a> -->
<!--                         </li> -->
<!--                         <li><a href="table.html">路線規劃</a> -->
<!--                         </li> -->
<!--                         <li><a href="pie.html">統計圖表</a> -->
<!--                         </li> -->
<!--                     </ul> -->
<!--                 </div> -->
<!--             </div> -->

<!--         </div> -->
        <!-- end #header -->

        <div id="page">
            <div id="content">

                <!-- ------------------------------------------------ -->

                <h1>
			    	景點地圖
			    </h1>
                <div class="logo">
                    <ul>
                        <li><img src="/SouthBorder1/src/main/webapp/img/spot/food.png" alt="">：景點</li>
                        <li><img src="../img/spot/travel.png" alt="">：娛樂</li>
                        <li><img src="../img/spot/food.png" alt="">：美食</li>
                        

                    </ul>
                </div>
                <div class="line"></div>
                <h2>請選擇您要查詢的宗教：</h2>
                <select id="choosereligion" onchange="getReligion(this.value)">
                    <option value="all" selected="selected">全部宗教</option>
                    <option value="道教">道教</option>
                    <option value="佛教">佛教</option>
                    <option value="天主教">天主教</option>
                    <option value="基督教">基督教</option>
                    <option value="回教">伊斯蘭教</option>
                    <option value="一貫道">一貫道</option>
                    <option value="儒教">儒教</option>
                    <option value="其他(教會)">其他(教會)</option>

                </select>
                
                <!-- <p> 輸入欲查詢的地址<input id="address" type="text" size="50" value="">   <input type="button" value="查經緯度並在地圖上顯示" onClick="codeAddress()"> </p> -->

                <div id="map"></div>

                <script>
                    $(document).ready(function() {
                                $("#select").click(function(e) {
                                    $(this).children(".option").toggleClass("shown");
                                    $(this).toggleClass("open");
                                });

                                $(".option").click(function() {
                                    $(this).siblings("#selected").html($(this).html().split("<br>")[0]);
                                    /*Obtiene el html de #selected y lo cambia por la primera línea del
			elemento que se ha seleccionado [$(this)]
			$(this).html extrae el html del contenido y luego lo separa
			en un arreglo con split(), usando los <br> como delimitadores, por lo
			que obtenemos un arreglo con dos valores: a[0] = Opción X y a[1] = descripción
			*/
                                });

                                /*Aquí emulamos el input.value de Javascript*/
                                //   $("input").click(function()
                                //     {
                                //       var selection = $("#selected").html();
                                //       alert(selection);
                                //     });
                                // });

                                // 					function codeAddress() {
                                //     var address = document.getElementById("address").value;
                                //     var geocoder= new google.maps.Geocoder();
                                //     geocoder.geocode( { 'address': address}, function(results, status) {
                                //       if (status == google.maps.GeocoderStatus.OK) {
                                //       	map.setCenter(new google.maps.LatLng(results[0].geometry.location));
                                //         map.setCenter(results[0].geometry.location);

                                // 		document.getElementById("lat").value=results[0].geometry.location.lat();
                                // 		document.getElementById("lng").value=results[0].geometry.location.lng();
                                //         var marker = new google.maps.Marker({
                                //             map: map,
                                //             position: results[0].geometry.location
                                //         });

                                // 		showAddress(results[0], marker);
                                //       } else {
                                //         alert("失敗, 原因: " + status);
                                //       }
                                //     });
                                //   }

                                function showAddress(result, marker) {
                                    var popupContent = result.formatted_address;
                                    popup.setContent(popupContent);
                                    popup.open(map, marker);
                                }
                </script>
                <script>
                    //--------------------------------------------------讀取XML黨-------------------------------------------
                    function loadXMLFile(file) {
                            var xmlDoc;
                            if (window.ActiveXObject) {
                                xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                                xmlDoc.async = false;
                                xmlDoc.load(file);
                                return xmlDoc;
                            } else if (document.implementation && document.implementation.createDocument) {
                                var xmlInfo = new XMLHttpRequest();
                                xmlInfo.open("GET", file, false);
                                xmlInfo.send(null);
                                xmlDoc = xmlInfo.responseXML;
                                return xmlDoc;
                            } else {
                                alert("您的瀏覽器不支援Javascript!! ");
                            }
                        }
                        //--------------------------------------------------讀取XML黨-------------------------------------------
                    var Religionget = "all";

                    function getReligion(choosereligion) {
                        Religionget = choosereligion;
                        initMap();
                    }


                    function initMap() {
                        var myLatLng = {
                            lat: 22.6623065,
                            lng: 120.3547871
                        };

                        var map = new google.maps.Map(document.getElementById('map'), {
                            zoom: 12,
                            center: myLatLng
                        });


                        var infowindow = null;

                        /* window.onload=function() { */
                        xmlFile = "temple.xml";
                        xmlData = loadXMLFile(xmlFile);

                        infowindow = new google.maps.InfoWindow({
                            content: "holding..."
                        });


                        for (var i = 0; i <= 1658; i++) {

                            if (Religionget !== "all") {
                                var Reli = new Array();
                                Reli[i] = xmlData.getElementsByTagName("Religion")[i].firstChild.nodeValue;
                                if (Reli[i] !== Religionget) {
                                    continue;
                                }
                            }

                            var District = new Array();
                            District[i] = xmlData.getElementsByTagName("District")[i].firstChild.nodeValue;
                            var Address = new Array();
                            Address[i] = xmlData.getElementsByTagName("Address")[i].firstChild.nodeValue;


                            var locate1 = "";
                            var locate2 = "";
                            var Lxml = 0;
                            Lxml = loadXMLFile("https://maps.googleapis.com/maps/api/geocode/xml?address=" + District[i] + Address[i] + "&key=AIzaSyAsTC5dBCsI0Ufiizw1Phs6xSJ2K_Lw_L4");
                            locate1 = Lxml.getElementsByTagName("lat")[0].firstChild.nodeValue;
                            locate2 = Lxml.getElementsByTagName("lng")[0].firstChild.nodeValue;
                            console.log(i);
                            var contentString = new Array();
                            contentString[i] = '<div class="content">' +
                                '<div id="siteNotice">' +
                                '</div>' +
                                '<h2 id="firstHeading" class="firstHeading">' +
                                xmlData.getElementsByTagName("Name")[i].firstChild.nodeValue + '</h2>' +
                                '<div id="bodyContent">' +
                                '<p><b>宗教類別：</b>' +
                                xmlData.getElementsByTagName("Religion")[i].firstChild.nodeValue + '</p>' +
                                '<p><b>地址：</b>' +
                                xmlData.getElementsByTagName("District")[i].firstChild.nodeValue +
                                xmlData.getElementsByTagName("Address")[i].firstChild.nodeValue + '</p>' +
                                '<p><b>連絡電話：</b>' +
                                xmlData.getElementsByTagName("Tel")[i].firstChild.nodeValue + '</p>' +
                                '<p><b>管理者：</b>' +
                                xmlData.getElementsByTagName("Manager")[i].firstChild.nodeValue + '</p>' +
                                '</div>' +
                                '</div>';

                            switch (xmlData.getElementsByTagName("Religion")[i].firstChild.nodeValue) {
                                case '道教':
                                    var markers = new Array();
                                    markers[i] = new google.maps.Marker({
                                        position: {
                                            lat: parseFloat(locate1),
                                            lng: parseFloat(locate2)
                                        },
                                        map: map,
                                        html: contentString[i],
                                        icon: 'images/ri01.png',
                                        // icon: templehindu.png
                                        // 'animation': 'DROP'
                                    });

                                    var marker = markers[i]
                                    google.maps.event.addListener(marker, 'click', function() {
                                        // where I have added .html to the marker object.
                                        infowindow.setContent(this.html);
                                        infowindow.open(map, this);
                                    });
                                    break;
                                case '佛教':
                                    var markers = new Array();
                                    markers[i] = new google.maps.Marker({
                                        position: {
                                            lat: parseFloat(locate1),
                                            lng: parseFloat(locate2)
                                        },
                                        map: map,
                                        html: contentString[i],
                                        icon: 'images/ri02.png',
                                        // icon: templehindu.png
                                        // 'animation': 'DROP'
                                    });

                                    var marker = markers[i]
                                    google.maps.event.addListener(marker, 'click', function() {
                                        // where I have added .html to the marker object.
                                        infowindow.setContent(this.html);
                                        infowindow.open(map, this);
                                    });
                                    break;
                                case '天主教':
                                    var markers = new Array();
                                    markers[i] = new google.maps.Marker({
                                        position: {
                                            lat: parseFloat(locate1),
                                            lng: parseFloat(locate2)
                                        },
                                        map: map,
                                        html: contentString[i],
                                        icon: 'images/ri03.png',
                                        // icon: templehindu.png
                                        // 'animation': 'DROP'
                                    });

                                    var marker = markers[i]
                                    google.maps.event.addListener(marker, 'click', function() {
                                        // where I have added .html to the marker object.
                                        infowindow.setContent(this.html);
                                        infowindow.open(map, this);
                                    });
                                    break;
                                case '基督教':
                                    var markers = new Array();
                                    markers[i] = new google.maps.Marker({
                                        position: {
                                            lat: parseFloat(locate1),
                                            lng: parseFloat(locate2)
                                        },
                                        map: map,
                                        html: contentString[i],
                                        icon: 'images/ri04.png',
                                        // icon: templehindu.png
                                        // 'animation': 'DROP'
                                    });

                                    var marker = markers[i]
                                    google.maps.event.addListener(marker, 'click', function() {
                                        // where I have added .html to the marker object.
                                        infowindow.setContent(this.html);
                                        infowindow.open(map, this);
                                    });
                                    break;
                                case '回教':
                                    var markers = new Array();
                                    markers[i] = new google.maps.Marker({
                                        position: {
                                            lat: parseFloat(locate1),
                                            lng: parseFloat(locate2)
                                        },
                                        map: map,
                                        html: contentString[i],
                                        icon: 'images/ri05.png',
                                        // icon: templehindu.png
                                        // 'animation': 'DROP'
                                    });

                                    var marker = markers[i]
                                    google.maps.event.addListener(marker, 'click', function() {
                                        // where I have added .html to the marker object.
                                        infowindow.setContent(this.html);
                                        infowindow.open(map, this);
                                    });
                                    break;
                                case '一貫道':
                                    var markers = new Array();
                                    markers[i] = new google.maps.Marker({
                                        position: {
                                            lat: parseFloat(locate1),
                                            lng: parseFloat(locate2)
                                        },
                                        map: map,
                                        html: contentString[i],
                                        icon: 'images/ri06.png',
                                        // icon: templehindu.png
                                        // 'animation': 'DROP'
                                    });

                                    var marker = markers[i]
                                    google.maps.event.addListener(marker, 'click', function() {
                                        // where I have added .html to the marker object.
                                        infowindow.setContent(this.html);
                                        infowindow.open(map, this);
                                    });
                                    break;
                                case '儒教':
                                    var markers = new Array();
                                    markers[i] = new google.maps.Marker({
                                        position: {
                                            lat: parseFloat(locate1),
                                            lng: parseFloat(locate2)
                                        },
                                        map: map,
                                        html: contentString[i],
                                        icon: 'images/ri07.png',
                                        // icon: templehindu.png
                                        // 'animation': 'DROP'
                                    });

                                    var marker = markers[i]
                                    google.maps.event.addListener(marker, 'click', function() {
                                        // where I have added .html to the marker object.
                                        infowindow.setContent(this.html);
                                        infowindow.open(map, this);
                                    });
                                    break;
                                case '其他(教會)':
                                    var markers = new Array();
                                    markers[i] = new google.maps.Marker({
                                        position: {
                                            lat: parseFloat(locate1),
                                            lng: parseFloat(locate2)
                                        },
                                        map: map,
                                        html: contentString[i],
                                        icon: 'images/ri08.png',
                                        // icon: templehindu.png
                                        // 'animation': 'DROP'
                                    });

                                    var marker = markers[i]
                                    google.maps.event.addListener(marker, 'click', function() {
                                        // where I have added .html to the marker object.
                                        infowindow.setContent(this.html);
                                        infowindow.open(map, this);
                                    });
                                    break;

                            }




                        }

                    }
                </script>
                <script async defer
                        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAsTC5dBCsI0Ufiizw1Phs6xSJ2K_Lw_L4&callback=initMap">
                </script>

                <!-- ------------------------------------------------ -->

            </div>
            <div style="clear: both;">&nbsp;</div>
        </div>
        <!-- end #content -->
        <div style="clear: both;">&nbsp;</div>
    </div>
    <!-- end #page -->
    </div>

    <!-- end #footer -->
</body>

</html>