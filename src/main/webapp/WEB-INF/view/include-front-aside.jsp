<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        
        <aside class="col-lg-4">
          <!-- Widget [Search Bar Widget]-->
          <div class="widget search">
            <header>
              <h3 class="h6">Search the blog</h3>
            </header>
            <form action="/blog-search/" class="search-form">
              <div class="form-group">
                <input type="search" placeholder="What are you looking for?" name="text" value="${SearchTitle}">
                <button type="submit" class="submit"><i class="icon-search"></i></button>
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
                      <div class="comments"><i class="icon-comment"></i>${b33.numberComments}</div>
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
            <div class="item d-flex justify-content-between"><a href="/blog-category/${cat5.seoTitle}/${cat5.id}">${cat5.name}</a><span>${cat5.blogNumber}</span></div>
			</c:forEach>
          </div>
          <!-- Widget [Tags Cloud Widget]-->
          <div class="widget tags">       
            <header>
              <h3 class="h6">Tags</h3>
            </header>
            <ul class="list-inline">
            <c:forEach var="tag" items="${tags}">
              <li class="list-inline-item"><a href="/blog-tag/${tag.seoTitle}/${tag.id}" class="tag">${tag.name} ${tag.blogs.size()}</a></li>
     		</c:forEach>
            </ul>
          </div>
        </aside>