<%@page import="service.StatService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Statistics</title>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
        <script src="http://code.highcharts.com/highcharts.js"></script>
    </head>
    <body>

        <%
            StatService statService = new StatService();
            Map<String, Integer> map = statService.getMedicineSellStat();
            Map<String, Integer> map2 = statService.getMedicineSellStat2();
//            out.print("map is: "+map);
//            out.print("map2 is: " + map2);
%>

        <div>
            <ul class="nav navbar-nav">
<!--                <li><a href="account.jsp"><%=session.getAttribute("userEmail")%></a></li>-->
                <li><a href="insertNew.jsp"><i class="fa fa-shopping-cart"></i>insert new medicine</a></li>
            </ul>
        </div>

        <!--        <div>
                    <ul class="nav navbar-nav">
                        <li><a href="insertNew.jsp"><i class="fa fa-shopping-cart"></i>insert new medicine</a></li>
                    </ul>
                </div>-->

        <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>

        <script>
            $(function () {
            $('#container').highcharts({
            chart: {
            type: 'column'
            },
                    title: {
                    text: 'Medicine sell statistics'
                    },
                    subtitle: {
                    text: ''
                    },
                    xAxis: {
                    categories: [
            <%
                for (String label : map.keySet()) {

            %>
                    '<%=label%>',
            <%
                }
            %>
                    ],
                            crosshair: true
                    },
                    yAxis: {
                    min: 0,
                            title: {
                            text: 'Quantity sold'
                            }
                    },
                    tooltip: {
                    headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                            '<td style="padding:0"><b>{point.y:.1f} </b></td></tr>',
                            footerFormat: '</table>',
                            shared: true,
                            useHTML: true
                    },
                    plotOptions: {
                    column: {
                    pointPadding: 0.2,
                            borderWidth: 0
                    }
                    },
                    series: [{
                    name: 'individual sell',
                            data: [
            <%
                for (String key : map.keySet()) {
                    int val = map.get(key);
            %>
            <%=val%>,
            <%
                }
            %>

                            ]

                    }, {
                    name: 'total sell',
                            data: [

            <%
                for (String key : map2.keySet()) {
                    int val = map2.get(key);
            %>
            <%=val%>,
            <%
                }
            %>
                            ]

                    }]
            });
            });
        </script>

        <!--
                <div>
                    <div id="line-chart-div" style="width: 100%; height: 400px;"></div>
                    <script>
                        $(function () {
                        $('#line-chart-div').highcharts({
                        chart: {
                        type: 'column'
                        },
                                title: {
                                text: 'MedicineName vs QuantitySold'
                                },
                                subtitle: {
                                text: $('#semester-dropdown option:selected').text()
                                },
                                xAxis: {
                                type: 'category',
                                        labels: {
                                        rotation: - 45,
                                                style: {
                                                fontSize: '13px',
                                                        fontFamily: 'Verdana, sans-serif'
                                                }
                                        }
                                },
                                yAxis: {
                                min: 0,
                                        title: {
                                        text: 'Quantity sold'
                                        }
                                },
                                legend: {
                                enabled: false
                                },
                                tooltip: {
                                pointFormat: '<b>{point.y:.1f}</b>'
                                },
                                series: [{
                                name: 'Population',
                                        data: [
        <%                                                int i = 1;
            for (String label : map.keySet()) {
                if (i == map.size()) {
        %>
                        [ '<%=label%>', <%=map.get(label)%>]
        <%
        } else {
        %>

                        [ '<%=label%>', <%=map.get(label)%>],
        <%
                }
                i++;
            }
        %>
                        ],
                        dataLabels: {
                        enabled: true,
                                rotation: - 90,
                                color: '#FFFFFF',
                                align: 'right',
                                x: 4,
                                y: 10,
                                style: {
                                fontSize: '13px',
                                        fontFamily: 'Verdana, sans-serif',
                                        textShadow: '0 0 3px black'
                                }
                        }
                }]
        });
        });
    </script>
</div>

<div>
    <div id="line-chart-div2" style="width: 100%; height: 400px;"></div>
    <script>
        $(function () {
        $('#line-chart-div2').highcharts({
        chart: {
        type: 'column'
        },
                title: {
                text: 'Medicine Name vs Total quantity sold(Generic name)'
                },
                subtitle: {
                text: $('#semester-dropdown option:selected').text()
                },
                xAxis: {
                type: 'category',
                        labels: {
                        rotation: - 45,
                                style: {
                                fontSize: '13px',
                                        fontFamily: 'Verdana, sans-serif'
                                }
                        }
                },
                yAxis: {
                min: 0,
                        title: {
                        text: 'Quantity sold'
                        }
                },
                legend: {
                enabled: false
                },
                tooltip: {
                pointFormat: '<b>{point.y:.1f}</b>'
                },
                series: [{
                name: 'Population',
                        data: [
        <%                                       i = 1;
            for (String label : map2.keySet()) {
                if (i == map2.size()) {
        %>
                        [ '<%=label%>', <%=map2.get(label)%>]
        <%
        } else {
        %>

                        [ '<%=label%>', <%=map2.get(label)%>],
        <%
                }
                i++;
            }
        %>
                        ],
                        dataLabels: {
                        enabled: true,
                                rotation: - 90,
                                color: '#FFFFFF',
                                align: 'right',
                                x: 4,
                                y: 10,
                                style: {
                                fontSize: '13px',
                                        fontFamily: 'Verdana, sans-serif',
                                        textShadow: '0 0 3px black'
                                }
                        }
                }]
        });
        });
    </script>
</div>-->
        <%map.clear();
            map2.clear();
        %>
    </body>
</html>