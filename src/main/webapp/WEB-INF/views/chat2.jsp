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
   
  </head>

  <body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">

          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <div class="app-chat overflow-hidden card">
                <div class="row g-0">
                  <!-- Sidebar Left -->
                  <div class="col app-chat-sidebar-left app-sidebar overflow-hidden" id="app-chat-sidebar-left">
                    <div
                      class="chat-sidebar-left-user sidebar-header d-flex flex-column justify-content-center align-items-center flex-wrap p-4 mt-2">
                      <div class="avatar avatar-xl avatar-online">
                        <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/1.png" alt="Avatar" class="rounded-circle" />
                      </div>
                      <h5 class="mt-3 mb-1">John Doe</h5>
                      <small class="text-muted">UI/UX Designer</small>
                      <i
                        class="bx bx-x bx-sm cursor-pointer close-sidebar me-1 fs-4"
                        data-bs-toggle="sidebar"
                        data-overlay
                        data-target="#app-chat-sidebar-left"></i>
                    </div>
                    <div class="sidebar-body px-4 pb-4">
                      <div class="my-3">
                        <span class="text-muted text-uppercase">About</span>
                        <textarea
                          id="chat-sidebar-left-user-about"
                          class="form-control chat-sidebar-left-user-about mt-2"
                          rows="4"
                          maxlength="120">
Dessert chocolate cake lemon drops jujubes. Biscuit cupcake ice cream bear claw brownie brownie marshmallow.</textarea
                        >
                      </div>
                      <div class="my-4">
                        <span class="text-muted text-uppercase">Status</span>
                        <div class="d-grid gap-1 mt-2">
                          <div class="form-check form-check-success">
                            <input
                              name="chat-user-status"
                              class="form-check-input"
                              type="radio"
                              value="active"
                              id="user-active"
                              checked />
                            <label class="form-check-label" for="user-active">Active</label>
                          </div>
                          <div class="form-check form-check-danger">
                            <input
                              name="chat-user-status"
                              class="form-check-input"
                              type="radio"
                              value="busy"
                              id="user-busy" />
                            <label class="form-check-label" for="user-busy">Busy</label>
                          </div>
                          <div class="form-check form-check-warning">
                            <input
                              name="chat-user-status"
                              class="form-check-input"
                              type="radio"
                              value="away"
                              id="user-away" />
                            <label class="form-check-label" for="user-away">Away</label>
                          </div>
                          <div class="form-check form-check-secondary">
                            <input
                              name="chat-user-status"
                              class="form-check-input"
                              type="radio"
                              value="offline"
                              id="user-offline" />
                            <label class="form-check-label" for="user-offline">Offline</label>
                          </div>
                        </div>
                      </div>
                      <div class="my-4">
                        <span class="text-muted text-uppercase">Settings</span>
                        <ul class="list-unstyled d-grid gap-2 mt-2">
                          <li class="d-flex justify-content-between align-items-center">
                            <div>
                              <i class="bx bx-check-circle me-1"></i>
                              <span class="align-middle">Two-step Verification</span>
                            </div>
                            <div class="form-check form-switch mb-0">
                              <input class="form-check-input" type="checkbox" id="twoStepVerification" />
                            </div>
                          </li>
                          <li class="d-flex justify-content-between align-items-center">
                            <div>
                              <i class="bx bx-bell me-1"></i>
                              <span class="align-middle">Notification</span>
                            </div>
                            <div class="form-check form-switch mb-0">
                              <input class="form-check-input" type="checkbox" id="switchNotification" checked />
                            </div>
                          </li>
                        </ul>
                      </div>
                      <div class="d-flex mt-4">
                        <button
                          class="btn btn-primary"
                          data-bs-toggle="sidebar"
                          data-overlay
                          data-target="#app-chat-sidebar-left">
                          Logout
                        </button>
                      </div>
                    </div>
                  </div>
                  <!-- /Sidebar Left-->

                  <!-- Chat & Contacts -->
                  <div
                    class="col app-chat-contacts app-sidebar flex-grow-0 overflow-hidden border-end"
                    id="app-chat-contacts">
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
                            placeholder="Search..."
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
                          <h5 class="text-primary mb-0">Chats</h5>
                        </li>
                        <li class="chat-contact-list-item chat-list-item-0 d-none">
                          <h6 class="text-muted mb-0">No Chats Found</h6>
                        </li>
                        <li class="chat-contact-list-item">
                          <a class="d-flex align-items-center">
                            <div class="flex-shrink-0 avatar avatar-online">
                              <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/13.png" alt="Avatar" class="rounded-circle" />
                            </div>
                            <div class="chat-contact-info flex-grow-1 ms-3">
                              <h6 class="chat-contact-name text-truncate m-0">Waldemar Mannering</h6>
                              <p class="chat-contact-status text-truncate mb-0 text-muted">
                                Refer friends. Get rewards.
                              </p>
                            </div>
                            <small class="text-muted mb-auto">5 Minutes</small>
                          </a>
                        </li>
                        <li class="chat-contact-list-item active">
                          <a class="d-flex align-items-center">
                            <div class="flex-shrink-0 avatar avatar-offline">
                              <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/2.png" alt="Avatar" class="rounded-circle" />
                            </div>
                            <div class="chat-contact-info flex-grow-1 ms-3">
                              <h6 class="chat-contact-name text-truncate m-0">Felecia Rower</h6>
                              <p class="chat-contact-status text-truncate mb-0 text-muted">
                                I will purchase it for sure. 👍
                              </p>
                            </div>
                            <small class="text-muted mb-auto">30 Minutes</small>
                          </a>
                        </li>
                        <li class="chat-contact-list-item">
                          <a class="d-flex align-items-center">
                            <div class="flex-shrink-0 avatar avatar-busy">
                              <span class="avatar-initial rounded-circle bg-label-success">CM</span>
                            </div>
                            <div class="chat-contact-info flex-grow-1 ms-3">
                              <h6 class="chat-contact-name text-truncate m-0">Calvin Moore</h6>
                              <p class="chat-contact-status text-truncate mb-0 text-muted">
                                If it takes long you can mail inbox user
                              </p>
                            </div>
                            <small class="text-muted mb-auto">1 Day</small>
                          </a>
                        </li>
                      </ul>
                      <!-- Contacts -->
                      <ul class="list-unstyled chat-contact-list mb-0" id="contact-list">
                        <li class="chat-contact-list-item chat-contact-list-item-title">
                          <h5 class="text-primary mb-0">Contacts</h5>
                        </li>
                        <li class="chat-contact-list-item contact-list-item-0 d-none">
                          <h6 class="text-muted mb-0">No Contacts Found</h6>
                        </li>
                        <li class="chat-contact-list-item">
                          <a class="d-flex align-items-center">
                            <div class="flex-shrink-0 avatar avatar-offline">
                              <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/4.png" alt="Avatar" class="rounded-circle" />
                            </div>
                            <div class="chat-contact-info flex-grow-1 ms-3">
                              <h6 class="chat-contact-name text-truncate m-0">Natalie Maxwell</h6>
                              <p class="chat-contact-status text-truncate mb-0 text-muted">UI/UX Designer</p>
                            </div>
                          </a>
                        </li>
                        <li class="chat-contact-list-item">
                          <a class="d-flex align-items-center">
                            <div class="flex-shrink-0 avatar avatar-busy">
                              <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/5.png" alt="Avatar" class="rounded-circle" />
                            </div>
                            <div class="chat-contact-info flex-grow-1 ms-3">
                              <h6 class="chat-contact-name text-truncate m-0">Jess Cook</h6>
                              <p class="chat-contact-status text-truncate mb-0 text-muted">Business Analyst</p>
                            </div>
                          </a>
                        </li>
                        <li class="chat-contact-list-item">
                          <a class="d-flex align-items-center">
                            <div class="avatar d-block flex-shrink-0">
                              <span class="avatar-initial rounded-circle bg-label-primary">LM</span>
                            </div>
                            <div class="chat-contact-info flex-grow-1 ms-3">
                              <h6 class="chat-contact-name text-truncate m-0">Louie Mason</h6>
                              <p class="chat-contact-status text-truncate mb-0 text-muted">Resource Manager</p>
                            </div>
                          </a>
                        </li>
                        <li class="chat-contact-list-item">
                          <a class="d-flex align-items-center">
                            <div class="flex-shrink-0 avatar avatar-busy">
                              <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/7.png" alt="Avatar" class="rounded-circle" />
                            </div>
                            <div class="chat-contact-info flex-grow-1 ms-3">
                              <h6 class="chat-contact-name text-truncate m-0">Krystal Norton</h6>
                              <p class="chat-contact-status text-truncate mb-0 text-muted">Business Executive</p>
                            </div>
                          </a>
                        </li>
                        <li class="chat-contact-list-item">
                          <a class="d-flex align-items-center">
                            <div class="flex-shrink-0 avatar avatar-offline">
                              <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/8.png" alt="Avatar" class="rounded-circle" />
                            </div>
                            <div class="chat-contact-info flex-grow-1 ms-3">
                              <h6 class="chat-contact-name text-truncate m-0">Stacy Garrison</h6>
                              <p class="chat-contact-status text-truncate mb-0 text-muted">Marketing Ninja</p>
                            </div>
                          </a>
                        </li>
                        <li class="chat-contact-list-item">
                          <a class="d-flex align-items-center">
                            <div class="avatar d-block flex-shrink-0">
                              <span class="avatar-initial rounded-circle bg-label-success">CM</span>
                            </div>
                            <div class="chat-contact-info flex-grow-1 ms-3">
                              <h6 class="chat-contact-name text-truncate m-0">Calvin Moore</h6>
                              <p class="chat-contact-status text-truncate mb-0 text-muted">UX Engineer</p>
                            </div>
                          </a>
                        </li>
                        <li class="chat-contact-list-item">
                          <a class="d-flex align-items-center">
                            <div class="flex-shrink-0 avatar avatar-busy">
                              <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/10.png" alt="Avatar" class="rounded-circle" />
                            </div>
                            <div class="chat-contact-info flex-grow-1 ms-3">
                              <h6 class="chat-contact-name text-truncate m-0">Mary Giles</h6>
                              <p class="chat-contact-status text-truncate mb-0 text-muted">Account Department</p>
                            </div>
                          </a>
                        </li>
                        <li class="chat-contact-list-item">
                          <a class="d-flex align-items-center">
                            <div class="flex-shrink-0 avatar avatar-offline">
                              <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/13.png" alt="Avatar" class="rounded-circle" />
                            </div>
                            <div class="chat-contact-info flex-grow-1 ms-3">
                              <h6 class="chat-contact-name text-truncate m-0">Waldemar Mannering</h6>
                              <p class="chat-contact-status text-truncate mb-0 text-muted">AWS Support</p>
                            </div>
                          </a>
                        </li>
                        <li class="chat-contact-list-item">
                          <a class="d-flex align-items-center">
                            <div class="avatar d-block flex-shrink-0">
                              <span class="avatar-initial rounded-circle bg-label-danger">AJ</span>
                            </div>
                            <div class="chat-contact-info flex-grow-1 ms-3">
                              <h6 class="chat-contact-name text-truncate m-0">Amy Johnson</h6>
                              <p class="chat-contact-status text-truncate mb-0 text-muted">Frontend Developer</p>
                            </div>
                          </a>
                        </li>
                        <li class="chat-contact-list-item">
                          <a class="d-flex align-items-center">
                            <div class="flex-shrink-0 avatar avatar-offline">
                              <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/2.png" alt="Avatar" class="rounded-circle" />
                            </div>
                            <div class="chat-contact-info flex-grow-1 ms-3">
                              <h6 class="chat-contact-name text-truncate m-0">Felecia Rower</h6>
                              <p class="chat-contact-status text-truncate mb-0 text-muted">Cloud Engineer</p>
                            </div>
                          </a>
                        </li>
                        <li class="chat-contact-list-item">
                          <a class="d-flex align-items-center">
                            <div class="flex-shrink-0 avatar avatar-busy">
                              <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/11.png" alt="Avatar" class="rounded-circle" />
                            </div>
                            <div class="chat-contact-info flex-grow-1 ms-3">
                              <h6 class="chat-contact-name text-truncate m-0">William Stephens</h6>
                              <p class="chat-contact-status text-truncate mb-0 text-muted">Backend Developer</p>
                            </div>
                          </a>
                        </li>
                      </ul>
                    </div>
                  </div>
                  <!-- /Chat contacts -->

                  <!-- Chat History -->
                  <div class="col app-chat-history">
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
                              <h6 class="m-0">Felecia Rower</h6>
                              <small class="user-status text-muted">NextJS developer</small>
                            </div>
                          </div>
                          <div class="d-flex align-items-center">
                            <i class="bx bx-phone-call cursor-pointer d-sm-block d-none me-3 fs-4"></i>
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
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="chat-history-body">
                        <ul class="list-unstyled chat-history mb-0">
                          <li class="chat-message chat-message-right">
                            <div class="d-flex overflow-hidden">
                              <div class="chat-message-wrapper flex-grow-1">
                                <div class="chat-message-text">
                                  <p class="mb-0">How can we help? We're here for you! 😄</p>
                                </div>
                                <div class="text-end text-muted mt-1">
                                  <i class="bx bx-check-double text-success"></i>
                                  <small>10:00 AM</small>
                                </div>
                              </div>
                              <div class="user-avatar flex-shrink-0 ms-3">
                                <div class="avatar avatar-sm">
                                  <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/1.png" alt="Avatar" class="rounded-circle" />
                                </div>
                              </div>
                            </div>
                          </li>
                          <li class="chat-message">
                            <div class="d-flex overflow-hidden">
                              <div class="user-avatar flex-shrink-0 me-3">
                                <div class="avatar avatar-sm">
                                  <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/2.png" alt="Avatar" class="rounded-circle" />
                                </div>
                              </div>
                              <div class="chat-message-wrapper flex-grow-1">
                                <div class="chat-message-text">
                                  <p class="mb-0">Hey John, I am looking for the best admin template.</p>
                                  <p class="mb-0">Could you please help me to find it out? 🤔</p>
                                </div>
                                <div class="chat-message-text mt-2">
                                  <p class="mb-0">It should be Bootstrap 5 compatible.</p>
                                </div>
                                <div class="text-muted mt-1">
                                  <small>10:02 AM</small>
                                </div>
                              </div>
                            </div>
                          </li>
                          <li class="chat-message chat-message-right">
                            <div class="d-flex overflow-hidden">
                              <div class="chat-message-wrapper flex-grow-1">
                                <div class="chat-message-text">
                                  <p class="mb-0">Sneat has all the components you'll ever need in a app.</p>
                                </div>
                                <div class="text-end text-muted mt-1">
                                  <i class="bx bx-check-double text-success"></i>
                                  <small>10:03 AM</small>
                                </div>
                              </div>
                              <div class="user-avatar flex-shrink-0 ms-3">
                                <div class="avatar avatar-sm">
                                  <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/1.png" alt="Avatar" class="rounded-circle" />
                                </div>
                              </div>
                            </div>
                          </li>
                          <li class="chat-message">
                            <div class="d-flex overflow-hidden">
                              <div class="user-avatar flex-shrink-0 me-3">
                                <div class="avatar avatar-sm">
                                  <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/2.png" alt="Avatar" class="rounded-circle" />
                                </div>
                              </div>
                              <div class="chat-message-wrapper flex-grow-1">
                                <div class="chat-message-text">
                                  <p class="mb-0">Looks clean and fresh UI. 😃</p>
                                </div>
                                <div class="chat-message-text mt-2">
                                  <p class="mb-0">It's perfect for my next project.</p>
                                </div>
                                <div class="chat-message-text mt-2">
                                  <p class="mb-0">How can I purchase it?</p>
                                </div>
                                <div class="text-muted mt-1">
                                  <small>10:05 AM</small>
                                </div>
                              </div>
                            </div>
                          </li>
                          <li class="chat-message chat-message-right">
                            <div class="d-flex overflow-hidden">
                              <div class="chat-message-wrapper flex-grow-1">
                                <div class="chat-message-text">
                                  <p class="mb-0">Thanks, you can purchase it.</p>
                                </div>
                                <div class="text-end text-muted mt-1">
                                  <i class="bx bx-check-double text-success"></i>
                                  <small>10:06 AM</small>
                                </div>
                              </div>
                              <div class="user-avatar flex-shrink-0 ms-3">
                                <div class="avatar avatar-sm">
                                  <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/1.png" alt="Avatar" class="rounded-circle" />
                                </div>
                              </div>
                            </div>
                          </li>
                          <li class="chat-message">
                            <div class="d-flex overflow-hidden">
                              <div class="user-avatar flex-shrink-0 me-3">
                                <div class="avatar avatar-sm">
                                  <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/2.png" alt="Avatar" class="rounded-circle" />
                                </div>
                              </div>
                              <div class="chat-message-wrapper flex-grow-1">
                                <div class="chat-message-text">
                                  <p class="mb-0">I will purchase it for sure. 👍</p>
                                </div>
                                <div class="chat-message-text mt-2">
                                  <p class="mb-0">Thanks.</p>
                                </div>
                                <div class="text-muted mt-1">
                                  <small>10:08 AM</small>
                                </div>
                              </div>
                            </div>
                          </li>
                          <li class="chat-message chat-message-right">
                            <div class="d-flex overflow-hidden">
                              <div class="chat-message-wrapper flex-grow-1">
                                <div class="chat-message-text">
                                  <p class="mb-0">Great, Feel free to get in touch.</p>
                                </div>
                                <div class="text-end text-muted mt-1">
                                  <i class="bx bx-check-double text-success"></i>
                                  <small>10:10 AM</small>
                                </div>
                              </div>
                              <div class="user-avatar flex-shrink-0 ms-3">
                                <div class="avatar avatar-sm">
                                  <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/1.png" alt="Avatar" class="rounded-circle" />
                                </div>
                              </div>
                            </div>
                          </li>
                          <li class="chat-message">
                            <div class="d-flex overflow-hidden">
                              <div class="user-avatar flex-shrink-0 me-3">
                                <div class="avatar avatar-sm">
                                  <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/2.png" alt="Avatar" class="rounded-circle" />
                                </div>
                              </div>
                              <div class="chat-message-wrapper flex-grow-1">
                                <div class="chat-message-text">
                                  <p class="mb-0">Do you have design files for Sneat?</p>
                                </div>
                                <div class="text-muted mt-1">
                                  <small>10:15 AM</small>
                                </div>
                              </div>
                            </div>
                          </li>
                          <li class="chat-message chat-message-right">
                            <div class="d-flex overflow-hidden">
                              <div class="chat-message-wrapper flex-grow-1 w-50">
                                <div class="chat-message-text">
                                  <p class="mb-0">
                                    Yes that's correct documentation file, Design files are included with the template.
                                  </p>
                                </div>
                                <div class="text-end text-muted mt-1">
                                  <i class="bx bx-check-double"></i>
                                  <small>10:15 AM</small>
                                </div>
                              </div>
                              <div class="user-avatar flex-shrink-0 ms-3">
                                <div class="avatar avatar-sm">
                                  <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/1.png" alt="Avatar" class="rounded-circle" />
                                </div>
                              </div>
                            </div>
                          </li>
                        </ul>
                      </div>
                      <!-- Chat message form -->
                      <div class="chat-history-footer">
                        <form class="form-send-message d-flex justify-content-between align-items-center">
                          <input
                            class="form-control message-input border-0 me-3 shadow-none"
                            placeholder="Type your message here..." />
                          <div class="message-actions d-flex align-items-center">
                            <i class="speech-to-text bx bx-microphone bx-sm cursor-pointer"></i>
                            <label for="attach-doc" class="form-label mb-0">
                              <i class="bx bx-paperclip bx-sm cursor-pointer mx-3"></i>
                              <input type="file" id="attach-doc" hidden />
                            </label>
                            <button class="btn btn-primary d-flex send-msg-btn">
                              <i class="bx bx-paper-plane me-md-1 me-0"></i>
                              <span class="align-middle d-md-inline-block d-none">Send</span>
                            </button>
                          </div>
                        </form>
                      </div>
                    </div>
                  </div>
                  <!-- /Chat History -->

                  <!-- Sidebar Right -->
                  <div class="col app-chat-sidebar-right app-sidebar overflow-hidden" id="app-chat-sidebar-right">
                    <div
                      class="sidebar-header d-flex flex-column justify-content-center align-items-center flex-wrap p-4 mt-2">
                      <div class="avatar avatar-xl avatar-online">
                        <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/2.png" alt="Avatar" class="rounded-circle" />
                      </div>
                      <h6 class="mt-3 mb-1">Felecia Rower</h6>
                      <small class="text-muted">NextJS Developer</small>
                      <i
                        class="bx bx-x bx-sm cursor-pointer close-sidebar me-1 fs-4 d-block"
                        data-bs-toggle="sidebar"
                        data-overlay
                        data-target="#app-chat-sidebar-right"></i>
                    </div>
                    <div class="sidebar-body px-4 pb-4">
                      <div class="my-3">
                        <span class="text-muted text-uppercase">About</span>
                        <p class="mb-0 mt-2">
                          A Next. js developer is a software developer who uses the Next. js framework alongside ReactJS
                          to build web applications.
                        </p>
                      </div>
                      <div class="my-4">
                        <span class="text-muted text-uppercase">Personal Information</span>
                        <ul class="list-unstyled d-grid gap-2 mt-2">
                          <li class="d-flex align-items-center">
                            <i class="bx bx-envelope"></i>
                            <span class="align-middle ms-2">josephGreen@email.com</span>
                          </li>
                          <li class="d-flex align-items-center">
                            <i class="bx bx-phone-call"></i>
                            <span class="align-middle ms-2">+1(123) 456 - 7890</span>
                          </li>
                          <li class="d-flex align-items-center">
                            <i class="bx bx-time-five"></i>
                            <span class="align-middle ms-2">Mon - Fri 10AM - 8PM</span>
                          </li>
                        </ul>
                      </div>
                      <div class="mt-4">
                        <span class="text-muted text-uppercase">Options</span>
                        <ul class="list-unstyled d-grid gap-2 mt-2">
                          <li class="cursor-pointer d-flex align-items-center">
                            <i class="bx bx-bookmark"></i>
                            <span class="align-middle ms-2">Add Tag</span>
                          </li>
                          <li class="cursor-pointer d-flex align-items-center">
                            <i class="bx bx-star"></i>
                            <span class="align-middle ms-2">Important Contact</span>
                          </li>
                          <li class="cursor-pointer d-flex align-items-center">
                            <i class="bx bx-image-alt"></i>
                            <span class="align-middle ms-2">Shared Media</span>
                          </li>
                          <li class="cursor-pointer d-flex align-items-center">
                            <i class="bx bx-trash-alt"></i>
                            <span class="align-middle ms-2">Delete Contact</span>
                          </li>
                          <li class="cursor-pointer d-flex align-items-center">
                            <i class="bx bx-block"></i>
                            <span class="align-middle ms-2">Block Contact</span>
                          </li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <!-- /Sidebar Right -->

                  <div class="app-overlay"></div>
                </div>
              </div>
            </div>
            <!-- / Content -->

            <!-- Footer -->
            <footer class="content-footer footer bg-footer-theme">
              <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                <div class="mb-2 mb-md-0">
                  ©
                  <script>
                    document.write(new Date().getFullYear());
                  </script>
                  , made with ❤️ by
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
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/bootstrap-maxlength/bootstrap-maxlength.js"></script>

    <!-- Page JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/app-chat.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/header.js"></script>
  </body>
</html>
