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

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/animate-css/animate.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/sweetalert2/sweetalert2.css" />
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
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->

        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
          <div class="app-brand demo">
            <a href="${pageContext.request.contextPath}/main" class="app-brand-link">
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
            <li class="menu-item active">
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
                  <a href="dashboards-crm.html" class="menu-link">
                    <div class="text-truncate" >프로젝트 조직도</div>
                  </a>
                </li>
                <li class="menu-item active">
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
            
            <%-- <li class="menu-item">
               <a href="${pageContext.request.contextPath}/addUser" class="menu-link">
                <i class="menu-icon tf-icons bx bx-user"></i>
                <div class="text-truncate">사용자 등록</div>
              </a>
            </li> --%>
            <li class="menu-item">
               <a href="${pageContext.request.contextPath}/employee/jjoin" class="menu-link">
                <i class="menu-icon tf-icons bx bx-user"></i>
                <div class="text-truncate">사용자 등록</div>
              </a>
            </li>
            
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

            <div class="container-xxl flex-grow-1 container-p-y">
              <div class="app-email card">
                <div class="border-0">
                  <div class="row g-0">
                    <!-- Email Sidebar -->
                    <div class="col app-email-sidebar border-end flex-grow-0" id="app-email-sidebar">
                      <div class="btn-compost-wrapper d-grid">
                        <button
                          class="btn btn-primary btn-compose"
                          data-bs-toggle="modal"
                          data-bs-target="#emailComposeSidebar"
                          id="emailComposeSidebarLabel">
                          	쪽지 보내기
                        </button>
                      </div>
                      <!-- Email Filters -->
                      <div class="email-filters py-2">
                        <!-- Email Filters: Folder -->
                        <ul class="email-filter-folders list-unstyled pb-1">
                          <li class="active d-flex justify-content-between" data-target="inbox" id="inboxTab">
                            <a href="javascript:void(0);" id="inboxNoteList" class="d-flex flex-wrap align-items-center">
                              <i class="bx bx-envelope"></i>
                              <span class="align-middle ms-2">수신 쪽지함</span>
                            </a>
                            <div class="badge bg-label-primary rounded-pill" id="unreadNote">${unReadCount}</div>
                          </li>
                          <li class="d-flex justify-content-between" data-target="sent" id="sentTab">
                            <a href="javascript:void(0);" id="sentNoteList" class="d-flex flex-wrap align-items-center">
                              <i class="bx bx-send"></i>
                              <span class="align-middle ms-2">발신 쪽지함</span>
                            </a>
                          </li>
                          <li class="d-flex justify-content-between" data-target="draft" id="draftTab">
                            <a href="javascript:void(0);" id="draftNoteList" class="d-flex flex-wrap align-items-center">
                              <i class="bx bx-edit"></i>
                              <span class="align-middle ms-2">임시 저장함</span>
                            </a>
                            <div class="badge bg-label-success rounded-pill" id="draftNote">${draftCount}</div>
                          </li>
                          <li class="d-flex justify-content-between" data-target="starred" id="starredTab">
                            <a href="javascript:void(0);" id="starredNoteList" class="d-flex flex-wrap align-items-center">
                              <i class="bx bx-star"></i>
                              <span class="align-middle ms-2">중요 쪽지함</span>
                            </a>
                              <div class="badge bg-label-warning rounded-pill" id="starredNote">${starredCount}</div>
                          </li>
                          
                          <li class="d-flex justify-content-between align-items-center" data-target="trash" id="trashTab">
                            <a href="javascript:void(0);" id="trashNoteList" class="d-flex flex-wrap align-items-center">
                              <i class="bx bx-trash"></i>
                              <span class="align-middle ms-2">휴지통</span>
                            </a>
                             <div class="badge bg-label-secondary rounded-pill" id="trashNote">${trashCount}</div>
                          </li>
                        </ul>
                        <input type="hidden" id="conType" value="${noteReadNo}"/>

                        <!-- Email Filters: Labels -->
                        <div class="email-filter-labels">
                          <small class="mx-4 text-uppercase text-muted">Labels</small>
                          <ul class="list-unstyled mb-0">
                            <li data-target="private">
                              <a href="javascript:void(0);">
                                <i class="badge badge-dot bg-danger"></i>
                                <span class="align-middle ms-2">긴급 필독</span>
                              </a>
                            </li>
                            <li data-target="important">
                              <a href="javascript:void(0);">
                                <i class="badge badge-dot bg-warning"></i>
                                <span class="align-middle ms-2">공지 관련</span>
                              </a>
                            </li>
                           
                            <li data-target="work">
                              <a href="javascript:void(0);">
                                <i class="badge badge-dot bg-success"></i>
                                <span class="align-middle ms-2">기능 문의</span>
                              </a>
                            </li>
                            <li data-target="company">
                              <a href="javascript:void(0);">
                                <i class="badge badge-dot bg-primary"></i>
                                <span class="align-middle ms-2">일반 쪽지</span>
                              </a>
                            </li>
                            
                          </ul>
                        </div>
                        <!--/ Email Filters -->
                      </div>
                    </div>
                    <!--/ Email Sidebar -->

                    <!-- Emails List -->
                    <div class="col app-emails-list" id="refreshNoteContent">
<%--                       <div class="card shadow-none border-0">
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
                              <div class="-check me-2">
                                <input class="form-check-input" type="checkbox" id="email-select-all" />
                                <label class="form-check-label" for="email-select-all"></label>
                              </div>
                              <i class="bx bx-trash-alt email-list-delete cursor-pointer me-3 fs-4"></i>
                              <i class="bx bx-envelope email-list-read cursor-pointer me-3 fs-4"></i>
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
                              <span class="d-sm-block d-none mx-3 text-muted">1-10 of 653</span>
                              <span class="d-sm-block d-none mx-3 text-muted"><a class="text-muted" href="?pageNo=1">처음</a></span>
                              <i
                                class="email-prev bx bx-chevron-left scaleX-n1-rtl cursor-pointer text-muted me-4 fs-4">
                                   <c:if test="${pager.groupNo>1}">
                                       <a href="?pageNo=${pager.startPageNo-1}"></a>
                                   </c:if>
                              </i>
                              <i class="email-next bx bx-chevron-right scaleX-n1-rtl cursor-pointer fs-4">
                              <c:if test="${pager.groupNo<pager.totalGroupNo}">
                              	 <a href="?pageNo=${pager.endPageNo+1}"></a>
                              </c:if>
                              	</i>
                              	
                              	<span class="d-sm-block d-none mx-3 text-muted"><a class="text-muted" href="?pageNo=${pager.totalPageNo}">맨끝</a></span>
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
			                              data-target="#app-email-view-${note.noteRead_no}">
			                              <div class="d-flex align-items-center">
			                                <div class="form-check">
			                                  <input class="email-list-item-input form-check-input" type="checkbox" id="email-${note.noteRead_no}" />
			                                  <label class="form-check-label" for="email-${note.noteRead_no}"></label>
			                                </div>
			                                <i
			                                  class="email-list-item-bookmark bx bx-star d-sm-inline-block d-none cursor-pointer mx-4 bx-sm"></i>
			                                <img
			                                  src="${pageContext.request.contextPath}/resources/assets/img/avatars/1.png"
			                                  alt="user-avatar"
			                                  class="d-block flex-shrink-0 rounded-circle me-sm-3 me-0"
			                                  height="32"
			                                  width="32" />
			                                <div class="email-list-item-content ms-2 ms-sm-0 me-2">
			                                  <span class="email-list-item-username me-2 h6">${note.note_sender_name}</span>
			                                  <span class="email-list-item-subject d-xl-inline-block d-block">
			                               	     ${note.note_title}</span
			                                  >
			                                </div>
			                                <div class="email-list-item-meta ms-auto d-flex align-items-center">
			                                  <span
			                                    class="email-list-item-label badge badge-dot bg-danger d-none d-md-inline-block me-2"
			                                    data-label="private"></span>
			                                  <small class="email-list-item-time text-muted">${note.note_createdAt.substring(11, 16)}</small>
			                                  <ul class="list-inline email-list-item-actions">
			                                    <li class="list-inline-item email-delete"><i class="bx bx-trash-alt fs-4"></i></li>
			                                     <c:if test ="${note.noteRead_read != null}">
						                              <li class="list-inline-item email-read"><i class="bx bx-envelope-open fs-4"></i></li>
						                         </c:if>
						                          <c:if test ="${note.noteRead_read == null}">
			                                          <li class="list-inline-item email-unread"><i class="bx bx-envelope fs-4"></i></li>
			                                      </c:if>
			                                    <li class="list-inline-item"><i class="bx bx-error-circle fs-4"></i></li>
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
                      <div class="app-overlay"></div> --%>
                    </div> 
                    <!-- /Emails List -->
                    <!-- Email View -->
                    <div class="col app-email-view flex-grow-0 bg-body" id="app-email-view">
                     <%--  <div class="app-email-view-header p-3 py-md-3 py-2 rounded-0">
                        <!-- Email View : Title  bar-->
                        <div class="d-flex justify-content-between align-items-center">
                          <div class="d-flex align-items-center overflow-hidden">
                            <i
                              class="bx bx-chevron-left bx-sm cursor-pointer me-2"
                              data-bs-toggle="sidebar"
                              data-target="#app-email-view-${note.noteRead_no}"></i>
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
                                id="dropdownMoreOptions-${note.noteRead_no}"
                                data-bs-toggle="dropdown"
                                aria-haspopup="true"
                                aria-expanded="false">
                                <i class="bx bx-dots-vertical-rounded fs-4"></i>
                              </button>
                              <div class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMoreOption">
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
                              data-target="#app-email-view-${note.noteRead_no}"></i>
                            <i class="bx bx-envelope fs-4 cursor-pointer me-3"></i>
                            <div class="dropdown">
                              <button
                                class="btn p-0"
                                type="button"
                                id="dropdownMenuFolderTwo-${note.noteRead_no}"
                                data-bs-toggle="dropdown"
                                aria-haspopup="true"
                                aria-expanded="false">
                                <i class="bx bx-folder fs-4 me-3"></i>
                              </button>
                              <div class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuFolderTwo-${note.noteRead_no}">
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
                                id="dropdownLabelTwo-${note.noteRead_no}"
                                data-bs-toggle="dropdown"
                                aria-haspopup="true"
                                aria-expanded="false">
                                <i class="bx bx-label fs-4 me-3"></i>
                              </button>
                              <div class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownLabelTwo-${note.noteRead_no}">
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
                                  id="dropdownEmailOne-${note.noteRead_no}"
                                  data-bs-toggle="dropdown"
                                  aria-haspopup="true"
                                  aria-expanded="false">
                                  <i class="bx bx-dots-vertical-rounded bx-sm"></i>
                                </button>
                                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownEmailOne-${note.noteRead_no}">
                                  <a class="dropdown-item scroll-to-reply" href="javascript:void(0)">
                                    <i class="bx bx-share me-1"></i>
                                    <span class="align-middle">Reply</span>
                                  </a>
                                  <a class="dropdown-item" href="javascript:void(0)">
                                    <i class="bx bx-share scaleX-n1 scaleX-n1-rtl me-1"></i>
                                    <span class="align-middle">Forward</span>
                                  </a>
                                  <a class="dropdown-item" href="javascript:void(0)">
                                    <i class="bx bx-info-circle me-1"></i>
                                    <span class="align-middle">Report</span>
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
                                <h6 class="m-0">${note.note_sender_name}</h6>
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
                                  id="dropdownEmailTwo-${note.noteRead_no}"
                                  data-bs-toggle="dropdown"
                                  aria-haspopup="true"
                                  aria-expanded="false">
                                  <i class="bx bx-dots-vertical-rounded bx-sm"></i>
                                </button>
                                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownEmailTwo-${note.noteRead_no}">
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
                        <!-- Email View : Reply mail-->
                        <div class="email-reply card mt-4 mx-sm-4 mx-3 border">
                          <h6 class="card-header border mb-2"><strong>'${note.note_sender_name}' 님께 답장</strong></h6>
                          <div class="card-body pt-0 px-3">
                            <div class="d-flex justify-content-start">
                              <div class="email-reply-toolbar border-0 w-100 ps-0">
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
                            <div class="email-reply-editor" id="editor-${note.noteRead_no}"></div>
                            <div class="d-flex justify-content-end align-items-center">
                              <div class="cursor-pointer me-3">
                                <i class="bx bx-paperclip"></i>
                                <span class="align-middle">첨부 파일</span>
                              </div>
                              <button class="btn btn-primary">
                                <i class="bx bx-paper-plane me-1"></i>
                                <span class="align-middle">보내기</span>
                              </button>
                            </div>
                          </div>
                        </div>
                      </div> --%>
                    </div>
                    <!-- Email View -->
                      
                  </div> 
                </div>
                <input type="hidden" id="searchUserFrom" value="${emp_no}">

                <!-- Compose Email -->
                <div
                  class="app-email-compose modal"
                  id="emailComposeSidebar"
                  tabindex="-1"
                  aria-labelledby="emailComposeSidebarLabel"
                  aria-hidden="true">
                  <div class="modal-dialog m-0 me-md-4 mb-4 modal-lg">
                    <div class="modal-content p-0">
                      <div class="modal-header py-3 bg-body">
                        <h5 class="modal-title fs-5">쪽지 보내기</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body flex-grow-1 pb-sm-0 p-4 py-2">
                        <form class="email-compose-form" name="NoteRequest" action="noteSend" id="noteSend" method="POST" enctype="multipart/form-data" onsubmit="return validateForm();">
                          <div class="email-compose-to d-flex justify-content-between align-items-center">
                            <label class="form-label mb-2" for="emailContacts" style="width: 90px;">받는 사람 :</label>
                            <div class="select2-primary border-0 shadow-none flex-grow-1 mx-1">
                              <select
                                class="select-email-contacts select2 form-select"
                                id="emailContacts"
                                name="emailContacts"
                                multiple>
                                <c:forEach var="team" items="${teamList}">
		                           <optgroup label="${team}">
                                      <c:forEach var="emp" items="${empList}">
                                         <c:if test ="${emp.team_name == team}">
		                                	<option data-avatar="1.png" value="${emp.emp_no}" data-subtext=" ${emp.empinfo_position}">${emp.empinfo_name}</option>
	                                	 </c:if>
                                      </c:forEach>
		                           </optgroup>
                                </c:forEach>
                              </select>
                              <input type="hidden" name="note_receiver" id="note_receiver" value="">
                            </div>
                            <div class="email-compose-toggle-wrapper mb-2 mx-1" style="width: 140px;">
                              <a class="email-compose-toggle-cc text-body mx-1" href="javascript:void(0);" id="emailcc">참조  </a>
                              |<a class="email-compose-toggle-bcc text-body mx-1" href="javascript:void(0);" id="emailbcc"> 비밀참조</a>
                            </div>
                          </div>
                         
                           <div class="email-compose-cc d-none">
                            <hr class="mx-n4 my-2" />
                            <div class="d-flex justify-content-between align-items-center">
                               <label for="selectpickerSelectDeselect" class="form-label me-1" style="width: 40px;">참조 :</label>
		                          <select class="selectpicker w-100 my-2 mb-3" 
		                          	multiple
		                            data-actions-box="true"
		                            id="selectpickerSelectDeselect"
		                         	 data-style="btn-default"
		                        	  name="note_receiver_cc"
		                        	  data-live-search="true">
		                           <c:forEach var="team" items="${teamList}">
			                           <optgroup label="${team}">
	                                      <c:forEach var="emp" items="${empList}">
	                                         <c:if test ="${emp.team_name == team}">
			                                	<option class="ccReceiver" id="cc-${emp.emp_no}" data-avatar="1.png" value="${emp.emp_no}" data-subtext=" ${emp.empinfo_position}">${emp.empinfo_name}</option>
		                                	 </c:if>
	                                      </c:forEach>
			                           </optgroup>
	                                </c:forEach>
		                          </select> 
                            </div>
                          </div>
                         <div class="email-compose-bcc d-none">
                            <hr class="mx-n4 my-2" />
                            <div class=" d-flex justify-content-between align-items-center">
                               <label for="selecBcc" class="form-label me-1" style="width: 70px;">비밀참조 :</label>
		                          <select
		                            id="selecBcc"
		                            name="note_receiver_bcc"
		                            class="selectpicker w-100 my-2 mb-3"
		                            data-style="btn-default"
		                            data-live-search="true"
		                            multiple
		                            data-actions-box="true">
		                           <c:forEach var="team" items="${teamList}">
			                           <optgroup label="${team}">
	                                      <c:forEach var="emp" items="${empList}">
	                                         <c:if test ="${emp.team_name == team}">
			                                	<option data-avatar="1.png" value="${emp.emp_no}" data-subtext=" ${emp.empinfo_position}">${emp.empinfo_name}</option>
		                                	 </c:if>
	                                      </c:forEach>
			                           </optgroup>
                                  </c:forEach>
		                          </select>
                            </div>
                          </div> 
                          <hr class="mx-n4 my-0" />
                          <div class="email-compose-subject d-flex justify-content-between align-items-center my-1">
                            <label for="email-subject" class="form-label mb-0 d-inline" style="width: 35px;" >주제 :</label>
                            <input
                              type="text"
                              name="note_title"
                              class="form-control border-0 shadow-none flex-grow-1 mx-2"
                              id="email-subject" />
                          </div>
                          <div class="email-compose-message mx-n4">
                            <div class="d-flex justify-content-end">
                              <div class="email-editor-toolbar border-0 w-100 border-top">
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
                            <div class="email-editor border-0 border-top"></div>
                            <textarea id="note-content" name="note_content" style="display:none"></textarea>
                          </div>
                          <hr class="mx-n4 mt-0 mb-2" />
		                           <!-- 보내기 예약 -->
		                           
		                        <div class="d-flex col-md-8 col-12 mb-4 d-none" id="send-reserv">
		                         	<div class="col-md-6"> 
			                         	<label for="flatpickr-datetime" class="form-label">보내기 예약</label>
			                          <input
			                            type="text"
			                            class="form-control"
			                            name=""
			                            placeholder="YYYY-MM-DD HH:MM"
			                            id="flatpickr-datetime" />
			                           
		                           	</div>
		                           	<div class="col-md-2 mt-4 ms-2 pt-2 mb-2 align-items-center">
		                           		<button type="button" class="btn btn-label-secondary btn-sm" onclick="javascript:hideReserv();">X</button>
		                           	</div>
		                        </div>
		                        <!-- /Datetime Picker-->
		                        
                          <div
                            class="email-compose-actions d-flex justify-content-between align-items-center my-2 py-1">
                            <div class="d-flex align-items-center">
                              <div class="btn-group">
                                <button type="submit" class="btn btn-primary" data-bs-dismiss="modal" aria-label="Close">
                                  	보내기
                                </button>
                                <button
                                  type="button"
                                  class="btn btn-primary dropdown-toggle dropdown-toggle-split"
                                  data-bs-toggle="dropdown"
                                  aria-haspopup="true"
                                  aria-expanded="false">
                                  <span class="visually-hidden">Toggle Dropdown</span>
                                </button>
                                <ul class="dropdown-menu">
                                  <li><a class="dropdown-item" href="javascript:showReserv();">예약 전송</a></li>
                                  <li><a class="dropdown-item" href="javascript:showdraft();">임시 저장</a></li>
                                </ul>
                              </div>
                              <label for="attach-file"><i class="bx bx-paperclip cursor-pointer ms-2"></i></label>
                              <input type="file" name="files" class="d-none" id="attach-file" multiple/>
                              <input value="첨부파일" readonly type="text" id="filename" placeholder="첨부파일" class="text-muted ms-1 upload-name" style="border:none; width:400px;outline: none;">
                            </div>
                            <div class="d-flex align-items-center">
                             <i id="label-select" class="me-1 badge badge-dot bg-primary"></i>
                             <input type="hidden" id="note_label" name="note_label" value="일반 쪽지"/>
                              <div class="ms-2 dropdown">
                                <button
                                  class="btn p-0"
                                  type="button"
                                  id="dropdownMoreActions"
                                  data-bs-toggle="dropdown"
                                  aria-haspopup="true"
                                  aria-expanded="false">
                                  <i class="bx bx-dots-vertical-rounded"></i>
                                  
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMoreActions">
                                  <li class="dropdown-item">라벨 추가</li>
                                   <hr class="dropdown-divider" />
                                  <li><button type="button" class="dropdown-item" id="label-red"><i class="badge badge-dot bg-danger"></i>
                                            <span class="align-middle ms-2">긴급 필독</span></button></li>
                                  <li><button type="button" class="dropdown-item" id="label-yellow"><i class="badge badge-dot bg-warning"></i>
                                            <span class="align-middle ms-2">공지 관련</span></button></li>
                                  <li><button type="button" class="dropdown-item" id="label-green"><i class="badge badge-dot bg-success"></i>
                                            <span class="align-middle ms-2">기능 문의</span></button></li>
                                  <li><button type="button" class="dropdown-item" id="label-blue"><i class="badge badge-dot bg-primary"></i>
                                            <span class="align-middle ms-2">일반 쪽지</span></button></li>
                                </ul>
                              </div>
                              <button type="reset" class="btn" data-bs-dismiss="modal" aria-label="Close">
                                <i class="bx bx-trash"></i>
                              </button>
                            </div>
                          </div>
                        </form>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- /Compose Email -->
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
	<script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/sweetalert2/sweetalert2.js"></script>



    <!-- Page JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/forms-pickers.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/forms-tagify.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/header.js"></script>
  </body>
</html>
