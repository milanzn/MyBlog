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
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/front/favicon.png">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->


    
    <!-- owl carousel 2 stylesheet-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front/plugins/owl-carousel2/assets/owl.carousel.min.css" id="theme-stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front/plugins/owl-carousel2/assets/owl.theme.default.min.css" id="theme-stylesheet">
  </head>
  <body>
	
	<jsp:include page="include-front-header.jsp"/>

    <!-- Hero Section-->
    
    
    
    <div id="index-slider" class="owl-carousel">
    
    <c:forEach var="slider" items="${sliders}">
      <section style="background: url(${pageContext.request.contextPath}/front/img/${slider.image}); background-size: cover; background-position: center center" class="hero">
        <div class="container">
          <div class="row">
            <div class="col-lg-7">
              <h1>${slider.title}</h1>
              <a href="${slider.url}" class="hero-link">${slider.buttonTitle}</a>
            </div>
          </div>
        </div>
      </section>
	</c:forEach>


    </div>



    <!-- Intro Section-->
    <section class="intro">
      <div class="container">
        <div class="row">
          <div class="col-lg-8">
            <h2 class="h3">Some great intro here</h2>
            <p class="text-big">Place a nice <strong>introduction</strong> here <strong>to catch reader's attention</strong>.</p>
          </div>
        </div>
      </div>
    </section>

    
    <section class="featured-posts no-padding-top">
    
    

    
      <div class="container">
      
      
      <c:forEach var="b" items="${blogs}" varStatus="counter">
    
    	<c:choose>
    		
    		<c:when test="${counter.count ne 2}">
    
    
		    <!-- Post odd-->
		        <div class="row d-flex align-items-stretch">
		          <div class="text col-lg-7">
		            <div class="text-inner d-flex align-items-center">
		              <div class="content">
		                <header class="post-header">
		                  <div class="category">
		           <c:choose>
                  
                  <c:when test="${!b.category.name.contains('Uncatogorizied')}">
                  	<a href="/blog-category/${b.category.seoTitle}/${b.category.id}"> ${b.category.name}</a>
                  </c:when>
                  <c:otherwise>
                  	<a href="#">${b.category.name}</a>
                  </c:otherwise>
               
                  </c:choose>
		                  </div>
		                  <a href="/blog-post/${b.seoTitle}/${b.id}"><h2 class="h4">${b.title}</h2></a>
		                </header>
		                <p>${b.description}</p>
		                <footer class="post-footer d-flex align-items-center"><a href="/blog-author/${b.user.seoTitle}/${b.user.username}" class="author d-flex align-items-center flex-wrap">
		                    <div class="avatar"><img src="${b.imagePath}/${b.user.image}" alt="..." class="img-fluid"></div>
		                    <div class="title"><span>${b.user.name}</span></div></a>
		                  <div class="date"><i class="icon-clock"></i> ${b.timeAgo}</div>
		                  <div class="comments"><i class="icon-comment"></i>${b.numberComments}</div>
		                </footer>
		              </div>
		            </div>
		          </div>
		          <div class="image col-lg-5"><img src="${pageContext.request.contextPath}/front/img/${b.image}" alt="..."></div>
		        </div>
		        
        
        
    
    
    
    
    </c:when>
    
    <c:otherwise>
    
     <!-- Post  2nd      -->
        <div class="row d-flex align-items-stretch">
          <div class="image col-lg-5"><img src="${pageContext.request.contextPath}/front/img/${b.image}" alt="..."></div>
          <div class="text col-lg-7">
            <div class="text-inner d-flex align-items-center">
              <div class="content">
                <header class="post-header">
                  <div class="category">
                  <c:choose>
                  
                  <c:when test="${!b.category.name.contains('Uncatogorizied')}">
                  	<a href="blog-category/${b.category.seoTitle}/${b.category.id}"> ${b.category.name}</a>
                  </c:when>
                  <c:otherwise>
                  	<a href="#">${b.category.name}</a>
                  </c:otherwise>
               
                  </c:choose>
                  </div>
                  <a href="/blog-post/${b.seoTitle}/${b.id}"><h2 class="h4">${b.title}</h2></a>
                </header>
                <p>${b.description}</p>
                <footer class="post-footer d-flex align-items-center"><a href="blog-author/${b.user.seoTitle}/${b.user.username}" class="author d-flex align-items-center flex-wrap">
                    <div class="avatar"><img src="${b.imagePath}/${b.user.image}" alt="..." class="img-fluid"></div>
                    <div class="title"><span>${b.user.name}</span></div></a>
                  <div class="date"><i class="icon-clock"></i>${b.timeAgo}</div>
                  <div class="comments"><i class="icon-comment"></i>${b.numberComments}</div>
                </footer>
              </div>
            </div>
          </div>
        </div>
 
    		</c:otherwise>
  
    	</c:choose>

    </c:forEach>
      
    </div>
    </section>
    
    
    <!-- Divider Section-->
    <section style="background: url(${pageContext.request.contextPath}/front/img/divider-bg.jpg); background-size: cover; background-position: center bottom" class="divider">
      <div class="container">
        <div class="row">
          <div class="col-md-7">
            <h2>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</h2>
            <a href="contact" class="hero-link">Contact Us</a>
          </div>
        </div>
      </div>
    </section>
    <!-- Latest Posts -->
    <section class="latest-posts"> 
      <div class="container">
        <header> 
          <h2>Latest from the blog</h2>
          <p class="text-big">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
        </header>
        
        
        
        <div class="owl-carousel" id="latest-posts-slider">
        
    
          <div class="row">
          
              <c:forEach var="blog" items="${blog12}" begin="0" end="2">
       
       
            <div class="post col-md-4">
              <div class="post-thumbnail"><a href="/blog-post/${blog.seoTitle}/${blog.id}"><img src="${pageContext.request.contextPath}/front/img/blog-1.jpg" alt="..." class="img-fluid"></a></div>
              <div class="post-details">
                <div class="post-meta d-flex justify-content-between">
                  <div class="date"><fmt:formatDate value="${blog.dateCreated}" pattern="dd MMM | yyyy"/></div>
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
                <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.</p>
              </div>
            </div>
           
         
        </c:forEach>     
          </div>
 

          <div class="row">
   
       
         <c:forEach var="blog" items="${blog12}" begin="3" end="5">
            <div class="post col-md-4">
              <div class="post-thumbnail"><a href="/blog-post/${blog.seoTitle}/${blog.id}"><img src="${pageContext.request.contextPath}/front/img/blog-1.jpg" alt="..." class="img-fluid"></a></div>
              <div class="post-details">
                <div class="post-meta d-flex justify-content-between">
                  <div class="date"><fmt:formatDate value="${blog.dateCreated}" pattern="dd MMM | yyyy"/></div>
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
                <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.</p>
              </div>
            </div>
           
      </c:forEach>      
            
          </div>
 
 
           <div class="row">
   
       
         <c:forEach var="blog" items="${blog12}" begin="6" end="8">
            <div class="post col-md-4">
              <div class="post-thumbnail"><a href="/blog-post/${blog.seoTitle}/${blog.id}"><img src="${pageContext.request.contextPath}/front/img/blog-1.jpg" alt="..." class="img-fluid"></a></div>
              <div class="post-details">
                <div class="post-meta d-flex justify-content-between">
                  <div class="date"><fmt:formatDate value="${blog.dateCreated}" pattern="dd MMM | yyyy"/></div>
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
                <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.</p>
              </div>
            </div>
           
      </c:forEach>      
            
          </div>
          
           <div class="row">
   
       
         <c:forEach var="blog" items="${blog12}" begin="9" end="11">
            <div class="post col-md-4">
              <div class="post-thumbnail"><a href="/blog-post/${blog.seoTitle}/${blog.id}"><img src="${pageContext.request.contextPath}/front/img/blog-1.jpg" alt="..." class="img-fluid"></a></div>
              <div class="post-details">
                <div class="post-meta d-flex justify-content-between">
                  <div class="date"><fmt:formatDate value="${blog.dateCreated}" pattern="dd MMM | yyyy"/></div>
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
                <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.</p>
              </div>
            </div>
           
      </c:forEach>      
            
          </div>
          
    
          
        </div>
        
         
        
      </div>
    </section>
    <!-- Gallery Section-->
    <section class="gallery no-padding">    
      <div class="row">
        <div class="mix col-lg-3 col-md-3 col-sm-6">
          <div class="item">
            <a href="${pageContext.request.contextPath}/front/img/gallery-1.jpg" data-fancybox="gallery" class="image">
              <img src="${pageContext.request.contextPath}/front/img/gallery-1.jpg" alt="gallery image alt 1" class="img-fluid" title="gallery image title 1">
              <div class="overlay d-flex align-items-center justify-content-center"><i class="icon-search"></i></div>
            </a>
          </div>
        </div>
        <div class="mix col-lg-3 col-md-3 col-sm-6">
          <div class="item">
            <a href="${pageContext.request.contextPath}/front/img/gallery-2.jpg" data-fancybox="gallery" class="image">
              <img src="${pageContext.request.contextPath}/front/img/gallery-2.jpg" alt="gallery image alt 2" class="img-fluid" title="gallery image title 2">
              <div class="overlay d-flex align-items-center justify-content-center"><i class="icon-search"></i></div>
            </a>
          </div>
        </div>
        <div class="mix col-lg-3 col-md-3 col-sm-6">
          <div class="item">
            <a href="${pageContext.request.contextPath}/front/img/gallery-3.jpg" data-fancybox="gallery" class="image">
              <img src="${pageContext.request.contextPath}/front/img/gallery-3.jpg" alt="gallery image alt 3" class="img-fluid" title="gallery image title 3">
              <div class="overlay d-flex align-items-center justify-content-center"><i class="icon-search"></i></div>
            </a>
          </div>
        </div>
        <div class="mix col-lg-3 col-md-3 col-sm-6">
          <div class="item">
            <a href="${pageContext.request.contextPath}/front/img/gallery-4.jpg" data-fancybox="gallery" class="image">
              <img src="${pageContext.request.contextPath}/front/img/gallery-4.jpg" alt="gallery image alt 4" class="img-fluid" title="gallery image title 4">
              <div class="overlay d-flex align-items-center justify-content-center"><i class="icon-search"></i></div>
            </a>
          </div>
        </div>
        
      </div>
    </section>
    
    
    
    
    <!-- Page Footer-->
    
	<jsp:include page="include-front-footer.jsp"/>    
    
    
    <!-- JavaScript files-->
    <script src="${pageContext.request.contextPath}/front/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/front/vendor/popper.js/umd/popper.min.js"> </script>
    <script src="${pageContext.request.contextPath}/front/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/front/vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="${pageContext.request.contextPath}/front/vendor/@fancyapps/fancybox/jquery.fancybox.min.js"></script>
    <script src="${pageContext.request.contextPath}/front/js/front.js"></script>


    <script src="${pageContext.request.contextPath}/front/plugins/owl-carousel2/owl.carousel.min.js"></script>
    <script>
      $("#index-slider").owlCarousel({
        "items": 1,
        "loop": true,
        "autoplay": true,
        "autoplayHoverPause": true
      });

      $("#latest-posts-slider").owlCarousel({
        "items": 1,
        "loop": true,
        "autoplay": true,
        "autoplayHoverPause": true
      });
    </script>
    
  </body>
</html>