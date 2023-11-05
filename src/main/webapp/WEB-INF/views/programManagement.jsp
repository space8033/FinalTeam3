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

    <title>Roles - Apps | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/assets/img/favicon/favicon.ico" />

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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/@form-validation/umd/styles/index.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/flatpickr/flatpickr.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/bootstrap-datepicker/bootstrap-datepicker.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/bootstrap-daterangepicker/bootstrap-daterangepicker.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/jquery-timepicker/jquery-timepicker.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/pickr/pickr-themes.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/flatpickr/flatpickr.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/select2/select2.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/tagify/tagify.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/bootstrap-select/bootstrap-select.css" />

    <!-- Page CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/css/pages/page-faq.css" />


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
          <div class="app-brand demo">
            <a href="${pageContext.request.contextPath}/main" class="app-brand-link">
              <span class="app-brand-logo demo">
                <svg
                  width="25"
                  viewBox="0 0 25 42"
                  version="1.1"
                  xmlns="http://www.w3.org/2000/svg"
                  xmlns:xlink="http://www.w3.org/1999/xlink">
                  <defs>
                    <path
                      d="M13.7918663,0.358365126 L3.39788168,7.44174259 C0.566865006,9.69408886 -0.379795268,12.4788597 0.557900856,15.7960551 C0.68998853,16.2305145 1.09562888,17.7872135 3.12357076,19.2293357 C3.8146334,19.7207684 5.32369333,20.3834223 7.65075054,21.2172976 L7.59773219,21.2525164 L2.63468769,24.5493413 C0.445452254,26.3002124 0.0884951797,28.5083815 1.56381646,31.1738486 C2.83770406,32.8170431 5.20850219,33.2640127 7.09180128,32.5391577 C8.347334,32.0559211 11.4559176,30.0011079 16.4175519,26.3747182 C18.0338572,24.4997857 18.6973423,22.4544883 18.4080071,20.2388261 C17.963753,17.5346866 16.1776345,15.5799961 13.0496516,14.3747546 L10.9194936,13.4715819 L18.6192054,7.984237 L13.7918663,0.358365126 Z"
                      id="path-1"></path>
                    <path
                      d="M5.47320593,6.00457225 C4.05321814,8.216144 4.36334763,10.0722806 6.40359441,11.5729822 C8.61520715,12.571656 10.0999176,13.2171421 10.8577257,13.5094407 L15.5088241,14.433041 L18.6192054,7.984237 C15.5364148,3.11535317 13.9273018,0.573395879 13.7918663,0.358365126 C13.5790555,0.511491653 10.8061687,2.3935607 5.47320593,6.00457225 Z"
                      id="path-3"></path>
                    <path
                      d="M7.50063644,21.2294429 L12.3234468,23.3159332 C14.1688022,24.7579751 14.397098,26.4880487 13.008334,28.506154 C11.6195701,30.5242593 10.3099883,31.790241 9.07958868,32.3040991 C5.78142938,33.4346997 4.13234973,34 4.13234973,34 C4.13234973,34 2.75489982,33.0538207 2.37032616e-14,31.1614621 C-0.55822714,27.8186216 -0.55822714,26.0572515 -4.05231404e-15,25.8773518 C0.83734071,25.6075023 2.77988457,22.8248993 3.3049379,22.52991 C3.65497346,22.3332504 5.05353963,21.8997614 7.50063644,21.2294429 Z"
                      id="path-4"></path>
                    <path
                      d="M20.6,7.13333333 L25.6,13.8 C26.2627417,14.6836556 26.0836556,15.9372583 25.2,16.6 C24.8538077,16.8596443 24.4327404,17 24,17 L14,17 C12.8954305,17 12,16.1045695 12,15 C12,14.5672596 12.1403557,14.1461923 12.4,13.8 L17.4,7.13333333 C18.0627417,6.24967773 19.3163444,6.07059163 20.2,6.73333333 C20.3516113,6.84704183 20.4862915,6.981722 20.6,7.13333333 Z"
                      id="path-5"></path>
                  </defs>
                  <g id="g-app-brand" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                    <g id="Brand-Logo" transform="translate(-27.000000, -15.000000)">
                      <g id="Icon" transform="translate(27.000000, 15.000000)">
                        <g id="Mask" transform="translate(0.000000, 8.000000)">
                          <mask id="mask-2" fill="white">
                            <use xlink:href="#path-1"></use>
                          </mask>
                          <use fill="#696cff" xlink:href="#path-1"></use>
                          <g id="Path-3" mask="url(#mask-2)">
                            <use fill="#696cff" xlink:href="#path-3"></use>
                            <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-3"></use>
                          </g>
                          <g id="Path-4" mask="url(#mask-2)">
                            <use fill="#696cff" xlink:href="#path-4"></use>
                            <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-4"></use>
                          </g>
                        </g>
                        <g
                          id="Triangle"
                          transform="translate(19.000000, 11.000000) rotate(-300.000000) translate(-19.000000, -11.000000) ">
                          <use fill="#696cff" xlink:href="#path-5"></use>
                          <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-5"></use>
                        </g>
                      </g>
                    </g>
                  </g>
                </svg>
              </span>
              <span class="app-brand-text demo menu-text fw-bold ms-2">pms</span>
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
                  <a href="${pageContext.request.contextPath}/projectList" class="menu-link">
                    <div class="text-truncate" >프로젝트 목록</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="dashboards-crm.html" class="menu-link">
                    <div class="text-truncate" >프로젝트 조직도</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="${pageContext.request.contextPath}/searchUser" class="menu-link">
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
              <a href="${pageContext.request.contextPath}/qnaList" class="menu-link">
                <i class="menu-icon tf-icons bx bx-conversation"></i>
                <div class="text-truncate">문의하기</div>
              </a>
            </li>
            
            <!-- e-commerce-app menu start -->
            <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-task"></i>
                <div class="text-truncate">일정관리</div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="${pageContext.request.contextPath}/calendar" class="menu-link">
                    <div class="text-truncate">팀 별 일정 관리</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="${pageContext.request.contextPath}/calendar" class="menu-link">
                    <div class="text-truncate">개인 별 일정 관리</div>
                  </a>
                </li>
              </ul>
            </li>
            <li class="menu-item active">
              <a href="${pageContext.request.contextPath}/programManagement" class="menu-link">
                <i class="menu-icon tf-icons bx bx-server"></i>
                <div class="text-truncate">프로그램</div>
              </a>
            </li>
            
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
              <a href="${pageContext.request.contextPath}/employee/jjoin" class="menu-link">
                <i class="menu-icon tf-icons bx bx-user"></i>
                <div class="text-truncate">사용자 등록</div>
              </a>
<%--             <li class="menu-item">
              <a href="${pageContext.request.contextPath}/addUser" class="menu-link">
                <i class="menu-icon tf-icons bx bx-user"></i>
                <div class="text-truncate">사용자 등록</div>
              </a> --%>
            </li>
            
            <li class="menu-item">
              <a href="${pageContext.request.contextPath}/employee/userManagement" class="menu-link">
                <i class="menu-icon tf-icons bx bx-face"></i>
                <div class="text-truncate">인력 관리</div>
              </a>
            </li>            
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
              <h4 class="py-3 mb-2">프로그램 목록</h4>

             
              <!-- Role cards -->
              <div class="row">
                
                <div class="col-md-6 col-lg-6 mb-4 mb-md-0">
                  <!-- Role Table -->
                  <div class="card">
                    <div class="card-datatable table-responsive">
                      <table class="datatables-users table border-top" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                        <thead>
                          <tr>
                          	<th></th>
                            <th>팀</th>
                            <th>프로그램명</th>
                            <th>담당자</th>
                            <th>기간</th>
                            <th>상태</th>
                          </tr>
                        </thead>
                      </table>
                    </div>
                  </div>
                  <!--/ Role Table -->
                </div>
            
              
                <!-- 비동기 jsp 삽입부분 -->
                <div class="col-md-6 col-lg-6 mb-4 mb-md-0 py-0" id="programModifyContainer">
               		<div class="card mb-5">
					    <h5 class="card-header mb-4">프로그램 상세정보 </h5>
					    <form class="card-body">
					       <div class="row mb-3">
					         <label class="col-sm-3 col-form-label" for="multicol-email">프로그램명</label>
					         <div class="col-sm-9">
					           <div class="input-group input-group-merge">
					             <input
					               type="text"
					               id="multicol-email"
					               class="form-control"
					               placeholder="프로그램명"
					               value= "${programModifiy.task_name}"
					               aria-label="john.doe"
					               aria-describedby="multicol-email2" />
					           </div>
					         </div>
					       </div>
					       <div class="row mb-3">
					         <label class="col-sm-3 col-form-label" for="multicol-user">담당자</label>
					         <div class="col-sm-9">
					           <input type="text" id="multicol-user" class="form-control" placeholder="담당자" value="${programModifiy.empinfo_name}" />
					         </div>
					       </div>
					       
					       <div class="row form-password-toggle mb-3">
					         <label class="col-sm-3 col-form-label" for="multicol-password">URL</label>
					         <div class="col-sm-9">
					           <div class="input-group input-group-merge">
					             <input
					               type="text"
					               id="multicol-password"
					               class="form-control"
					               value="${programModifiy.task_url}"
					               placeholder="URL"
					               aria-describedby="multicol-password2" />
					           </div>
					         </div>
					       </div>
					       <div class="row mb-3">
					         <label class="col-sm-3 col-form-label" for="task-priority">작업 중요도</label>
					         
					         <div class="col-sm-9">
					           <select id="task-priority" class="select2 form-select" data-allow-clear="true">
					           	 <c:if test="${programModifiy.task_importance == null}">
						           	 <option value="">선택</option>
						             <option value="상">상</option>
						             <option value="중">중</option>
						             <option value="하">하</option>
					           	 </c:if>
					           	 <c:if test="${programModifiy.task_importance == '상'}">
						           	 <option value="">선택</option>
						             <option value="상" selected="selected">상</option>
						             <option value="중">중</option>
						             <option value="하">하</option>
					           	 </c:if>
					           	 <c:if test="${programModifiy.task_importance == '중'}">
						           	 <option value="">선택</option>
						             <option value="상">상</option>
						             <option value="중" selected="selected">중</option>
						             <option value="하">하</option>
					           	 </c:if>
					           	 <c:if test="${programModifiy.task_importance == '하'}">
						           	 <option value="">선택</option>
						             <option value="상">상</option>
						             <option value="중">중</option>
						             <option value="하" selected="selected">하</option>
					           	 </c:if>
					           </select>
					         </div>
					       </div>
					       <div class="row mb-3">
					         <label class="col-sm-3 col-form-label" for="multicol-country">프로그램 유형</label>
					         <div class="col-sm-9">
					           <select id="multicol-country" class="select2 form-select" data-allow-clear="true">
					             <c:if test="${programModifiy.task_category == null}">
						             <option value="">Select</option>
						             <option value="온라인">온라인</option>
						             <option value="배치">배치</option>
						             <option value="선택">선택</option>
					          	 </c:if>
					             <c:if test="${programModifiy.task_category == '온라인'}">
						             <option value="">Select</option>
						             <option value="온라인" selected="selected">온라인</option>
						             <option value="배치">배치</option>
						             <option value="선택">선택</option>
					          	 </c:if>
					             <c:if test="${programModifiy.task_category == '배치'}">
						             <option value="">Select</option>
						             <option value="온라인">온라인</option>
						             <option value="배치" selected="selected">배치</option>
						             <option value="선택">선택</option>
					          	 </c:if>
					             <c:if test="${programModifiy.task_category == '선택'}">
						             <option value="">Select</option>
						             <option value="온라인">온라인</option>
						             <option value="배치">배치</option>
						             <option value="선택" selected="selected">선택</option>
					          	 </c:if>
					           </select>
					         </div>
					       </div>
					       <div class="row mb-3">
					         <label class="col-sm-3 col-form-label" for="detail-category">세부 유형</label>
					         <div class="col-sm-9">
					           <select id="detail-category" class="select2 form-select" data-allow-clear="true">
					           	 <c:if test="${programModifiy.task_detail == null}">
						             <option value="선택">선택</option>
						             <option value="화면(메인)">화면(메인)</option>
						             <option value="화면(탭)">화면(탭)</option>
						             <option value="화면(팝업)">화면(팝업)</option>
						             <option value="보고서">보고서</option>
						             <option value="배치">배치</option>
					          	 </c:if>
					           	 <c:if test="${programModifiy.task_detail == '화면(메인)'}">
						             <option value="선택">선택</option>
						             <option value="화면(메인)" selected="selected">화면(메인)</option>
						             <option value="화면(탭)">화면(탭)</option>
						             <option value="화면(팝업)">화면(팝업)</option>
						             <option value="보고서">보고서</option>
						             <option value="배치">배치</option>
					          	 </c:if>
					           	 <c:if test="${programModifiy.task_detail == '화면(탭)'}">
						             <option value="선택">선택</option>
						             <option value="화면(메인)">화면(메인)</option>
						             <option value="화면(탭)" selected="selected">화면(탭)</option>
						             <option value="화면(팝업)">화면(팝업)</option>
						             <option value="보고서">보고서</option>
						             <option value="배치">배치</option>
					          	 </c:if>
					           	 <c:if test="${programModifiy.task_detail == '화면(팝업)'}">
						             <option value="선택">선택</option>
						             <option value="화면(메인)">화면(메인)</option>
						             <option value="화면(탭)">화면(탭)</option>
						             <option value="화면(팝업)" selected="selected">화면(팝업)</option>
						             <option value="보고서">보고서</option>
						             <option value="배치">배치</option>
					          	 </c:if>
					           	 <c:if test="${programModifiy.task_detail=='보고서'}">
						             <option value="선택">선택</option>
						             <option value="화면(메인)">화면(메인)</option>
						             <option value="화면(탭)">화면(탭)</option>
						             <option value="화면(팝업)">화면(팝업)</option>
						             <option value="보고서" selected="selected">보고서</option>
						             <option value="배치">배치</option>
					          	 </c:if>
					           	 <c:if test="${programModifiy.task_detail == '배치'}">
						             <option value="선택">선택</option>
						             <option value="화면(메인)">화면(메인)</option>
						             <option value="화면(탭)">화면(탭)</option>
						             <option value="화면(팝업)">화면(팝업)</option>
						             <option value="보고서">보고서</option>
						             <option value="배치" selected="selected">배치</option>
					          	 </c:if>
					           </select>
					         </div>
					       </div>
					       <div class="row mb-3">
					         <label class="col-sm-3 col-form-label" for="flatpickr-range">개발 예정 기간</label>
					         <div class="col-sm-9">
					           <input
					             type="text"
					             class="form-control"
					             value="${programModifiy.task_date}"
					             placeholder="YYYY-MM-DD to YYYY-MM-DD"
					             id="flatpickr-range" />
					         </div>
					       </div>
					     <div class="row mb-3">
						  <label class="col-sm-3 form-label" for="flatpickr-date">실적 시작</label>
						  <div class="col-sm-9">
							  <input type="text" class="form-control" placeholder="YYYY-MM-DD" value="${programModifiy.task_realstart}" id="flatpickr-date"/>
						  </div>
						 </div>
						             <div class="row mb-3">
						  <label class="col-sm-3 form-label" for="flatpickr-disabled-range">실적 종료</label>
						  <div class="col-sm-9">
						  	<input type="text" class="form-control" placeholder="YYYY-MM-DD" value="${programModifiy.task_realend}" id="flatpickr-disabled-range" />
						  </div>
						 </div>
					    <div class="row mb-3">
					      <label class="col-sm-3 col-form-label" for="task-progress">작업진척율</label>
					      <div class="col-sm-9">
					        <select id="task-progress" class="select2 form-select" data-allow-clear="true">
					          <c:if test="${programModifiy.task_status == null}">
						          <option value="">선택</option>
						          <option value="미진행">미진행</option>
						          <option value="화면개발">화면개발</option>
						          <option value="단위테스트">단위테스트</option>
						          <option value="PL테스트">PL테스트</option>
						          <option value="완료">완료</option>
					          </c:if>
					          <c:if test="${programModifiy.task_status == '미진행'}">
						          <option value="">선택</option>
						          <option value="미진행" selected="selected">미진행</option>
						          <option value="화면개발">화면개발</option>
						          <option value="단위테스트">단위테스트</option>
						          <option value="PL테스트">PL테스트</option>
						          <option value="완료">완료</option>
					          </c:if>
					          <c:if test="${programModifiy.task_status == '화면개발'}">
						          <option value="">선택</option>
						          <option value="미진행">미진행</option>
						          <option value="화면개발" selected="selected">화면개발</option>
						          <option value="단위테스트">단위테스트</option>
						          <option value="PL테스트">PL테스트</option>
						          <option value="완료">완료</option>
					          </c:if>
					          <c:if test="${programModifiy.task_status == '단위테스트'}">
						          <option value="">선택</option>
						          <option value="미진행">미진행</option>
						          <option value="화면개발">화면개발</option>
						          <option value="단위테스트" selected="selected">단위테스트</option>
						          <option value="PL테스트">PL테스트</option>
						          <option value="완료">완료</option>
					          </c:if>
					          <c:if test="${programModifiy.task_status == 'PL테스트'}">
						          <option value="">선택</option>
						          <option value="미진행">미진행</option>
						          <option value="화면개발">화면개발</option>
						          <option value="단위테스트">단위테스트</option>
						          <option value="PL테스트" selected="selected">PL테스트</option>
						          <option value="완료">완료</option>
					          </c:if>
					          <c:if test="${programModifiy.task_status == '완료'}">
						          <option value="">선택</option>
						          <option value="미진행">미진행</option>
						          <option value="화면개발">화면개발</option>
						          <option value="단위테스트">단위테스트</option>
						          <option value="PL테스트">PL테스트</option>
						          <option value="완료" selected="selected">완료</option>
					          </c:if>
					        </select>
					      </div>
					    </div>
					    
					  </form>
					</div>
               	</div>
              <!--/ 프로그램 등록 -->
               <div
                  class="offcanvas offcanvas-end"
                  tabindex="-1"
                  id="offcanvasEcommerceCategoryList"
                  aria-labelledby="offcanvasEcommerceCategoryListLabel"
                  >
                  <!-- Offcanvas Header -->
                  <div class="offcanvas-header py-4">
                    <h5 id="offcanvasEcommerceCategoryListLabel" class="offcanvas-title">프로그램 등록</h5>
                    <button
                      type="button"
                      class="btn-close bg-label-secondary text-reset"
                      data-bs-dismiss="offcanvas"
                      aria-label="Close"></button>
                  </div> 
                  <!-- Offcanvas Body -->
                  <div class="offcanvas-body border-top">
                    <form class="pt-0" id="eCommerceCategoryListForm">
                      <!-- Title -->
                      <div class="row mb-4 mt-3">
                        <label class="col-sm-4 col-form-label" for="multicol-program">프로그램명</label>
                        <div class="col-sm-8">
                          <div class="col-sm-8 input-group input-group-merge">
                            <input
                              type="text"
                              id="multicol-program"
                              class="form-control"
                              name="task_name"
                              placeholder="프로그램명"
                              aria-label="john.doe"
                              aria-describedby="multicol-email2" />
                          </div>
                        </div>
                      </div>

                      <div class="row mb-4">
                        <label class="col-sm-4 col-form-label" for="TagifyUserList">담당자</label>
                        <div class="col-sm-8">
                          <input type="text" id="TagifyUserList" class="form-control" name="emp_note" />
                        </div>
                      </div>
                      
                      <div class="row mb-4">
                        <label class="col-sm-4 col-form-label" for="multicol-task">URL</label>
                        <div class="col-sm-8">
                          <div class="input-group input-group-merge">
                            <input
                              type="text"
                              id="multicol-task"
                              class="form-control"
                              placeholder="업무구분"
                              name="task_url"
                              aria-describedby="multicol-password2" />
                          </div>
                        </div>
                      </div>
                      <div class="row mb-4">
                        <label class="col-sm-4 col-form-label" for="task-priority-plus">작업 중요도</label>
                        
                        <div class="col-sm-8">
                          <select id="task-priority-plus" name="task_importance" class="select2 form-select" data-allow-clear="true">
                          	<option value="">Select</option>
                            <option value="상">상</option>
                            <option value="중">중</option>
                            <option value="하">하</option>
                            
                          </select>
                        </div>
                      </div>
                      <div class="row mb-4">
                        <label class="col-sm-4 col-form-label" for="multicol-category">프로그램 유형</label>
                        <div class="col-sm-8">
                          <select id="multicol-category" name="task_category" class="select2 form-select" data-allow-clear="true">
                            <option value="">Select</option>
                            <option value="온라인">온라인</option>
                            <option value="배치">배치</option>
                            <option value="선택">선택</option>
                         
                          </select>
                        </div>
                      </div>
                      <div class="row mb-4">
                        <label class="col-sm-4 col-form-label" for="detail-category2">세부 유형</label>
                        <div class="col-sm-8">
                          <select id="detail-category2" name="task_detail" class="select2 form-select" data-allow-clear="true">
                            <option value="">Select</option>
                            <option value="화면(메인)">화면(메인)</option>
                            <option value="화면(탭)">화면(탭)</option>
                            <option value="화면(팝업)">화면(팝업)</option>
                            <option value="보고서">보고서</option>
                            <option value="배치">배치</option>
                         
                          </select>
                        </div>
                      </div>
                      <div class="row mb-4 com-sm-12">
                         <label for="bs-rangepicker-week-num" class="form-label col-sm-4">개발 예정 기간</label>
                          <div class="col-sm-8">
                          	<input type="text" id="bs-rangepicker-week-num" class="form-control col-sm-8" />
                          </div>
                      </div>
                      
                      

                      <div class="row mb-5">
                        <label class="col-sm-4 col-form-label" for="task-progress2">작업진척율</label>
                        <div class="col-sm-8">
                          <select id="task-progress2" name="task_status" class="select2 form-select" data-allow-clear="true">
                          	<option value="">Select</option>
                            <option value="미진행">미진행</option>
                            <option value="화면개발">화면개발</option>
                            <option value="단위테스트">단위테스트</option>
                            <option value="PL테스트">PL테스트</option>
                            <option value="완료">완료</option>
                          </select>
                        </div>
                      </div>

                    
                      <!-- Submit and reset -->
                      <div class="col-sm-12 col-md-8 ps-5 ms-4">
                        <button type="submit" class="btn btn-primary me-sm-3 me-1 data-submit">등록</button>
                        <button type="reset" class="btn bg-label-danger" data-bs-dismiss="offcanvas">취소</button>
                      </div>
                    </form>
                  </div>
                </div>

              <!-- Add Role Modal -->
              <!-- Add Role Modal -->
              
              <!--/ Add Role Modal -->

              <!-- / Add Role Modal -->
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
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/datatables-bs5/datatables-bootstrap5.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/@form-validation/umd/bundle/popular.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/@form-validation/umd/plugin-bootstrap5/index.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/@form-validation/umd/plugin-auto-focus/index.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/cleavejs/cleave.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/cleavejs/cleave-phone.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/moment/moment.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/flatpickr/flatpickr.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/select2/select2.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/bootstrap-datepicker/bootstrap-datepicker.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/bootstrap-daterangepicker/bootstrap-daterangepicker.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/jquery-timepicker/jquery-timepicker.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/pickr/pickr.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/tagify/tagify.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/bootstrap-select/bootstrap-select.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/typeahead-js/typeahead.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/bloodhound/bloodhound.js"></script>
	
	<!-- Main JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
    
    <!-- Page JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/forms-pickers.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/form-layouts.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/header.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/forms-selects.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/forms-typeahead.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/app-access-roles.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/modal-add-role.js"></script>
    
  </body>
</html>
