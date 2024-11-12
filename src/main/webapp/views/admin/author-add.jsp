<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 11/12/2024
  Time: 12:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/commons/taglib.jsp"%>
<div class="content-page">
    <div class="container-fluid add-form-list">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between">
                        <div class="header-title">
                            <h4 class="card-title">Add Author</h4>
                        </div>
                    </div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/admin/book/author" method="post" data-toggle="validator">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Author name *</label>
                                        <input name="name" type="text" class="form-control" placeholder="Enter Title" data-errors="Please Enter Name." required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Date of birth *</label>
                                        <input name="dob" type="text" class="form-control" placeholder="Enter publish date." data-errors="Please publish date." required>
                                    </div>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary mr-2">Add Author</button>
                            <button type="reset" class="btn btn-danger">Reset</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page end  -->
    </div>
</div>