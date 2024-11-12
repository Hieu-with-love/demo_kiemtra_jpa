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
        <div class="d-flex flex-wrap flex-wrap align-items-center justify-content-between mb-4">
          <div>
            <h4 class="mb-3">Book List</h4>
            <p class="mb-0">The Book list effectively dictates book presentation and provides space<br> to list your Books and offering in the most appealing way.</p>
          </div>
          <a href="${pageContext.request.contextPath}/admin/book/add" class="btn btn-primary add-list"><i class="las la-plus mr-3"></i>Add Book</a>
        </div>
      </div>
      <div class="col-lg-12">
        <div class="table-responsive rounded mb-3">
          <table class="data-tables table mb-0 tbl-server-info">
            <thead class="bg-white text-uppercase">
            <tr class="ligth ligth-data">
              <th>Book</th>
              <th>Code</th>
              <th>Category</th>
              <th>Price</th>
              <th>Brand Name</th>
              <th>Cost</th>
              <th>Quantity</th>
              <th>Review</th>
              <th>Action</th>
            </tr>
            </thead>
            <tbody class="ligth-body">
            <c:forEach var="book" items="${books}">
              <tr>
                <td>
                  <div class="d-flex align-items-center">
                    <img src="${pageContext.request.contextPath}/uploads/${book.cover_image}" alt="Cover Image" style="width: 100px; height: 150px;" />
                    <div>
                      <a href="${pageContext.request.contextPath}/user/home?bookId=${book.bookid}">Popular Books</a>
                      <p class="mb-0"><small>This is test Book</small></p>
                    </div>
                  </div>
                </td>
                <td><a href="${pageContext.request.contextPath}/user/home?bookId=${book.bookid}">${book.title}</a></td>
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
                       href="${pageContext.request.contextPath}/admin/book/update?bookId=${book.bookid}"><i class="ri-pencil-line mr-0"></i></a>
                    <a class="badge bg-warning mr-2" data-toggle="tooltip" data-placement="top" title="" data-original-title="Delete"
                       href="${pageContext.request.contextPath}/admin/book/delete?bookId=${book.bookid}"><i class="ri-delete-bin-line mr-0"></i></a>
                  </div>
                </td>
              </tr>
            </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </div>
    <!-- Page end  -->
  </div>
  <!-- Modal Edit -->
  <div class="modal fade" id="edit-note" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-body">
          <div class="popup text-left">
            <div class="media align-items-top justify-content-between">
              <h3 class="mb-3">Book</h3>
              <div class="btn-cancel p-0" data-dismiss="modal"><i class="las la-times"></i></div>
            </div>
            <div class="content edit-notes">
              <div class="card card-transparent card-block card-stretch event-note mb-0">
                <div class="card-body px-0 bukmark">
                  <div class="d-flex align-items-center justify-content-between pb-2 mb-3 border-bottom">
                    <div class="quill-tool">
                    </div>
                  </div>
                  <div id="quill-toolbar1">
                    <p>Virtual Digital Marketing Course every week on Monday, Wednesday and Saturday.Virtual Digital Marketing Course every week on Monday</p>
                  </div>
                </div>
                <div class="card-footer border-0">
                  <div class="d-flex flex-wrap align-items-ceter justify-content-end">
                    <div class="btn btn-primary mr-3" data-dismiss="modal">Cancel</div>
                    <div class="btn btn-outline-primary" data-dismiss="modal">Save</div>
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
