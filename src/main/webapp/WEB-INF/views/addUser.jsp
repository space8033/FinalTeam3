<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html
  lang="en"
  class="light-style layout-navbar-fixed layout-menu-fixed layout-compact"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="${pageContext.request.contextPath}/resources/assets/"
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/bootstrap-maxlength/bootstrap-maxlength.css" />

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/js/helpers.js"></script>
    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Template customizer: To hide customizer set displayCustomizer value false in config.js.  -->
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/js/template-customizer.js"></script>
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
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
                <!-- <li class="menu-item">
                  <a href="dashboards-crm.html" class="menu-link">
                    <div class="text-truncate" >프로젝트 조직도</div>
                  </a>
                </li> -->
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
	            
	            <c:if test="${emp_id == 'admin'}">
		            <li class="menu-item">
		              <a href="${pageContext.request.contextPath}/employee/join" class="menu-link">
		                <i class="menu-icon tf-icons bx bx-user"></i>
		                <div class="text-truncate">사용자 등록</div>
		              </a>
		            </li>
	            </c:if>
	<%--             <li class="menu-item">
	              <a href="${pageContext.request.contextPath}/addUser" class="menu-link">
	                <i class="menu-icon tf-icons bx bx-user"></i>
	                <div class="text-truncate">사용자 등록</div>
	              </a>
	            </li> --%>
	            
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

         <%@ include file="/WEB-INF/views/header.jsp" %>

          <!-- / Navbar -->

          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">

              <div class="row">
                <!-- Autosize -->
                
                <!-- Form Repeater -->
                <div class="col-12">
                  <div class="card">
                    <h5 class="card-header">사용자 등록</h5>
                    <div class="card-body">
                      <form class="form-repeater" id="joinForm" action="employee/addUser">
                        <div data-repeater-list="joinList">
                          <div data-repeater-item>
                            <div class="row">
                              <div class="mb-3 col-lg-6 col-xl-2 col-12 mb-0">
                                <label class="form-label" for="form-repeater-1-1">이름</label>
                                <input type="text" id="form-repeater-1-1" class="form-control" placeholder="김시온" name="empinfo_name" />
                              </div>
                              <div class="mb-3 col-lg-6 col-xl-2 col-12 mb-0">
                                <label class="form-label" for="form-repeater-1-2">아이디</label>
                                <input
                                  type="text"
                                  id="form-repeater-1-2"
                                  class="form-control"
                                  placeholder="201723445"
                                  name="emp_id" />
                              </div>
                              <div class="mb-3 col-lg-6 col-xl-2 col-12 mb-0">
                                <label class="form-label" for="form-repeater-1-3">전화번호</label>
                                <input
                                  type="tel"
                                  id="form-repeater-1-3"
                                  class="form-control"
                                  placeholder="010-4504-1219"
                                  name="empinfo_phone" />
                              </div>
                              
                              <div class="mb-3 col-lg-6 col-xl-2 col-12 mb-0">
                                <label class="form-label" for="form-repeater-1-4">이메일</label>
                                <input
                                  type="text"
                                  id="form-repeater-1-4"
                                  class="form-control"
                                  placeholder="noismik@oti.com"
                                  name="empinfo_email" />
                                 
                              </div>
            
                              <div class="mb-3 col-lg-6 col-xl-2 col-12 mb-0">
                                <label class="form-label" for="form-repeater-1-5">직위</label>
                                <select id="form-repeater-1-5" class="form-select" name="empinfo_position">
                                  <option value="Sawon">사원</option>
                                  <option value="Daeri">대리</option>
                                  <option value="Gwajang">과장</option>
                                  <option value="Chajang">차장</option>
                                  <option value="Bujang">부장</option>
                                </select>
                              </div>
                              
                              <div class="mb-3 col-lg-12 col-xl-2 col-12 d-flex align-items-center justify-content-center mb-0">
                                <button class="btn btn-label-danger mt-4" data-repeater-delete>
                                  <span class="align-middle">삭제</span>
                                </button>
                              </div>
                              
                            </div>
                            <hr />
                          </div>
                        </div>
                        <div class="mb-0 me-2 col text-center">
                          <button onclick="submit" class="btn btn-primary align-items-center" data-repeater-create >
                            <i class="bx bx-plus me-1"></i>
                            <span class="align-middle">추가</span>
                          </button>
                        </div>
                      </form>
                      
                    </div>
                  </div>
                </div>
                <!-- /Form Repeater -->
              </div>
            </div>
            <!-- / Content -->

            <!-- Footer -->
           
            <!-- / Footer -->

            <div class="content-backdrop fade"></div>
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>

      <!-- Drag Target Area To SlideIn Menu On Small Screens -->
      <div class="drag-target"></div>
    </div>
    <!-- / Layout wrapper -->

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
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/autosize/autosize.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/cleavejs/cleave.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/cleavejs/cleave-phone.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/bootstrap-maxlength/bootstrap-maxlength.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/jquery-repeater/jquery-repeater.js"></script>

    <!-- Main JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

    <!-- Page JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/forms-extras.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/header.js"></script>
  </body>
</html>