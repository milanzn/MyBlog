<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
     <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Bootstrap Blog - B4 Template by Bootstrap Temple</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front/vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front/vendor/font-awesome/css/font-awesome.min.css">
    <!-- Custom icon font-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front/css/fontastic.css">
    <!-- Google fonts - Open Sans-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
    <!-- Fancybox-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front/vendor/@fancyapps/fancybox/jquery.fancybox.min.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front/css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front/css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="favicon.png">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
  </head>
  <body>
  
  
		<jsp:include page="include-front-header.jsp"/>
    
    
    
    <div class="container">
    
    <h2 class="mb-3">Posts by author: "${HeadTitle}"</h2>
      <div class="row">
        <!-- Latest Posts -->
        <main class="posts-listing col-lg-8"> 
          <div class="container">
            <div class="row">
            
            <c:forEach var="blog" items="${blog12}">
              <!-- post -->
              
              <div class="post col-xl-6">
                <div class="post-thumbnail"><a href="/blog-post/${blog.seoTitle}/${blog.id}"><img src="${pageContext.request.contextPath}/front/img/blog-post-1.jpeg" alt="..." class="img-fluid"></a></div>
                <div class="post-details">
                  <div class="post-meta d-flex justify-content-between">
                    <div class="date meta-last"><fmt:formatDate value="${blog.dateCreated}" pattern="dd MMM | yyyy"/></div>
                    <div class="category">
                   
                  <c:choose>
                  
                  <c:when test="${!blog.category.name.contains('Uncatogorizied')}">
                  	<a href="/blog-category/${blog.category.seoTitle}/${blog.category.id}"> ${blog.category.name}</a>
                  </c:when>
                  <c:otherwise>
                  	<a href="#">${blog.category.name}</a>
                  </c:otherwise>
               
                  </c:choose>                    
                    
                    </div>
                  </div><a href="/blog-post/${blog.seoTitle}/${blog.id}">
                    <h3 class="h4">${blog.title}</h3></a>
                  <p class="text-muted">${blog.description}"</p>
                  <footer class="post-footer d-flex align-items-center"><a href="/blog-author/${blog.user.seoTitle}/${blog.user.username}" class="author d-flex align-items-center flex-wrap">
                      <div class="avatar"><img src="${pageContext.request.contextPath}/front/img/${blog.user.image}" alt="..." class="img-fluid"></div>
                      <div class="title"><span>${blog.user.name}</span></div></a>
                    <div class="date"><i class="icon-clock"></i> ${blog.timeAgo}</div>
                    <div class="comments meta-last"><i class="icon-comment"></i>"${blog.numberComments}"</div>
                  </footer>
                </div>
              </div>
              
              </c:forEach>
            
            </div>
            
          
            <!-- Pagination -->
            <nav aria-label="Page navigation example">
              <ul class="pagination pagination-template d-flex justify-content-center">
                
                <c:choose>
                <c:when test="${curentPage > 1 && curentPage != null}">
                	<li class="page-item"><a href="/blog-author/${userSeoTitle}/${username}/${curentPage - 1}" class="page-link"> <i class="fa fa-angle-left"></i></a></li>
                </c:when>
                <c:otherwise>
                	<li class="page-item"><a href="/blog-author/${userSeoTitle}/${username}/${curentPage}" class="page-link"> <i class="fa fa-angle-left"></i></a></li>
                </c:otherwise>
                </c:choose>
                
                <c:forEach begin="1" end="${totalPage}" varStatus="broj">
               
        		<c:choose>
                		<c:when test="${broj.count == curentPage}">
                		 <li class="page-item"><a href="/blog-author/${userSeoTitle}/${username}/${broj.count}" class="page-link active">${broj.count}</a></li>
                		</c:when>
                		<c:otherwise>
                		<li class="page-item"><a href="/blog-author/${userSeoTitle}/${username}/${broj.count}" class="page-link">${broj.count}</a></li>
        		
                		</c:otherwise>
               </c:choose>
        		
        		
        		</c:forEach>
        		
                 <c:choose>
                <c:when test="${curentPage != totalPage}">
                	<li class="page-item"><a href="/blog-author/${userSeoTitle}/${username}/${curentPage + 1}" class="page-link"> <i class="fa fa-angle-right"></i></a></li>
                </c:when>
                <c:otherwise>
                	<li class="page-item"><a href="/blog-author/${userSeoTitle}/${username}/${curentPage}" class="page-link"> <i class="fa fa-angle-right"></i></a></li>
                </c:otherwise>
                </c:choose>       		
        		
        
                
              </ul>
            </nav>
          </div>
        </main>
        
        
        <jsp:include page="include-front-aside.jsp"/>
        
        
      </div>
    </div>
    <!-- Page Footer-->
 
 	<jsp:include page="include-front-footer.jsp"/>    
    
    <!-- JavaScript files-->
    <script src="${pageContext.request.contextPath}/front/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/front/vendor/popper.js/umd/popper.min.js"> </script>
    <script src="${pageContext.request.contextPath}/front/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/front/vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="${pageContext.request.contextPath}/front/vendor/@fancyapps/fancybox/jquery.fancybox.min.js"></script>
    <script src="${pageContext.request.contextPath}/front/js/front.js"></script>
  </body>
</html>