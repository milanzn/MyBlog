<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<footer class="main-footer">
      <div class="container">
        <div class="row">
          <div class="col-md-4">
            <div class="logo">
              <h6 class="text-white">My Blog</h6>
            </div>
            <div class="contact-details">
              <p>11080 Zemun, Galenika</p>
              <p>Phone: (011) 123 456 789</p>
              <p>Email: <a href="mailto:info@company.com">Info@Company.com</a></p>
              <ul class="social-menu">
                <li class="list-inline-item"><a href="#"><i class="fa fa-facebook"></i></a></li>
                <li class="list-inline-item"><a href="#"><i class="fa fa-twitter"></i></a></li>
                <li class="list-inline-item"><a href="#"><i class="fa fa-instagram"></i></a></li>
                <li class="list-inline-item"><a href="#"><i class="fa fa-behance"></i></a></li>
                <li class="list-inline-item"><a href="#"><i class="fa fa-pinterest"></i></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md-4">
            <div class="menus d-flex">
              <ul class="list-unstyled">
                <li> <a href="index">Home</a></li>
                <li> <a href="blog">Blog</a></li>
                <li> <a href="contact">Contact</a></li>
                <li> <a href="http://localhost:8087/login-page">Login</a></li>
              </ul>
              <ul class="list-unstyled">
              
             <c:forEach var="c" items="${categories}">
                <li> <a href="/blog-category/${c.seoTitle}/${c.id}">${c.name}</a></li>

              </c:forEach>
              </ul>
            </div>
          </div>
          <div class="col-md-4">
            <div class="latest-posts">
            
            <c:forEach var="b3" items="${blog3}">
            
            <a href="/blog-post/${b3.seoTitle}/${b3.id}">
                <div class="post d-flex align-items-center">
         		<div class="image"><img src="${pageContext.request.contextPath}/front/img/small-thumbnail-1.jpg" alt="..." class="img-fluid"></div>
                <div class="title"><strong>${b3.title}</strong><span class="date last-meta"><fmt:formatDate value="${b3.dateCreated}" pattern="MMM dd, yyyy"/></span></div>
                </div>
              </a>
              
            </c:forEach>  

                
                
             </div>
          </div>
        </div>
      </div>
      <div class="copyrights">
        <div class="container">
          <div class="row">
            <div class="col-md-6">
              <p>&copy; 2021. All rights reserved. Your great site.</p>
            </div>
            <div class="col-md-6 text-right">
              <p>Template By <a href="https://bootstrapious.com/p/bootstrap-carousel" class="text-white">Bootstrapious</a>
                <!-- Please do not remove the backlink to Bootstrap Temple unless you purchase an attribution-free license @ Bootstrap Temple or support us at http://bootstrapious.com/donate. It is part of the license conditions. Thanks for understanding :)                         -->
              </p>
            </div>
          </div>
        </div>
      </div>
    </footer>
    