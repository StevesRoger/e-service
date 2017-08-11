<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>V-Printing-Product</title>
    <!-- Bootstrap Styles-->
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css">
    <!-- Custom Styles-->
    <link href="./resources/css/custom-styles.css" rel="stylesheet"/>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>

    <link rel="stylesheet" type="text/css" href="./resources/css/main.css"/>

    <link rel="stylesheet" href="./resources/css/zoom.css" media="all"/>
</head>
<body ng-app="ngApp" ng-controller="ngCtrl" data-ng-init="fetchProduct()">
<div id="wrapper">
    <nav class="navbar navbar-default top-navbar" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index"><strong>V-Printing</strong></a>
        </div>

        <ul class="nav navbar-top-links navbar-right">
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                    <i class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-messages">
                    <li>
                        <a href="#">
                            <div>
                                <strong>John Doe</strong>
                                <span class="pull-right text-muted">
                                        <em>Today</em>
                                    </span>
                            </div>
                            <div>Lorem Ipsum has been the industry's standard dummy text ever since the 1500s...</div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <strong>John Smith</strong>
                                <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                            </div>
                            <div>Lorem Ipsum has been the industry's standard dummy text ever since an kwilnw...</div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <strong>John Smith</strong>
                                <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                            </div>
                            <div>Lorem Ipsum has been the industry's standard dummy text ever since the...</div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a class="text-center" href="#">
                            <strong>Read All Messages</strong>
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </li>
                </ul>
                <!-- /.dropdown-messages -->
            </li>
            <!-- /.dropdown -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                    <i class="fa fa-tasks fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-tasks">
                    <li>
                        <a href="#">
                            <div>
                                <p>
                                    <strong>Task 1</strong>
                                    <span class="pull-right text-muted">60% Complete</span>
                                </p>
                                <div class="progress progress-striped active">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                        <span class="sr-only">60% Complete (success)</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <p>
                                    <strong>Task 2</strong>
                                    <span class="pull-right text-muted">28% Complete</span>
                                </p>
                                <div class="progress progress-striped active">
                                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="28"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 28%">
                                        <span class="sr-only">28% Complete</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <p>
                                    <strong>Task 3</strong>
                                    <span class="pull-right text-muted">60% Complete</span>
                                </p>
                                <div class="progress progress-striped active">
                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                        <span class="sr-only">60% Complete (warning)</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <p>
                                    <strong>Task 4</strong>
                                    <span class="pull-right text-muted">85% Complete</span>
                                </p>
                                <div class="progress progress-striped active">
                                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="85"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 85%">
                                        <span class="sr-only">85% Complete (danger)</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a class="text-center" href="#">
                            <strong>See All Tasks</strong>
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </li>
                </ul>
                <!-- /.dropdown-tasks -->
            </li>
            <!-- /.dropdown -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                    <i class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-alerts">
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-comment fa-fw"></i> New Comment
                                <span class="pull-right text-muted small">4 min</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                <span class="pull-right text-muted small">12 min</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-envelope fa-fw"></i> Message Sent
                                <span class="pull-right text-muted small">4 min</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-tasks fa-fw"></i> New Task
                                <span class="pull-right text-muted small">4 min</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                <span class="pull-right text-muted small">4 min</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a class="text-center" href="#">
                            <strong>See All Alerts</strong>
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </li>
                </ul>
                <!-- /.dropdown-alerts -->
            </li>
            <!-- /.dropdown -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                    <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                    </li>
                    <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                    </li>
                    <li class="divider"></li>
                    <li><a href="#"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                    </li>
                </ul>
                <!-- /.dropdown-user -->
            </li>
            <!-- /.dropdown -->
        </ul>
    </nav>
    <!--/. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">

                <li>
                    <a href="index"><i class="fa fa-desktop"></i> Dashboard</a>
                </li>
                <li>
                    <a class="active-menu" href="product"><i class="fa fa-newspaper-o"></i> Wedding Letter</a>
                </li>
                <li>
                    <a href="feast"><i class="fa fa-newspaper-o"></i> Feast Letter </a>
                </li>
                <li>
                    <a href="creative"><i class="fa fa-newspaper-o"></i> Creative Letter </a>
                </li>
                <li>
                    <a href="customer"><i class="fa fa-user"></i> Customer</a>
                </li>

            </ul>

        </div>

    </nav>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper">
        <ol class="breadcrumb">
        </ol>

        <div id="page-inner">
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">Product
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form role="form" name="myForm">
                                        <div class="form-group">
                                            <input class="ng-hide" ng-model="txtId"/>
                                            <label>Code</label>
                                            <input class="form-control" placeholder="Enter Code"
                                                   ng-model="txtCode" name="txtCode" required/>
                                        </div>
                                        <div class="form-group">
                                            <label>Color</label>
                                            <input class="form-control" placeholder="Enter Color"
                                                   ng-model="txtColor" name="txtColor" required/>
                                        </div>
                                        <div class="form-group">
                                            <label>Size</label>
                                            <input class="form-control" placeholder="Enter Size"
                                                   ng-model="txtSize" name="txtSize" required/>
                                        </div>
                                        <div class="form-group">
                                            <label>Price</label>
                                            <input class="form-control" placeholder="Enter Price"
                                                   ng-model="txtPrice" name="txtPrice" required/>
                                        </div>
                                        <div class="form-group">
                                            <div class="imgupload panel panel-default">
                                                <div class="panel-heading clearfix">
                                                    <h3 class="panel-title pull-left">Upload image</h3>
                                                </div>
                                                <div class="file-tab panel-body">
                                                    <input type="file" id="files" name="files[]" multiple/>
                                                    <div id="preview"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-primary" ng-click="submit()">Submit
                                        </button>
                                        <button type="reset" class="btn btn-default"
                                                ng-click="reset()">Reset
                                        </button>
                                    </form>
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                                <div class="col-lg-6">
                                    <form role="form">
                                        <div class="form-group">
                                            <label>Phone1</label>
                                            <input class="form-control" placeholder="Enter Phone Number"
                                                   ng-model="txtPhone1">
                                        </div>
                                        <div class="form-group">
                                            <label>Phone2</label>
                                            <input class="form-control" placeholder="Enter Phone Number"
                                                   ng-model="txtPhone2">
                                        </div>
                                        <div class="form-group">
                                            <label>Phone3</label>
                                            <input class="form-control" placeholder="Enter Phone Number"
                                                   ng-model="txtPhone3">
                                        </div>
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input class="form-control" placeholder="Enter Email"
                                                   ng-model="txtEmail">
                                        </div>
                                        <div class="form-group">
                                            <label>Facebook</label>
                                            <input class="form-control" placeholder="Enter Facebook"
                                                   ng-model="txtFacebook">
                                        </div>
                                    </form>

                                </div>
                                <!-- /.col-lg-6 (nested) -->
                            </div>

                            <div class="row">
                                <div class="col-md-12"><br/>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            Table Products
                                        </div>
                                        <div class="panel-body">
                                            <div class="table-responsive">
                                                <table class="table table-striped table-bordered table-hover">
                                                    <thead>
                                                    <tr>
                                                        <th class="ng-hide">Id</th>
                                                        <th>Code</th>
                                                        <th>Size</th>
                                                        <th>Price</th>
                                                        <th>Color</th>
                                                        <th>Phone</th>
                                                        <th>Email</th>
                                                        <th>Facebook</th>
                                                        <th>Action</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <tr ng-repeat="product in products">
                                                        <td class="ng-hide">{{product.ID}}</td>
                                                        <td>{{product.CODE}}</td>
                                                        <td>{{product.SIZE}}</td>
                                                        <td>{{product.PRICE}}</td>
                                                        <td>{{product.COLOR}}</td>
                                                        <td>{{product.CONTACT.PHONE1}}, {{product.CONTACT.PHONE2}},
                                                            {{product.CONTACT.PHONE3}}
                                                        </td>
                                                        <td>{{product.CONTACT.EMAIL}}</td>
                                                        <td>{{product.CONTACT.FACEBOOK}}</td>
                                                        <td width="100px">
                                                            <button class="btn btn-info btn-xs" data-title="Image"
                                                                    data-toggle="modal" data-target="#image"
                                                                    ng-click="viewImage(product.IMAGES)"><span
                                                                    class="glyphicon glyphicon-picture"></span></button>
                                                            <button class="btn btn-primary btn-xs" data-title="Edit"
                                                                    data-toggle="modal" data-target="#edit"
                                                                    ng-click="editProduct(product)"><span
                                                                    class="glyphicon glyphicon-pencil"></span></button>
                                                            <button class="btn btn-danger btn-xs" data-title="Delete"
                                                                    data-toggle="modal" data-target="#delete"
                                                                    ng-click="deleteProduct(product.ID, $index);"><span
                                                                    class="glyphicon glyphicon-trash"></span></button>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
        </div>
        <!-- /. PAGE INNER  -->
    </div>
    <!-- /. PAGE WRAPPER  -->
</div>
<!-- /. WRAPPER  -->
<div class="container">
    <div class="gallery"></div>
    <div class="clear"></div>
</div>

<!-- JS Scripts-->
<script src="./resources/js/jquery-1.11.3.min.js"></script>
<!-- lib angular js -->
<script src="./resources/js/angular.min.js"></script>
<!-- angular app -->
<script src="./resources/js/app.js"></script>
<!-- main js -->
<script src="./resources/js/main.js"></script>

<script src="./resources/js/bootstrap.min.js"></script>

</body>
</html>
