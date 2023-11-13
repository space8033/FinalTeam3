<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

   
          <!-- Content wrapper -->
            <!-- Content -->
                    <!-- Email View -->
                    <div class="col app-email-view flex-grow-0 bg-body show" id="noteDetail">
                     
                    <!--   <hr class="m-0" /> -->
                      
                      <!-- Email View : Content-->
                      <div class="app-email-view-content py-4">
                        <!-- <p class="email-earlier-msgs text-center text-muted cursor-pointer mb-5">이전 메세지 1개</p> -->
                        <!-- Email View : Previous mails-->
                       
                        <!-- Email View : Last mail-->
                        <div class="card email-card-last mx-sm-4 mx-3 mt-4 border">
                          <div
                            class="card-header d-flex justify-content-between align-items-center flex-wrap border-bottom">
                            <div class="d-flex align-items-center mb-sm-0 mb-3">
                              <img
                                src="${pageContext.request.contextPath}/resources/assets/img/avatars/1.png"
                                alt="user-avatar"
                                class="flex-shrink-0 rounded-circle me-2"
                                height="38"
                                width="38" />
                              <div class="flex-grow-1 ms-1">
                                <h6 class="m-0">
                                <label for="receiverList"
                                data-bs-toggle="tooltip"
		                        data-bs-offset="0,4"
		                        data-bs-placement="right"
		                        data-bs-html="true"
		                        >
                                ${name} <i id="receiverList"
                                	       class="mb-1 bx bx-chevron-right scaleX-n1-rtl cursor-pointer fs-5"
				                           data-bs-toggle="collapse"
				                           data-bs-target="#collapseExample"
				                           aria-expanded="false"
				                           aria-controls="collapseExample"
				                           title="수신자 목록"
				                           style="transform: rotate(90deg)"></i>
				                </label>
							    </h6> 
									                        
									                        
                                <small class="text-muted">${email}</small>
                              </div>
                            </div>
                            <div class="d-flex align-items-center">
                            
                            <c:choose>		                                  
								<c:when test ="${contentType eq '발신'}">
								
								 	<c:if test="${note.note_createdAt != null}">
		                              	<small class="mb-0 me-3 text-muted">${note.note_createdAt} ${note.note_restime}</small>
		                          	</c:if>
	                             	<c:choose>
									  <c:when test="${fn:length(note.note_restime) >= 20}">
									    <!-- 글자 수가 20 이상인 경우 -->
									   <small class="mb-0 me-3 text-muted">${note.note_restime}</small>
									  </c:when>
									  <c:otherwise>
									  	<c:if test="${note.note_restime != null && note.note_restime != '예약 전송 완료'}">
									    <!-- 글자 수가 20 미만인 경우 -->
	                             	 		<small class="mb-0 me-3 text-muted">${note.note_restime} 에 보내기 예약됨</small>
	                             	 	</c:if>
									  </c:otherwise>
									</c:choose>
	                     		</c:when>
	                     		<c:when test ="${contentType ne '발신'}">
	                     			<small class="mb-0 me-3 text-muted">${note.note_createdAt}</small>
	                     		
	                     		</c:when>
                            </c:choose> 	 
                              
                              <c:if test="${not empty mediaList}">
                              	<i class="bx bx-paperclip cursor-pointer me-2 bx-sm"></i>
                              </c:if>
                              
                              
                                <c:choose>		                                  
										<c:when test ="${contentType eq '발신'}">
										
										 	
			                     		</c:when>
			                     		<c:when test ="${contentType eq '임시저장'}">
		                     			
		                     		
		                     			</c:when>
		                     			<c:otherwise>
		                     			  <c:if test ="${noteRead.noteRead_starred == null}">
			                              	<i class="email-list-item-bookmark bx bx-star cursor-pointer me-2 bx-sm"></i>
			                              </c:if>
			                              <c:if test ="${noteRead.noteRead_starred != null}">
			                              	<i class="email-list-item-bookmark bx bx-star cursor-pointer me-2 bx-sm" style="color: #ffab00;"></i>
			                              </c:if>
		                     			</c:otherwise>
		                     		</c:choose>
                            </div>
                            
                          </div>
                          <div class="card-body pt-3">
	                          <div class="collapse" id="collapseExample">
	                          	<div class="d-flex">
	                          		<div class="" style="width:60px;">수신자 : </div>
	                          		<div>
		                          			<c:forEach var="list" items="${list}">
		                          				<c:if test="${list.noteRead_type == '수신'}">
		                          					${list.emp_name} (${list.emp_email}) 
		                          				</c:if>
		                          			</c:forEach>
	                          		</div>
	                          	</div>
								<div class="d-flex">
	                          	 	<div class="" style="width:50px;"> 참조 : </div>
	                          	 	<div>
	                          	 		<c:forEach var="list" items="${list}">
		                          				<c:if test="${list.noteRead_type == '참조'}">
		                          					${list.emp_name} (${list.emp_email}) 
		                          				</c:if>
		                          	    </c:forEach>
	                          	 	
	                          	 	</div>
	                          	</div>
	                          	<div class="d-flex">
	                          		<div class="" style="width:80px;">비밀 참조 : </div>
	                          		<div>
	                          		<c:forEach var="list" items="${list}">
		                          				<c:if test="${list.noteRead_type == '비밀참조'}">
		                          					${list.emp_name} (${list.emp_email}) 
		                          				</c:if>
		                          	</c:forEach>	                          		
		                          	</div>
	                          	</div>
	                          <hr />
	                          </div>
	                          <div>
	                            <p class="fw-medium py-2"><strong>제목 : ${note.note_title}</strong></p>
	                            <p>
	                            	 ${note.note_content}
	                            </p>
	                            <c:if test="${not empty mediaList}">
		                            <hr />
		                            <p class="mb-2 ">첨부 파일</p> 
		                              <c:forEach var="media" items="${mediaList}" varStatus="a">
				                              <div class="cursor-pointer">
		        	                	       	
		        	                	       	<c:if test="${media.media_type}">
		        	                	       		<i class="bx bx-file-image"></i>
		        	                	       	</c:if>
		        	                	       		<i class="bx bx-file"></i>
		            	        	          		<a class="align-middle ms-1" href ="noteFileDownload?mno=${media.media_no}">${media.media_name}</a>
		            	        	          	
		                		              </div>
		                              </c:forEach>
		                         </c:if>
		                       </div>
                          </div>
                        </div>
                        
                        
                        
                        <c:choose>		                                  
								<c:when test ="${contentType eq '발신'}">
								
								 	
	                     		</c:when>
	                     		<c:when test ="${contentType eq '임시저장'}">
	                     			
	                     		
	                     		</c:when>
                            
                             	<c:otherwise>
		                          <form name="ReplyRequest" action="replySend" id="replySend" method="POST" enctype="multipart/form-data">
		                        
		                        <!-- Email View : Reply mail-->
			                        <div class="email-reply card mt-4 mx-sm-4 mx-3 border">
			                          <h6 class="card-header border mb-2"><strong>'${name}' 님께 답장</strong></h6>
			                          <div class="card-body pt-0 px-3">
			                            <div class="d-flex justify-content-start">
			                              <div class="email-reply-toolbar border-0 w-100 ps-0" id="toolbar">
			                                <span class="ql-formats me-0">
			                                  <button class="ql-bold"></button>
			                                  <button class="ql-italic"></button>
			                                  <button class="ql-underline"></button>
			                                  <button class="ql-list" value="ordered"></button>
			                                  <button class="ql-list" value="bullet"></button>
			                                  <button class="ql-link"></button>
			                                  <button class="ql-image"></button>
			                                </span>
			                              </div>
			                            </div>
			                            <div class="email-reply-editor" id="editor"></div>
			                            
			                            <input type="hidden" name="note_content" id="reply"/>
			                            <input type="hidden" name="note_no" value="${note.note_no}"/>
			                            <input type="hidden" name="note_title" value="${note.note_title}"/>
			                            <input type="hidden" name="note_receiver" value="${note.note_sender}"/>
			                            <div class="mt-2 d-flex justify-content-end align-items-center">
			                              <div class="cursor-pointer me-3">
				                              <input value="" readonly type="text" id="reply-filename" placeholder="" class="text-muted ms-1 upload-name" style="border:none; width:400px; outline: none; text-align:right;">
			                                  <label for="reply-attach-file"><i class="bx bx-paperclip"></i><span class="align-middle cursor-pointer"> 첨부 파일</span></label>
				                              <input type="file" name="reply_files" class="d-none" id="reply-attach-file" multiple/>
			                                  
			                              </div>
			                              <button type="submit" class="btn btn-primary">
			                                <i class="bx bx-paper-plane me-1"></i>
			                                <span class="align-middle">보내기</span>
			                              </button>
			                            </div>
			                          </div>
			                        </div>
			                        
		                        </form>
		                      
		                    <!-- Email View -->
                           </c:otherwise>
                              
                        </c:choose> 	 
                        </div>
		               </div>
                       
                     
                      <div class="app-overlay"></div>

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
    <script src="${pageContext.request.contextPath}/resources/assets/js/app-note-popup.js"></script>
    
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
        <script src="${pageContext.request.contextPath}/resources/assets/js/ui-popover.js"></script>
  </body>
</html>
