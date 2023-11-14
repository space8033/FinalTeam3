<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html
  lang="en"
  class="light-style layout-wide customizer-hide"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="../../assets/"
  data-template="vertical-menu-template">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>Project Management System</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/assets/img/backgrounds/pmslogo.png" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet" />

    <!-- Icons -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/fonts/boxicons.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/fonts/fontawesome.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/fonts/flag-icons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/css/rtl/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/css/rtl/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/typeahead-js/typeahead.css" />
    <!-- Vendor -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/@form-validation/umd/styles/index.min.css" />

    <!-- Page CSS -->
    <!-- Page -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/css/pages/page-auth.css" />

    <!-- Helpers -->
    <script src="../../assets/vendor/js/helpers.js"></script>
    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Template customizer: To hide customizer set displayCustomizer value false in config.js.  -->
    <script src="../../assets/vendor/js/template-customizer.js"></script>
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="../../assets/js/config.js"></script>
  </head>

  <body>
    <!-- Content -->

    <div class="authentication-wrapper authentication-cover">
      <div class="authentication-inner row m-0">
        <!-- /Left Text -->
        <div class="d-none d-lg-flex col-lg-7 col-xl-6 align-items-center" style="background-color:white">
          <div class="w-100 d-flex justify-content-end">
            <img
              src="${pageContext.request.contextPath}/resources/assets/img/illustrations/loginAnimation.gif"
              class="img-fluid"
              alt="Login image"
              width="80%"
              />
          </div>
        </div>
        <!-- /Left Text -->

	       <div class="d-flex col-12 col-lg-5 col-xl-6 align-items-center authentication-bg justify-content-center">
	<!--           <div class="w-px-400 mx-auto"> -->
        	<div class="mmmmmmmmmmmmmmmmmmm" style="
        			display: flex;
        			align-items: center;
        			background-color: whitesmoke;
        			height: 100%;
        			padding: 100px;">
	         <div class="w-px-400">
	           <!-- Logo -->
	           <div class="app-brand mb-3 d-flex justify-content-center">
	             <a href="#" class="app-brand-link gap-2">
	                 <img
		              src="${pageContext.request.contextPath}/resources/assets/img/illustrations/mainlogo.png"
		              class="img-fluid"
		              alt="Login image"
		              width="60%"
		              style="margin-left: 80px; margin-bottom: 20px;"
	              />
	             </a>
	           </div>
	           <!-- /Logo -->
	           
	           <form id="formAuthentication" class="mb-3" name="loginRequest" action="/exodia/login" method="POST">
	               <div class="mb-3">
	                 <label for="email" class="form-label">아이디</label>
	                 <input
	                   type="text"
	                   class="form-control"
	                   id="email"
	                   name="emp_id"
	                   placeholder="아이디"
	                   autofocus />
	               </div>
	               <div class="mb-3 form-password-toggle">
	                 <div class="d-flex justify-content-between">
	                   <label class="form-label" for="password">비밀번호</label>
	                 </div>
	                 <div class="input-group input-group-merge">
	                   <input
	                     type="password"
	                     id="password"
	                     class="form-control"
	                     name="emp_password"
	                     placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
	                     aria-describedby="password" />
	                   <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
	                 </div>
	               </div>
	               <div class="mb-3">
	                 <div class="form-check">
	                   <input class="form-check-input" type="checkbox" id="remember-me" />
	                   <label class="form-check-label" for="remember-me"> 아이디 저장 </label>
	                 </div>
	               </div>
	               <div class="mb-3">
	                 <button class="login btn btn-primary d-grid w-100" type="submit" id="btnLogin">로그인</button>
	               </div>
	               <small>비밀번호 분실시 010-1212-3434</small>
	             </form>
	
	         </div>

	       </div>
        <!-- Login -->
        <!-- /Login -->
      </div>
    </div>

    <!-- / Content -->

    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->

    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/popper/popper.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/hammer/hammer.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/i18n/i18n.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/typeahead-js/typeahead.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/js/menu.js"></script>

    <!-- endbuild -->

    <!-- Vendors JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/@form-validation/umd/bundle/popular.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/@form-validation/umd/plugin-bootstrap5/index.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/@form-validation/umd/plugin-auto-focus/index.min.js"></script>

    <!-- Main JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

    <!-- Page JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/login.js"></script>
  </body>
</html>
