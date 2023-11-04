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
      <div class="modal-content p-3 p-md-5" id="sendCancelContent">
        <div class="modal-body">
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          <div class="text-center">
            <h3 class="mb-2">수신자 명단</h3>
           			<h5>${contentType}</h5>
          </div>
          
        </div>
       <!--  <div class="mb-4 pb-2">
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
          
          
        </div> -->
        <div class="d-flex justify-content-end">
          	<button type="button" class="btn btn-label-primary" onclick="javascript:sentCancelAll();">일괄 발송 취소</button>
        </div>
        <h5 class="mb-4 pb-2">수신 목록</h5>
        <ul class="p-0 m-0 mb-3">
        
         <c:forEach var="list" items="${list}">
        	<c:if test="${list.noteRead_type == '수신'}">
		                          			
	          <li class="d-flex flex-wrap mb-3">
	            
	            <div class="avatar me-3">
	              <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/1.png" alt="avatar" class="rounded-circle" />
	            </div>
	            <div class="d-flex justify-content-between flex-grow-1">
	              <div class="me-2">
	                <p class="mb-0">${list.emp_name}</p>
	                <p class="mb-0 text-muted">${list.emp_email}</p>
	              </div>
	              <div class="dropdown">
	                 <c:if test="${list.noteRead_read == null}">
		                <c:if test="${list.noteRead_isCanceled == true}">
		                	
		                	<span id="s-${list.noteRead_no}" class="badge bg-label-secondary">발송 취소 완료</span>
		                </c:if>
		                <c:if test="${list.noteRead_isCanceled == false}">
		                	<button id="b-${list.noteRead_no}" type="button" class="cancelList btn btn-outline-primary" onclick="javascript:sentCancelNo(${list.noteRead_no});">발송 취소 
		                	</button>
		                	<span id="s-${list.noteRead_no}" class="cancelComplete d-none badge bg-label-secondary">발송 취소 완료</span>
		                </c:if>
	                </c:if>
	                
	                <c:if test="${list.noteRead_read != null}">
	                    <i class="bx bx-envelope-open me-2">
                     	</i><span class="text-muted fw-normal me-2 d-none d-sm-inline-block">${list.noteRead_read} 읽음</span>
	                </c:if>
	                
	              </div>
	            </div>
	          </li>
          	</c:if>
          </c:forEach>
        </ul>
        
        
        <h5 class="mb-4 pb-2">참조 목록</h5>
        <ul class="p-0 m-0 mb-3">
        
        <c:if test="${noCC == true}">
        	<p class="text-muted">참조 목록이 없습니다.</p>
        </c:if>
         <c:forEach var="list" items="${list}">
        	<c:if test="${list.noteRead_type == '참조'}">
		                     		
	          <li class="d-flex flex-wrap mb-3">
	            
	            <div class="avatar me-3">
	              <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/1.png" alt="avatar" class="rounded-circle" />
	            </div>
	            <div class="d-flex justify-content-between flex-grow-1">
	              <div class="me-2">
	                <p class="mb-0">${list.emp_name}</p>
	                <p class="mb-0 text-muted">${list.emp_email}</p>
	              </div>
	              <div class="dropdown">
	                <c:if test="${list.noteRead_read == null}">
		                <c:if test="${list.noteRead_isCanceled == true}">
		                	
		                	<span id="s-${list.noteRead_no}" class="badge bg-label-secondary">발송 취소 완료</span>
		                </c:if>
		                <c:if test="${list.noteRead_isCanceled == false}">
		                	<button id="b-${list.noteRead_no}" type="button" class="cancelList btn btn-outline-primary" onclick="javascript:sentCancelNo(${list.noteRead_no});">발송 취소 
		                	</button>
		                	<span id="s-${list.noteRead_no}" class="cancelComplete d-none badge bg-label-secondary">발송 취소 완료</span>
		                </c:if>
	                </c:if>
	                <c:if test="${list.noteRead_read != null}">
	                    <i class="bx bx-envelope-open me-2 mt-2">
                     	</i><span class="mt-2 text-muted fw-normal me-2 d-none d-sm-inline-block">${list.noteRead_read} 읽음</span>
	                </c:if>
	                
	              </div>
	            </div>
	          </li>
          	</c:if>
          </c:forEach>
        </ul>
        
        <h5 class="mb-4 pb-2">비밀 참조 목록</h5>
        <ul class="p-0 m-0">
	       <c:if test="${noBCC == true}">
	        	<p class="text-muted">비밀 참조 목록이 없습니다.</p>
	        </c:if>
	         <c:forEach var="list" items="${list}">
	        	<c:if test="${list.noteRead_type == '비밀참조'}">
		          <li class="d-flex flex-wrap mb-3">
		            
		            <div class="avatar me-3">
		              <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/1.png" alt="avatar" class="rounded-circle" />
		            </div>
		            <div class="d-flex justify-content-between flex-grow-1">
		              <div class="me-2">
		                <p class="mb-0">${list.emp_name}</p>
		                <p class="mb-0 text-muted">${list.emp_email}</p>
		              </div>
		              <div class="dropdown">
		              
	
		                <c:if test="${list.noteRead_read == null}">
			                <c:if test="${list.noteRead_isCanceled == true}">
			                	
			                	<span id="s-${list.noteRead_no}" class="badge bg-label-secondary">발송 취소 완료</span>
			                </c:if>
			                <c:if test="${list.noteRead_isCanceled == false}">
			                	<button id="b-${list.noteRead_no}" type="button" class="cancelList btn btn-outline-primary" onclick="javascript:sentCancelNo(${list.noteRead_no});">발송 취소 
			                	</button>
			                	<span id="s-${list.noteRead_no}" class="cancelComplete d-none badge bg-label-secondary">발송 취소 완료</span>
			                </c:if>
		                </c:if>
		                <c:if test="${list.noteRead_read != null}">
		                    <i class="bx bx-envelope-open me-2">
	                     	</i><span class="text-muted fw-normal me-2 d-none d-sm-inline-block">${list.noteRead_read} 읽음</span>
		                </c:if>
		                
		              </div>
		            </div>
		          </li>
	          	</c:if>
	          </c:forEach>
        </ul>
        
        <div class="d-flex align-items-center mt-4 align-items-sm-center">
          <div class="d-flex justify-content-between flex-grow-1 align-items-center flex-wrap gap-2">
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
