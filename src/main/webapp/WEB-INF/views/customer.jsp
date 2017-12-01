<jsp:include page="header.jsp"/>
<jsp:include page="navigationbar.jsp"/>

<div ng-app="ngApp" ng-controller="ngCtrl" data-ng-init="fetchCustomer()">
    <div id="page-wrapper">
        <div class="header">
            <ol class="breadcrumb">
               <h3>Customers</h3>
            </ol>
        </div>
        <div id="page-inner">
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">Customer</div>
                        <div class="panel-body">
                            <div class="row">
                                <form class="form-inline"​ style="margin-left: 15px">
                                    <div class="form-group">
                                        <label >Search</label>
                                        <input type="text" ng-model="search" class="form-control" placeholder="Search">
                                    </div>
                                </form>
                                <div class="col-md-12"><br/>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            Table Customer
                                        </div>
                                        <div class="panel-body">
                                            <div class="table-responsive">
                                                <table class="table table-striped table-bordered table-hover">
                                                    <thead>
                                                    <tr>
                                                        <th ng-click="sort('PRODUCT.CODE')">Product Code
                                                            <span class="glyphicon sort-icon" ng-show="sortKey=='PRODUCT.CODE'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                        </th>
                                                        <th ng-click="sort('PRODUCT.TYPE')">Type
                                                            <span class="glyphicon sort-icon" ng-show="sortKey=='PRODUCT.TYPE'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                        </th>
                                                        <th ng-click="sort('GROOM_NAME')">Groom Name
                                                            <span class="glyphicon sort-icon" ng-show="sortKey=='GROOM_NAME'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                        </th>
                                                        <th ng-click="sort('BRIDE_NAME')">Bride Name
                                                            <span class="glyphicon sort-icon" ng-show="sortKey=='BRIDE_NAME'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                        </th>
                                                        <th ng-click="sort('PHONE')">Phone
                                                            <span class="glyphicon sort-icon" ng-show="sortKey=='PHONE'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                        </th>
                                                        <th>Action</th>
                                                        <th>Active</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <tr ng-repeat="customer in customers|orderBy:sortKey:reverse|filter:search">
                                                        <td>{{customer.PRODUCT.CODE}}</td>
                                                        <td>{{types[customer.PRODUCT.TYPE]}}</td>
                                                        <td>{{customer.GROOM_NAME}}</td>
                                                        <td>{{customer.BRIDE_NAME}}</td>
                                                        <td>{{customer.PHONE}}</td>
                                                        <td width="100px">
                                                            <button class="btn btn-info btn-xs"
                                                                    ng-click="viewImage(customer.IMAGES,customer.ID,'CUS')">
                                                                <span class="glyphicon glyphicon-picture"></span>
                                                            </button>
                                                            <button class="btn btn-primary btn-xs" data-title="Customer"
                                                                    data-toggle="modal" data-target="#myModal"
                                                                    ng-click="viewCustomer(customer)"><span
                                                                    class="glyphicon glyphicon-user"></span></button>
                                                            <button class="btn btn-danger btn-xs" data-title="Delete"
                                                                    data-toggle="modal" data-target="#delete"
                                                                    ng-click="deleteEntity(customer.ID, $index, 'CUS')"><span
                                                                    class="glyphicon glyphicon-trash"></span></button>

                                                        </td>
                                                        <td>
                                                            <input id="checkboxes-0" ng-click="deActiveCustomer()" type="checkbox" ng-model="" ng-checked="true">
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
        <!-- /. PAGE WRAPPER  -->
    </div>
    <!-- /. WRAPPER  -->

    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="panel panel-default">
                    <div class="panel-heading">Customer Detail
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label style="color:#0866C6">Groom</label>
                                </div>
                                <div class="form-group">
                                    <label id="mName"></label>
                                </div>
                                <div class="form-group">
                                    <label id="mFatName"></label>
                                </div>
                                <div class="form-group">
                                    <label id="mMomName"></label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label style="color:#0866C6">Bride</label>
                                </div>
                                <div class="form-group">
                                    <label id="fName"></label>
                                </div>
                                <div class="form-group">
                                    <label id="fFatName"></label>
                                </div>
                                <div class="form-group">
                                    <label id="fMomName"></label>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label style="color:#0866C6">More Information</label>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label id="date"></label>
                                    </div>
                                    <div class="form-group">
                                        <label id="address"></label>
                                    </div>
                                    <div class="form-group">
                                        <label id="home"></label>
                                    </div>
                                    <div class="form-group">
                                        <label id="tel"></label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label id="email"></label>
                                    </div>
                                    <div class="form-group">
                                        <label id="fb"></label>
                                    </div>
                                    <div class="form-group">
                                        <label><a id="map" href="#">Google Map</a></label>
                                    </div>
                                    <div class="form-group">
                                        <label id="other"></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="gallery"></div>
    <div class="clear"></div>
</div>

<jsp:include page="footer.jsp"/>

</div>

