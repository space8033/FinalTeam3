<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html
  lang="en"
  class="light-style layout-wide customizer-hide"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="${pageContext.request.contextPath}/resources/assets/"
  data-template="vertical-menu-template-no-customizer">
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/datatables-bs5/datatables.bootstrap5.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/datatables-responsive-bs5/responsive.bootstrap5.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/datatables-buttons-bs5/buttons.bootstrap5.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/select2/select2.css" />
    <!-- Vendor -->
    <%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/@form-validation/umd/styles/index.min.css" />

    <!-- Page CSS -->
    <!-- Page -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/css/pages/page-auth.css" /> --%>

    <!-- Helpers -->
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/js/helpers.js"></script>
    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/js/template-customizer.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/config.js"></script>
  </head>

  <body>
      <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->

         <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
          <div class="app-brand demo" style="padding-left : 1.5rem">
            <a href="/exodia/main" class="app-brand-link">
              <img src="${pageContext.request.contextPath}/resources/assets/img/backgrounds/pmslogo.png" width=40 height=40 style="margin-right : 12px"/>
              <span class=" demo menu-text fw-bold ms-2" style="font-size: 25px; padding-top: 3px">PMS</span>
            </a>

            <a href="${pageContext.request.contextPath}/main" class="layout-menu-toggle menu-link text-large ms-auto">
              <i class="bx bx-chevron-left bx-sm align-middle"></i>
            </a>
          </div>

          <div class="menu-inner-shadow"></div>

          <ul class="menu-inner py-1">
            <!-- Dashboards -->
                        <!-- Apps & Pages -->
            <li class="menu-header small text-uppercase">
              <span class="menu-header-text">MENU</span>
            </li>
            <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-file"></i>
                <div class="text-truncate" >프로젝트</div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="${pageContext.request.contextPath}/project/projectList" class="menu-link">
                    <div class="text-truncate" >프로젝트 목록</div>
                  </a>
                </li>

                <li class="menu-item">
                  <a href="${pageContext.request.contextPath}/project/searchUser" class="menu-link">
                    <div class="text-truncate">프로젝트 인력 검색</div>
                  </a>
                </li>
              </ul>
            </li>
            <li class="menu-item">
              <a href="${pageContext.request.contextPath}/noticeList" class="menu-link">
                <i class="menu-icon tf-icons bx bx-bell"></i>
                <div class="text-truncate">공지사항</div>
              </a>
            </li>
            <li class="menu-item">
              <a href="${pageContext.request.contextPath}/inquiryList" class="menu-link">
                <i class="menu-icon tf-icons bx bx-conversation"></i>
                <div class="text-truncate">문의하기</div>
              </a>
            </li>
            
            <!-- e-commerce-app menu start -->
                
            <li class="menu-item">
              <a href="${pageContext.request.contextPath}/calendar" class="menu-link">
             <i class="menu-icon tf-icons bx bx-task"></i>
                <div class="text-truncate">일정관리</div>
              </a>
            </li>
            <li class="menu-item">
              <a href="${pageContext.request.contextPath}/task/programManagement" class="menu-link">
                <i class="menu-icon tf-icons bx bx-server"></i>
                <div class="text-truncate">프로그램</div>
              </a>
            </li>
            
            <c:if test="${emp_id == 'admin' || emp_id == 'nonono'}">
	            <!--관리자 메뉴-->
	            <li class="menu-header small text-uppercase">
	              <span class="menu-header-text">ADMIN MENU</span>
	            </li>
	            
	            <li class="menu-item">
	              <a href="${pageContext.request.contextPath}/project/addProject" class="menu-link">
	                <i class="menu-icon tf-icons bx bx-file"></i>
	                <div class="text-truncate">프로젝트 등록</div>
	              </a>
	            </li>
	            
	            <li class="menu-item">
	              <a href="${pageContext.request.contextPath}/project/modifyProject" class="menu-link">
	                <i class="menu-icon tf-icons bx bxs-edit"></i>
	                <div class="text-truncate">프로젝트 수정</div>
	              </a>
	            </li>
	            
	            <li class="menu-item active">
	              <a href="${pageContext.request.contextPath}/employee/join" class="menu-link">
	                <i class="menu-icon tf-icons bx bx-user"></i>
	                <div class="text-truncate">사용자 등록</div>
	              </a>
	            </li>
	            
	            <li class="menu-item">
	              <a href="${pageContext.request.contextPath}/employee/userManagement" class="menu-link">
	                <i class="menu-icon tf-icons bx bx-face"></i>
	                <div class="text-truncate">인력 관리</div>
	              </a>
	            </li>            
            </c:if>
          </ul>
        </aside>
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
          <!-- Navbar -->
			<div>
	          <%@ include file="/WEB-INF/views/header.jsp" %>
			</div>

          <!-- / Navbar -->

          <!-- Content wrapper -->
          
   <div class="content-wrapper">
   	<div class="container-xxl flex-grow-1 container-p-y">
    <!-- Content -->
	    <div class="row" style="padding:25px;">
			<div class="col-12 mt-1">
		      <div class="card">
		        <div class="card-body">
		          <form id="formAuthentication" class="row g-3" name="JoinRequest" action="join" method="POST">
		            <!-- Account Details -->
		            <div class="col-12">
		              <h4>개인 사용자 등록</h4>
		              <hr class="mt-0" />
		            </div>
		
		            <div class="col-md-6">
		              <label for="emp_id" class="form-label">아이디</label>
		                  <input
		                    type="text"
		                    class="form-control"
		                    id="emp_id"
		                    name="emp_id"
		                    placeholder="아이디"
		                    autofocus />
		            </div>
		            <div class="col-md-6">
		              <label for="emp_name" class="form-label">이름</label>
		                  <input
		                    type="text"
		                    class="form-control"
		                    id="emp_name"
		                    name="empinfo_name"
		                    placeholder="이름"
		                    autofocus />
		            </div>
		
		            <div class="col-md-6">
		              <label for="emp_phone" class="form-label">전화번호</label>
		                  <input
		                    type="text"
		                    class="form-control"
		                    id="emp_phone"
		                    name="empinfo_phone"
		                    placeholder="전화번호"
		                    autofocus />
		            </div>
		            <div class="col-md-6">
		              <label for="emp_email" class="form-label">이메일</label>
		                  <input
		                    type="text"
		                    class="form-control"
		                    id="emp_email"
		                    name="empinfo_email"
		                    placeholder="이메일"
		                    autofocus />
		            </div>
		            <div class="col-md-6">
		              <label class="form-label" for="emp_position">직위</label>
		                  <select id="emp_position" class="form-select" name="empinfo_position">
		                    <option value="사원">사원</option>
		                    <option value="대리">대리</option>
		                    <option value="과장">과장</option>
		                    <option value="차장">차장</option>
		                    <option value="부장">부장</option>
		                  </select>
		            </div>
		
		            <div class="col-md-6"></div>
		            
		            <div class="col-md-10"></div>
		            <div class="col-md-2 align-items-end">
		            	<div class="d-flex h-100">
		                  <button class="login btn btn-primary d-grid w-100 align-self-end" type="submit">가입하기</button>
		                </div>
		            </div>
		          </form>
				</div>
				<input type="hidden" value="${idList}" id="idList"/>
				<div class="card-body pt-0">
		            <div class="col-md-12">
		            	<hr/>
		            	<h4 class="mb-4">엑셀 사용자 등록</h4>
		            	<hr/>
		              <form action="poiJoin" method="POST" id="myForm">
		            	<div class="col-xl-3 col-md-5 col-sm-6 col-12" onclick="submitForm()">
		                  <div class="form-check custom-option custom-option-icon mb-4">
		                    <label class="form-check-label custom-option-content" for="basicPlanMain1">
		                      <span class="custom-option-body">
		                        <img class="my-4" width=50 height=50 src="${pageContext.request.contextPath}/resources/assets/img/illustrations/excelIcon.png">
		                        <span class="custom-option-title"> register.xlsx </span>
		                        <small>바탕화면에 위치 시켜주세요</small>
		                      </span>
		                    </label>
		                  </div>
		                </div>        
		               </form>
		            </div>
		            </div>
		          </div>
		          <!-- /Register -->
		        </div>
	       	</div>
        </div>
      </div>
    </div>
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
    <script src="${pageContext.request.contextPath}/resources/assets/js/pages-auth.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/header.js"></script>
  </body>
</html>
