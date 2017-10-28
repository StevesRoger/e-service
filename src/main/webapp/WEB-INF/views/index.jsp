
    <jsp:include page="header.jsp"/>
    <jsp:include page="navigationbar.jsp"/>

    <div id="page-wrapper">
        <div class="header">
            <ol class="breadcrumb">
                <h3>Dash board</h3>
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