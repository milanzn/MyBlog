<%@ taglib prefix = "form" uri="http://www.springframework.org/tags/form" %>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
    </ul>

    
    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Messages Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="far fa-user"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <a href="#" class="dropdown-item">
            <!-- Message Start -->
            <div class="media align-items-center">
              <img src="${pageContext.request.contextPath}/admin/slike/${currentUser.image}"  style="max-width: 80px;" alt="" class="img-brand-50 mr-3 img-circle">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  <!--  <sec:authentication  property="principal.username"/> -->
                </h3>
                <h3>${currentUser.name}</h3>
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class="dropdown-divider"></div>
          <a href="user-myupdate" class="dropdown-item">
            <i class="fas fa-user"></i> Your Profile
          </a>
          <div class="dropdown-divider"></div>
            <a href="user-change-password" class="dropdown-item">
            <i class="fas fa-key"></i> Change Password
          </a>
        
          <form:form action="${pageContext.request.contextPath}/logout">
          <input type="submit" value="Log out">
          </form:form>
          
        </div>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Product Logo -->
    <a href="/admin/" class="brand-link">
      <img src="${pageContext.request.contextPath}/admin/dist/img/AdminLTELogo.png" alt="Cubes School Logo" class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">Web Shop</span>
    </a>

          <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
               
         <sec:authorize access="hasRole('admin')">     
               
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon far fa-plus-square"></i>
              <p>
                Categories
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="category-list" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Categories list</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="category-form" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Add Category</p>
                </a>
              </li>
            </ul>
          </li>
          
          
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon far fa-plus-square"></i>
              <p>
                Tags
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="tag-list" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Tags list</p>
                </a>
              </li>
              <li class="sticker-form">
                <a href="tag-form" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p> Add Tag</p>
                </a>
              </li>
            </ul>
          </li>
          
          
          
          
          
            <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon far fa-plus-square"></i>
              <p>
                Users
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="user-list" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Users list</p>
                </a>
              </li>
              <li class="sticker-form">
                <a href="user-form" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Add User</p>
                </a>
              </li>
            </ul>
          </li>
          
          </sec:authorize> 
          
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon far fa-plus-square"></i>
              <p>
                Blog
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="blog-list" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Blog list</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="blog-form" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Add Blog</p>
                </a>
              </li>
            </ul>
          </li>
        <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon far fa-plus-square"></i>
              <p>
                Other
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="message-list" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Message list</p>
                </a>
              </li>
            </ul>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="slider-list" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Slider list</p>
                </a>
              </li>
            </ul>
             <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="comment-list" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Comment list</p>
                </a>
              </li>
            </ul>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="static-page-form?page=about" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Edit About us Page</p>
                </a>
              </li>
            </ul>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="static-page-form?page=location" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Edit Location Page</p>
                </a>
              </li>
            </ul>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar --> 
     
  </aside>