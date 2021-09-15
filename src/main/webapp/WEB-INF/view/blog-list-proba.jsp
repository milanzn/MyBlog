
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="ie=edge">

  <title>AdminLTE 3 | Starter</title>

  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">

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
              <img src="dist/img/user1-128x128.jpg" alt="User Avatar" class="img-brand-50 mr-3 img-circle">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  Brad Diesel
                </h3>
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-user"></i> Your Profile
          </a>
          <div class="dropdown-divider"></div>
          <a href="login.html" class="dropdown-item">
              <i class="fas fa-sign-out-alt"></i> Log Out
          </a>
        </div>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Product Logo -->
    <a href="index3.html" class="brand-link">
      <img src="dist/img/AdminLTELogo.png" alt="Cubes School Logo" class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">Cubes School</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon far fa-plus-square"></i>
              <p>
                Products
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Products list</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Add Product</p>
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

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Products</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Products</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-12">
          
          
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Search Products</h3>
                <div class="card-tools">
                  <a href="products-form.html" class="btn btn-success">
                    <i class="fas fa-plus-square"></i>
                    Add new Product
                  </a>
                </div>
              </div>
              
              
              <!-- /.card-header -->
              
              
              
              <div class="card-body">
                <form id="entities-filter-form">
                  <div class="row">
                    <div class="col-md-3 form-group">
                      <label>Name</label>
                      <input type="text" class="form-control" placeholder="Search by name">
                    </div>
                    <div class="col-md-2 form-group">
                      <label>Brand</label>
                      <select class="form-control">
                        <option>--Choose Brand --</option>
                        <option value="">Brand 1</option>
                        <option value="">Brand 2</option>
                        <option value="">Brand 3</option>
                      </select>
                    </div>
                    <div class="col-md-2 form-group">
                      <label>Category</label>
                      <select class="form-control">
                        <option>--Choose Category --</option>
                        <option value="">Category 1</option>
                        <option value="">Category 2</option>
                        <option value="">Category 3</option>
                      </select>
                    </div>
                    <div class="col-md-1 form-group">
                      <label>On Index</label>
                      <select class="form-control">
                        <option>-- All --</option>
                        <option value="">yes</option>
                        <option value="">no</option>
                      </select>
                    </div>
                    <div class="col-md-4 form-group">
                      <label>In size</label>
                      <select class="form-control" multiple>
                        <option value="">XS</option>
                        <option value="">S</option>
                        <option value="">M</option>
                        <option value="">L</option>
                        <option value="">XL</option>
                        <option value="">XXL</option>
                      </select>
                    </div>
                  </div>
                </form>
              </div>
              <!-- /.card-body -->
              <div class="card-footer clearfix">
                
              </div>
            </div>
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">All Products</h3>
                <div class="card-tools">
                  
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table class="table table-bordered">
                  <thead>                  
                    <tr>
                      <th style="width: 10px">#</th>
                      <th class="text-center">Photo</th>
                      <th style="width: 20%;">Name</th>
                      <th style="width: 30%;">Brand</th>
                      <th class="text-center">Category</th>
                      <th class="text-center">Sizes</th>
                      <th class="text-center">Created At</th>
                      <th class="text-center">Actions</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>#1</td>
                      <td class="text-center">
                        <img src="https://via.placeholder.com/200" style="max-width: 80px;">
                      </td>
                      <td>
                        <strong>Product 1</strong>
                      </td>
                      <td>
                        Brand 1
                      </td>
                      <td>
                        Category 1
                      </td>
                      <td>XS, L, XL</td>
                      <td class="text-center">2020-02-02 12:00:00</td>
                      <td class="text-center">
                        <div class="btn-group">
                          <a href="#" class="btn btn-info" target="_blank">
                            <i class="fas fa-eye"></i>
                          </a>
                          <a href="#" class="btn btn-info">
                            <i class="fas fa-edit"></i>
                          </a>
                          <button type="button" class="btn btn-info" data-toggle="modal" data-target="#delete-modal">
                            <i class="fas fa-trash"></i>
                          </button>
                        </div>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
              <div class="card-footer clearfix">
                
              </div>
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->

    <div class="modal fade" id="delete-modal">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title">Delete Product</h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <p>Are you sure you want to delete product?</p>
            <strong></strong>
          </div>
          <div class="modal-footer justify-content-between">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
            <button type="button" class="btn btn-danger">Delete</button>
          </div>
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
  </div>
  <!-- /.content-wrapper -->

  

  <!-- Main Footer -->
  <footer class="main-footer">
    <!-- To the right -->
    <div class="float-right d-none d-sm-inline">
      PHP Laravel
    </div>
    <!-- Default to the left -->
    <strong>Copyright &copy; 2019 <a href="https://cubes.edu.rs">Cubes School</a>.</strong> All rights reserved.
  </footer>
</div>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
</body>
</html>

