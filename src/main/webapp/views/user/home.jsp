<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 11/10/2024
  Time: 9:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/views/taglibs.jsp"%>
<c:url value="/" var="URL"></c:url>
<!-- Shop Details Section Start -->
<section class="shop-details-section fix section-padding">
    <div class="container">
        <div class="shop-details-wrapper">
            <div class="row g-4">
                <div class="col-lg-5">
                    <div class="shop-details-image">
                        <div class="tab-content">
                            <div id="thumb1" class="tab-pane fade show active">
                                <div class="shop-details-thumb">
                                    <img src="${pageContext.request.contextPath}/uploads/${book.cover_image}" alt="Cover Image" style="width: 100px; height: 150px;" />
                                </div>
                            </div>
                        </div>
                        <ul class="nav">
                            <li class="nav-item">
                                <a href="#thumb1" data-bs-toggle="tab" class="nav-link active">
                                    <img src="${pageContext.request.contextPath}/uploads/${book.cover_image}" alt="Cover Image" style="width: 100px; height: 150px;" />
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-7">
                    <div class="shop-details-content">
                        <div class="title-wrapper">
                            <h2>${book.title}</h2>
                            <h5>Stock availability.</h5>
                        </div>
                        <div class="star">
                            <a href="shop-details.html"> <i class="fas fa-star"></i></a>
                            <a href="shop-details.html"><i class="fas fa-star"></i></a>
                            <a href="shop-details.html"> <i class="fas fa-star"></i></a>
                            <a href="shop-details.html"><i class="fas fa-star"></i></a>
                            <a href="shop-details.html"><i class="fa-regular fa-star"></i></a>
                            <span>(10 Customer Reviews)</span>
                        </div>
                        <ul>
                            <li></li>
                        </ul>
                        <div class="price-list">
                            <h3>${book.price}</h3>
                        </div>
                        <div class="category-box">
                            <div class="category-list">
                                <ul>
                                    <li>
                                        Title: ${book.title}
                                    </li>
                                    <li>
                                        ISBN Code: ${book.isbn}
                                    </li>
                                    <li>
                                        Publisher: ${book.publisher}
                                    </li>
                                    <li>
                                        Publisher Date: ${book.publish_date}
                                    </li>
                                    <li>
                                        quantity: ${book.quantity}
                                    </li>
                                </ul>
                                <br/>
                                <br/>

                                <ul>
                                    <li>
                                        <span>Author:</span>
                                        <c:forEach var="author" items="${book.authors}">
                                            ${author.author_name}<br />
                                            <c:if test="${!status.last}"> | </c:if>
                                        </c:forEach>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="single-tab section-padding pb-0">
                <ul class="nav mb-5" role="tablist">
                    <li class="nav-item" role="presentation">
                        <a href="#description" data-bs-toggle="tab" class="nav-link ps-0 active"
                           aria-selected="true" role="tab">
                            <h6>Description</h6>
                        </a>
                    </li>
                    <li class="nav-item" role="presentation">
                        <a href="#additional" data-bs-toggle="tab" class="nav-link" aria-selected="false"
                           tabindex="-1" role="tab">
                            <h6>Additional Information </h6>
                        </a>
                    </li>
                    <li class="nav-item" role="presentation">
                        <a href="#review" data-bs-toggle="tab" class="nav-link" aria-selected="false" tabindex="-1"
                           role="tab">
                            <h6>reviews (3)</h6>
                        </a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div id="description" class="tab-pane fade show active" role="tabpanel">
                        <div class="description-items">
                            <p>
                                Bai lam cua Tran Trung Hieu
                            </p>
                        </div>
                    </div>
                    <div id="additional" class="tab-pane fade" role="tabpanel">
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <tbody>
                                <tr>
                                    <td class="text-1">Availability</td>
                                    <td class="text-2">Available</td>
                                </tr>
                                <tr>
                                    <td class="text-1">Categories</td>
                                    <td class="text-2">Book</td>
                                </tr>
                                <tr>
                                    <td class="text-1">Publish Date</td>
                                    <td class="text-2">${book.publish_date}</td>
                                </tr>
                                <tr>
                                    <td class="text-1">Total Page</td>
                                    <td class="text-2">330</td>
                                </tr>
                                <tr>
                                    <td class="text-1">Author</td>
                                    <c:forEach var="author" items="${book.authors}">
                                        <td> ${author.author_name}<br /></td>
                                    </c:forEach>
                                </tr>
                                <tr>
                                    <td class="text-1">Quantity</td>
                                    <td class="text-2">${book.quantity}</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div id="review" class="tab-pane fade" role="tabpanel">
                        <div class="review-items">
                            <div class="review-wrap-area d-flex gap-4">
                                <div class="review-thumb">
                                    <img src="{URL}${URL}template-user/assets/img/shop-details/review.png" alt="img">
                                </div>
                                <div class="review-content">
                                    <div
                                            class="head-area d-flex flex-wrap gap-2 align-items-center justify-content-between">
                                        <div class="cont">
                                            <h5><a href="news-details.html">Leslie Alexander</a></h5>
                                            <span>February 10, 2024 at 2:37 pm</span>
                                        </div>
                                        <div class="star">
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-regular fa-star"></i>
                                        </div>
                                    </div>
                                    <p class="mt-30 mb-4">
                                        Neque porro est qui dolorem ipsum quia quaed inventor veritatis et quasi
                                        architecto var sed efficitur turpis gilla sed sit amet finibus eros. Lorem
                                        Ipsum is <br> simply dummy
                                    </p>
                                </div>
                            </div>
                            <div class="review-title mt-5 py-15 mb-30">
                                <h4>Your Rating*</h4>
                                <div class="rate-now d-flex align-items-center">
                                    <p>Your Rating*</p>
                                    <div class="star">
                                        <i class="fa-light fa-star"></i>
                                        <i class="fa-light fa-star"></i>
                                        <i class="fa-light fa-star"></i>
                                        <i class="fa-light fa-star"></i>
                                        <i class="fa-light fa-star"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="review-form">
                                <form action="#" id="contact-form" method="POST">
                                    <div class="row g-4">
                                        <div class="col-lg-6">
                                            <div class="form-clt">
                                                <span>Your Name*</span>
                                                <input type="text" name="name" id="name" placeholder="Your Name">
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-clt">
                                                <span>Your Email*</span>
                                                <input type="text" name="email" id="email" placeholder="Your Email">
                                            </div>
                                        </div>
                                        <div class="col-lg-12 wow fadeInUp animated" data-wow-delay=".8">
                                            <div class="form-clt">
                                                <span>Message*</span>
                                                <textarea name="message" id="message"
                                                          placeholder="Write Message"></textarea>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 wow fadeInUp animated" data-wow-delay=".9">
                                            <div class="form-check d-flex gap-2 from-customradio">
                                                <input type="checkbox" class="form-check-input"
                                                       name="flexRadioDefault" id="flexRadioDefault12">
                                                <label class="form-check-label" for="flexRadioDefault12">
                                                    i accept your terms & conditions
                                                </label>
                                            </div>
                                            <button type="submit" class="theme-btn">
                                                Submit now
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Top Ratting Book Section Start -->
<section class="top-ratting-book-section fix section-padding pt-0">
    <div class="container">
        <div class="section-title text-center">
            <h2 class="mb-3 wow fadeInUp" data-wow-delay=".3s">Related Products</h2>
            <p class="wow fadeInUp" data-wow-delay=".5s">
                Interdum et malesuada fames ac ante ipsum primis in faucibus. <br> Donec at nulla nulla. Duis
                posuere ex lacus
            </p>
        </div>
        <div class="swiper book-slider">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <div class="shop-box-items style-2">
                        <div class="book-thumb center">
                            <a href="shop-details-2.html"><img src="{URL}${URL}template-user/assets/img/book/01.png" alt="img"></a>
                            <ul class="post-box">
                                <li>
                                    Hot
                                </li>
                                <li>
                                    -30%
                                </li>
                            </ul>
                            <ul class="shop-icon d-grid justify-content-center align-items-center">
                                <li>
                                    <a href="shop-cart.html"><i class="far fa-heart"></i></a>
                                </li>
                            </ul>
                            <ul class="shop-icon d-grid justify-content-center align-items-center">
                                <li>
                                    <a href="shop-cart.html"><i class="far fa-heart"></i></a>
                                </li>
                                <li>
                                    <a href="shop-cart.html">

                                        <img class="icon" src="{URL}${URL}template-user/assets/img/icon/shuffle.svg" alt="svg-icon">
                                    </a>
                                </li>
                                <li>
                                    <a href="shop-details.html"><i class="far fa-eye"></i></a>
                                </li>
                            </ul>
                        </div>
                        <div class="shop-content">
                            <h5> Design Low Book </h5>
                            <h3><a href="shop-details.html">Simple Things You To <br> Save BOOK</a></h3>
                            <ul class="price-list">
                                <li>$30.00</li>
                                <li>
                                    <del>$39.99</del>
                                </li>
                            </ul>
                            <ul class="author-post">
                                <li class="authot-list">
                                        <span class="thumb">
                                            <img src="{URL}${URL}template-user/assets/img/testimonial/client-1.png" alt="img">
                                        </span>
                                    <span class="content">Wilson</span>
                                </li>

                                <li class="star">
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-regular fa-star"></i>
                                </li>
                            </ul>
                        </div>
                        <div class="shop-button">
                            <a href="shop-details.html" class="theme-btn"><i
                                    class="fa-solid fa-basket-shopping"></i> Add To Cart</a>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="shop-box-items style-2">
                        <div class="book-thumb center">
                            <a href="shop-details-2.html"><img src="{URL}${URL}template-user/assets/img/book/02.png" alt="img"></a>
                            <ul class="shop-icon d-grid justify-content-center align-items-center">
                                <li>
                                    <a href="shop-cart.html"><i class="far fa-heart"></i></a>
                                </li>
                                <li>
                                    <a href="shop-cart.html">

                                        <img class="icon" src="{URL}${URL}template-user/assets/img/icon/shuffle.svg" alt="svg-icon">
                                    </a>
                                </li>
                                <li>
                                    <a href="shop-details.html"><i class="far fa-eye"></i></a>
                                </li>
                            </ul>
                        </div>
                        <div class="shop-content">
                            <h5> Design Low Book </h5>
                            <h3><a href="shop-details.html">How Deal With Very <br> Bad BOOK</a></h3>
                            <ul class="price-list">
                                <li>$30.00</li>
                                <li>
                                    <del>$39.99</del>
                                </li>
                            </ul>
                            <ul class="author-post">
                                <li class="authot-list">
                                        <span class="thumb">
                                            <img src="{URL}${URL}template-user/assets/img/testimonial/client-2.png" alt="img">
                                        </span>
                                    <span class="content">Alexander</span>
                                </li>

                                <li class="star">
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-regular fa-star"></i>
                                </li>
                            </ul>
                        </div>
                        <div class="shop-button">
                            <a href="shop-details.html" class="theme-btn"><i
                                    class="fa-solid fa-basket-shopping"></i> Add To Cart</a>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="shop-box-items style-2">
                        <div class="book-thumb center">
                            <a href="shop-details-2.html"><img src="{URL}${URL}template-user/assets/img/book/03.png" alt="img"></a>
                            <ul class="shop-icon d-grid justify-content-center align-items-center">
                                <li>
                                    <a href="shop-cart.html"><i class="far fa-heart"></i></a>
                                </li>
                                <li>
                                    <a href="shop-cart.html">

                                        <img class="icon" src="{URL}${URL}template-user/assets/img/icon/shuffle.svg" alt="svg-icon">
                                    </a>
                                </li>
                                <li>
                                    <a href="shop-details.html"><i class="far fa-eye"></i></a>
                                </li>
                            </ul>
                        </div>
                        <div class="shop-content">
                            <h5> Design Low Book </h5>
                            <h3><a href="shop-details.html">Qple GPad With Retina <br> Sisplay</a></h3>
                            <ul class="price-list">
                                <li>$30.00</li>
                                <li>
                                    <del>$39.99</del>
                                </li>
                            </ul>
                            <ul class="author-post">
                                <li class="authot-list">
                                        <span class="thumb">
                                            <img src="{URL}${URL}template-user/assets/img/testimonial/client-3.png" alt="img">
                                        </span>
                                    <span class="content">Esther</span>
                                </li>

                                <li class="star">
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-regular fa-star"></i>
                                </li>
                            </ul>
                        </div>
                        <div class="shop-button">
                            <a href="shop-details.html" class="theme-btn"><i
                                    class="fa-solid fa-basket-shopping"></i> Add To Cart</a>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="shop-box-items style-2">
                        <div class="book-thumb center">
                            <a href="shop-details-2.html"><img src="{URL}${URL}template-user/assets/img/book/04.png" alt="img"></a>
                            <ul class="post-box">
                                <li>
                                    Hot
                                </li>
                            </ul>
                            <ul class="shop-icon d-grid justify-content-center align-items-center">
                                <li>
                                    <a href="shop-cart.html"><i class="far fa-heart"></i></a>
                                </li>
                                <li>
                                    <a href="shop-cart.html">

                                        <img class="icon" src="{URL}${URL}template-user/assets/img/icon/shuffle.svg" alt="svg-icon">
                                    </a>
                                </li>
                                <li>
                                    <a href="shop-details.html"><i class="far fa-eye"></i></a>
                                </li>
                            </ul>
                        </div>
                        <div class="shop-content">
                            <h5> Design Low Book </h5>
                            <h3><a href="shop-details.html">Qple GPad With Retina <br> Sisplay</a></h3>
                            <ul class="price-list">
                                <li>$30.00</li>
                                <li>
                                    <del>$39.99</del>
                                </li>
                            </ul>
                            <ul class="author-post">
                                <li class="authot-list">
                                        <span class="thumb">
                                            <img src="{URL}${URL}template-user/assets/img/testimonial/client-4.png" alt="img">
                                        </span>
                                    <span class="content">Hawkins</span>
                                </li>

                                <li class="star">
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-regular fa-star"></i>
                                </li>
                            </ul>
                        </div>
                        <div class="shop-button">
                            <a href="shop-details.html" class="theme-btn"><i
                                    class="fa-solid fa-basket-shopping"></i> Add To Cart</a>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="shop-box-items style-2">
                        <div class="book-thumb center">
                            <a href="shop-details-2.html"><img src="{URL}${URL}template-user/assets/img/book/05.png" alt="img"></a>
                            <ul class="shop-icon d-grid justify-content-center align-items-center">
                                <li>
                                    <a href="shop-cart.html"><i class="far fa-heart"></i></a>
                                </li>
                                <li>
                                    <a href="shop-cart.html">

                                        <img class="icon" src="{URL}${URL}template-user/assets/img/icon/shuffle.svg" alt="svg-icon">
                                    </a>
                                </li>
                                <li>
                                    <a href="shop-details.html"><i class="far fa-eye"></i></a>
                                </li>
                            </ul>
                        </div>
                        <div class="shop-content">
                            <h5> Design Low Book </h5>
                            <h3><a href="shop-details.html">Simple Things You To <br> Save BOOK</a></h3>
                            <ul class="price-list">
                                <li>$30.00</li>
                                <li>
                                    <del>$39.99</del>
                                </li>
                            </ul>
                            <ul class="author-post">
                                <li class="authot-list">
                                        <span class="thumb">
                                            <img src="{URL}${URL}template-user/assets/img/testimonial/client-5.png" alt="img">
                                        </span>
                                    <span class="content">(Author) Albert</span>
                                </li>

                                <li class="star">
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-regular fa-star"></i>
                                </li>
                            </ul>
                        </div>
                        <div class="shop-button">
                            <a href="shop-details.html" class="theme-btn"><i
                                    class="fa-solid fa-basket-shopping"></i> Add To Cart</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>