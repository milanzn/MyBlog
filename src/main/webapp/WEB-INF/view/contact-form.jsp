<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="">
    <meta name="description" content="Online garden shop">
    <meta name="keywords" content="garden, shop, plants, decorate,
            decoration">


    <!--ios compatibility-->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-title" content="garden Shop">
    <link rel="apple-touch-icon" href="apple-icon-144x144.png">


    <!--Android compatibility-->

    <meta name="mobile-web-app-capable" content="yes">
    <meta name="application-name" content="Garden Shop">
    <link rel="icon" type="image/png" href="android-icon-192x192.png">

    <link rel="shortcut icon" href="favicon.ico" type="${pageContext.request.contextPath}/front/image/x-icon" />


    <!--FONTS-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap CSS -->
    <link href="${pageContext.request.contextPath}/front/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <!--THEME CSS-->
    <link href="${pageContext.request.contextPath}/front/css/theme.css" rel="stylesheet" type="text/css" />




    <title>Garden Shop</title>
</head>

<body>

<!--HEADER START--> <!-- INCLUDE JSP!!! -->
<!--HEADER ENDS--> <!-- INCLUDE JSP!!! -->

<jsp:include page="include-front-header.jsp"/> 

<!--NAVIGATION START--> <!-- INCLUDE JSP!!! -->
<!--NAVIGATION ENDS--> <!-- INCLUDE JSP!!! -->  

<main>

    <div class="container">

        <!--CONTACT - LEAD START-->
        <section class="services-1-article contact-lead" style="background-color: #fff;">
            <article class="services-1-lead-article-wrapper b-radius"></article>
        </section>
        <!--CONTACT - LEAD ENDS-->




        <!--CONTACT - MAIN FORM START-->
        <section class="contact-main-form" style="background-color: #fff">
            <h3>CONTACT FORM</h3>
            <div class="row justify-content-between">
                <div class="col-md-6 col-lg-4 mb-4 mb-md-0">
                
                
                
                    <form:form method="post" action="contact-save" modelAttribute="message" class="contact-form text-uppercase">
                        <div class="form-group">
                            <label for="contact-name">YOUR NAME:</label>
                            <form:input type="text" name="name" value="" class="form-control" id="contact-name" path="name"/>
                            <div class="error-msg"></div>
                        </div>

                        <div class="form-group">
                            <label for="contact-email">EMAIL ADDRESS:</label>
                            <form:input type="email" name="email" value="" class="form-control" id="contact-email" path="email"/>
                            <div class="error-msg"></div>
                        </div>
                        <div class="form-group">
                            <label for="contact-message">YOUR MESSAGE:</label>
                            <form:textarea name="message" class="form-control" id="contact-message" path="message"/></textarea>
                            <div class="error-msg"></div>
                        </div>
                        <div class="form-group text-left">
                            <button type="submit"
                                class="d-inline-block btn btn-warning text-uppercase text-white">Send</button>
                        </div>
                    </form:form>
                    
                    
                    
                </div>

            </div>
        </section>
        <!--CONTACT - MAIN FORM ENDS-->


    </div>
</main>


<!--FOOTER START-->
	<jsp:include page="include-front-footer.jsp"/>
<!--FOOTER ENDS-->









<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="${pageContext.request.contextPath}/front/js/jquery.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/front/js/popper.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/front/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/front/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/front/js/owl.carousel.min.js" type="text/javascript"></script>


<script src="${pageContext.request.contextPath}/front/js/main.js" type="text/javascript"></script>

<script>

    $('.contact-form').validate({

        highlight: function (element) {
            $(element).closest('.form-group').addClass('has-danger').removeClass('has-success');
            $(element).addClass('form-control-danger').removeClass('form-control-success');
        },

        unhighlight: function (element) {
            $(element).closest('.form-group').addClass('has-success').removeClass('has-danger');
            $(element).removeClass('form-control-danger').addClass('form-control-success');
        },
        errorElement: 'p',
        errorPlacement: function (error, element) {
            error.appendTo(element.closest(".form-group").find(".error-msg"));
        },
        rules: {
            email: {
                required: true,
                email: true
            },
            name: {
                required: true,
                rangelength: [3, 20]
            },
            surname: {
                required: true,
                rangelength: [3, 20]
            },
            message: {
                required: true,
                rangelength: [10, 255]
            }
        },
        messages: {
            email: {
                required: 'The Email is required field',
                email: 'Please enter valid email address'
            },
            name: {
                required: 'The Name field is required',
                rangelength: 'Name must be between 3 and 20 character long'
            },
            name: {
                required: 'The Surname field is required',
                rangelength: 'Surname must be between 3 and 20 character long'
            },
            message: {
                required: 'The Message field is required',
                rangelength: 'Message must be between 10 and 255 character long'
            }
        }

    });

</script>
</body>

</html>