<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

    <title>eCommerce Add Product - Apps | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>

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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/quill/typography.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/quill/katex.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/quill/editor.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/select2/select2.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/dropzone/dropzone.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/flatpickr/flatpickr.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/tagify/tagify.css" />

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
          <div class="app-brand demo">
            <a href="main" class="app-brand-link">
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

            <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto">
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
                  <a href="${pageContext.request.contextPath}/projectList" class="menu-link">
                    <div class="text-truncate" >프로젝트 목록</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="dashboards-crm.html" class="menu-link">
                    <div class="text-truncate" >프로젝트 조직도</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="${pageContext.request.contextPath}/searchUser" class="menu-link">
                    <div class="text-truncate">프로젝트 인력 검색</div>
                  </a>
                </li>
              </ul>
            </li>
            <li class="menu-item active">
              <a href="${pageContext.request.contextPath}/noticeList" class="menu-link">
                <i class="menu-icon tf-icons bx bx-bell"></i>
                <div class="text-truncate">공지사항</div>
              </a>
            </li>
            <li class="menu-item">
              <a href="${pageContext.request.contextPath}/qnaList" class="menu-link">
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
                  <a href="${pageContext.request.contextPath}/calendar" class="menu-link">
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
              <a href="${pageContext.request.contextPath}/employee/jjoin" class="menu-link">
                <i class="menu-icon tf-icons bx bx-user"></i>
                <div class="text-truncate">사용자 등록</div>
              </a>
            </li>
            <%-- <li class="menu-item">
              <a href="${pageContext.request.contextPath}/addUser" class="menu-link">
                <i class="menu-icon tf-icons bx bx-user"></i>
                <div class="text-truncate">사용자 등록</div>
              </a>
            </li> --%>
            
            <li class="menu-item">
              <a href="${pageContext.request.contextPath}/userManagement" class="menu-link">
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

          <nav
            class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
            id="layout-navbar">
            <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
              <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                <i class="bx bx-menu bx-sm"></i>
              </a>
            </div>

            <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
              <!-- Search -->
              <div class="navbar-nav align-items-center">
                <div class="nav-item navbar-search-wrapper mb-0">
                  <a class="nav-item nav-link search-toggler px-0" href="javascript:void(0);">
                    <i class="bx bx-search bx-sm"></i>
                    <span class="d-none d-md-inline-block text-muted">Search (Ctrl+/)</span>
                  </a>
                </div>
              </div>
              <!-- /Search -->

              <ul class="navbar-nav flex-row align-items-center ms-auto">
                <!-- Language -->
                <li class="nav-item dropdown-language dropdown me-2 me-xl-0">
                  <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                    <i class="bx bx-globe bx-sm"></i>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-end">
                    <li>
                      <a class="dropdown-item" href="javascript:void(0);" data-language="en">
                        <span class="align-middle">English</span>
                      </a>
                    </li>
                    <li>
                      <a class="dropdown-item" href="javascript:void(0);" data-language="fr">
                        <span class="align-middle">French</span>
                      </a>
                    </li>
                    <li>
                      <a class="dropdown-item" href="javascript:void(0);" data-language="de">
                        <span class="align-middle">German</span>
                      </a>
                    </li>
                    <li>
                      <a class="dropdown-item" href="javascript:void(0);" data-language="pt">
                        <span class="align-middle">Portuguese</span>
                      </a>
                    </li>
                  </ul>
                </li>
                <!-- /Language -->

                <!-- Quick links  -->
                <li class="nav-item dropdown-shortcuts navbar-dropdown dropdown me-2 me-xl-0">
                  <a
                    class="nav-link dropdown-toggle hide-arrow"
                    href="javascript:void(0);"
                    data-bs-toggle="dropdown"
                    data-bs-auto-close="outside"
                    aria-expanded="false">
                    <i class="bx bx-grid-alt bx-sm"></i>
                  </a>
                  <div class="dropdown-menu dropdown-menu-end py-0">
                    <div class="dropdown-menu-header border-bottom">
                      <div class="dropdown-header d-flex align-items-center py-3">
                        <h5 class="text-body mb-0 me-auto">Shortcuts</h5>
                        <a
                          href="javascript:void(0)"
                          class="dropdown-shortcuts-add text-body"
                          data-bs-toggle="tooltip"
                          data-bs-placement="top"
                          title="Add shortcuts"
                          ><i class="bx bx-sm bx-plus-circle"></i
                        ></a>
                      </div>
                    </div>
                    <div class="dropdown-shortcuts-list scrollable-container">
                      <div class="row row-bordered overflow-visible g-0">
                        <div class="dropdown-shortcuts-item col">
                          <span class="dropdown-shortcuts-icon bg-label-secondary rounded-circle mb-2">
                            <i class="bx bx-calendar fs-4"></i>
                          </span>
                          <a href="app-calendar.html" class="stretched-link">Calendar</a>
                          <small class="text-muted mb-0">Appointments</small>
                        </div>
                        <div class="dropdown-shortcuts-item col">
                          <span class="dropdown-shortcuts-icon bg-label-secondary rounded-circle mb-2">
                            <i class="bx bx-food-menu fs-4"></i>
                          </span>
                          <a href="app-invoice-list.html" class="stretched-link">Invoice App</a>
                          <small class="text-muted mb-0">Manage Accounts</small>
                        </div>
                      </div>
                      <div class="row row-bordered overflow-visible g-0">
                        <div class="dropdown-shortcuts-item col">
                          <span class="dropdown-shortcuts-icon bg-label-secondary rounded-circle mb-2">
                            <i class="bx bx-user fs-4"></i>
                          </span>
                          <a href="app-user-list.html" class="stretched-link">User App</a>
                          <small class="text-muted mb-0">Manage Users</small>
                        </div>
                        <div class="dropdown-shortcuts-item col">
                          <span class="dropdown-shortcuts-icon bg-label-secondary rounded-circle mb-2">
                            <i class="bx bx-check-shield fs-4"></i>
                          </span>
                          <a href="app-access-roles.html" class="stretched-link">Role Management</a>
                          <small class="text-muted mb-0">Permission</small>
                        </div>
                      </div>
                      <div class="row row-bordered overflow-visible g-0">
                        <div class="dropdown-shortcuts-item col">
                          <span class="dropdown-shortcuts-icon bg-label-secondary rounded-circle mb-2">
                            <i class="bx bx-pie-chart-alt-2 fs-4"></i>
                          </span>
                          <a href="index.html" class="stretched-link">Dashboard</a>
                          <small class="text-muted mb-0">User Profile</small>
                        </div>
                        <div class="dropdown-shortcuts-item col">
                          <span class="dropdown-shortcuts-icon bg-label-secondary rounded-circle mb-2">
                            <i class="bx bx-cog fs-4"></i>
                          </span>
                          <a href="pages-account-settings-account.html" class="stretched-link">Setting</a>
                          <small class="text-muted mb-0">Account Settings</small>
                        </div>
                      </div>
                      <div class="row row-bordered overflow-visible g-0">
                        <div class="dropdown-shortcuts-item col">
                          <span class="dropdown-shortcuts-icon bg-label-secondary rounded-circle mb-2">
                            <i class="bx bx-help-circle fs-4"></i>
                          </span>
                          <a href="pages-faq.html" class="stretched-link">FAQs</a>
                          <small class="text-muted mb-0">FAQs & Articles</small>
                        </div>
                        <div class="dropdown-shortcuts-item col">
                          <span class="dropdown-shortcuts-icon bg-label-secondary rounded-circle mb-2">
                            <i class="bx bx-window-open fs-4"></i>
                          </span>
                          <a href="modal-examples.html" class="stretched-link">Modals</a>
                          <small class="text-muted mb-0">Useful Popups</small>
                        </div>
                      </div>
                    </div>
                  </div>
                </li>
                <!-- Quick links -->

                <!-- Style Switcher -->
                <li class="nav-item dropdown-style-switcher dropdown me-2 me-xl-0">
                  <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                    <i class="bx bx-sm"></i>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-styles">
                    <li>
                      <a class="dropdown-item" href="javascript:void(0);" data-theme="light">
                        <span class="align-middle"><i class="bx bx-sun me-2"></i>Light</span>
                      </a>
                    </li>
                    <li>
                      <a class="dropdown-item" href="javascript:void(0);" data-theme="dark">
                        <span class="align-middle"><i class="bx bx-moon me-2"></i>Dark</span>
                      </a>
                    </li>
                    <li>
                      <a class="dropdown-item" href="javascript:void(0);" data-theme="system">
                        <span class="align-middle"><i class="bx bx-desktop me-2"></i>System</span>
                      </a>
                    </li>
                  </ul>
                </li>
                <!-- / Style Switcher-->

                <!-- Notification -->
                <li class="nav-item dropdown-notifications navbar-dropdown dropdown me-3 me-xl-1">
                  <a
                    class="nav-link dropdown-toggle hide-arrow"
                    href="javascript:void(0);"
                    data-bs-toggle="dropdown"
                    data-bs-auto-close="outside"
                    aria-expanded="false">
                    <i class="bx bx-bell bx-sm"></i>
                    <span class="badge bg-danger rounded-pill badge-notifications">5</span>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-end py-0">
                    <li class="dropdown-menu-header border-bottom">
                      <div class="dropdown-header d-flex align-items-center py-3">
                        <h5 class="text-body mb-0 me-auto">Notification</h5>
                        <a
                          href="javascript:void(0)"
                          class="dropdown-notifications-all text-body"
                          data-bs-toggle="tooltip"
                          data-bs-placement="top"
                          title="Mark all as read"
                          ><i class="bx fs-4 bx-envelope-open"></i
                        ></a>
                      </div>
                    </li>
                    <li class="dropdown-notifications-list scrollable-container">
                      <ul class="list-group list-group-flush">
                        <li class="list-group-item list-group-item-action dropdown-notifications-item">
                          <div class="d-flex">
                            <div class="flex-shrink-0 me-3">
                              <div class="avatar">
                                <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle" />
                              </div>
                            </div>
                            <div class="flex-grow-1">
                              <h6 class="mb-1">Congratulation Lettie 🎉</h6>
                              <p class="mb-0">Won the monthly best seller gold badge</p>
                              <small class="text-muted">1h ago</small>
                            </div>
                            <div class="flex-shrink-0 dropdown-notifications-actions">
                              <a href="javascript:void(0)" class="dropdown-notifications-read"
                                ><span class="badge badge-dot"></span
                              ></a>
                              <a href="javascript:void(0)" class="dropdown-notifications-archive"
                                ><span class="bx bx-x"></span
                              ></a>
                            </div>
                          </div>
                        </li>
                        <li class="list-group-item list-group-item-action dropdown-notifications-item">
                          <div class="d-flex">
                            <div class="flex-shrink-0 me-3">
                              <div class="avatar">
                                <span class="avatar-initial rounded-circle bg-label-danger">CF</span>
                              </div>
                            </div>
                            <div class="flex-grow-1">
                              <h6 class="mb-1">Charles Franklin</h6>
                              <p class="mb-0">Accepted your connection</p>
                              <small class="text-muted">12hr ago</small>
                            </div>
                            <div class="flex-shrink-0 dropdown-notifications-actions">
                              <a href="javascript:void(0)" class="dropdown-notifications-read"
                                ><span class="badge badge-dot"></span
                              ></a>
                              <a href="javascript:void(0)" class="dropdown-notifications-archive"
                                ><span class="bx bx-x"></span
                              ></a>
                            </div>
                          </div>
                        </li>
                        <li class="list-group-item list-group-item-action dropdown-notifications-item marked-as-read">
                          <div class="d-flex">
                            <div class="flex-shrink-0 me-3">
                              <div class="avatar">
                                <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/2.png" alt class="w-px-40 h-auto rounded-circle" />
                              </div>
                            </div>
                            <div class="flex-grow-1">
                              <h6 class="mb-1">New Message ✉️</h6>
                              <p class="mb-0">You have new message from Natalie</p>
                              <small class="text-muted">1h ago</small>
                            </div>
                            <div class="flex-shrink-0 dropdown-notifications-actions">
                              <a href="javascript:void(0)" class="dropdown-notifications-read"
                                ><span class="badge badge-dot"></span
                              ></a>
                              <a href="javascript:void(0)" class="dropdown-notifications-archive"
                                ><span class="bx bx-x"></span
                              ></a>
                            </div>
                          </div>
                        </li>
                        <li class="list-group-item list-group-item-action dropdown-notifications-item">
                          <div class="d-flex">
                            <div class="flex-shrink-0 me-3">
                              <div class="avatar">
                                <span class="avatar-initial rounded-circle bg-label-success"
                                  ><i class="bx bx-cart"></i
                                ></span>
                              </div>
                            </div>
                            <div class="flex-grow-1">
                              <h6 class="mb-1">Whoo! You have new order 🛒</h6>
                              <p class="mb-0">ACME Inc. made new order $1,154</p>
                              <small class="text-muted">1 day ago</small>
                            </div>
                            <div class="flex-shrink-0 dropdown-notifications-actions">
                              <a href="javascript:void(0)" class="dropdown-notifications-read"
                                ><span class="badge badge-dot"></span
                              ></a>
                              <a href="javascript:void(0)" class="dropdown-notifications-archive"
                                ><span class="bx bx-x"></span
                              ></a>
                            </div>
                          </div>
                        </li>
                        <li class="list-group-item list-group-item-action dropdown-notifications-item marked-as-read">
                          <div class="d-flex">
                            <div class="flex-shrink-0 me-3">
                              <div class="avatar">
                                <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/9.png" alt class="w-px-40 h-auto rounded-circle" />
                              </div>
                            </div>
                            <div class="flex-grow-1">
                              <h6 class="mb-1">Application has been approved 🚀</h6>
                              <p class="mb-0">Your ABC project application has been approved.</p>
                              <small class="text-muted">2 days ago</small>
                            </div>
                            <div class="flex-shrink-0 dropdown-notifications-actions">
                              <a href="javascript:void(0)" class="dropdown-notifications-read"
                                ><span class="badge badge-dot"></span
                              ></a>
                              <a href="javascript:void(0)" class="dropdown-notifications-archive"
                                ><span class="bx bx-x"></span
                              ></a>
                            </div>
                          </div>
                        </li>
                        <li class="list-group-item list-group-item-action dropdown-notifications-item marked-as-read">
                          <div class="d-flex">
                            <div class="flex-shrink-0 me-3">
                              <div class="avatar">
                                <span class="avatar-initial rounded-circle bg-label-success"
                                  ><i class="bx bx-pie-chart-alt"></i
                                ></span>
                              </div>
                            </div>
                            <div class="flex-grow-1">
                              <h6 class="mb-1">Monthly report is generated</h6>
                              <p class="mb-0">July monthly financial report is generated</p>
                              <small class="text-muted">3 days ago</small>
                            </div>
                            <div class="flex-shrink-0 dropdown-notifications-actions">
                              <a href="javascript:void(0)" class="dropdown-notifications-read"
                                ><span class="badge badge-dot"></span
                              ></a>
                              <a href="javascript:void(0)" class="dropdown-notifications-archive"
                                ><span class="bx bx-x"></span
                              ></a>
                            </div>
                          </div>
                        </li>
                        <li class="list-group-item list-group-item-action dropdown-notifications-item marked-as-read">
                          <div class="d-flex">
                            <div class="flex-shrink-0 me-3">
                              <div class="avatar">
                                <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/5.png" alt class="w-px-40 h-auto rounded-circle" />
                              </div>
                            </div>
                            <div class="flex-grow-1">
                              <h6 class="mb-1">Send connection request</h6>
                              <p class="mb-0">Peter sent you connection request</p>
                              <small class="text-muted">4 days ago</small>
                            </div>
                            <div class="flex-shrink-0 dropdown-notifications-actions">
                              <a href="javascript:void(0)" class="dropdown-notifications-read"
                                ><span class="badge badge-dot"></span
                              ></a>
                              <a href="javascript:void(0)" class="dropdown-notifications-archive"
                                ><span class="bx bx-x"></span
                              ></a>
                            </div>
                          </div>
                        </li>
                        <li class="list-group-item list-group-item-action dropdown-notifications-item">
                          <div class="d-flex">
                            <div class="flex-shrink-0 me-3">
                              <div class="avatar">
                                <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/6.png" alt class="w-px-40 h-auto rounded-circle" />
                              </div>
                            </div>
                            <div class="flex-grow-1">
                              <h6 class="mb-1">New message from Jane</h6>
                              <p class="mb-0">Your have new message from Jane</p>
                              <small class="text-muted">5 days ago</small>
                            </div>
                            <div class="flex-shrink-0 dropdown-notifications-actions">
                              <a href="javascript:void(0)" class="dropdown-notifications-read"
                                ><span class="badge badge-dot"></span
                              ></a>
                              <a href="javascript:void(0)" class="dropdown-notifications-archive"
                                ><span class="bx bx-x"></span
                              ></a>
                            </div>
                          </div>
                        </li>
                        <li class="list-group-item list-group-item-action dropdown-notifications-item marked-as-read">
                          <div class="d-flex">
                            <div class="flex-shrink-0 me-3">
                              <div class="avatar">
                                <span class="avatar-initial rounded-circle bg-label-warning"
                                  ><i class="bx bx-error"></i
                                ></span>
                              </div>
                            </div>
                            <div class="flex-grow-1">
                              <h6 class="mb-1">CPU is running high</h6>
                              <p class="mb-0">CPU Utilization Percent is currently at 88.63%,</p>
                              <small class="text-muted">5 days ago</small>
                            </div>
                            <div class="flex-shrink-0 dropdown-notifications-actions">
                              <a href="javascript:void(0)" class="dropdown-notifications-read"
                                ><span class="badge badge-dot"></span
                              ></a>
                              <a href="javascript:void(0)" class="dropdown-notifications-archive"
                                ><span class="bx bx-x"></span
                              ></a>
                            </div>
                          </div>
                        </li>
                      </ul>
                    </li>
                    <li class="dropdown-menu-footer border-top p-3">
                      <button class="btn btn-primary text-uppercase w-100">view all notifications</button>
                    </li>
                  </ul>
                </li>
                <!--/ Notification -->
                <!-- User -->
                <li class="nav-item navbar-dropdown dropdown-user dropdown">
                  <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                    <div class="avatar avatar-online">
                      <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle" />
                    </div>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-end">
                    <li>
                      <a class="dropdown-item" href="${pageContext.request.contextPath}/userModify">
                        <div class="d-flex">
                          <div class="flex-shrink-0 me-3">
                            <div class="avatar avatar-online">
                              <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle" />
                            </div>
                          </div>
                          <div class="flex-grow-1">
                            <span class="fw-medium d-block">김시온</span>
                            <small class="text-muted">개인 정보 수정</small>
                          </div>
                        </div>
                      </a>
                    </li>
                    <li>
                      <div class="dropdown-divider"></div>
                    </li>
                    <li>
                      <a class="dropdown-item" href="${pageContext.request.contextPath}/userProfile">
                        <i class="bx bx-user me-2"></i>
                        <span class="align-middle mx-1">마이 페이지</span>
                      </a>
                    </li>
                    <li>
                      <a class="dropdown-item" href="${pageContext.request.contextPath}/note">
                        <span class="d-flex align-items-center align-middle">
                    	  <i class="bx bx-envelope me-3"></i>
                     	  <span class="flex-grow-1 align-middle">쪽지함</span>
                      	  <span class="flex-shrink-0 badge badge-center rounded-pill bg-danger w-px-20 h-px-20">4</span>
                      	</span>
                      </a>
                    </li>
                    <li>
                      <a class="dropdown-item" href="${pageContext.request.contextPath}/chat">
                        <span class="d-flex align-items-center align-middle">
                          <i class="bx bx-chat me-3"></i>
                          <span class="flex-grow-1 align-middle">채팅</span>
                          <span class="flex-shrink-0 badge badge-center rounded-pill bg-danger w-px-20 h-px-20">4</span>
                        </span>
                      </a>
                    </li>

                    <li>
                      <div class="dropdown-divider"></div>
                    </li>
                    <li>
                      <a class="dropdown-item" href="auth-login-cover.html" target="_blank">
                        <i class="bx bx-power-off me-2"></i>
                        <span class="align-middle">로그아웃</span>
                      </a>
                    </li>
                  </ul>
                </li>
                <!--/ User -->
              </ul>
            </div>

            <!-- Search Small Screens -->
            <div class="navbar-search-wrapper search-input-wrapper d-none">
              <input
                type="text"
                class="form-control search-input container-xxl border-0"
                placeholder="Search..."
                aria-label="Search..." />
              <i class="bx bx-x bx-sm search-toggler cursor-pointer"></i>
            </div>
          </nav>
          <!-- / Navbar -->

          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <!-- <h4 class="py-3 mb-4"><span class="text-muted fw-light">eCommerce /</span><span> Add Product</span></h4> -->

              <div class="app-ecommerce">
                <!-- Add Product -->
                <div class="d-flex flex-wrap justify-content-between align-items-center mb-3">
                  <div class="d-flex flex-column justify-content-center">
                    <h4 class="mb-1 mt-3"><strong>공지사항 내용🍣</strong></h4>
                    <!-- <p class="text-muted">Orders placed across your store</p> -->
                  </div>
                  <div class="d-flex align-content-center flex-wrap gap-3">
                    <!-- <button class="btn btn-label-secondary">Discard</button>
                    <button class="btn btn-label-primary">Save draft</button> -->
                    <button type="submit" class="btn btn-primary">등록</button>
                  </div>
                </div>

                <div class="row">
                  <!-- First column-->
                  <div class="col-12 col-lg-12">
                    <!-- Product Information -->
                    <div class="card mb-4">
                      <!-- <div class="card-header">
                        <h5 class="card-tile mb-0">Product information</h5>
                      </div> -->
                      <div class="card-body">
                        	<div class="card-body">
								<div>
									<div>
										<div>
											<p>
												<span>번호:</span> 
												<span>${board.bno}</span>
											</p>
											
											<p>
												<span>제목:</span> 
												<span>${board.btitle}</span>
											</p>
											
											<p>
												<span>글쓴이:</span> 
												<span>${board.mid}</span>
											<p>
											
											<p>
												<span>날짜:</span> 
												<span><fmt:formatDate value="${board.bdate}" pattern="yyyy-MM-dd HH.mm.ss"/></span> <br/>
											</p>
											
											<c:if test="${board.battachoname !=null}">
												<p>
													<%-- <span>첨부:</span> 
													<span>
														${board.battachoname}
														
														<!-- 첨부파일이 파일 시스템에 저장되어 있는 경우 -->
														<c:if test="${board.battachoname != null}">
															<a href="filedownload1?bno=${board.bno}"
															 class="btn btn-info btn-sm ml-2">다운로드</a>
															<img src="filedownload1?bno=${board.bno}" height="100"/>
														</c:if>
														
														<!-- 첨부파일이 DB에 저장되어 있는 경우 --> 
														<c:if test="${board.battachdata != null}">
															<a href="filedownload2?bno=${board.bno}"
															 class="btn btn-info btn-sm ml-2">다운로드</a>
															 <!-- 
															  src의 속성값은 완전한 응답 HTTP가 되어야 함 
															  (jpg,png 나 filedownload1?bno=${board.bno} 요청으로 완전한 http를 받는다)
															  
															   1) 서버의 정적을 요청해서 응답을 받는 경우, 예) photo1.jpg
															   2) 요청경로를 이용해서 컨트롤러에서 응답을 생성하는 경우, 예) filedownload1?bno=${board.bno}
															   
															   데이터를 직접 주면 안됨! 만약 데이터를 직접 넣어야할 경우 아래와 같음
															  src="data:MIME;base64, base64로 인코딩된 데이터"
															 -->
															<img src="data:${board.battachtype};base64, ${base64Img}" height="100"/>
														</c:if>
														 
													</span> --%>
												</p>
											</c:if>
										</div>
										
										<%-- <div>
											<span class="title">내용:</span> <br/>
											<textarea style="width:100%" readonly>${board.bcontent}</textarea>
										</div> --%>
										<div>
				                          <label class="form-label"><strong>내용</strong></label>
				                          <div class="form-control p-0 pt-1">
				                            <div class="comment-toolbar border-0 border-bottom">
				                              <div class="d-flex justify-content-start">
				                              </div>
				                            </div>
				                          </div>
				                        </div>
										
										<a class="btn btn-primary btn-sm mt-2" href="noticeList">목록</a>
										<a class="btn btn-primary btn-sm mt-2" href="updateBoard?bno=${board.bno}">수정</a>
										<a class="btn btn-primary btn-sm mt-2" href="deleteBoard?bno=${board.bno}">삭제</a>
										
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
            <footer class="content-footer footer bg-footer-theme">
              <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                <div class="mb-2 mb-md-0">
                  Â©
                  <script>
                    document.write(new Date().getFullYear());
                  </script>
                  , made with â¤ï¸ by
                  <a href="https://themeselection.com" target="_blank" class="footer-link fw-medium">ThemeSelection</a>
                </div>
                <div class="d-none d-lg-inline-block">
                  <a href="https://themeselection.com/license/" class="footer-link me-4" target="_blank">License</a>
                  <a href="https://themeselection.com/" target="_blank" class="footer-link me-4">More Themes</a>

                  <a
                    href="https://demos.themeselection.com/sneat-bootstrap-html-admin-template/documentation/"
                    target="_blank"
                    class="footer-link me-4"
                    >Documentation</a
                  >

                  <a
                    href="https://themeselection.com/support/"
                    target="_blank"
                    class="footer-link d-none d-sm-inline-block"
                    >Support</a
                  >
                </div>
              </div>
            </footer>
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
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/dropzone/dropzone.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/jquery-repeater/jquery-repeater.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/flatpickr/flatpickr.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/tagify/tagify.js"></script>

    <!-- Main JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

    <!-- Page JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/noticeDetail.js"></script>
  </body>
</html>