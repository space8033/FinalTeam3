<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/assets/vendor/libs/fullcalendar/fullcalendar.css" />
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/assets/vendor/libs/flatpickr/flatpickr.css" />
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/assets/vendor/libs/select2/select2.css" />
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/assets/vendor/libs/quill/editor.css" />
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/assets/vendor/libs/@form-validation/umd/styles/index.min.css" />
	    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/apex-charts/apex-charts.css" />

    <!-- Page CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/css/pages/card-analytics.css" />

    <!-- Helpers -->
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/js/helpers.js"></script>
    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Template customizer: To hide customizer set displayCustomizer value false in config.js.  -->
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/js/template-customizer.js"></script>
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/config.js"></script>
    <!-- calendar -->
    <script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
      });

    </script>
  </head>

  <body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->
 		 <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
          <div class="app-brand demo">
            <a href="main" class="app-brand-link">
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
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-task"></i>
                <div class="text-truncate">일정관리</div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="${pageContext.request.contextPath}/teamCalendar" class="menu-link">
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
            <li class="menu-item">
              <a href="${pageContext.request.contextPath}/task/programManagement" class="menu-link">
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
              <a href="${pageContext.request.contextPath}/project/modifyProject" class="menu-link">
                <i class="menu-icon tf-icons bx bxs-edit"></i>
                <div class="text-truncate">프로젝트 수정</div>
              </a>
            </li>
            
            <li class="menu-item">
              <a href="${pageContext.request.contextPath}/employee/join" class="menu-link">
                <i class="menu-icon tf-icons bx bx-user"></i>
                <div class="text-truncate">사용자 등록</div>
              </a>
            </li>
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

            <div class="container-xxl flex-grow-1" >
              <div class="row">
				<div style="width:60%;">							
					<!-- 공지사항 -->
					<div class="col-md-6 col-lg-8 mb-4 mb-md-0" style="width:100%; padding-top:1.625rem;">
						<div class="card">
						    <div class="card-datatable table-responsive">
			                  <table id="noticeTable" class="datatables-products table border-top" style="width:100%;">
			                    <thead>
			                      <th colspan="2">최신 공지사항</th>
			                      <th></th>
			                      <th></th>
			                      <tr>
			                        <th>No</th>
			                        <th>제목</th>
			                        <th>작성자</th>
			                        <th>날짜</th>
			                      </tr>
			                    </thead>
			
			                  </table>
			                </div>
						 </div>		
					  </div>
					  
					  <!-- 캘린더 -->
					 <div class="col-md-6 col-lg-8 mb-4 mb-md-0" style="width:100%;">
			            <div class="flex-grow-1 container-p-y">
			              <div class="card app-calendar-wrapper">
			                <div class="row g-0">
			                  <div class="col app-calendar-content">
									<div class="card shadow-none border-0">
										<div class="card-body pb-0">
											<!-- FullCalendar -->
											<div id="calendar"></div>
										</div>
									</div>
									<div class="app-overlay"></div>
									<!-- FullCalendar Offcanvas -->
									<div class="offcanvas offcanvas-end event-sidebar"
										tabindex="-1" id="addEventSidebar"
										aria-labelledby="addEventSidebarLabel">
										<div class="offcanvas-header border-bottom">
											<h5 class="offcanvas-title mb-2" id="addEventSidebarLabel"></h5>
											<button type="button" class="btn-close text-reset"
												data-bs-dismiss="offcanvas" aria-label="Close"></button>
										</div>
										<div class="offcanvas-body">
											<form class="event-form pt-0" id="eventForm" name="CalendarRequest">
<!-- 											<form class="event-form pt-0" id="eventForm" action="/deleteCalendar" method="post"
												name="CalendarRequest" onsubmit="return false"> -->
												<div class="mb-3">
													<label class="form-label" for="eventTitle">제목</label> <input
														type="text" class="form-control" id="eventTitle"
														name="eventTitle" />
												</div>
												<div class="mb-3">
													<label class="form-label" for="eventDescription">내용</label>
													<textarea class="form-control" name="eventDescription"
														id="eventDescription"></textarea>
												</div>
												<div class="mb-3">
													<label class="form-label" for="eventLabel">분류</label> <select
														class="select2 select-event-label form-select"
														id="eventLabel" name="eventLabel">
														<!-- <option data-label="primary" value="Business" selected>업무</option> -->
														<option data-label="danger" value="Personal" selected="selected">개인 일정</option>
														<option data-label="success" value="Holiday">휴가</option>
														<option data-label="info" value="ETC">기타</option>
													</select>
												</div>
												<div class="mb-3">
													<label class="form-label" for="eventStartDate">시작 날짜</label>
													<input type="text" class="form-control"
														id="eventStartDate" name="eventStartDate" />
												</div>
												<div class="mb-3">
													<label class="form-label" for="eventEndDate">종료 날짜</label>
													<input type="text" class="form-control" id="eventEndDate"
														name="eventEndDate" />
												</div>
												<div class="mb-3">
													<label class="switch"> <input type="checkbox"
														class="switch-input allDay-switch" /> <span
														class="switch-toggle-slider"> <span
															class="switch-on"></span> <span class="switch-off"></span>
													</span> <span class="switch-label">하루종일</span>
													</label>
												</div>
												<div
													class="mb-3 d-flex justify-content-sm-between justify-content-start my-4">
													<div>
														<button type="submit" id="calendarsubmit"
															class="btn btn-primary btn-add-event me-sm-3 me-1"></button>
														<button type="reset"
															class="btn btn-label-secondary btn-cancel me-sm-0 me-1"
															data-bs-dismiss="offcanvas">취소</button>
													</div>
													<div>
														<textarea id="taskNo" style="display: none">${CalendarResponse2.task_no}</textarea>
														<button type="button" id="taskDeleteButton" class="btn btn-label-danger btn-delete-event d-none">삭제</button>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
			                </div>
			              </div>
			            </div>
	          		</div>
					 
					 
					
					
					
					
					 
					 
					 
					 
					 
					 
			</div>
			
              	<div style="width:40%;">
              		
              		<!-- 개인별 진척도 -->
					 <div class="col-md-6 col-lg-4 mb-4 mb-mb-0" style="width:100%; padding-top:1.625rem;">
	                  <div class="card text-center" style="padding-: 1.625rem !important;">
	                    <div class="card-header py-3">
	                      <ul class="nav nav-pills" role="tablist">
	                      	<c:forEach items="${team_names}" var="teamName" varStatus="teamStatus">
	                      		<c:if test="${teamStatus.count == 1}">
			                        <li class="nav-item">
			                          <button
			                            type="button"
			                            class="nav-link active"
			                            role="tab"
			                            data-bs-toggle="tab"
			                            data-bs-target="#target1"
			                            aria-selected="true">
			                            	${teamName}
			                          </button>
			                        </li>
	                      		</c:if>
	                      		<c:if test="${teamStatus.count != 1}">
			                        <li class="nav-item">
			                          <button
			                            type="button"
			                            class="nav-link"
			                            role="tab"
			                            data-bs-toggle="tab"
			                            data-bs-target="#target${teamStatus.count}"
			                            aria-selected="false">
			                            	${teamName}
			                          </button>
			                        </li>
	                      		</c:if>
	                      	</c:forEach>
	                      </ul>
	                    </div>
	                    <div class="tab-content pt-0">
	                    
	                    <c:forEach items="${taskList}" var="tl" varStatus="tlStatus">
	                      <c:if test="${tlStatus.count == 1}">
		                      <div class="tab-pane fade show active" id="target${tlStatus.count}" role="tabpanel">
		                        <div class="table-responsive text-start">
		                          <table class="table table-borderless text-nowrap">
		                            <thead>
		                              <tr>
		                                <th>No</th>
		                                <th>담당 업무</th>
		                                <th>이름</th>
		                                <th class="w-50">진척률</th>
		                              </tr>
		                            </thead>
		                            <tbody>
		                              <c:forEach items="${tl.response}" var="response" varStatus="resStatus">
		                              	  <c:if test="${resStatus.count < 7}">
				                              <tr>
				                                <td>${response.index}</td>
				                                <td>
				                                  <div class="d-flex align-items-center">
				                                    <span>${response.team_duty}</span>
				                                  </div>
				                                </td>
				                                <td>${response.empinfo_name}</td>
				                                <td>
				                                  <div class="d-flex justify-content-between align-items-center gap-3">
				                                    <div class="progress w-100" style="height: 10px">
				                                      <div
				                                        class="progress-bar bg-success"
				                                        role="progressbar"
				                                        style="width: ${response.progress_rate}%"
				                                        aria-valuenow="${response.progress_rate}"
				                                        aria-valuemin="0"
				                                        aria-valuemax="100"></div>
				                                    </div>
				                                    <small class="fw-medium">${response.progress_rate}%</small>
				                                  </div>
				                                </td>
				                              </tr>
		                              	  </c:if>
		                              </c:forEach>
		                            </tbody>
		                          </table>
		                        </div>
		                      </div>
	                      </c:if>
	                      <c:if test="${tlStatus.count != 1}">
		                      <div class="tab-pane fade" id="target${tlStatus.count}" role="tabpanel">
		                        <div class="table-responsive text-start">
		                          <table class="table table-borderless text-nowrap">
		                            <thead>
		                              <tr>
		                                <th>No</th>
		                                <th>담당 업무</th>
		                                <th>이름</th>
		                                <th class="w-50">진척률</th>
		                              </tr>
		                            </thead>
		                            <tbody>
		                              <c:forEach items="${tl.response}" var="response" varStatus="resStatus">
		                              	  <c:if test="${resStatus.count < 7}">
				                              <tr>
				                                <td>${response.index}</td>
				                                <td>
				                                  <div class="d-flex align-items-center">
				                                    <span>${response.team_duty}</span>
				                                  </div>
				                                </td>
				                                <td>${response.empinfo_name}</td>
				                                <td>
				                                  <div class="d-flex justify-content-between align-items-center gap-3">
				                                    <div class="progress w-100" style="height: 10px">
				                                      <div
				                                        class="progress-bar bg-success"
				                                        role="progressbar"
				                                        style="width: ${response.progress_rate}%"
				                                        aria-valuenow="${response.progress_rate}"
				                                        aria-valuemin="0"
				                                        aria-valuemax="100"></div>
				                                    </div>
				                                    <small class="fw-medium">${response.progress_rate}%</small>
				                                  </div>
				                                </td>
				                              </tr>
		                              	  </c:if>
		                              </c:forEach>
		                            </tbody>
		                          </table>
		                        </div>
		                      </div>
	                      </c:if>
	                    </c:forEach>
	                  </div>
	                </div>
				</div>
				          
	                <!-- 진척률 -->
	                <div class="col-md-4" style="width:100%;">
	                	<div class="card">
	                      <div class="card-body">
	                        <div class="text-center">
	                          <div class="dropdown">
	                            <button
	                              class="btn btn-sm btn-label-primary"
	                              type="button"
	                              id="growthReportId"
	                              aria-haspopup="true"
	                              aria-expanded="false">
	                              	${project_name}
	                            </button>
	                            <!-- <div class="dropdown-menu dropdown-menu-end" aria-labelledby="growthReportId">
	                              <a class="dropdown-item" href="javascript:void(0);">프로젝트 2</a>
	                              <a class="dropdown-item" href="javascript:void(0);">프로젝트 3</a>
	                              <a class="dropdown-item" href="javascript:void(0);">프로젝트 4</a>
	                            </div> -->
	                          </div>
	                        </div>
	                      </div>
	                      <input type="hidden" value="${progressRate}" id="rateBox"/>
	                      <div id="growthChart"></div>
	                      <div class="text-center fw-medium pt-3 mb-2">화이팅!</div>
	
	                      <div class="d-flex px-xxl-4 px-lg-2 p-4 gap-xxl-3 gap-lg-1 gap-3 justify-content-between">
	                        <div class="d-flex">
	                          <div class="me-2">
	                            <span class="badge bg-label-primary p-2"><i class='bx bx-calendar-star' ></i></span>
	                          </div>
	                          <div class="d-flex flex-column">
	                            <small>프로젝트 시작</small>
	                            <h6 class="mb-0">${start}~</h6>
	                          </div>
	                        </div>
	                        <div class="d-flex">
	                          <div class="me-2">
	                            <span class="badge bg-label-info p-2"><i class='bx bx-calendar-x'></i></span>
	                          </div>
	                          <div class="d-flex flex-column">
	                            <small>프로젝트 종료</small>
	                            <h6 class="mb-0">~${end}</h6>
	                          </div>
	                        </div>
	                      </div>
	                    </div>
	              	</div>
              	
              	
              	
              	</div>
              

              
              	
              	
		     </div>
		   	</div>
		   </div>
	  	</div>
	  </div>
            <!-- / Content -->

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
    <script
		src="${pageContext.request.contextPath}/resources/assets/vendor/libs/fullcalendar/fullcalendar.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/datatables-bs5/datatables-bootstrap5.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/apex-charts/apexcharts.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/@form-validation/umd/bundle/popular.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/@form-validation/umd/plugin-bootstrap5/index.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/@form-validation/umd/plugin-auto-focus/index.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/select2/select2.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/flatpickr/flatpickr.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/moment/moment.js"></script>

    <!-- Main JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

    <!-- Page JS -->
    <script
		src="${pageContext.request.contextPath}/resources/assets/js/calendar.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/mainRank.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/mainGraph.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/mainNoticeList.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/header.js"></script>
    
    <script>
        // 사이드바 숨기기
        //document.getElementById('app-calendar-sidebar').style.display = 'none';

        // 사이드바 보이기
        // document.getElementById('app-calendar-sidebar').style.display = 'block';
    </script>
    
  </body>
</html>
