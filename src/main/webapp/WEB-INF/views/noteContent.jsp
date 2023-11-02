<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
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

    <title>Email - Apps | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet" />
  

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/flatpickr/flatpickr.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/bootstrap-datepicker/bootstrap-datepicker.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/bootstrap-daterangepicker/bootstrap-daterangepicker.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/jquery-timepicker/jquery-timepicker.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/pickr/pickr-themes.css" />

    <!-- Page CSS -->
    
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/quill/katex.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/quill/editor.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/select2/select2.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/bootstrap-select/bootstrap-select.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/tagify/tagify.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/@form-validation/umd/styles/index.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/bs-stepper/bs-stepper.css" />
    <!-- Page CSS -->

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/css/pages/app-email.css" />

    <!-- Helpers -->
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/js/helpers.js"></script>
    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Template customizer: To hide customizer set displayCustomizer value false in config.js.  -->
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/js/template-customizer.js"></script>
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/config.js"></script>
  
  
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 

  
  </head>

  <body>
    <!-- Layout wrapper -->
        <!-- Menu -->

    


          <!-- / Navbar -->
          <div class="app-email card">
            <div class="border-0">
              <div class="row g-0">
          <!-- Content wrapper -->
            <!-- Content -->
            	<div class="col app-emails-list" id="noteContent">
 					<div class="card shadow-none border-0">
                        <div class="card-body emails-list-header p-3 py-lg-3 py-2">
                          <!-- Email List: Search -->
                          <div class="d-flex justify-content-between align-items-center">
                            <div class="d-flex align-items-center w-100">
                              <i
                                class="bx bx-menu bx-sm cursor-pointer d-block d-lg-none me-3"
                                data-bs-toggle="sidebar"
                                data-target="#app-email-sidebar"
                                data-overlay></i>
                              <div class="mb-0 mb-lg-2 w-100">
                                <div class="input-group input-group-merge shadow-none">
                                  <span class="input-group-text border-0 ps-0 py-0" id="email-search">
                                    <i class="bx bx-search fs-4 text-muted"></i>
                                  </span>
                                  <input
                                    type="text"
                                    class="form-control email-search-input border-0 py-0"
                                    placeholder="Search mail"
                                    aria-label="Search..."
                                    aria-describedby="email-search" />
                                </div>
                              </div>
                            </div>
                            <div class="d-flex align-items-center mb-0 mb-md-2">
                              <i
                                class="bx bx-refresh scaleX-n1-rtl cursor-pointer email-refresh me-2 bx-sm text-muted"></i>
                              <div class="dropdown">
                                <button
                                  class="btn p-0"
                                  type="button"
                                  id="emailsActions"
                                  data-bs-toggle="dropdown"
                                  aria-haspopup="true"
                                  aria-expanded="false">
                                  <i class="bx bx-dots-vertical-rounded bx-sm text-muted"></i>
                                </button>
                                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="emailsActions">
                                  <a class="dropdown-item" href="javascript:void(0)">확인 </a>
                                  <a class="dropdown-item" href="javascript:void(0)">미확인</a>
                                  <a class="dropdown-item" href="javascript:void(0)">삭제</a>
                                  <a class="dropdown-item" href="javascript:void(0)">Archive</a>
                                </div>
                              </div>
                            </div>
                          </div>
                          <hr class="mx-n3 emails-list-header-hr" />
                          <!-- Email List: Actions -->
                          <div class="d-flex justify-content-between align-items-center">
                            <div class="d-flex align-items-center">
                              <div class="form-check me-2">
                                <input class="form-check-input" type="checkbox" id="email-select-all" onclick="javascript:checkAll()"/>
                                <label class="form-check-label" for="email-select-all"></label>
                              </div>
                             
                              
                              <c:choose>
                              	<c:when test ="${contentType eq '휴지통'}">
	                               <i class="bx bx-trash-alt email-list-delete cursor-pointer me-3 fs-4" onclick="javascript:trashCheck('${contentType}')"></i>
	                          	</c:when>
                              	<c:otherwise>
                              		<i class="bx bx-trash email-list-delete cursor-pointer me-3 fs-4" onclick="javascript:trashCheck('${contentType}')"></i>
                              	</c:otherwise>
                              </c:choose>
                              <i class="bx bx-envelope email-list-read cursor-pointer me-3 fs-4"></i>
                              <c:choose>
	                              <c:when test ="${contentType eq '휴지통'}">
	                               	<i class="bx bx-rotate-left email-list-read cursor-pointer me-3 fs-4" onclick="javascript:recoveryCheck()"></i>
	                              </c:when>
	                              <c:otherwise>
	                              </c:otherwise>
                              </c:choose>
                              <div class="dropdown">
                                <button
                                  class="btn p-0"
                                  type="button"
                                  id="dropdownMenuFolderOne"
                                  data-bs-toggle="dropdown"
                                  aria-haspopup="true"
                                  aria-expanded="false">
                                  <i class="bx bx-folder bx bx-folder fs-4 me-3"></i>
                                </button>
                                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuFolderOne">
                                  <a class="dropdown-item" href="javascript:void(0)">
                                    <i class="bx bx-error-circle me-1"></i>
                                    <span class="align-middle">Spam</span>
                                  </a>
                                  <a class="dropdown-item" href="javascript:void(0)">
                                    <i class="bx bx-edit me-1"></i>
                                    <span class="align-middle">Draft</span>
                                  </a>
                                  <a class="dropdown-item" href="javascript:void(0)">
                                    <i class="bx bx-trash-alt me-1"></i>
                                    <span class="align-middle">Trash</span>
                                  </a>
                                </div>
                              </div>
                              <div class="dropdown">
                                <button
                                  class="btn p-0"
                                  type="button"
                                  id="dropdownLabelOne"
                                  data-bs-toggle="dropdown"
                                  aria-haspopup="true"
                                  aria-expanded="false">
                                  <i class="bx bx-label fs-4 me-3"></i>
                                </button>
                                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownLabelOne">
                                  <a class="dropdown-item" href="javascript:void(0)">
                                    <i class="badge badge-dot bg-success me-1"></i>
                                    <span class="align-middle">Workshop</span>
                                  </a>
                                  <a class="dropdown-item" href="javascript:void(0)">
                                    <i class="badge badge-dot bg-primary me-1"></i>
                                    <span class="align-middle">Company</span>
                                  </a>
                                  <a class="dropdown-item" href="javascript:void(0)">
                                    <i class="badge badge-dot bg-warning me-1"></i>
                                    <span class="align-middle">Important</span>
                                  </a>
                                  <a class="dropdown-item" href="javascript:void(0)">
                                    <i class="badge badge-dot bg-danger me-1"></i>
                                    <span class="align-middle">Private</span>
                                  </a>
                                </div>
                              </div>
                            </div>
                            <div
                              class="email-pagination d-sm-flex d-none align-items-center flex-wrap justify-content-between justify-sm-content-end">
                              <span class="d-sm-block d-none mx-3 text-muted">
                              
                              		<c:if test="${pager.totalRows <= 10}">
                              			${pager.totalRows} of ${pager.totalRows}
                              		</c:if>
                              		<c:if test="${pager.pageNo == 1 && pager.totalRows >= 10}">
                              			1-10 of ${pager.totalRows}
                              		</c:if>
                             
                              		<c:if test="${pager.pageNo > 1 && pager.pageNo < pager.totalPageNo}">
                              			${pager.pageNo-1}1-${pager.pageNo}0 of ${pager.totalRows}
                              		</c:if>
                              		<c:if test="${pager.pageNo > 1 && pager.pageNo == pager.totalPageNo}">
                              			${pager.pageNo-1}1-${pager.totalRows} of ${pager.totalRows}
                              		</c:if>
                              </span>
                              <span class="d-sm-block d-none mx-3 text-muted"><a class="text-muted" href="javascript:showEmailList('${contentType}', 1)">처음</a></span>
                                   <c:if test="${pager.pageNo>1}">
	                                   <a href="javascript:showEmailList('${contentType}', ${pager.pageNo-1})">
			                              <i
			                                class="email-prev bx bx-chevron-left scaleX-n1-rtl cursor-pointer text-muted me-4 fs-4">
			                                       
			                              </i>
	                              		</a>
                                   </c:if>
                                   <c:if test="${pager.pageNo == 1}">
			                              <i
			                                class="email-prev bx bx-chevron-left scaleX-n1-rtl cursor-pointer text-muted me-4 fs-4">
			                              </i>
                                   </c:if>
                              
                              
                              <c:if test="${pager.pageNo >= pager.totalPageNo}">
                              	 <i class="email-next bx bx-chevron-right scaleX-n1-rtl cursor-pointer fs-4"></i>
                              </c:if>
                              
                              <c:if test="${pager.pageNo < pager.totalPageNo}">
                              	 <a href="javascript:showEmailList('${contentType}', ${pager.pageNo+1})"> <i class="email-next bx bx-chevron-right scaleX-n1-rtl cursor-pointer fs-4"></i></a>
                              </c:if>
                              	
                              	
                              	<span class="d-sm-block d-none mx-3 text-muted"><a class="text-muted" href="javascript:showEmailList('${contentType}', ${pager.totalPageNo})">맨끝</a></span>
                            </div>
                          </div>
                        </div>
                        <hr class="container-m-nx m-0" />
                        <!-- Email List: Items -->
                        <div class="email-list pt-0">
                          <ul class="list-unstyled m-0">
	                            <c:forEach var="note" items="${list}">
		                            <li
			                              class="
					                          <c:if test ="${note.noteRead_read == null}">email-list-item 
					                          </c:if>
					                          <c:if test ="${note.noteRead_read != null}">email-list-item email-marked-read
					                          </c:if>
					                          "
					                          <c:if test ="${note.noteRead_starred == null}">
			                              
					                          </c:if>
					                          <c:if test ="${note.noteRead_starred != null}">
					                          data-starred="true"
					                          </c:if>
					                      data-sent="true"
					                      id="${note.noteRead_no}"
			                              data-bs-toggle="sidebar"
			                              data-target="#app-email-view-${note.noteRead_no}"
			                              >
			                              <div class="d-flex align-items-center">
			                                <div class="form-check">
			                                  <input class="email-list-item-input form-check-input" type="checkbox" id="email-${note.noteRead_no}" />
			                                  <label class="form-check-label" for="email-${note.noteRead_no}"></label>
			                                </div>
			                                <i
			                                  class="email-list-item-bookmark bx bx-star d-sm-inline-block d-none cursor-pointer mx-4 bx-sm"  onclick="javascript:bookMark(${note.noteRead_no})"></i>
			                                <img
			                                  src="${pageContext.request.contextPath}/resources/assets/img/avatars/1.png"
			                                  alt="user-avatar"
			                                  class="d-block flex-shrink-0 rounded-circle me-sm-3 me-0"
			                                  height="32"
			                                  width="32" />
			                                <div class="email-list-item-content ms-2 ms-sm-0 me-2"  onclick="javascript:showDetail(${note.noteRead_no});">
			                                  <span class="email-list-item-username me-2 h6">${note.note_sender_name}</span>
			                                  <span class="email-list-item-subject d-xl-inline-block d-block">
			                               	     ${note.note_title}</span
			                                  >
			                                </div>
			                                <div class="email-list-item-meta ms-auto d-flex align-items-center">
			                                  <c:if test="${note.media_isEmpty}">
			                                  
			                                  </c:if>
			                                  <c:if test="${not note.media_isEmpty}">
			                                  	<span class="email-list-item-attachment bx bx-paperclip cursor-pointer float-end float-sm-none me-2"></span>
			                                  </c:if>
			                                  
						                         <c:choose>
												    <c:when test="${note.note_label == '긴급 필독'}">
												        <span class="email-list-item-label badge badge-dot bg-danger d-none d-md-inline-block me-2" data-label="private"></span>
												    </c:when>
												    <c:when test="${note.note_label == '공지 관련'}">
												        <span class="email-list-item-label badge badge-dot bg-warning d-none d-md-inline-block me-2" data-label="important"></span>
												    </c:when>
												    <c:when test="${note.note_label == '기능 문의'}">
												        <span class="email-list-item-label badge badge-dot bg-success d-none d-md-inline-block me-2" data-label="work"></span>
												    </c:when>
												    <c:when test="${note.note_label == '일반 쪽지'}">
												        <span class="email-list-item-label badge badge-dot bg-primary d-none d-md-inline-block me-2" data-label="company"></span>
												    </c:when>
												    <c:otherwise>
												        <!-- 다른 경우에 대한 처리 -->
												    </c:otherwise>
												</c:choose>
			                                   
			                                  <c:set var="today" value="<%=new java.util.Date()%>" />
												<!-- 현재날짜 -->
												<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy.MM.dd" /></c:set>
												  <c:if test="${note.note_createdAt.substring(0, 10) eq date}">
												  	<c:if test="${note.note_createdAt.substring(11, 13) ge '0' && note.note_createdAt.substring(11, 13) le '11'}">
												      <small class="email-list-item-time text-muted">${note.note_createdAt.substring(11, 16)} AM</small>
												    </c:if>
												  	<c:if test="${note.note_createdAt.substring(11, 13) ge '12' && note.note_createdAt.substring(11, 13) le '23'}">
												      <small class="email-list-item-time text-muted">${note.note_createdAt.substring(11, 16)} PM</small>
												    </c:if>
												  </c:if>
												 
												  <c:if test="${note.note_createdAt.substring(0, 10) ne date}">
												    <small class="email-list-item-time text-muted">${note.note_createdAt.substring(2, 10)}</small>
												  </c:if>
												  
			                                  <ul class="list-inline email-list-item-actions">
			                                    <li class="list-inline-item email-delete"><i id="trash-${note.noteRead_no}" class="bx bx-trash fs-4" onclick="javascript:trashSingleNote(${note.noteRead_no});"></i></li>
			                                     <c:if test ="${note.noteRead_read != null}">
						                              <li id="li-${note.noteRead_no}" class="list-inline-item email-read"><i id="i-${note.noteRead_no}" class="bx bx-envelope-open fs-4"></i></li>
						                         </c:if>
						                          <c:if test ="${note.noteRead_read == null}">
			                                          <li id="li-${note.noteRead_no}" class="list-inline-item email-unread"><i id="i-${note.noteRead_no}" class="bx bx-envelope fs-4"></i></li>
			                                      </c:if>
			                                      
			                                      
			                                      <!-- 발신 쪽지함일 경우 : 발송취소/읽음-->
			                                      <c:if test ="${contentType eq '발신'}">
			                                          <c:if test ="${note.noteRead_read != null}">
			                                    	     <li class="list-inline-item"> 
			                                    	        <a class="text-primary text-mute" data-bs-toggle="modal" data-bs-target="#shareProject">발송취소</a> 
			                                    	       
			                                    	        
			                                    	     </li>
			                                    	  </c:if>
			                                      </c:if>
			                                  </ul>
			                                </div>
			                              </div>
		                            </li>
		                        </c:forEach>
	
                          </ul>
                          <ul class="list-unstyled m-0">
                            <li class="email-list-empty text-center d-none">쪽지가 없습니다.</li>
                          </ul>
                          
                        </div>
                      </div>
                     
                      <div class="app-overlay"></div>
                      
                      
                      		<!-- 발송취소 모달 따로 jsp뺴기 임시 기능 -->
                      		
                      		
                       <div class="modal fade" id="shareProject" tabindex="-1" aria-hidden="true">
		                <div class="modal-dialog modal-lg modal-simple modal-enable-otp modal-dialog-centered">
		                  <div class="modal-content p-3 p-md-5">
		                    <div class="modal-body">
		                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		                      <div class="text-center">
		                        <h3 class="mb-2">수신자 명단</h3>
		                      </div>
		                    </div>
		                    <div class="mb-4 pb-2">
		                      <label for="select2Basic" class="form-label">수신자 찾기</label>
		                      <select
		                        id="select2Basic"
		                        class="form-select form-select-lg share-project-select"
		                        data-allow-clear="true">
		                        <option data-name="Adelaide Nichols" data-image="img/avatars/20.png" selected>
		                          	 김시온
		                        </option>
		                        <option data-name="Julian Murphy" data-image="img/avatars/9.png">Julian Murphy</option>
		                        <option data-name="Sophie Gilbert" data-image="img/avatars/10.png">Sophie Gilbert</option>
		                        <option data-name="Marvin Wheeler" data-image="img/avatars/17.png">Marvin Wheeler</option>
		                      </select>
		                    </div>
		                    <h4 class="mb-4 pb-2">수신자</h4>
		                    <ul class="p-0 m-0">
		                      <li class="d-flex flex-wrap mb-3">
		                        <div class="avatar me-3">
		                          <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/1.png" alt="avatar" class="rounded-circle" />
		                        </div>
		                        <div class="d-flex justify-content-between flex-grow-1">
		                          <div class="me-2">
		                            <p class="mb-0">Lester Palmer</p>
		                            <p class="mb-0 text-muted">pe@vogeiz.net</p>
		                          </div>
		                          <div class="dropdown">
		                            <button type="button" class="btn btn-outline-primary">발송 취소
		                            </button>
		                          </div>
		                        </div>
		                      </li>
		                      <li class="d-flex flex-wrap mb-3">
		                        <div class="avatar me-3">
		                          <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/2.png" alt="avatar" class="rounded-circle" />
		                        </div>
		                        <div class="d-flex justify-content-between flex-grow-1">
		                          <div class="me-2">
		                            <p class="mb-0">Mattie Blair</p>
		                            <p class="mb-0 text-muted">peromak@zukedohik.gov</p>
		                          </div>
		                          <div class="dropdown">
		                            
		                              <i class="bx bx-envelope-open me-2">
		                              </i><span class="text-muted fw-normal me-2 d-none d-sm-inline-block">2023.11.10.13:11 읽음</span>
		                          </div>
		                        </div>
		                      </li>
		                      <li class="d-flex flex-wrap mb-3">
		                        <div class="avatar me-3">
		                          <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/3.png" alt="avatar" class="rounded-circle" />
		                        </div>
		                        <div class="d-flex justify-content-between flex-grow-1">
		                          <div class="me-2">
		                            <p class="mb-0">Marvin Wheeler</p>
		                            <p class="mb-0 text-muted">rumet@jujpejah.net</p>
		                          </div>
		                          <div class="dropdown">
		                           
		                           	  <i class="bx bx-envelope-open me-1">
		                              </i>
		                              <span class="text-muted fw-normal me-2 d-none d-sm-inline-block">2023.11.10.13:11 읽음</span>
		                          </div>
		                        </div>
		                      </li>
		                      <li class="d-flex flex-wrap mb-3">
		                        <div class="avatar me-3">
		                          <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/4.png" alt="avatar" class="rounded-circle" />
		                        </div>
		                        <div class="d-flex justify-content-between flex-grow-1">
		                          <div class="me-2">
		                            <p class="mb-0">Nannie Ford</p>
		                            <p class="mb-0 text-muted">negza@nuv.io</p>
		                          </div>
		                          <div class="dropdown">
		                            <button
		                              type="button"
		                              class="btn dropdown-toggle p-2"
		                              data-bs-toggle="dropdown"
		                              aria-expanded="false">
		                              <span class="text-muted fw-normal me-2 d-none d-sm-inline-block">Can Comment</span>
		                            </button>
		                          </div>
		                        </div>
		                      </li>
		                      
		                    </ul>
		                    <div class="d-flex align-items-center mt-4 align-items-sm-center">
		                      <div class="d-flex justify-content-between flex-grow-1 align-items-center flex-wrap gap-2">
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

            <!-- Footer -->
            
            <!-- / Footer -->

          <!-- Content wrapper -->
        <!-- / Layout page -->

      <!-- Overlay -->

      <!-- Drag Target Area To SlideIn Menu On Small Screens -->
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
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/quill/katex.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/quill/quill.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/select2/select2.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/block-ui/block-ui.js"></script>

    <!-- Main JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

    <!-- Page JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/app-note.js"></script>
    
     <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->

    <!-- Vendors JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/moment/moment.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/flatpickr/flatpickr.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/bootstrap-datepicker/bootstrap-datepicker.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/bootstrap-daterangepicker/bootstrap-daterangepicker.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/jquery-timepicker/jquery-timepicker.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/pickr/pickr.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/tagify/tagify.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/bootstrap-select/bootstrap-select.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/bloodhound/bloodhound.js"></script>



    <!-- Page JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/forms-pickers.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/forms-tagify.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/header.js"></script>
    
    
    

    <!-- Vendors JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/cleavejs/cleave.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/cleavejs/cleave-phone.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/@form-validation/umd/bundle/popular.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/@form-validation/umd/plugin-bootstrap5/index.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/@form-validation/umd/plugin-auto-focus/index.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/bs-stepper/bs-stepper.js"></script>

    <!-- Main JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

    <!-- Page JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/pages-pricing.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/modal-create-app.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/modal-add-new-cc.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/modal-add-new-address.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/modal-edit-user.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/modal-enable-otp.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/modal-share-project.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/modal-two-factor-auth.js"></script>
    
  </body>
</html>
