<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
     <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
	 <%@ taglib prefix = "form" uri="http://www.springframework.org/tags/form" %>


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
      <div class="row">
        <!-- Latest Posts -->
        <main class="post blog-post col-lg-8"> 
          <div class="container">
            <div class="post-single">
              <div class="post-thumbnail"><img src="${pageContext.request.contextPath}/front/img/${myBlog.image}" alt="..." class="img-fluid"></div>
              <div class="post-details">
                <div class="post-meta d-flex justify-content-between">
                  <div class="category"><a href="/blog-category/${myBlog.category.seoTitle}/${myBlog.category.id}">${myBlog.category.name}</a></div>
                </div>
                <h1>${myBlog.title}<a href="#"><i class="fa fa-bookmark-o"></i></a></h1>
                <div class="post-footer d-flex align-items-center flex-column flex-sm-row">
                
                <a href="/blog-author/${myBlog.user.seoTitle}/${myBlog.user.username}" class="author d-flex align-items-center flex-wrap">
                    <div class="avatar"><img src="${pageContext.request.contextPath}/admin/slike/${myBlog.user.image}"alt="..." class="img-fluid"></div>
                    <div class="title"><span>${myBlog.user.name}</span></div></a>
                  <div class="d-flex align-items-center flex-wrap">       
                    <div class="date"><i class="icon-clock"></i> ${myBlog.timeAgo}</div>
                    <div class="views"><i class="icon-eye"></i> ${myBlog.views}</div>
                    <div class="comments meta-last"><a href="#post-comments"><i class="icon-comment"></i>${myBlog.comments.size()}</a></div>
                  </div>
                </div>
                <div class="post-body">
                
                
                 ${myBlog.post}
                
                </div>
                
                
                
                <div class="post-tags">
                <c:forEach var="t" items="${myBlog.tags}">
                <a href="/blog-tag/${t.seoTitle}/${t.id}" class="tag">${t.name}</a>
                </c:forEach>


                </div>
                
                
                
                
                
                
                
                
                
                <div class="posts-nav d-flex justify-content-between align-items-stretch flex-column flex-md-row">
                <a href="/blog-post/${prevBlog.seoTitle}/${prevBlog.id}" class="prev-post text-left d-flex align-items-center">
                    <div class="icon prev"><i class="fa fa-angle-left"></i></div>
                    <div class="text"><strong class="text-primary">Previous Post </strong>
                      <h6>${prevBlog.title}</h6>
                    </div></a>
                    <a href="/blog-post/${nextBlog.seoTitle}/${nextBlog.id}" class="next-post text-right d-flex align-items-center justify-content-end">
                    <div class="text"><strong class="text-primary">Next Post </strong>
                      <h6>${nextBlog.title}</h6>
                    </div>
                    <div class="icon next"><i class="fa fa-angle-right">   </i></div></a></div>
                <div class="post-comments" id="post-comments">
                  <header>
                    <h3 class="h6">Post Comments<span class="no-of-comments">${myBlog.numberComments}</span></h3>
                  </header>
               <c:forEach var="c" items="${myBlog.comments}"> 
               <c:if test="${c.enabled}">
                  <div class="comment">
                    <div class="comment-header d-flex justify-content-between">
                      <div class="user d-flex align-items-center">
                        <div class="image"><img src="${pageContext.request.contextPath}/front/img/user.svg" alt="..." class="img-fluid rounded-circle"></div>
                        <div class="title"><strong>${c.name}</strong><span class="date">
                        <fmt:formatDate value="${c.dateCreated}" pattern="MMM yyyy"/></span></div>
                      </div>
                    </div>
                    <div class="comment-body">
                      <p>${c.description}</p>
                    </div>
                  </div>
                  </c:if>
                </c:forEach>    
                  
                  
                  
                </div>
                <div class="add-comment">
                  <header>
                    <h3 class="h6">Leave a reply</h3>
                  </header>
                  <form:form method="post" action="/comment-save/${myBlog.seoTitle}/${myBlog.id}" modelAttribute="comm" class="commenting-form">
                  
                  <form:hidden path="id"/>
                 
                    <div class="row">
                      <div class="form-group col-md-6">
                        <form:input type="text"  placeholder="Name" class="form-control" path="name"/>
                      </div>
                      <div class="form-group col-md-6">
                        <form:input type="email" placeholder="Email Address (will not be published)" class="form-control" path="email"/>
                      </div>
                      <div class="form-group col-md-12">
                        <form:textarea name="usercomment" id="usercomment" placeholder="Type your comment" class="form-control" path="description"/>
                      </div>
                      <div class="form-group col-md-12">
                        <button type="submit" class="btn btn-secondary">Submit Comment</button>
                      </div>
                    </div>
                  </form:form>
                </div>
              </div>
            </div>
          </div>
        </main>
        
        
        <!-- desna strana, ista je kao u blogs.jsp -->
        <aside class="col-lg-4">
          <!-- Widget [Search Bar Widget]-->
          <div class="widget search">
            <header>
              <h3 class="h6">Search the blog</h3>
            </header>
            <form action="/blog-search/" class="search-form">
              <div class="form-group">
                <input type="search" placeholder="What are you looking for?" name="text" value="${HeadTitle}">
                <button type="submit" class="submit"><i class="icon-search" ></i></button>
              </div>
            </form>
          </div>
          <!-- Widget [Latest Posts Widget]        -->
          <div class="widget latest-posts">
            <header>
              <h3 class="h6">Latest Posts!!!??????</h3>
            </header>
            <div class="blog-posts">
            
            <c:forEach var="b33" items="${blog33}">
            
            <a href="/blog-post/${b33.seoTitle}/${b33.id}">
                <div class="item d-flex align-items-center">
                  <div class="image"><img src="${pageContext.request.contextPath}/front/img/small-thumbnail-1.jpg" alt="..." class="img-fluid"></div>
                  <div class="title"><strong>${b33.title}</strong>
                    <div class="d-flex align-items-center">
                      <div class="views"><i class="icon-eye"></i> ${b33.views}</div>
                      <div class="comments"><i class="icon-comment"></i>${b33.comments.size()}</div>
                    </div>
                  </div>
                </div>
             </a>
            </c:forEach>    
                               
                
                </div>
          </div>
          <!-- Widget [Categories Widget]-->
          <div class="widget categories">
            <header>
              <h3 class="h6">Categories</h3>
            </header>
            
            <c:forEach var="cat5" items="${category5}">
            <div class="item d-flex justify-content-between"><a href="/blog-category/${cat5.seoTitle}/${cat5.id}">${cat5.name}</a><span>${cat5.blogs.size()}</span></div>
			</c:forEach>
          </div>
          <!-- Widget [Tags Cloud Widget]-->
          <div class="widget tags">       
            <header>
              <h3 class="h6">Tags</h3>
            </header>
            <ul class="list-inline">
            <c:forEach var="tag" items="${tags}">
              <li class="list-inline-item"><a href="/blog-tag/${tag.seoTitle}/${tag.id}" class="tag">${tag.name}</a></li>
     		</c:forEach>
            </ul>
          </div>
        </aside>
        
        
        
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
