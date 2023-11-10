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
    <!-- Layout wrapper -->

                  <!-- /Chat contacts -->

                  <!-- Chat History -->
                  <div class="col app-chat-history" id="chatRoomContent">
                    <div class="chat-history-wrapper">
                      <div class="chat-history-header border-bottom">
                        <div class="d-flex justify-content-between align-items-center">
                          <div class="d-flex overflow-hidden align-items-center">
                            <i
                              class="bx bx-menu bx-sm cursor-pointer d-lg-none d-block me-2"
                              data-bs-toggle="sidebar"
                              data-overlay
                              data-target="#app-chat-contacts"></i>
                            <div class="flex-shrink-0 avatar">
                              <img
                                src="${pageContext.request.contextPath}/resources/assets/img/avatars/2.png"
                                alt="Avatar"
                                class="rounded-circle"
                                data-bs-toggle="sidebar"
                                data-overlay
                                data-target="#app-chat-sidebar-right" />
                            </div>
                            <div class="chat-contact-info flex-grow-1 ms-3">
                              <h6 class="m-0">${buddy.empinfo_name}</h6>
                              <small class="user-status text-muted">${buddy.team_name} ${buddy.empinfo_name}</small>
                            </div>
                          </div>
                          <div class="d-flex align-items-center">
                            <!-- <i class="bx bx-phone-call cursor-pointer d-sm-block d-none me-3 fs-4"></i>
                            <i class="bx bx-video cursor-pointer d-sm-block d-none me-3 fs-4"></i>
                            <i class="bx bx-search cursor-pointer d-sm-block d-none me-3 fs-4"></i>
                            <div class="dropdown">
                              <button
                                class="btn p-0"
                                type="button"
                                id="chat-header-actions"
                                data-bs-toggle="dropdown"
                                aria-haspopup="true"
                                aria-expanded="false">
                                <i class="bx bx-dots-vertical-rounded fs-4"></i>
                              </button>
                              <div class="dropdown-menu dropdown-menu-end" aria-labelledby="chat-header-actions">
                                <a class="dropdown-item" href="javascript:void(0);">View Contact</a>
                                <a class="dropdown-item" href="javascript:void(0);">Mute Notifications</a>
                                <a class="dropdown-item" href="javascript:void(0);">Block Contact</a>
                                <a class="dropdown-item" href="javascript:void(0);">Clear Chat</a>
                                <a class="dropdown-item" href="javascript:void(0);">Report</a>
                              </div>
                            </div> -->
                          </div>
                        </div>
                      </div>
                        <c:forEach var="chat" items="${chatMsg}">
						   <input type="hidden" id="chatNo" value="${chat.chatRoom_no}"/>
						    <c:if test="${empInfoNo != chat.empInfo_no}">
						      <input type="hidden" id="empInfoNo" value="${chat.empInfo_no}"/>
						    </c:if>
						</c:forEach>
                      
                      <input type="hidden" id="alarmId" value="${empInfo.empinfo_no}"/>
                      <div class="chat-history-body">
                        <ul class="list-unstyled chat-history mb-0">
                         
                        <c:set var="empInfoNo" value="${empInfo.empinfo_no}" />
						<c:forEach var="chat" items="${chatMsg}">
						   <c:if test="${chat.message_content != null}">
						    <c:if test="${empInfoNo != chat.empInfo_no}">
	                          <li class="chat-message">
	                            <div class="d-flex overflow-hidden">
	                              <div class="user-avatar flex-shrink-0 me-3">
	                                <div class="avatar avatar-sm">
	                                  <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/2.png" alt="Avatar" class="rounded-circle" />
	                                </div>
	                              </div>
	                              <div class="chat-message-wrapper flex-grow-1">
	                                <div class="chat-message-text">
	                                  
	                                  	<p class="mb-0">${chat.message_content}</p>
	                                  
	                                </div>
	                                <div class="text-muted mt-1">
	                                
	                                 <c:set var="today" value="<%=new java.util.Date()%>" />
									<!-- 현재날짜 -->
									<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy.MM.dd" /></c:set>
	                            
	                             		<c:if test="${chat.message_createdAt.substring(0, 10) eq date}">
										  	<c:if test="${chat.message_createdAt.substring(11, 13) ge '0' && chat.message_createdAt.substring(11, 13) le '11'}">
										      <small>오전 ${chat.message_createdAt.substring(11, 16)}</small>
										    </c:if>
										  	<c:if test="${chat.message_createdAt.substring(11, 13) ge '12' && chat.message_createdAt.substring(11, 13) le '23'}">
											    <c:set var="hour" value="${chat.message_createdAt.substring(11, 13)}" />
											    <c:choose>
											        <c:when test="${hour eq '12'}">
											            <c:set var="hour" value="오후 12" />
											        </c:when>
											        <c:otherwise>
											            <c:set var="hour" value="오후 ${hour - 12}" />
											        </c:otherwise>
											    </c:choose>
											    <small>${hour}${chat.message_createdAt.substring(13, 16)}</small>
											</c:if>
										  </c:if>
										 
										  <c:if test="${chat.message_createdAt.substring(0, 10) ne date}">
										    <small>${chat.message_createdAt.substring(2, 10)}</small>
										  </c:if>
	                                </div>
	                              </div>
	                            </div>
                         	 </li>
                         	</c:if>
						    <c:if test="${empInfoNo == chat.empInfo_no}">
	                          <li class="chat-message chat-message-right">
	                            <div class="d-flex overflow-hidden">
	                              <div class="chat-message-wrapper flex-grow-1 w-50">
	                                <div class="chat-message-text">
	                                  <p class="mb-0">
	                                   		${chat.message_content}
	                                  </p>
	                                </div>
	                                <div class="text-end text-muted mt-1">
	                                <c:if test="${chat.message_read == null}">
	                                  <i class="bx bx-check-double"></i>
	                                </c:if>
	                                <c:if test="${chat.message_read != null}">
	                                  <i class="bx bx-check-double text-success"></i>
	                                </c:if>
	                                  <c:if test="${chat.message_createdAt.substring(0, 10) eq date}">
										  	<c:if test="${chat.message_createdAt.substring(11, 13) ge '0' && chat.message_createdAt.substring(11, 13) le '11'}">
										      <small>오전 ${chat.message_createdAt.substring(11, 16)}</small>
										    </c:if>
										  	<c:if test="${chat.message_createdAt.substring(11, 13) ge '12' && chat.message_createdAt.substring(11, 13) le '23'}">
											    <c:set var="hour" value="${chat.message_createdAt.substring(11, 13)}" />
											    <c:choose>
											        <c:when test="${hour eq '12'}">
											            <c:set var="hour" value="오후 12" />
											        </c:when>
											        <c:otherwise>
											            <c:set var="hour" value="오후 ${hour - 12}" />
											        </c:otherwise>
											    </c:choose>
											    <small>${hour}${chat.message_createdAt.substring(13, 16)}</small>
											</c:if>
										  </c:if>
										 
										  <c:if test="${chat.message_createdAt.substring(0, 10) ne date}">
										    <small>${chat.message_createdAt.substring(2, 10)}</small>
										  </c:if>
	                                </div>
	                              </div>
	                              <div class="user-avatar flex-shrink-0 ms-3">
	                                <div class="avatar avatar-sm">
	                                  <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/1.png" alt="Avatar" class="rounded-circle" />
	                                </div>
	                              </div>
	                            </div>
	                          </li>
	                        </c:if>
	                       </c:if>
                          </c:forEach>
                        </ul>
                          <script>
                          function handleKeyPress(event) {
                        	    if (event.key === "Enter") {
                        	    	buttonSend();
                        	    }
                        	}
                          </script>
                      </div>
                      <!-- Chat message form -->
                      <div class="chat-history-footer">
                        <div class="form-send-message d-flex justify-content-between align-items-center">
                          <input id="msg"
                            class="form-control message-input border-0 me-3 shadow-none"
                            placeholder="메세지를 입력해주세요" 
                            aria-label="Recipient's username" aria-describedby="button-addon2"
                            onkeyup="javascript:handleKeyPress(event)"/>
                          <div class="message-actions d-flex align-items-center">
                           <!--  <i class="speech-to-text bx bx-microphone bx-sm cursor-pointer"></i>
                            <label for="attach-doc" class="form-label mb-0">
                              <i class="bx bx-paperclip bx-sm cursor-pointer mx-3"></i>
                              <input type="file" id="attach-doc" hidden />
                            </label> -->
                            <button id="button-send" class="btn btn-primary d-flex send-msg-btn" onclick="javascript:buttonSend();">
                              <i class="bx bx-paper-plane me-md-1 me-0"></i>
                              <span class="align-middle d-md-inline-block d-none">send</span>
                            </button>
                          </div>
                        </div>
                      </div>
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
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/bootstrap-maxlength/bootstrap-maxlength.js"></script>

    <!-- Main JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

    <!-- Page JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/app-chat.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/header.js"></script>
  </body>
</html>
