<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	href="${pageContext.request.contextPath}/resources/assets/vendor/libs/datatables-bs5/datatables.bootstrap5.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/vendor/libs/datatables-responsive-bs5/responsive.bootstrap5.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/vendor/libs/@form-validation/umd/styles/index.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/vendor/libs/flatpickr/flatpickr.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/vendor/libs/bootstrap-datepicker/bootstrap-datepicker.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/vendor/libs/bootstrap-daterangepicker/bootstrap-daterangepicker.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/vendor/libs/jquery-timepicker/jquery-timepicker.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/vendor/libs/pickr/pickr-themes.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/vendor/libs/flatpickr/flatpickr.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/vendor/libs/select2/select2.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/vendor/libs/tagify/tagify.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/vendor/libs/bootstrap-select/bootstrap-select.css" />

<!-- Page CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/vendor/css/pages/page-faq.css" />


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
            <li class="menu-item active">
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
						<h4 class="py-3 mb-2">프로그램 목록</h4>


						<!-- Role cards -->
						<div class="row">

							<div class="col-md-7 col-lg-7 mb-4 mb-md-0">
								<!-- Role Table -->
								<div class="card">
									<div class="card-datatable table-responsive">
										<div><input type="hidden" value="${emp_no}" id="now_emp_no"/></div>
										<div><input type="hidden" value="${empinfo_no}" id="now_empinfo_no"/></div>
										<table class="datatables-users table border-top"
											style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
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
							<div class="col-md-5 col-lg-5 mb-4 mb-md-0 py-0"
								id="programModifyContainer">
								<div class="card mb-5">
									<h5 class="card-header mb-4">프로그램 상세정보</h5>
									<form class="card-body">
										<div class="row mb-3">
											<label class="col-sm-3 col-form-label" for="multicol-email">프로그램명</label>
											<div class="col-sm-9">
												<div class="input-group input-group-merge">
													<input type="text" id="multicol-email" class="form-control"
														placeholder="프로그램명" value="${programModifiy.task_name}"
														aria-label="john.doe" aria-describedby="multicol-email2" />
												</div>
											</div>
										</div>
										<div class="row mb-3">
											<label class="col-sm-3 col-form-label" for="multicol-user">담당자</label>
											<div class="col-sm-9">
												<input type="text" id="multicol-user" class="form-control"
													placeholder="담당자" value="${programModifiy.empinfo_name}" />
											</div>
										</div>

										<div class="row form-password-toggle mb-3">
											<label class="col-sm-3 col-form-label"
												for="multicol-password">URL</label>
											<div class="col-sm-9">
												<div class="input-group input-group-merge">
													<input type="text" id="multicol-password"
														class="form-control" value="${programModifiy.task_url}"
														placeholder="URL" aria-describedby="multicol-password2" />
												</div>
											</div>
										</div>
										<div class="row mb-3">
											<label class="col-sm-3 col-form-label" for="task-priority">작업
												중요도</label>

											<div class="col-sm-9">
												<select id="task-priority" class="select2 form-select"
													data-allow-clear="true">
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
											<label class="col-sm-3 col-form-label" for="multicol-country">프로그램
												유형</label>
											<div class="col-sm-9">
												<select id="multicol-country" class="select2 form-select"
													data-allow-clear="true">
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
												<select id="detail-category" class="select2 form-select"
													data-allow-clear="true">
													<c:if test="${programModifiy.task_detail == null}">
														<option value=""></option>
														<option value="화면(메인)">화면(메인)</option>
														<option value="화면(탭)">화면(탭)</option>
														<option value="화면(팝업)">화면(팝업)</option>
														<option value="보고서">보고서</option>
														<option value="배치">배치</option>
													</c:if>
													<c:if test="${programModifiy.task_detail == '화면(메인)'}">
														<option value="">선택</option>
														<option value="화면(메인)" selected="selected">화면(메인)</option>
														<option value="화면(탭)">화면(탭)</option>
														<option value="화면(팝업)">화면(팝업)</option>
														<option value="보고서">보고서</option>
														<option value="배치">배치</option>
													</c:if>
													<c:if test="${programModifiy.task_detail == '화면(탭)'}">
														<option value="">선택</option>
														<option value="화면(메인)">화면(메인)</option>
														<option value="화면(탭)" selected="selected">화면(탭)</option>
														<option value="화면(팝업)">화면(팝업)</option>
														<option value="보고서">보고서</option>
														<option value="배치">배치</option>
													</c:if>
													<c:if test="${programModifiy.task_detail == '화면(팝업)'}">
														<option value="">선택</option>
														<option value="화면(메인)">화면(메인)</option>
														<option value="화면(탭)">화면(탭)</option>
														<option value="화면(팝업)" selected="selected">화면(팝업)</option>
														<option value="보고서">보고서</option>
														<option value="배치">배치</option>
													</c:if>
													<c:if test="${programModifiy.task_detail=='보고서'}">
														<option value="">선택</option>
														<option value="화면(메인)">화면(메인)</option>
														<option value="화면(탭)">화면(탭)</option>
														<option value="화면(팝업)">화면(팝업)</option>
														<option value="보고서" selected="selected">보고서</option>
														<option value="배치">배치</option>
													</c:if>
													<c:if test="${programModifiy.task_detail == '배치'}">
														<option value="">선택</option>
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
											<label class="col-sm-3 col-form-label" for="flatpickr-range">개발
												예정 기간</label>
											<div class="col-sm-9">
												<input type="text" class="form-control"
													value="${programModifiy.task_date}"
													placeholder="YYYY-MM-DD to YYYY-MM-DD" id="flatpickr-range" />
											</div>
										</div>
										<div class="row mb-3">
											<label class="col-sm-3 form-label" for="flatpickr-date">실적
												시작</label>
											<div class="col-sm-9">
												<input type="text" class="form-control"
													placeholder="YYYY-MM-DD"
													value="${programModifiy.task_realstart}"
													id="flatpickr-date" />
											</div>
										</div>
										<div class="row mb-3">
											<label class="col-sm-3 form-label"
												for="flatpickr-disabled-range">실적 종료</label>
											<div class="col-sm-9">
												<input type="text" class="form-control"
													placeholder="YYYY-MM-DD"
													value="${programModifiy.task_realend}"
													id="flatpickr-disabled-range" />
											</div>
										</div>
										<div class="row mb-3">
											<label class="col-sm-3 col-form-label" for="task-progress">작업진척률</label>
											<div class="col-sm-9">
												<select id="task-progress" class="select2 form-select"
													data-allow-clear="true">
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
							<div class="offcanvas offcanvas-end" tabindex="-1"
								id="offcanvasEcommerceCategoryList"
								aria-labelledby="offcanvasEcommerceCategoryListLabel">
								<!-- Offcanvas Header -->
								<div class="offcanvas-header py-4">
									<h5 id="offcanvasEcommerceCategoryListLabel"
										class="offcanvas-title">프로그램 등록</h5>
									<button type="button"
										class="btn-close bg-label-secondary text-reset"
										data-bs-dismiss="offcanvas" aria-label="Close"></button>
								</div>
								<!-- Offcanvas Body -->
								<div class="offcanvas-body border-top">
									<form class="pt-0" id="eCommerceCategoryListForm">
										<!-- Title -->
										<div class="row mb-4 mt-3">
											<label class="col-sm-4 col-form-label" for="multicol-program">프로그램명</label>
											<div class="col-sm-8">
												<div class="col-sm-8 input-group input-group-merge">
													<input type="text" id="multicol-program"
														class="form-control" name="task_name" placeholder="프로그램명"
														aria-label="john.doe" aria-describedby="multicol-email2" />
												</div>
											</div>
										</div>

										<div class="row mb-4">
											<label class="col-sm-4 col-form-label" for="TagifyUserList">담당자</label>
											<div class="col-sm-8">
												<input type="text" id="TagifyUserList" class="form-control"
													name="emp_note" />
											</div>
										</div>

										<div class="row mb-4">
											<label class="col-sm-4 col-form-label" for="multicol-task">URL</label>
											<div class="col-sm-8">
												<div class="input-group input-group-merge">
													<input type="text" id="multicol-task" class="form-control"
														placeholder="업무구분" name="task_url"
														aria-describedby="multicol-password2" />
												</div>
											</div>
										</div>
										<div class="row mb-4">
											<label class="col-sm-4 col-form-label"
												for="task-priority-plus">작업 중요도</label>

											<div class="col-sm-8">
												<select id="task-priority-plus" name="task_importance"
													class="select2 form-select" data-allow-clear="true">
													<option value="">Select</option>
													<option value="상">상</option>
													<option value="중">중</option>
													<option value="하">하</option>

												</select>
											</div>
										</div>
										<div class="row mb-4">
											<label class="col-sm-4 col-form-label"
												for="multicol-category">프로그램 유형</label>
											<div class="col-sm-8">
												<select id="multicol-category" name="task_category"
													class="select2 form-select" data-allow-clear="true">
													<option value="">Select</option>
													<option value="온라인">온라인</option>
													<option value="배치">배치</option>
													<option value="선택">선택</option>

												</select>
											</div>
										</div>
										<div class="row mb-4">
											<label class="col-sm-4 col-form-label" for="detail-category2">세부유형</label>
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
											<label for="bs-rangepicker-week-num"
												class="form-label col-sm-4">개발 예정 기간</label>
											<div class="col-sm-8">
												<input type="text" id="bs-rangepicker-week-num"
													class="form-control col-sm-8" />
											</div>
										</div>



										<div class="row mb-5">
											<label class="col-sm-4 col-form-label" for="task-progress2">작업진척율</label>
											<div class="col-sm-8">
												<select id="task-progress2" name="task_status"
													class="select2 form-select" data-allow-clear="true">
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
											<button type="submit"
												class="btn btn-primary me-sm-3 me-1 data-submit">등록</button>
											<button type="reset" class="btn bg-label-danger"
												data-bs-dismiss="offcanvas">취소</button>
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
			src="${pageContext.request.contextPath}/resources/assets/vendor/libs/datatables-bs5/datatables-bootstrap5.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/assets/vendor/libs/@form-validation/umd/bundle/popular.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/assets/vendor/libs/@form-validation/umd/plugin-bootstrap5/index.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/assets/vendor/libs/@form-validation/umd/plugin-auto-focus/index.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/assets/vendor/libs/cleavejs/cleave.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/assets/vendor/libs/cleavejs/cleave-phone.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/assets/vendor/libs/moment/moment.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/assets/vendor/libs/flatpickr/flatpickr.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/assets/vendor/libs/select2/select2.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/assets/vendor/libs/bootstrap-datepicker/bootstrap-datepicker.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/assets/vendor/libs/bootstrap-daterangepicker/bootstrap-daterangepicker.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/assets/vendor/libs/jquery-timepicker/jquery-timepicker.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/assets/vendor/libs/pickr/pickr.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/assets/vendor/libs/tagify/tagify.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/assets/vendor/libs/bootstrap-select/bootstrap-select.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/assets/vendor/libs/typeahead-js/typeahead.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/assets/vendor/libs/bloodhound/bloodhound.js"></script>

		<!-- Main JS -->
		<script
			src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

		<!-- Page JS -->
		<script
			src="${pageContext.request.contextPath}/resources/assets/js/forms-pickers.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/assets/js/form-layouts.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/assets/js/header.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/assets/js/forms-selects.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/assets/js/forms-typeahead.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/assets/js/app-access-roles.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/assets/js/modal-add-role.js"></script>
</body>
</html>
