<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en"
	class="light-style layout-navbar-fixed layout-menu-fixed layout-compact"
	dir="ltr" data-theme="theme-default"
	data-assets-path="${pageContext.request.contextPath}/resources/assets/"
	data-template="vertical-menu-template">
<head>
<meta charset="utf-8" />
<meta name="viewport"
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/vendor/fonts/boxicons.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/vendor/fonts/fontawesome.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/vendor/fonts/flag-icons.css" />

<!-- Core CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/vendor/css/rtl/core.css"
	class="template-customizer-core-css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/vendor/css/rtl/theme-default.css"
	class="template-customizer-theme-css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/demo.css" />

<!-- Vendors CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/vendor/libs/typeahead-js/typeahead.css" />
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

<!-- Page CSS -->

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/vendor/css/pages/app-calendar.css" />

<!-- Helpers -->
<script
	src="${pageContext.request.contextPath}/resources/assets/vendor/js/helpers.js"></script>
<!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
<!--? Template customizer: To hide customizer set displayCustomizer value false in config.js.  -->
<script
	src="${pageContext.request.contextPath}/resources/assets/vendor/js/template-customizer.js"></script>
<!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
<script
	src="${pageContext.request.contextPath}/resources/assets/js/config.js"></script>
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
                
            <li class="menu-item active">
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

				<%@ include file="/WEB-INF/views/header.jsp"%>
				<!-- / Navbar -->

				<!-- Content wrapper -->
				<div class="content-wrapper">
					<!-- Content -->

					<div class="container-xxl flex-grow-1 container-p-y">
						<div class="card app-calendar-wrapper">
							<div class="row g-0">
								<!-- Calendar Sidebar -->
								<div class="col app-calendar-sidebar" id="app-calendar-sidebar">
									<div class="border-bottom p-4 my-sm-0 mb-3">
										<div class="d-grid">
											<button class="btn btn-primary btn-toggle-sidebar"
												data-bs-toggle="offcanvas" data-bs-target="#addEventSidebar"
												aria-controls="addEventSidebar">
												<i class="bx bx-plus me-1"></i> <span class="align-middle">일정 추가하기</span>
											</button>
										</div>
									</div>
									<div class="p-4">
										<!-- inline calendar (flatpicker) -->
										<div class="ms-n2">
											<div class="inline-calendar"></div>
										</div>

										<hr class="container-m-nx my-4" />

										<!-- Filter -->
										<div class="mb-4">
											<small
												class="text-small text-muted text-uppercase align-middle">분류</small>
										</div>

										<div class="form-check mb-2" style="display:none;">
											<input class="form-check-input select-all" type="checkbox"
												id="selectAll" data-value="all" checked /> <label
												class="form-check-label" for="selectAll">전체</label>
										</div>

										<div class="app-calendar-events-filter">
											<div class="form-check form-check-danger mb-2">
												<input class="form-check-input input-filter" type="checkbox"
													id="select-personal" data-value="personal" checked /> <label
													class="form-check-label" for="select-personal">개인 일정</label>
											</div>
											<div class="form-check mb-2">
												<input class="form-check-input input-filter" type="checkbox"
													id="select-business" data-value="business" checked /> <label
													class="form-check-label" for="select-business">업무</label>
											</div>
											<div class="form-check form-check-success mb-2">
												<input class="form-check-input input-filter" type="checkbox"
													id="select-holiday" data-value="holiday" checked /> <label
													class="form-check-label" for="select-holiday">휴가</label>
											</div>
											<div class="form-check form-check-info">
												<input class="form-check-input input-filter" type="checkbox"
													id="select-etc" data-value="etc" checked /> <label
													class="form-check-label" for="select-etc">기타</label>
											</div>
										</div>
									</div>
								</div>
								<!-- /Calendar Sidebar -->

								<!-- Calendar & Modal -->
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
														name="eventTitle" autocomplete=off />
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
								<!-- /Calendar & Modal -->
							</div>
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

	<script
		src="${pageContext.request.contextPath}/resources/assets/vendor/libs/jquery/jquery.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/vendor/libs/popper/popper.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/vendor/js/bootstrap.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/vendor/libs/hammer/hammer.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/vendor/libs/i18n/i18n.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/vendor/libs/typeahead-js/typeahead.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/vendor/js/menu.js"></script>

	<!-- endbuild -->

	<!-- Vendors JS -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/vendor/libs/fullcalendar/fullcalendar.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/vendor/libs/@form-validation/umd/bundle/popular.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/vendor/libs/@form-validation/umd/plugin-bootstrap5/index.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/vendor/libs/@form-validation/umd/plugin-auto-focus/index.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/vendor/libs/select2/select2.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/vendor/libs/flatpickr/flatpickr.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/vendor/libs/moment/moment.js"></script>

	<!-- Main JS -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

	<!-- Page JS -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/calendar.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/header.js"></script>


</body>
</html>
