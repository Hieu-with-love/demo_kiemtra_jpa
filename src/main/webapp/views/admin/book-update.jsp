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
                            <h4 class="card-title">Update Book</h4>
                        </div>
                    </div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/admin/book/update"
                              method="post" enctype="multipart/form-data">
                            <div class="row">
                                <!-- Title Field -->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="title">Title *</label>
                                        <input id="title" name="title" type="text" class="form-control"
                                               value="${book.title}" placeholder="Enter Title" required>
                                    </div>
                                </div>

                                <!-- ISBN Field -->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="isbn">ISBN *</label>
                                        <input id="isbn" name="isbn" type="text" class="form-control"
                                               value="${book.isbn}" placeholder="Enter ISBN" required>
                                    </div>
                                </div>

                                <!-- Publisher Field -->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="publisher">Publisher *</label>
                                        <input id="publisher" name="publisher" type="text" class="form-control"
                                               value="${book.publisher}" placeholder="Enter Publisher" required>
                                    </div>
                                </div>

                                <!-- Price Field -->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="price">Price *</label>
                                        <input id="price" name="price" type="text" class="form-control"
                                               value="${book.price}" placeholder="Enter Price" required>
                                    </div>
                                </div>

                                <!-- Publish Date Field -->
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="publishDate">Publish Date *</label>
                                        <input id="publishDate" name="publishDate" type="text" class="form-control"
                                               value="${book.publish_date}" placeholder="Enter Publish Date" required>
                                    </div>
                                </div>

                                <!-- Author List -->
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="authorId">Authors List *</label>
                                        <select id="authorId" name="authorId" class="form-control" required>
                                            <option selected disabled>-- Choose author --</option>
                                            <c:forEach var="author" items="${authors}">
                                                <option value="${author.id}" ${book.authorId == author.id ? 'selected' : ''}>
                                                        ${author.name}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <!-- Quantity Field -->
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="quantity">Quantity *</label>
                                        <input id="quantity" name="quantity" type="text" class="form-control"
                                               value="${book.quantity}" placeholder="Enter Quantity" required>
                                    </div>
                                </div>

                                <!-- Cover Image Field -->
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="pic">Cover Image</label>
                                        <input id="pic" type="file" class="form-control" name="pic" accept="image/*">
                                    </div>
                                </div>

                                <!-- Description Field -->
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="description">Description / Book Details</label>
                                        <textarea id="description" name="description" class="form-control" rows="4">${book.description}</textarea>
                                    </div>
                                </div>

                                <!-- Submit and Reset Buttons -->
                                <div class="col-md-12">
                                    <button type="submit" class="btn btn-primary mr-2">Update Book</button>
                                    <button type="reset" class="btn btn-danger">Reset</button>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
        <!-- Page end  -->
    </div>
</div>