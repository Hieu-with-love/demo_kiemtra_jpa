<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 11/10/2024
  Time: 9:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/commons/taglib.jsp"%>
<div class="wrapper">
    <c:if test="${alert !=null}">
        <h3 class="alert alertdanger">${alert}</h3>
    </c:if>
    <section class="login-content">
        <div class="container">
            <div class="row align-items-center justify-content-center height-self-center">
                <div class="col-lg-8">
                    <div class="card auth-card">
                        <div class="card-body p-0">
                            <div class="d-flex align-items-center auth-content">
                                <div class="col-lg-7 align-self-center">
                                    <div class="p-3">
                                        <h2 class="mb-2">Sign Up</h2>
                                        <p>Create your POSDash account.</p>
                                        <form action="${pageContext.request.contextPath}/register" method="post">
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <div class="floating-label form-group">
                                                        <input class="floating-input form-control" type="text" name="fullname" placeholder=" ">
                                                        <label>Full Name</label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="floating-label form-group">
                                                        <input class="floating-input form-control" type="email" name="email" placeholder=" ">
                                                        <label>Email</label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="floating-label form-group">
                                                        <input class="floating-input form-control" type="text" name="phone" placeholder=" ">
                                                        <label>Phone No.</label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="floating-label form-group">
                                                        <input class="floating-input form-control" type="password" name="password" placeholder=" ">
                                                        <label>Password</label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="floating-label form-group">
                                                        <input class="floating-input form-control" type="password" name="confirmPassword" placeholder=" ">
                                                        <label>Confirm Password</label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12">
                                                    <div class="custom-control custom-checkbox mb-3">
                                                        <input type="checkbox" class="custom-control-input" id="customCheck1">
                                                        <label class="custom-control-label" for="customCheck1">I agree with the terms of use</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <button type="submit" class="btn btn-primary">Sign Up</button>
                                            <p class="mt-3">
                                                Already have an Account <a href="${pageContext.request.contextPath}/login" class="text-primary">Sign In</a>
                                            </p>
                                        </form>
                                    </div>
                                </div>
                                <div class="col-lg-5 content-right">
                                    <img src="assets/images/login/01.png" class="img-fluid image-right" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>