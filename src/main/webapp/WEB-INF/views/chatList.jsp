<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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

    <title>Chat - Apps | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>

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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/bootstrap-maxlength/bootstrap-maxlength.css" />

    <!-- Page CSS -->

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/css/pages/app-chat.css" />

    <!-- Helpers -->
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/js/helpers.js"></script>
    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Template customizer: To hide customizer set displayCustomizer value false in config.js.  -->
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/js/template-customizer.js"></script>
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/config.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
  </head>

  <body>
  
  


                  <!-- Chat & Contacts -->
                  <div
                    class="col app-chat-contacts app-sidebar flex-grow-0 overflow-hidden border-end"
                    id="chatList">
                    <div class="sidebar-header pt-3 px-3 mx-1">
                      <div class="d-flex align-items-center me-3 me-lg-0">
                        <div
                          class="flex-shrink-0 avatar avatar-online me-2"
                          data-bs-toggle="sidebar"
                          data-overlay="app-overlay-ex"
                          data-target="#app-chat-sidebar-left">
                          <img
                            class="user-avatar rounded-circle cursor-pointer"
                            src="${pageContext.request.contextPath}/resources/assets/img/avatars/1.png"
                            alt="Avatar" />
                        </div>
                        <div class="flex-grow-1 input-group input-group-merge rounded-pill ms-1">
                          <span class="input-group-text" id="basic-addon-search31"
                            ><i class="bx bx-search fs-4"></i
                          ></span>
                          <input
                            type="text"
                            class="form-control chat-search-input"
                            placeholder="검색"
                            aria-label="Search..."
                            aria-describedby="basic-addon-search31" />
                        </div>
                      </div>
                      <i
                        class="bx bx-x cursor-pointer position-absolute top-0 end-0 mt-2 me-1 fs-4 d-lg-none d-block"
                        data-overlay
                        data-bs-toggle="sidebar"
                        data-target="#app-chat-contacts"></i>
                    </div>
                    <hr class="container-m-nx mt-3 mb-0" />
                    <div class="sidebar-body">
                      <!-- Chats -->
                      <ul class="list-unstyled chat-contact-list pt-1" id="chat-list">
                        <li class="chat-contact-list-item chat-contact-list-item-title">
                          <h5 class="text-primary mb-0">채팅</h5>
                        </li>
                        <li class="chat-contact-list-item chat-list-item-0 d-none">
                          <h6 class="text-muted mb-0">대화목록을 찾을 수 없습니다.</h6>
                        </li>
                        
						<c:forEach var="emp" items="${empList}" varStatus="a">
						  <c:if test="${emp.lastMsgContent != null}">
	                        <li class="chat-contact-list-item"  id="${emp.empinfo_no}" >
	                          <a class="d-flex align-items-center" onclick="javascript:chatRoom(${emp.emp_no})">
	                          	<c:choose>
	                          	  <c:when test="${emp.emp_status == 'on-line'}">
	                          	    <div class="flex-shrink-0 avatar avatar-online">
	                          	  </c:when>
	                          	  <c:when test="${emp.emp_status == 'away'}">
	                          	    <div class="flex-shrink-0 avatar avatar-busy"> 
	                          	  </c:when>
	                          	  <c:otherwise>
		                            <div class="flex-shrink-0 avatar avatar-offline">
		                          </c:otherwise>
	                            </c:choose>
	                           
	                              <span class="avatar-initial rounded-circle bg-label-success">${emp.two_name}</span>
	                            </div>
	                            <div class="chat-contact-info flex-grow-1 ms-3">
	                              <h6 class="chat-contact-name text-truncate m-0">${emp.empinfo_name}</h6>
	                              <p class="chat-contact-status text-truncate mb-0 text-muted">
	                              		 ${emp.lastMsgContent}
	                              </p>
	                            </div>
	                            <div class="chat-contact-info flex-grow-1 d-flex flex-column align-items-end">
	                            
	                             <c:set var="today" value="<%=new java.util.Date()%>" />
									<!-- 현재날짜 -->
									<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy.MM.dd" /></c:set>
	                            
	                             		<c:if test="${emp.message_createdAt.substring(0, 10) eq date}">
										  	<c:if test="${emp.message_createdAt.substring(11, 13) ge '0' && emp.message_createdAt.substring(11, 13) le '11'}">
										      <small class="mb-1 text-muted">오전 ${emp.message_createdAt.substring(11, 16)}</small>
										    </c:if>
										  	<c:if test="${emp.message_createdAt.substring(11, 13) ge '12' && emp.message_createdAt.substring(11, 13) le '23'}">
											    <c:set var="hour" value="${emp.message_createdAt.substring(11, 13)}" />
											    <c:choose>
											        <c:when test="${hour eq '12'}">
											            <c:set var="hour" value="오후 12" />
											        </c:when>
											        <c:otherwise>
											            <c:set var="hour" value="오후 ${hour - 12}" />
											        </c:otherwise>
											    </c:choose>
											    <small class="mb-1 text-muted">${hour}${emp.message_createdAt.substring(13, 16)}</small>
											</c:if>
										  </c:if>
										 
										  <c:if test="${emp.message_createdAt.substring(0, 10) ne date}">
										    <small class="email-list-item-time text-muted">${emp.message_createdAt.substring(2, 10)}</small>
										  </c:if>
										  
										  
								     <c:if test="${emp.unreadCount != 0}">
										    <p class="mt-1 badge badge-center rounded-pill bg-danger" id="uck-${emp.emp_no}">${emp.unreadCount}</p>
									 </c:if>
									 <c:if test="${emp.unreadCount == 0}">
								    		<p class="mt-1 badge badge-center rounded-pill"> </p>
								     </c:if>
								</div>
	                          </a>
	                        </li>
	                      </c:if>
                        </c:forEach>
                      </ul>
                      <!-- Contacts -->
                      <ul class="list-unstyled chat-contact-list mb-0" id="contact-list">
                        <li class="chat-contact-list-item chat-contact-list-item-title">
                          <h5 class="text-primary mb-0">목록</h5>
                        </li>
                        <li class="chat-contact-list-item contact-list-item-0 d-none">
                          <h6 class="text-muted mb-0">해당 프로젝트 인원이 없습니다.</h6>
                        </li>
                        
                        
                        <c:forEach var="emp" items="${empList}" varStatus="a">
                         <c:if test="${emp.lastMsgContent == null}">
	                        <li class="chat-contact-list-item"  id="${emp.empinfo_no}" >
	                          <a class="d-flex align-items-center" onclick="javascript:chatRoom(${emp.emp_no})">
	                            <c:choose>
	                          	  <c:when test="${emp.emp_status == 'on-line'}">
	                          	    <div class="flex-shrink-0 avatar avatar-online">
	                          	  </c:when>
	                          	  <c:when test="${emp.emp_status == 'away'}">
	                          	    <div class="flex-shrink-0 avatar avatar-busy"> 
	                          	  </c:when>
	                          	  <c:otherwise>
		                            <div class="flex-shrink-0 avatar avatar-offline">
		                          </c:otherwise>
	                            </c:choose>
	                              <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/4.png" alt="Avatar" class="rounded-circle" />
	                            </div>
	                            <div class="chat-contact-info flex-grow-1 ms-3">
	                              <h6 class="chat-contact-name text-truncate m-0">${emp.empinfo_name}</h6>
	                              <p class="chat-contact-status text-truncate mb-0 text-muted">${emp.team_name} ${emp.empinfo_position}</p>
	                            </div>
	                          </a>
	                        </li>
	                      </c:if>
                        </c:forEach>
                       
                       
                       
                       
                      </ul>
                    </div>
                  </div>
                  <!-- /Chat contacts -->

                 
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
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/bootstrap-maxlength/bootstrap-maxlength.js"></script>

    <!-- Main JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

    <!-- Page JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/app-chat.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/header.js"></script>
  </body>
</html>
