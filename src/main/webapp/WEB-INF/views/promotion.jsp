
<jsp:include page="header.jsp"/>
<jsp:include page="navigationbar.jsp"/>

<div ng-app="ngApp" ng-controller="ngCtrl" data-ng-init="fetchPromotion()">

    <div id="page-wrapper">
        <div class="header">
            <ol class="breadcrumb">
                <h3>Promotions</h3>
            </ol>
        </div>

        <div id="page-inner">
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">Promotions
                        </div>
                        <div id="panel-body" class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form role="form" name="myForm">
                                        <div class="form-group">
                                            <input class="ng-hide" ng-model="txtId"/>
                                            <label>Code</label>
                                            <input class="form-control" placeholder="Enter Code"
                                                   ng-model="txtCode" name="txtCode"/>
                                        </div>
                                        <div class="form-group">
                                            <label>Description</label>
                                            <input class="form-control" placeholder="Enter Description"
                                                   ng-model="txtDesc" name="txtDesc"/>
                                        </div>
                                        <button type="submit" class="btn btn-primary" ng-click="submitPromotion()">
                                            Submit
                                        </button>
                                        <button type="reset" class="btn btn-default" ng-click="reset()">Clear
                                        </button>
                                    </form>
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                                <div class="col-lg-6">
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
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                            </div>

                            <div class="row">
                                <div class="col-md-12"><br/>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            Table Promotions
                                        </div>
                                        <div class="panel-body">
                                            <div class="table-responsive">
                                                <table class="table table-striped table-bordered table-hover">
                                                    <thead>
                                                    <tr>
                                                        <th class="ng-hide">Id</th>
                                                        <th>Code</th>
                                                        <th>Description</th>
                                                        <th>Action</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <tr ng-repeat="promotion in promotions">
                                                        <td class="ng-hide">{{promotion.ID}}</td>
                                                        <td>{{promotion.CODE}}</td>
                                                        <td>{{promotion.DESC}}</td>
                                                        <td width="100px">
                                                            <button class="btn btn-info btn-xs" data-title="Image"
                                                                    data-toggle="modal" data-target="#images"
                                                                    ng-click="viewImage(promotion.IMAGES,promotion.ID,'POM')"><span
                                                                    class="glyphicon glyphicon-picture"></span></button>
                                                            <button class="btn btn-primary btn-xs" data-title="Edit"
                                                                    data-toggle="modal" data-target="#edit"
                                                                    ng-click="editPromotion(promotion)"><span
                                                                    class="glyphicon glyphicon-pencil"></span></button>
                                                            <button class="btn btn-danger btn-xs" data-title="Delete"
                                                                    data-toggle="modal" data-target="#delete"
                                                                    ng-click="deleteEntity(promotion.ID, $index, 'POM')"><span
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
<jsp:include page="footer.jsp"/>


