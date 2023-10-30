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
                      <div class="app-email-view-header p-3 py-md-3 py-2 rounded-0">
                        <!-- Email View : Title  bar-->
                        <div class="d-flex justify-content-between align-items-center">
                          <div class="d-flex align-items-center overflow-hidden">
                            <i
                              class="bx bx-chevron-left bx-sm cursor-pointer me-2"
                              data-bs-toggle="sidebar"
                              data-target="#app-email-view"
                              onclick="javascript:showNoteList();"></i>
                            <h6 class="text-truncate mb-0 me-2">뒤로가기 </h6>
                            <span class="badge bg-label-warning">Important</span>
                          </div>
                          <!-- Email View : Action  bar-->
                          <div class="d-flex">
                            <i class="bx bx-printer d-sm-block d-none fs-4"></i>
                            <div class="dropdown ms-3">
                              <button
                                class="btn p-0"
                                type="button"
                                id="dropdownMoreOptions"
                                data-bs-toggle="dropdown"
                                aria-haspopup="true"
                                aria-expanded="false">
                                <i class="bx bx-dots-vertical-rounded fs-4"></i>
                              </button>
                              <div class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMoreOptions">
                                <a class="dropdown-item" href="javascript:void(0)">
                                  <i class="bx bx-envelope-open bx-xs me-1"></i>
                                  <span class="align-middle">Mark as unread</span>
                                </a>
                                <a class="dropdown-item" href="javascript:void(0)">
                                  <i class="bx bx-envelope-open bx-xs me-1"></i>
                                  <span class="align-middle">Mark as unread</span>
                                </a>
                                <a class="dropdown-item" href="javascript:void(0)">
                                  <i class="bx bx-star bx-xs me-1"></i>
                                  <span class="align-middle">Add star</span>
                                </a>
                                <a class="dropdown-item" href="javascript:void(0)">
                                  <i class="bx bx-calendar bx-xs me-1"></i>
                                  <span class="align-middle">Create Event</span>
                                </a>
                                <a class="dropdown-item" href="javascript:void(0)">
                                  <i class="bx bx-volume-mute bx-xs me-1"></i>
                                  <span class="align-middle">Mute</span>
                                </a>
                                <a class="dropdown-item d-sm-none d-block" href="javascript:void(0)">
                                  <i class="bx bx-printer bx-xs me-1"></i>
                                  <span class="align-middle">Print</span>
                                </a>
                              </div>
                            </div>
                          </div>
                        </div>
                        <hr class="app-email-view-hr mx-n3 mb-2" />
                        <div class="d-flex justify-content-between align-items-center">
                          <div class="d-flex align-items-center">
                            <i
                              class="bx bx-trash-alt cursor-pointer me-3 fs-4"
                              data-bs-toggle="sidebar"
                              data-target="#app-email-view"></i>
                            <i class="bx bx-envelope fs-4 cursor-pointer me-3"></i>
                            <div class="dropdown">
                              <button
                                class="btn p-0"
                                type="button"
                                id="dropdownMenuFolderTwo"
                                data-bs-toggle="dropdown"
                                aria-haspopup="true"
                                aria-expanded="false">
                                <i class="bx bx-folder fs-4 me-3"></i>
                              </button>
                              <div class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuFolderTwo">
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
                                id="dropdownLabelTwo"
                                data-bs-toggle="dropdown"
                                aria-haspopup="true"
                                aria-expanded="false">
                                <i class="bx bx-label fs-4 me-3"></i>
                              </button>
                              <div class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownLabelTwo">
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
                              </div>
                            </div>
                          </div>
                          <div class="d-flex align-items-center flex-wrap justify-content-end">
                            <span class="d-sm-block d-none mx-3 text-muted">1-10 of 653</span>
                            <i class="bx bx-chevron-left scaleX-n1-rtl cursor-pointer text-muted me-4 fs-4"></i>
                            <i class="bx bx-chevron-right scaleX-n1-rtl cursor-pointer fs-4"></i>
                          </div>
                        </div>
                      </div>
                      <hr class="m-0" />
                     
                      
                      
                      <!-- Email View : Content-->
                      <div class="app-email-view-content py-4">
                        <p class="email-earlier-msgs text-center text-muted cursor-pointer mb-5">이전 메세지 1개</p>
                        <!-- Email View : Previous mails-->
                        <div class="card email-card-prev mx-sm-4 mx-3 border">
                          <div class="card-header d-flex justify-content-between align-items-center flex-wrap">
                            <div class="d-flex align-items-center mb-sm-0 mb-3">
                              <img
                                src="${pageContext.request.contextPath}/resources/assets/img/avatars/2.png"
                                alt="user-avatar"
                                class="flex-shrink-0 rounded-circle me-2"
                                height="38"
                                width="38" />
                              <div class="flex-grow-1 ms-1">
                                <h6 class="m-0">Ross Geller</h6>
                                <small class="text-muted">rossGeller@email.com</small>
                              </div>
                            </div>
                            <div class="d-flex align-items-center">
                              <small class="mb-0 me-3 text-muted">June 20th 2020, 08:30 AM</small>
                              <i class="bx bx-paperclip cursor-pointer me-2 bx-sm"></i>
                              <i class="email-list-item-bookmark bx bx-star cursor-pointer me-2 bx-sm"></i>
                              <div class="dropdown me-3">
                                <button
                                  class="btn p-0"
                                  type="button"
                                  id="dropdownEmailOne"
                                  data-bs-toggle="dropdown"
                                  aria-haspopup="true"
                                  aria-expanded="false">
                                  <i class="bx bx-dots-vertical-rounded bx-sm"></i>
                                </button>
                                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownEmailOne">
                                  <a class="dropdown-item scroll-to-reply" href="javascript:void(0)">
                                    <i class="bx bx-share me-1"></i>
                                    <span class="align-middle">답장</span>
                                  </a>
                                  <a class="dropdown-item" href="javascript:void(0)">
                                    <i class="bx bx-share scaleX-n1 scaleX-n1-rtl me-1"></i>
                                    <span class="align-middle">전달</span>
                                  </a>
                                  <a class="dropdown-item" href="javascript:void(0)">
                                    <i class="bx bx-info-circle me-1"></i>
                                    <span class="align-middle">팝업 창 띄우기</span>
                                  </a>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="card-body">
                            <p class="fw-medium">Greetings!</p>
                            <p>
                              ${note.note_content}
                            </p>
                            <hr />
                            <p class="mb-2">Attachments</p>
                            <div class="cursor-pointer">
                              <i class="bx bx-file"></i>
                              <span class="align-middle ms-1">report.xlsx</span>
                            </div>
                          </div>
                        </div>
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
                                <h6 class="m-0">${name}</h6>
                                <small class="text-muted">iAmAhoot@email.com</small>
                              </div>
                            </div>
                            <div class="d-flex align-items-center">
                              <small class="mb-0 me-3 text-muted">${note.note_createdAt}</small>
                              <i class="bx bx-paperclip cursor-pointer me-2 bx-sm"></i>
                              <i class="email-list-item-bookmark bx bx-star cursor-pointer me-2 bx-sm"></i>
                              <div class="dropdown me-3">
                                <button
                                  class="btn p-0"
                                  type="button"
                                  id="dropdownEmailTwo"
                                  data-bs-toggle="dropdown"
                                  aria-haspopup="true"
                                  aria-expanded="false">
                                  <i class="bx bx-dots-vertical-rounded bx-sm"></i>
                                </button>
                                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownEmailTwo">
                                  <a class="dropdown-item scroll-to-reply" href="javascript:void(0)">
                                    <i class="bx bx-share me-1"></i>
                                    <span class="align-middle">답장</span>
                                  </a>
                                  <a class="dropdown-item" href="javascript:void(0)">
                                    <i class="bx bx-share me-1 scaleX-n1 scaleX-n1-rtl"></i>
                                    <span class="align-middle">전달</span>
                                  </a>
                                  <a class="dropdown-item" href="javascript:void(0)">
                                    <i class="bx bx-info-circle me-1"></i>
                                    <span class="align-middle">팝업 창 띄우기</span>
                                  </a>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="card-body pt-3">
                            <p class="fw-medium py-2"><strong>제목 : ${note.note_title}</strong></p>
                            <p>
                            	 ${note.note_content}
                            </p>
                            <hr />
                            <p class="mb-2">첨부 파일</p>
                            <div class="cursor-pointer">
                              <i class="bx bx-file"></i>
                              <span class="align-middle ms-1">report.xlsx</span>
                            </div>
                          </div>
                        </div>
                        
                        <form name="ReplyRequest" action="replySend" id="replySend" method="POST">
                        
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
	                            <div class="d-flex justify-content-end align-items-center">
	                              <div class="cursor-pointer me-3">
	                                <i class="bx bx-paperclip"></i>
	                                <span class="align-middle">첨부 파일</span>
	                              </div>
	                              <button type="submit" class="btn btn-primary">
	                                <i class="bx bx-paper-plane me-1"></i>
	                                <span class="align-middle">보내기</span>
	                              </button>
	                            </div>
	                          </div>
	                        </div>
	                        
                        </form>
                      </div>
                    </div>
                    <!-- Email View -->
                     
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
  </body>
</html>
