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

    <title>eCommerce - Dashboards | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>

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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/apex-charts/apex-charts.css" />

    <!-- Page CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/css/pages/card-analytics.css" />

    <!-- Helpers -->
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/js/helpers.js"></script>
    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Template customizer: To hide customizer set displayCustomizer value false in config.js.  -->
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/js/template-customizer.js"></script>
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/config.js"></script>
    <!-- calendar -->
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script>
    <script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
      });

    </script>
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
            <li class="menu-item">
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
              <a href="${pageContext.request.contextPath}/addProject" class="menu-link">
                <i class="menu-icon tf-icons bx bx-file"></i>
                <div class="text-truncate">프로젝트 등록</div>
              </a>
            </li>
            <li class="menu-item">
              <a href="${pageContext.request.contextPath}/addUser" class="menu-link">
                <i class="menu-icon tf-icons bx bx-user"></i>
                <div class="text-truncate">사용자 등록</div>
              </a>
            </li>
            
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

            <div class="container-xxl flex-grow-1 container-p-y" >
              <div class="row">
                <div class="col-md-6 col-lg-8 mb-4 mb-md-0">
		            <div class="flex-grow-1 container-p-y">
		              <div class="card app-calendar-wrapper">
		                <div class="row g-0">
		                  <div id='calendar'></div>
		                </div>
		              </div>
		            </div>
          		</div>
          		
          		<div class="col-md-6 col-lg-4 mb-4 mb-mb-0">
                  <div class="card text-center">
                    <div class="card-header py-3">
                      <ul class="nav nav-pills" role="tablist">
                        <li class="nav-item">
                          <button
                            type="button"
                            class="nav-link active"
                            role="tab"
                            data-bs-toggle="tab"
                            data-bs-target="#navs-pills-browser"
                            aria-controls="navs-pills-browser"
                            aria-selected="true">
                            Browser
                          </button>
                        </li>
                        <li class="nav-item">
                          <button
                            type="button"
                            class="nav-link"
                            role="tab"
                            data-bs-toggle="tab"
                            data-bs-target="#navs-pills-os"
                            aria-controls="navs-pills-os"
                            aria-selected="false">
                            Operating System
                          </button>
                        </li>
                        <li class="nav-item">
                          <button
                            type="button"
                            class="nav-link"
                            role="tab"
                            data-bs-toggle="tab"
                            data-bs-target="#navs-pills-country"
                            aria-controls="navs-pills-country"
                            aria-selected="false">
                            Country
                          </button>
                        </li>
                      </ul>
                    </div>
                    <div class="tab-content pt-0">
                      <div class="tab-pane fade show active" id="navs-pills-browser" role="tabpanel">
                        <div class="table-responsive text-start">
                          <table class="table table-borderless text-nowrap">
                            <thead>
                              <tr>
                                <th>No</th>
                                <th>Browser</th>
                                <th>Visits</th>
                                <th class="w-50">Data In Percentage</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                                <td>1</td>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <img
                                      src="../../assets/img/icons/brands/chrome.png"
                                      alt="Chrome"
                                      height="24"
                                      class="me-2" />
                                    <span>Chrome</span>
                                  </div>
                                </td>
                                <td>8.92k</td>
                                <td>
                                  <div class="d-flex justify-content-between align-items-center gap-3">
                                    <div class="progress w-100" style="height: 10px">
                                      <div
                                        class="progress-bar bg-success"
                                        role="progressbar"
                                        style="width: 84.75%"
                                        aria-valuenow="84.75"
                                        aria-valuemin="0"
                                        aria-valuemax="100"></div>
                                    </div>
                                    <small class="fw-medium">84.75%</small>
                                  </div>
                                </td>
                              </tr>
                              <tr>
                                <td>2</td>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <img
                                      src="../../assets/img/icons/brands/safari.png"
                                      alt="Safari"
                                      height="24"
                                      class="me-2" />
                                    <span>Safari</span>
                                  </div>
                                </td>
                                <td>7.29k</td>
                                <td>
                                  <div class="d-flex justify-content-between align-items-center gap-3">
                                    <div class="progress w-100" style="height: 10px">
                                      <div
                                        class="progress-bar bg-primary"
                                        role="progressbar"
                                        style="width: 72.43%"
                                        aria-valuenow="72.43"
                                        aria-valuemin="0"
                                        aria-valuemax="100"></div>
                                    </div>
                                    <small class="fw-medium">72.43%</small>
                                  </div>
                                </td>
                              </tr>
                              <tr>
                                <td>3</td>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <img
                                      src="../../assets/img/icons/brands/firefox.png"
                                      alt="Firefox"
                                      height="24"
                                      class="me-2" />
                                    <span>Firefox</span>
                                  </div>
                                </td>
                                <td>6.11k</td>
                                <td>
                                  <div class="d-flex justify-content-between align-items-center gap-3">
                                    <div class="progress w-100" style="height: 10px">
                                      <div
                                        class="progress-bar bg-primary"
                                        role="progressbar"
                                        style="width: 67.37%"
                                        aria-valuenow="67.37"
                                        aria-valuemin="0"
                                        aria-valuemax="100"></div>
                                    </div>
                                    <small class="fw-medium">67.37%</small>
                                  </div>
                                </td>
                              </tr>
                              <tr>
                                <td>4</td>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <img
                                      src="../../assets/img/icons/brands/edge.png"
                                      alt="Edge"
                                      height="24"
                                      class="me-2" />
                                    <span>Edge</span>
                                  </div>
                                </td>
                                <td>5.08k</td>
                                <td>
                                  <div class="d-flex justify-content-between align-items-center gap-3">
                                    <div class="progress w-100" style="height: 10px">
                                      <div
                                        class="progress-bar bg-info"
                                        role="progressbar"
                                        style="width: 60.12%"
                                        aria-valuenow="60.12"
                                        aria-valuemin="0"
                                        aria-valuemax="100"></div>
                                    </div>
                                    <small class="fw-medium">60.12%</small>
                                  </div>
                                </td>
                              </tr>
                              <tr>
                                <td>5</td>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <img
                                      src="../../assets/img/icons/brands/opera.png"
                                      alt="Opera"
                                      height="24"
                                      class="me-2" />
                                    <span>Opera</span>
                                  </div>
                                </td>
                                <td>3.93k</td>
                                <td>
                                  <div class="d-flex justify-content-between align-items-center gap-3">
                                    <div class="progress w-100" style="height: 10px">
                                      <div
                                        class="progress-bar bg-info"
                                        role="progressbar"
                                        style="width: 51.94%"
                                        aria-valuenow="51.94"
                                        aria-valuemin="0"
                                        aria-valuemax="100"></div>
                                    </div>
                                    <small class="fw-medium">51.94%</small>
                                  </div>
                                </td>
                              </tr>
                            </tbody>
                          </table>
                        </div>
                      </div>
                      <div class="tab-pane fade" id="navs-pills-os" role="tabpanel">
                        <div class="table-responsive text-start">
                          <table class="table table-borderless">
                            <thead>
                              <tr>
                                <th>No</th>
                                <th>System</th>
                                <th>Visits</th>
                                <th class="w-50">Data In Percentage</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                                <td>1</td>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <img
                                      src="../../assets/img/icons/brands/windows.png"
                                      alt="Windows"
                                      height="24"
                                      class="me-2" />
                                    <span>Windows</span>
                                  </div>
                                </td>
                                <td>875.24k</td>
                                <td>
                                  <div class="d-flex justify-content-between align-items-center gap-3">
                                    <div class="progress w-100" style="height: 10px">
                                      <div
                                        class="progress-bar bg-success"
                                        role="progressbar"
                                        style="width: 71.5%"
                                        aria-valuenow="71.50"
                                        aria-valuemin="0"
                                        aria-valuemax="100"></div>
                                    </div>
                                    <small class="fw-medium">71.50%</small>
                                  </div>
                                </td>
                              </tr>
                              <tr>
                                <td>2</td>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <img
                                      src="../../assets/img/icons/brands/mac.png"
                                      alt="Mac"
                                      height="24"
                                      class="me-2" />
                                    <span>Mac</span>
                                  </div>
                                </td>
                                <td>89.68k</td>
                                <td>
                                  <div class="d-flex justify-content-between align-items-center gap-3">
                                    <div class="progress w-100" style="height: 10px">
                                      <div
                                        class="progress-bar bg-primary"
                                        role="progressbar"
                                        style="width: 66.67%"
                                        aria-valuenow="66.67"
                                        aria-valuemin="0"
                                        aria-valuemax="100"></div>
                                    </div>
                                    <small class="fw-medium">66.67%</small>
                                  </div>
                                </td>
                              </tr>
                              <tr>
                                <td>3</td>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <img
                                      src="../../assets/img/icons/brands/ubuntu.png"
                                      alt="Ubuntu"
                                      height="24"
                                      class="me-2" />
                                    <span>Ubuntu</span>
                                  </div>
                                </td>
                                <td>37.68k</td>
                                <td>
                                  <div class="d-flex justify-content-between align-items-center gap-3">
                                    <div class="progress w-100" style="height: 10px">
                                      <div
                                        class="progress-bar bg-info"
                                        role="progressbar"
                                        style="width: 62.82%"
                                        aria-valuenow="62.82"
                                        aria-valuemin="0"
                                        aria-valuemax="100"></div>
                                    </div>
                                    <small class="fw-medium">62.82%</small>
                                  </div>
                                </td>
                              </tr>
                              <tr>
                                <td>4</td>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <img
                                      src="../../assets/img/icons/brands/chrome.png"
                                      alt="Chrome"
                                      height="24"
                                      class="me-2" />
                                    <span>Chrome</span>
                                  </div>
                                </td>
                                <td>35.34k</td>
                                <td>
                                  <div class="d-flex justify-content-between align-items-center gap-3">
                                    <div class="progress w-100" style="height: 10px">
                                      <div
                                        class="progress-bar bg-info"
                                        role="progressbar"
                                        style="width: 56.25%"
                                        aria-valuenow="56.25"
                                        aria-valuemin="0"
                                        aria-valuemax="100"></div>
                                    </div>
                                    <small class="fw-medium">56.25%</small>
                                  </div>
                                </td>
                              </tr>
                              <tr>
                                <td>5</td>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <img
                                      src="../../assets/img/icons/brands/cent.png"
                                      alt="Cent"
                                      height="24"
                                      class="me-2" />
                                    <span>Cent</span>
                                  </div>
                                </td>
                                <td>32.25k</td>
                                <td>
                                  <div class="d-flex justify-content-between align-items-center gap-3">
                                    <div class="progress w-100" style="height: 10px">
                                      <div
                                        class="progress-bar bg-info"
                                        role="progressbar"
                                        style="width: 42.76%"
                                        aria-valuenow="42.76"
                                        aria-valuemin="0"
                                        aria-valuemax="100"></div>
                                    </div>
                                    <small class="fw-medium">42.76%</small>
                                  </div>
                                </td>
                              </tr>
                              <tr>
                                <td>6</td>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <img
                                      src="../../assets/img/icons/brands/linux.png"
                                      alt="Linux"
                                      height="24"
                                      class="me-2" />
                                    <span>Linux</span>
                                  </div>
                                </td>
                                <td>22.15k</td>
                                <td>
                                  <div class="d-flex justify-content-between align-items-center gap-3">
                                    <div class="progress w-100" style="height: 10px">
                                      <div
                                        class="progress-bar bg-warning"
                                        role="progressbar"
                                        style="width: 37.77%"
                                        aria-valuenow="37.77"
                                        aria-valuemin="0"
                                        aria-valuemax="100"></div>
                                    </div>
                                    <small class="fw-medium">37.77%</small>
                                  </div>
                                </td>
                              </tr>
                              <tr>
                                <td>7</td>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <img
                                      src="../../assets/img/icons/brands/fedora.png"
                                      alt="Fedora"
                                      height="24"
                                      class="me-2" />
                                    <span>Fedora</span>
                                  </div>
                                </td>
                                <td>1.13k</td>
                                <td>
                                  <div class="d-flex justify-content-between align-items-center gap-3">
                                    <div class="progress w-100" style="height: 10px">
                                      <div
                                        class="progress-bar bg-danger"
                                        role="progressbar"
                                        style="width: 29.16%"
                                        aria-valuenow="29.16"
                                        aria-valuemin="0"
                                        aria-valuemax="100"></div>
                                    </div>
                                    <small class="fw-medium">29.16%</small>
                                  </div>
                                </td>
                              </tr>
                              <tr>
                                <td>8</td>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <img
                                      src="../../assets/img/icons/brands/vivaldi-os.png"
                                      alt="Vivaldi"
                                      height="24"
                                      class="me-2" />
                                    <span>Vivaldi</span>
                                  </div>
                                </td>
                                <td>1.09k</td>
                                <td>
                                  <div class="d-flex justify-content-between align-items-center gap-3">
                                    <div class="progress w-100" style="height: 10px">
                                      <div
                                        class="progress-bar bg-danger"
                                        role="progressbar"
                                        style="width: 26.26%"
                                        aria-valuenow="26.26"
                                        aria-valuemin="0"
                                        aria-valuemax="100"></div>
                                    </div>
                                    <small class="fw-medium">26.26%</small>
                                  </div>
                                </td>
                              </tr>
                            </tbody>
                          </table>
                        </div>
                      </div>
                      <div class="tab-pane fade" id="navs-pills-country" role="tabpanel">
                        <div class="table-responsive text-start">
                          <table class="table table-borderless">
                            <thead>
                              <tr>
                                <th>No</th>
                                <th>Country</th>
                                <th>Visits</th>
                                <th class="w-50">Data In Percentage</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                                <td>1</td>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <img src="../../assets/svg/flags/us.svg" alt="USA" height="24" class="me-2" />
                                    <span>USA</span>
                                  </div>
                                </td>
                                <td>87.24k</td>
                                <td>
                                  <div class="d-flex justify-content-between align-items-center gap-3">
                                    <div class="progress w-100" style="height: 10px">
                                      <div
                                        class="progress-bar bg-success"
                                        role="progressbar"
                                        style="width: 89.12%"
                                        aria-valuenow="89.12"
                                        aria-valuemin="0"
                                        aria-valuemax="100"></div>
                                    </div>
                                    <small class="fw-medium">89.12%</small>
                                  </div>
                                </td>
                              </tr>
                              <tr>
                                <td>2</td>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <img src="../../assets/svg/flags/br.svg" alt="Brazil" height="24" class="me-2" />
                                    <span>Brazil</span>
                                  </div>
                                </td>
                                <td>62.68k</td>
                                <td>
                                  <div class="d-flex justify-content-between align-items-center gap-3">
                                    <div class="progress w-100" style="height: 10px">
                                      <div
                                        class="progress-bar bg-primary"
                                        role="progressbar"
                                        style="width: 78.23%"
                                        aria-valuenow="78.23"
                                        aria-valuemin="0"
                                        aria-valuemax="100"></div>
                                    </div>
                                    <small class="fw-medium">78.23%</small>
                                  </div>
                                </td>
                              </tr>
                              <tr>
                                <td>3</td>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <img src="../../assets/svg/flags/in.svg" alt="India" height="24" class="me-2" />
                                    <span>India</span>
                                  </div>
                                </td>
                                <td>52.58k</td>
                                <td>
                                  <div class="d-flex justify-content-between align-items-center gap-3">
                                    <div class="progress w-100" style="height: 10px">
                                      <div
                                        class="progress-bar bg-info"
                                        role="progressbar"
                                        style="width: 69.82%"
                                        aria-valuenow="69.82"
                                        aria-valuemin="0"
                                        aria-valuemax="100"></div>
                                    </div>
                                    <small class="fw-medium">69.82%</small>
                                  </div>
                                </td>
                              </tr>
                              <tr>
                                <td>4</td>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <img src="../../assets/svg/flags/au.svg" alt="Australia" height="24" class="me-2" />
                                    <span>Australia</span>
                                  </div>
                                </td>
                                <td>44.13k</td>
                                <td>
                                  <div class="d-flex justify-content-between align-items-center gap-3">
                                    <div class="progress w-100" style="height: 10px">
                                      <div
                                        class="progress-bar bg-warning"
                                        role="progressbar"
                                        style="width: 59.9%"
                                        aria-valuenow="59.90"
                                        aria-valuemin="0"
                                        aria-valuemax="100"></div>
                                    </div>
                                    <small class="fw-medium">59.90%</small>
                                  </div>
                                </td>
                              </tr>
                              <tr>
                                <td>5</td>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <img src="../../assets/svg/flags/de.svg" alt="Germany" height="24" class="me-2" />
                                    <span>Germany</span>
                                  </div>
                                </td>
                                <td>32.21k</td>
                                <td>
                                  <div class="d-flex justify-content-between align-items-center gap-3">
                                    <div class="progress w-100" style="height: 10px">
                                      <div
                                        class="progress-bar bg-warning"
                                        role="progressbar"
                                        style="width: 57.11%"
                                        aria-valuenow="57.11"
                                        aria-valuemin="0"
                                        aria-valuemax="100"></div>
                                    </div>
                                    <small class="fw-medium">57.11%</small>
                                  </div>
                                </td>
                              </tr>                                       
                            </tbody>
                          </table>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
          		
          		
                <div class="col-md-6 col-lg-8 mb-4 mb-md-0">
                  <div class="card">
                    <div class="table-responsive text-nowrap">
                      <table class="table text-nowrap">
                        <thead>
                          <tr>
                            <th>Product</th>
                            <th>Category</th>
                            <th>Payment</th>
                            <th>Order Status</th>
                            <th>Actions</th>
                          </tr>
                        </thead>
                        <tbody class="table-border-bottom-0">
                          <tr>
                            <td>
                              <div class="d-flex align-items-center">
                                <img
                                  src="${pageContext.request.contextPath}/resources/assets/img/products/oneplus-lg.png"
                                  alt="Oneplus"
                                  height="32"
                                  width="32"
                                  class="me-2" />
                                <div class="d-flex flex-column">
                                  <span class="fw-medium lh-1">OnePlus 7Pro</span>
                                  <small class="text-muted">OnePlus</small>
                                </div>
                              </div>
                            </td>
                            <td>
                              <span class="badge bg-label-primary rounded-pill badge-center p-3 me-2"
                                ><i class="bx bx-mobile-alt bx-xs"></i
                              ></span>
                              Smart Phone
                            </td>
                            <td>
                              <div class="text-muted lh-1"><span class="text-primary fw-medium">$120</span>/499</div>
                              <small class="text-muted">Partially Paid</small>
                            </td>
                            <td><span class="badge bg-label-primary">Confirmed</span></td>
                            <td>
                              <div class="dropdown">
                                <button
                                  type="button"
                                  class="btn p-0 dropdown-toggle hide-arrow"
                                  data-bs-toggle="dropdown">
                                  <i class="bx bx-dots-vertical-rounded"></i>
                                </button>
                                <div class="dropdown-menu">
                                  <a class="dropdown-item" href="javascript:void(0);"
                                    ><i class="bx bx-edit-alt me-1"></i> View Details</a
                                  >
                                  <a class="dropdown-item" href="javascript:void(0);"
                                    ><i class="bx bx-trash me-1"></i> Delete</a
                                  >
                                </div>
                              </div>
                            </td>
                          </tr>
                          <tr>
                            <td>
                              <div class="d-flex align-items-center">
                                <img
                                  src="${pageContext.request.contextPath}/resources/assets/img/products/magic-mouse.png"
                                  alt="Apple"
                                  height="32"
                                  width="32"
                                  class="me-2" />
                                <div class="d-flex flex-column">
                                  <span class="fw-medium lh-1">Magic Mouse</span>
                                  <small class="text-muted">Apple</small>
                                </div>
                              </div>
                            </td>
                            <td>
                              <span class="badge bg-label-warning rounded-pill badge-center p-3 me-2"
                                ><i class="bx bx-mouse bx-xs"></i
                              ></span>
                              Mouse
                            </td>
                            <td>
                              <div class="lh-1"><span class="text-primary fw-medium">$149</span></div>
                              <small class="text-muted">Fully Paid</small>
                            </td>
                            <td><span class="badge bg-label-success">Completed</span></td>
                            <td>
                              <div class="dropdown">
                                <button
                                  type="button"
                                  class="btn p-0 dropdown-toggle hide-arrow"
                                  data-bs-toggle="dropdown">
                                  <i class="bx bx-dots-vertical-rounded"></i>
                                </button>
                                <div class="dropdown-menu">
                                  <a class="dropdown-item" href="javascript:void(0);"
                                    ><i class="bx bx-edit-alt me-1"></i> View Details</a
                                  >
                                  <a class="dropdown-item" href="javascript:void(0);"
                                    ><i class="bx bx-trash me-1"></i> Delete</a
                                  >
                                </div>
                              </div>
                            </td>
                          </tr>
                          
                          <tr>
                            <td>
                              <div class="d-flex align-items-center">
                                <img
                                  src="${pageContext.request.contextPath}/resources/assets/img/products/iphone.png"
                                  alt="Apple"
                                  height="32"
                                  width="32"
                                  class="me-2" />
                                <div class="d-flex flex-column">
                                  <span class="fw-medium lh-1">iPhone 11 Pro</span>
                                  <small class="text-muted">Apple</small>
                                </div>
                              </div>
                            </td>
                            <td>
                              <span class="badge bg-label-primary rounded-pill badge-center p-3 me-2"
                                ><i class="bx bx-mobile-alt bx-xs"></i
                              ></span>
                              Smart Phone
                            </td>
                            <td>
                              <div class="lh-1"><span class="text-primary fw-medium">$399</span></div>
                              <small class="text-muted">Fully Paid</small>
                            </td>
                            <td><span class="badge bg-label-success">Completed</span></td>
                            <td>
                              <div class="dropdown">
                                <button
                                  type="button"
                                  class="btn p-0 dropdown-toggle hide-arrow"
                                  data-bs-toggle="dropdown">
                                  <i class="bx bx-dots-vertical-rounded"></i>
                                </button>
                                <div class="dropdown-menu">
                                  <a class="dropdown-item" href="javascript:void(0);"
                                    ><i class="bx bx-edit-alt me-1"></i> View Details</a
                                  >
                                  <a class="dropdown-item" href="javascript:void(0);"
                                    ><i class="bx bx-trash me-1"></i> Delete</a
                                  >
                                </div>
                              </div>
                            </td>
                          </tr>
                          <tr>
                            <td>
                              <div class="d-flex align-items-center">
                                <img
                                  src="${pageContext.request.contextPath}/resources/assets/img/products/mi-tv.png"
                                  alt="Xiaomi"
                                  height="32"
                                  width="32"
                                  class="me-2" />
                                <div class="d-flex flex-column">
                                  <span class="fw-medium lh-1">Mi LED TV 4X</span>
                                  <small class="text-muted">Xiaomi</small>
                                </div>
                              </div>
                            </td>
                            <td>
                              <span class="badge bg-label-danger rounded-pill badge-center p-3 me-2"
                                ><i class="bx bx-tv bx-xs"></i
                              ></span>
                              Smart TV
                            </td>
                            <td>
                              <div class="text-muted lh-1"><span class="text-primary fw-medium">$349</span>/2499</div>
                              <small class="text-muted">Partially Paid</small>
                            </td>
                            <td><span class="badge bg-label-primary">Confirmed</span></td>
                            <td>
                              <div class="dropdown">
                                <button
                                  type="button"
                                  class="btn p-0 dropdown-toggle hide-arrow"
                                  data-bs-toggle="dropdown">
                                  <i class="bx bx-dots-vertical-rounded"></i>
                                </button>
                                <div class="dropdown-menu">
                                  <a class="dropdown-item" href="javascript:void(0);"
                                    ><i class="bx bx-edit-alt me-1"></i> View Details</a
                                  >
                                  <a class="dropdown-item" href="javascript:void(0);"
                                    ><i class="bx bx-trash me-1"></i> Delete</a
                                  >
                                </div>
                              </div>
                            </td>
                          </tr>
                          <tr>
                            <td>
                              <div class="d-flex align-items-center">
                                <img
                                  src="${pageContext.request.contextPath}/resources/assets/img/products/logitech-mx.png"
                                  alt="Logitech"
                                  height="32"
                                  width="32"
                                  class="me-2" />
                                <div class="d-flex flex-column">
                                  <span class="fw-medium lh-1">Logitech MX</span>
                                  <small class="text-muted">Logitech</small>
                                </div>
                              </div>
                            </td>
                            <td>
                              <span class="badge bg-label-warning rounded-pill badge-center p-3 me-2"
                                ><i class="bx bx-mouse bx-xs"></i
                              ></span>
                              Mouse
                            </td>
                            <td>
                              <div class="lh-1"><span class="text-primary fw-medium">$89</span></div>
                              <small class="text-muted">Fully Paid</small>
                            </td>
                            <td><span class="badge bg-label-primary">Completed</span></td>
                            <td>
                              <div class="dropdown">
                                <button
                                  type="button"
                                  class="btn p-0 dropdown-toggle hide-arrow"
                                  data-bs-toggle="dropdown">
                                  <i class="bx bx-dots-vertical-rounded"></i>
                                </button>
                                <div class="dropdown-menu">
                                  <a class="dropdown-item" href="javascript:void(0);"
                                    ><i class="bx bx-edit-alt me-1"></i> View Details</a
                                  >
                                  <a class="dropdown-item" href="javascript:void(0);"
                                    ><i class="bx bx-trash me-1"></i> Delete</a
                                  >
                                </div>
                              </div>
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
                <div class="col-md-4">
                	<div class="card">
                      <div class="card-body">
                        <div class="text-center">
                          <div class="dropdown">
                            <button
                              class="btn btn-sm btn-label-primary dropdown-toggle"
                              type="button"
                              id="growthReportId"
                              data-bs-toggle="dropdown"
                              aria-haspopup="true"
                              aria-expanded="false">
                              	프로젝트 1
                            </button>
                            <div class="dropdown-menu dropdown-menu-end" aria-labelledby="growthReportId">
                              <a class="dropdown-item" href="javascript:void(0);">프로젝트 2</a>
                              <a class="dropdown-item" href="javascript:void(0);">프로젝트 3</a>
                              <a class="dropdown-item" href="javascript:void(0);">프로젝트 4</a>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div id="growthChart"></div>
                      <div class="text-center fw-medium pt-3 mb-2">화이팅!</div>

                      <div class="d-flex px-xxl-4 px-lg-2 p-4 gap-xxl-3 gap-lg-1 gap-3 justify-content-between">
                        <div class="d-flex">
                          <div class="me-2">
                            <span class="badge bg-label-primary p-2"><i class="bx bx-dollar text-primary"></i></span>
                          </div>
                          <div class="d-flex flex-column">
                            <small>프로젝트 시작</small>
                            <h6 class="mb-0">23.4~</h6>
                          </div>
                        </div>
                        <div class="d-flex">
                          <div class="me-2">
                            <span class="badge bg-label-info p-2"><i class="bx bx-wallet text-info"></i></span>
                          </div>
                          <div class="d-flex flex-column">
                            <small>프로젝트 종료</small>
                            <h6 class="mb-0">~23.12</h6>
                          </div>
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
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/apex-charts/apexcharts.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/@form-validation/umd/bundle/popular.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/@form-validation/umd/plugin-bootstrap5/index.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/@form-validation/umd/plugin-auto-focus/index.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/select2/select2.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/flatpickr/flatpickr.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/moment/moment.js"></script>

    <!-- Main JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

    <!-- Page JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/app-ecommerce-dashboard.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/mainGraph.js"></script>
    
    
    <script>
        // 사이드바를 숨기기
        //document.getElementById('app-calendar-sidebar').style.display = 'none';

        // 또는 사이드바를 다시 나타내려면 다음과 같이 사용
        // document.getElementById('app-calendar-sidebar').style.display = 'block';
    </script>
    
  </body>
</html>
