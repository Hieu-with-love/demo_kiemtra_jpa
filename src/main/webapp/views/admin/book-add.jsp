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
                            <h4 class="card-title">Add Book</h4>
                        </div>
                    </div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/admin/book/add" method="post"
                              data-toggle="validator" enctype="multipart/form-data">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Title *</label>
                                        <input name="title" type="text" class="form-control" placeholder="Enter Title" data-errors="Please Enter Name." required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>isbn *</label>
                                        <input name="isbn" type="text" class="form-control" placeholder="Enter Isbn" data-errors="Please Enter Code." required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Publisher *</label>
                                        <input name="publisher" type="text" class="form-control" placeholder="Enter Publisher" data-errors="Please Enter Cost." required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Price *</label>
                                        <input name="price" type="text" class="form-control" placeholder="Enter Price" data-errors="Please Enter Price." required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>publish_date *</label>
                                        <input name="publishDate" type="text" class="form-control" placeholder="Enter publish date." data-errors="Please publish date." required>
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Authors List *</label>
                                        <select name="authorId" class="selectpicker form-control" data-style="py-0">
                                            <option selected disabled>-- Choose author --</option>
                                            <c:forEach var="au" items="${authors}">
                                                <option value="${au.author_id}">${au.author_name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Quantity *</label>
                                        <input name="quantity" type="text" class="form-control" placeholder="Enter Quantity" required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Cover Image</label>
                                        <input type="file" class="form-control image-file" name="pic" accept="image/*">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Description / Product Details</label>
                                        <textarea name="description" class="form-control" rows="4"></textarea>
                                    </div>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary mr-2">Add Book</button>
                            <button type="reset" class="btn btn-danger">Reset</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page end  -->
    </div>
</div>