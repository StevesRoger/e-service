
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
                                            <input class="form-control" placeholder="Enter Code" ng-model="txtCode" name="txtCode" required/>
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
                                                    <input type="file" id="files" name="files[]" accept="image/*" multiple/>
                                                    <div id="preview" style="margin-top: 5px"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-primary" ng-click="submitProduct()">Submit</button>
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
                                                <option ng-repeat="(key, value) in types" value="{{key}}">{{value}}
                                                </option>
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
                                                        <td>{{product.COLOR}}</td>
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

    <div class="container">
        <div class="gallery"></div>
        <div class="clear"></div>
    </div>

</div>


<jsp:include page="footer.jsp"/>
