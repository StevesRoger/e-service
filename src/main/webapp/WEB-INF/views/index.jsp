<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>

    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <title>V-Printing</title>
    <link rel="icon" type="image/ico" href="./resources/img/icons/v_printing_logo.ico">
    <!-- Bootstrap Styles-->
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css">

    <!-- Google Fonts-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" type="text/css" href="./resources/css/main.css"/>

    <link rel="stylesheet" href="./resources/css/zoom.css" media="all"/>

    <link rel="stylesheet" href="./resources/css/sweetalert2.min.css"/>

    <link rel="stylesheet" href="./resources/css/alertify.core.css"/>

    <link rel="stylesheet" href="./resources/css/alertify.default.css"/>
    <script src="./resources/js/jquery-1.11.3.min.js"></script>

    <!-- Custom Styles-->
    <link href="./resources/css/custom-styles.css" rel="stylesheet"/>

    <%-- color --%>

    <script src="./resources/js/spectrum.js"></script>
    <link rel="stylesheet" href="./resources/css/spectrum.css"/>

</head>
    <jsp:include page="header.jsp"/>
    <jsp:include page="navigationbar.jsp"/>

    <div id="page-wrapper">
        <div class="header">
            <ol class="breadcrumb">
            </ol>
        </div>
        <div id="page-inner">

            <div class="row">
                <div class="col-md-3 col-sm-12 col-xs-12">
                    <div class="panel panel-primary text-center no-boder blue">
                        <div class="panel-left pull-left blue">
                            <i class="fa fa-eye fa-5x"></i>
                        </div>
                        <div class="panel-right">
                            <h3>10,253</h3>
                            <strong> Daily Visits</strong>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-12 col-xs-12">
                    <div class="panel panel-primary text-center no-boder blue">
                        <div class="panel-left pull-left blue">
                            <i class="fa fa-shopping-cart fa-5x"></i>
                        </div>

                        <div class="panel-right">
                            <h3>33,180 </h3>
                            <strong> Sales</strong>

                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-12 col-xs-12">
                    <div class="panel panel-primary text-center no-boder blue">
                        <div class="panel-left pull-left blue">
                            <i class="fa fa fa-comments fa-5x"></i>

                        </div>
                        <div class="panel-right">
                            <h3>16,022 </h3>
                            <strong> Comments </strong>

                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-12 col-xs-12">
                    <div class="panel panel-primary text-center no-boder blue">
                        <div class="panel-left pull-left blue">
                            <i class="fa fa-users fa-5x"></i>

                        </div>
                        <div class="panel-right">
                            <h3>36,752 </h3>
                            <strong>No. of Visits</strong>

                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-5">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Line Chart
                        </div>
                        <div class="panel-body">
                            <div id="morris-line-chart"></div>
                        </div>
                    </div>
                </div>

                <div class="col-md-7">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Bar Chart Example
                        </div>
                        <div class="panel-body">
                            <div id="morris-bar-chart"></div>
                        </div>

                    </div>
                </div>

            </div>


            <div class="row">
                <div class="col-xs-6 col-md-3">
                    <div class="panel panel-default">
                        <div class="panel-body easypiechart-panel">
                            <h4>Customers</h4>
                            <div class="easypiechart" id="easypiechart-blue" data-percent="82">
                                <span class="percent">82%</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-6 col-md-3">
                    <div class="panel panel-default">
                        <div class="panel-body easypiechart-panel">
                            <h4>Sales</h4>
                            <div class="easypiechart" id="easypiechart-orange" data-percent="55"><span class="percent">55%</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-6 col-md-3">
                    <div class="panel panel-default">
                        <div class="panel-body easypiechart-panel">
                            <h4>Profits</h4>
                            <div class="easypiechart" id="easypiechart-teal" data-percent="84"><span
                                    class="percent">84%</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-6 col-md-3">
                    <div class="panel panel-default">
                        <div class="panel-body easypiechart-panel">
                            <h4>No. of Visits</h4>
                            <div class="easypiechart" id="easypiechart-red" data-percent="46"><span
                                    class="percent">46%</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--/.row-->

            <footer>
                <p>All right reserved. Template by: <a href="http://webthemez.com">WebThemez</a></p>
            </footer>
        </div>
        <!-- /. PAGE INNER -->
    </div>

    <jsp:include page="footer.jsp"/>