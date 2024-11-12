<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 11/10/2024
  Time: 9:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/commons/taglib.jsp"%>
<div class="content-page">
  <div class="container-fluid">
    <div class="row">
      <div class="col-lg-12">
        <div class="d-flex flex-wrap align-items-center justify-content-between mb-4">
          <div>
            <h4 class="mb-3">Category List</h4>
            <p class="mb-0">Use category list as to describe your overall core business from the provided list. <br>
              Click the name of the category where you want to add a list item. .</p>
          </div>
          <a href="${pageContext.request.contextPath}/admin/book/add" class="btn btn-primary add-list"><i class="las la-plus mr-3"></i>Add Book</a>
        </div>
      </div>
      <div class="col-lg-12">
        <div class="table-responsive rounded mb-3">
          <table class="data-table table mb-0 tbl-server-info">
            <thead class="bg-white text-uppercase">
            <tr class="ligth ligth-data">
              <th>
                <div class="checkbox d-inline-block">
                  <input type="checkbox" class="checkbox-input" id="checkbox1">
                  <label for="checkbox1" class="mb-0"></label>
                </div>
              </th>
              <th>Cover Image</th>
              <th>Title</th>
              <th>ISBN</th>
              <th>Author</th>
              <th>Publisher</th>
              <th>Publish Date</th>
              <th>Quantity</th>
              <th>Reviews</th>
              <th>Action</th>
            </tr>
            </thead>
            <tbody class="ligth-body">
            <c:forEach var="book" items="${books}">
              <tr>
                <td>
                  <div class="checkbox d-inline-block">
                    <input type="checkbox" class="checkbox-input" id="checkbox2">
                    <label for="checkbox2" class="mb-0"></label>
                  </div>
                </td>
                <td>
                  <div class="d-flex align-items-center">
                    <img src="${pageContext.request.contextPath}/uploads/${book.cover_image}" alt="Cover Image" style="width: 100px; height: 150px;" />
                    <div>
                      Organic Cream
                      <p class="mb-0"><small>This is test Product</small></p>
                    </div>
                  </div>
                </td>
                <td>${book.title}</td>
                <td>${book.isbn}</td>
                <td>
                  <c:forEach var="author" items="${book.authors}">
                    ${author.author_name}<br />
                    <c:if test="${!status.last}"> | </c:if>
                  </c:forEach>
                </td>
                <td>${book.publisher}</td>
                <td>${book.publish_date}</td>
                <td>${book.quantity}</td>
                <td>
                  <c:choose>
                    <c:when test="${not empty book.ratings}">
                      ${book.ratings.size()} (Out of 10)
                    </c:when>
                    <c:otherwise>
                      No reviews yet
                    </c:otherwise>
                  </c:choose>
                </td>
                <td>
                  <div class="d-flex align-items-center list-action">
                    <a class="badge badge-info mr-2" data-toggle="tooltip" data-placement="top" title="" data-original-title="View"
                       href="#"><i class="ri-eye-line mr-0"></i></a>
                    <a class="badge bg-success mr-2" data-toggle="tooltip" data-placement="top" title="" data-original-title="Edit"
                       href="#"><i class="ri-pencil-line mr-0"></i></a>
                    <a class="badge bg-warning mr-2" data-toggle="tooltip" data-placement="top" title="" data-original-title="Delete"
                       href="#"><i class="ri-delete-bin-line mr-0"></i></a>
                  </div>
                </td>
              </tr>
            </c:forEach>

            </tbody>
          </table>
        </div>
      </div>
    </div>

</div>
