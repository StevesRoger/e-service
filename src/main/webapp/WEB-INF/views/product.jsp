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

<div ng-app="ngApp" ng-controller="ngCtrl" data-ng-init="fetchProduct()">
    <div id="page-wrapper">
        <div class="header">
            <ol class="breadcrumb">
                <h3>Products</h3>
            </ol>
        </div>

        <div id="page-inner">
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">Product</div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form role="form" name="myForm">
                                        <div class="form-group required">
                                            <input class="ng-hide" ng-model="txtId"/>
                                            <label class="control-label">Code</label>
                                            <input class="form-control" placeholder="Enter Code" ng-model="txtCode"
                                                   name="txtCode" required/>
                                        </div>

                                        <div class="form-group required">
                                            <label class="control-label">Color </label>
                                            <input type='text' id="full"/>
                                            <span id="selectColor"></span>

                                        </div>

                                        <div class="form-group required">
                                            <label class="control-label">Size</label>
                                            <input class="form-control" placeholder="Enter Size"
                                                   ng-model="txtSize" name="txtSize" required/>
                                        </div>
                                        <div class="form-group required">
                                            <label class="control-label">Price</label>
                                            <input class="form-control" placeholder="Enter Price"
                                                   ng-model="txtPrice" name="txtPrice" required/>
                                        </div>
                                        <div class="form-group">
                                            <div class="imgupload panel panel-default">
                                                <div class="panel-heading clearfix">
                                                    <h3 class="panel-title pull-left">Upload images</h3>
                                                </div>
                                                <div class="file-tab panel-body">
                                                    <input type="file" id="files" name="files[]" accept="image/*"
                                                           multiple/>
                                                    <div id="preview" style="margin-top: 5px"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-primary" ng-click="submitProduct()">
                                            Submit
                                        </button>
                                        <button type="reset" class="btn btn-default" ng-click="reset()">Clear</button>
                                    </form>
                                </div>

                                <!-- /.col-lg-6 (nested) -->
                                <div class="col-lg-6">
                                    <form role="form">
                                        <div class="form-group required">
                                            <label class="control-label">Type</label>
                                            <select class="form-control" ng-model="selectType" required>
                                                <option></option>
                                                <option ng-repeat="(key, value) in types" value="{{key}}">{{value}}</option>
                                            </select>
                                        </div>
                                        <div class="form-group required">
                                            <label class="control-label">Phone1</label>
                                            <input class="form-control" placeholder="Enter Phone Number"
                                                   ng-model="txtPhone1" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Phone2</label>
                                            <input class="form-control" placeholder="Enter Phone Number"
                                                   ng-model="txtPhone2">
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
                                    <div class="row">
                                        <div class="col-md-4 offset-md-8">
                                            <div class="filter-product-type">
                                                <select class="form-control" ng-model="productType" ng-change="onchangeType()">
                                                    <option></option>
                                                    <option ng-repeat="(key, value) in types" value="{{key}}">{{value}}</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            Table Products
                                        </div>

                                        <div class="pull-right ">
                                            <span class="form-group"></span>
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
                                                        <th>Type</th>
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
                                                        <td>
                                                            <span ng-repeat="color in getColors(product.COLOR)">
                                                                <span class="color-box" ng-style="{'background-color': color}"></span>
                                                            </span>
                                                        </td>
                                                        <td>{{types[product.TYPE]}}</td>
                                                        <td>{{product.CONTACT.PHONE1}}, {{product.CONTACT.PHONE2}}</td>
                                                        <td>{{product.CONTACT.EMAIL}}</td>
                                                        <td>{{product.CONTACT.FACEBOOK}}</td>
                                                        <td width="100px">
                                                            <button class="btn btn-info btn-xs" data-title="Image"
                                                                    data-toggle="modal" data-target="#images"
                                                                    ng-click="viewImage(product.IMAGES,product.ID,'PRO')"><span
                                                                    class="glyphicon glyphicon-picture"></span></button>
                                                            <button class="btn btn-primary btn-xs" data-title="Edit"
                                                                    data-toggle="modal" data-target="#edit"
                                                                    ng-click="editProduct(product)"><span
                                                                    class="glyphicon glyphicon-pencil"></span></button>
                                                            <button class="btn btn-danger btn-xs" data-title="Delete"
                                                                    data-toggle="modal" data-target="#delete"
                                                                    ng-click="deleteEntity(product.ID, $index, 'PRO')"><span
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

                            <div>
                                <ul class="pagination pull-right">
                                    <li ng-class="{disabled:currentPage === 1}">
                                        <a href ng-click="prevPage()"> << Prev </a>
                                    </li>
                                    <li>
                                        <span> {{currentPage}} / {{countPage}} Pages</span>
                                    </li>
                                    <li>
                                        <span class="sapn-page-gination">
                                            <select ng-change="onChangeSize()" ng-model="itemPerPage" ng-options="item for item in pageSizes"></select>
                                        </span>
                                    </li>
                                    <li ng-class="{disabled:currentPage === countPage}">
                                        <a href ng-click="nextPage()"> >> Next </a>
                                    </li>
                                </ul>
                            </div>

                        </div>
                        <!-- /.panel-body  {disabled: currentPage == pagedItems.length - 1}  -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
        </div>
        <!-- /. PAGE INNER  -->
    </div>

    <div class="container">
        <div class="gallery"></div>
        <div class="clear"></div>
    </div>

</div>


<jsp:include page="footer.jsp"/>
