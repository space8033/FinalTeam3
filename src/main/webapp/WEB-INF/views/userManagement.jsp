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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/select2/select2.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/tagify/tagify.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/bootstrap-select/bootstrap-select.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/typeahead-js/typeahead.css" />

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
	            
	            <li class="menu-item">
	              <a href="${pageContext.request.contextPath}/employee/join" class="menu-link">
	                <i class="menu-icon tf-icons bx bx-user"></i>
	                <div class="text-truncate">사용자 등록</div>
	              </a>
	            </li>
	            
	            <li class="menu-item active">
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
              <div class="container-xxl flex-grow-1 container-p-y d-flex">

              <!-- Basic Bootstrap Table -->
	              <div style="width : 50%">
	              	<div class="card" style="height: 514px;">
		                <h5 class="card-header">팀 목록</h5>
		                <div class="table-responsive text-nowrap">
		                  <table class="table">
		                    <thead>
		                      <tr>
		                        <th>팀명</th>
		                        <th>팀장</th>
		                        <th>팀원</th>
		                        <th>팀업무</th>
		                        <th>삭제</th>
		                      </tr>
		                    </thead>
		                    <c:forEach var="teams" items="${list}" varStatus="status">
			                    <tbody class="table-border-bottom-0">
			                      <tr>
			                        <td>
			                          <span class="fw-medium">${teams.team_name}</span>
			                        </td>
			                        <td>${teams.team_leader}</td>
			                        <td>
			                          <ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
			                          	<c:forEach var="members" items="${teams.team_memberNames}" varStatus="memberStatus">
			                          		<c:if test="${memberStatus.count < 4}">
				                             	<li
					                              data-bs-toggle="tooltip"
					                              data-popup="tooltip-custom"
					                              data-bs-placement="top"
					                              class="avatar avatar-xs pull-up"
					                              title="${members.empinfo_name}">
					                                <c:if test="${members.photo == null}">
					                                	<c:if test="${members.emp_no % 7 == 0}">
								                        	<span class="avatar-initial rounded-circle bg-label-success" id="nameProfile" 
								                        	style="width :25px; height: 25px; font-size: 10px; display: flex; align-items: center; justify-content: center;"> 
								                        	${members.two_name} 
								                        	</span>
					                                	</c:if>
					                                	<c:if test="${members.emp_no % 7 == 1}">
								                        	<span class="avatar-initial rounded-circle bg-label-primary" id="nameProfile" 
								                        	style="width :25px; height: 25px; font-size: 10px; display: flex; align-items: center; justify-content: center;"> 
								                        	${members.two_name} 
								                        	</span>
					                                	</c:if>
					                                	<c:if test="${members.emp_no % 7 == 2}">
								                        	<span class="avatar-initial rounded-circle bg-label-warning" id="nameProfile" 
								                        	style="width :25px; height: 25px; font-size: 10px; display: flex; align-items: center; justify-content: center;"> 
								                        	${members.two_name} 
								                        	</span>
					                                	</c:if>
					                                	<c:if test="${members.emp_no % 7 == 3}">
								                        	<span class="avatar-initial rounded-circle bg-label-danger" id="nameProfile" 
								                        	style="width :25px; height: 25px; font-size: 10px; display: flex; align-items: center; justify-content: center;"> 
								                        	${members.two_name} 
								                        	</span>
					                                	</c:if>
					                                	<c:if test="${members.emp_no % 7 == 4}">
								                        	<span class="avatar-initial rounded-circle bg-label-info" id="nameProfile" 
								                        	style="width :25px; height: 25px; font-size: 10px; display: flex; align-items: center; justify-content: center;"> 
								                        	${members.two_name} 
								                        	</span>
					                                	</c:if>
					                                	<c:if test="${members.emp_no % 7 == 5}">
								                        	<span class="avatar-initial rounded-circle bg-label-dark" id="nameProfile" 
								                        	style="width :25px; height: 25px; font-size: 10px; display: flex; align-items: center; justify-content: center;"> 
								                        	${members.two_name} 
								                        	</span>
					                                	</c:if>
					                                	<c:if test="${members.emp_no % 7 == 6}">
								                        	<span class="avatar-initial rounded-circle bg-label-secondary" id="nameProfile" 
								                        	style="width :25px; height: 25px; font-size: 10px; display: flex; align-items: center; justify-content: center;"> 
								                        	${members.two_name} 
								                        	</span>
					                                	</c:if>
							                        </c:if>
							                        <c:if test="${members.photo != null}">
								                        <img
								                          src="data:MIME;base64, ${members.photo}"
								                          alt="user-avatar"
								                          class="d-block rounded-circle"
								                          height="25"
								                          width="25"
								                          id="uploadedAvatar" />            	            
							                        </c:if>
					                            </li>
			                          		</c:if>
			                          		<c:if test="${memberStatus.count > 3}">
					                            <c:if test="${memberStatus.last}">
					                               <li class="avatar avatar-xs col-md-3 col-sm-6">
							                          <span
							                            class="avatar-initial rounded-circle pull-up bg-secondary"
							                            data-bs-toggle="tooltip"
							                            data-bs-placement="bottom"
							                            title="${memberStatus.count-3} more"
							                            >+${memberStatus.count-3}</span
							                          >
					                        		</li>
					                            </c:if>
			                          		</c:if>
			                          	</c:forEach>
			                          </ul>
			                        </td>
			                        <c:if test="${status.index % 7 == 0}">
				                        <td><span class="badge bg-label-primary me-1">${teams.team_duty}</span></td>
			                        </c:if>
			                        <c:if test="${status.index % 7 == 1}">
				                        <td><span class="badge bg-label-success me-1">${teams.team_duty}</span></td>
			                        </c:if>
			                        <c:if test="${status.index % 7 == 2}">
				                        <td><span class="badge bg-label-warning me-1">${teams.team_duty}</span></td>
			                        </c:if>
			                        <c:if test="${status.index % 7 == 3}">
				                        <td><span class="badge bg-label-danger me-1">${teams.team_duty}</span></td>
			                        </c:if>
			                        <c:if test="${status.index % 7 == 4}">
				                        <td><span class="badge bg-label-info me-1">${teams.team_duty}</span></td>
			                        </c:if>
			                        <c:if test="${status.index % 7 == 5}">
				                        <td><span class="badge bg-label-dark me-1">${teams.team_duty}</span></td>
			                        </c:if>
			                        <c:if test="${status.index % 7 == 6}">
				                        <td><span class="badge bg-label-secondary me-1">${teams.team_duty}</span></td>
			                        </c:if>
			                        <td>
			                          <div class="dropdown">
			                          	  <a class="dropdown-item" href="javascript:deleteTeam('${teams.team_name}')">
			                                <i class="bx bx-trash me-1" style="margin-left: 5px;"></i>
			                              </a>
			                          </div>
			                        </td>
			                      </tr>
			                    </tbody>
		                    	
		                    </c:forEach>
		                  </table>
		                </div>
		              </div>
	              </div>
	              
              <!--/ Basic Bootstrap Table -->
				<div style="width:50%">
		            <div class="container-xxl flex-grow-1">
		
		              <div class="row">
		                <!-- Select2 -->
		                <div class="col-12">
		                  <div class="card mb-4">
		                    <h5 class="card-header">인력 관리</h5>
		                    <div class="card-body">
		                      <div class="row">
		                        <!-- Basic -->
								<div class="col-md-10 mb-4">
		                          <label for="selectpickerLiveSearch" class="form-label">팀 설정</label>
		                          <select
		                            id="selectpickerLiveSearch"
		                            class="selectpicker w-100"
		                            data-style="btn-default"
		                            data-live-search="true">
		                            <option data-tokens="ketchup mustard">-------팀을 선택해주세요-------</option>
		                            <c:forEach var="teamName" items="${list}">
			                            <option data-tokens="ketchup mustard">${teamName.team_name}</option>
		                            </c:forEach>
		                          </select>
		                        </div>
		                        
		                        <div class="col-md-10 mb-4">
		                          <label for="selectpickerIcons" class="form-label">권한 구분</label>
		                          <select
		                            class="selectpicker w-100 show-tick"
		                            id="selectpickerIcons"
		                            data-icon-base="bx"
		                            data-tick-icon="bx-check"
		                            data-style="btn-default">
		                            <option data-icon="bx">-------권한을 선택해주세요-------</option>
		                            <!-- <option data-icon="bx">ROLE_PM</option> -->
		                            <option data-icon="bx" value="ROLE_PL">팀장</option>
		                            <option data-icon="bx" value="ROLE_EMP">팀원</option>
		                          </select>
		                        </div>
		                        
		                        <!-- Basic -->
		                        <div class="col-md-10 mb-4">
		                          <label for="TypeaheadBasic" class="form-label">팀 업무</label>
		                          <input
		                            id="TypeaheadBasic"
		                            class="form-control typeahead"
		                            type="text"
		                            autocomplete="off"
		                           />
		                        </div>
		                        
		                        <div class="col-md-10 mb-4">
		                          <label for="TagifyUserList" class="form-label">사용자 목록</label>
		                          <input
		                            id="TagifyUserList"
		                            name="TagifyUserList"
		                            class="form-control"
		                            />
		                        </div>
		               
				               <hr>
						        	<div class="mb-0">
						            <button class="btn btn-primary" id="managementSaveButton">
						               <span class="align-middle">저장</span>
						             </button>
						           </div>
		                      </div>
		                    </div>
		                  </div>
		                </div>
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
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/select2/select2.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/tagify/tagify.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/bootstrap-select/bootstrap-select.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/typeahead-js/typeahead.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/bloodhound/bloodhound.js"></script>

    <!-- Main JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

    <!-- Page JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/forms-selects.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/forms-tagify.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/forms-typeahead.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/header.js"></script>
  </body>
</html>
