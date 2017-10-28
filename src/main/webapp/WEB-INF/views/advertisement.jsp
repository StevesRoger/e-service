
<jsp:include page="header.jsp"/>
<jsp:include page="navigationbar.jsp"/>

<div ng-app="ngApp" ng-controller="ngCtrl" data-ng-init="fetchAdvertisement()">

    <div id="page-wrapper">
        <div class="header">
            <ol class="breadcrumb">
                <h3>Advertisement</h3>
            </ol>
        </div>

        <div id="page-inner">
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">Advertisement
                        </div>
                        <div id="panel-body" class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form role="form" name="myForm">
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
                                        <button type="submit" class="btn btn-primary" ng-click="submitAdvertisement()">
                                            Submit
                                        </button>
                                        <button type="reset" class="btn btn-default" ng-click="reset()">Clear
                                        </button>
                                    </form>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12"><br/>
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                            <div id="grid" style="margin-top: 5px">

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

</div>


