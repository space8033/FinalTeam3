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
  
  <script>
window.addEventListener('message', function (event) {
    if (event.data.type === 'websocket_message') {
        const message = event.data.data;
        // 여기서 메시지를 처리
        handleWebSocketMessage(message);
    }
});

function handleWebSocketMessage(message) {
	  $.get("/exodia/chatList?emp_no=1", function(result){
			updateChatList(result);
	  });
}

function updateChatList(result){	    
	   var chatList = $("#app-chat-contacts");
	   console.log("제이에스피타고드러온놈");
	   if(chatList) {
	   	
      	   var html = jQuery('<div>').html(result);
           var contents = html.find("div#chatList").html();
        	$("#app-chat-contacts").html(contents);
        	
           new PerfectScrollbar(chatList, {
   		        wheelPropagation: false,
   		        suppressScrollX: true
   		      });
		    
           const searchInput = document.querySelector('.chat-search-input');
           searchInput.addEventListener('keyup', function(e) {
        	    let searchValue = e.currentTarget.value.toLowerCase(),
        	        searchChatListItemsCount = 0,
        	        searchContactListItemsCount = 0,
        	        chatListItem0 = document.querySelector('.chat-list-item-0'),
        	        contactListItem0 = document.querySelector('.contact-list-item-0'),
        	        searchChatListItems = [].slice.call(
        	            document.querySelectorAll('#chat-list li:not(.chat-contact-list-item-title)')
        	        ),
        	        searchContactListItems = [].slice.call(
        	            document.querySelectorAll('#contact-list li:not(.chat-contact-list-item-title)')
        	        );

        	    // Search in chats
        	    searchChatContacts(searchChatListItems, searchChatListItemsCount, searchValue, chatListItem0);
        	    // Search in contacts
        	    searchChatContacts(searchContactListItems, searchContactListItemsCount, searchValue, contactListItem0);
        	});
   		     
   		     function handleKeyPress(event) {
   		    	    if (event.key === "Enter") {
   		    	    	buttonSend();
   		    	    }
   		    	}
   		     
   		     function searchChatContacts(searchListItems, searchListItemsCount, searchValue, listItem0) {
   		    	searchListItems.forEach(function(searchListItem) {
   		    	    let searchListItemText = searchListItem.textContent.toLowerCase();
   		    	    if (searchValue) {
   		    	        if (-1 < searchListItemText.indexOf(searchValue)) {
   		    	            searchListItem.classList.add('d-flex');
   		    	            searchListItem.classList.remove('d-none');
   		    	            searchListItemsCount++;
   		    	        } else {
   		    	            searchListItem.classList.add('d-none');
   		    	        }
   		    	    } else {
   		    	        searchListItem.classList.add('d-flex');
   		    	        searchListItem.classList.remove('d-none');
   		    	        searchListItemsCount++;
   		    	    }
   		    	});

   		    	// Display no search found if searchListItemsCount == 0
   		    	if (searchListItemsCount == 0) {
   		    	    listItem0.classList.remove('d-none');
   		    	} else {
   		    	    listItem0.classList.add('d-none');
   		    	}
   		     }
		
	   }
	
	
}
</script>
  
  
    <!-- Layout wrapper -->
        <!-- Menu -->

        <!-- / Menu -->

        <!-- Layout container -->
          <!-- Navbar -->

          <!-- / Navbar -->

          <!-- Content wrapper -->
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
                      <h5 id="name" class="mt-3 mb-1">${empInfo_name}</h5>
                      <small class="text-muted">개발자</small>
                      <i
                        class="bx bx-x bx-sm cursor-pointer close-sidebar me-1 fs-4"
                        data-bs-toggle="sidebar"
                        data-overlay
                        data-target="#app-chat-sidebar-left"></i>
                    </div>
                    
                    <%-- <input type="hidden" id="alarmId" value="${emp_id}"> --%>
                    <div class="sidebar-body px-4 pb-4">
                      <div class="my-3">
                        <span class="text-muted text-uppercase">소개</span>
                        <textarea
                          id="chat-sidebar-left-user-about"
                          class="form-control chat-sidebar-left-user-about mt-2"
                          rows="4"
                          maxlength="120">맛있는게 먹고 싶다.</textarea
                        >
                      </div>
                      <div class="my-4">
                        <span class="text-muted text-uppercase">상태</span>
                        <div class="d-grid gap-1 mt-2">
                          <div class="form-check form-check-success">
                            <input
                              name="chat-user-status"
                              class="form-check-input"
                              type="radio"
                              value="active"
                              id="user-active"
                              checked />
                            <label class="form-check-label" for="user-active">활동중</label>
                          </div>
                          <div class="form-check form-check-danger">
                            <input
                              name="chat-user-status"
                              class="form-check-input"
                              type="radio"
                              value="busy"
                              id="user-busy" />
                            <label class="form-check-label" for="user-busy">바쁨</label>
                          </div>
                          <div class="form-check form-check-warning">
                            <input
                              name="chat-user-status"
                              class="form-check-input"
                              type="radio"
                              value="away"
                              id="user-away" />
                            <label class="form-check-label" for="user-away">자리비움</label>
                          </div>
                          <div class="form-check form-check-secondary">
                            <input
                              name="chat-user-status"
                              class="form-check-input"
                              type="radio"
                              value="offline"
                              id="user-offline" />
                            <label class="form-check-label" for="user-offline">오프라인</label>
                          </div>
                        </div>
                      </div>
                      <div class="my-4">
                        <span class="text-muted text-uppercase">설정</span>
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
                              <span class="align-middle">알림</span>
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
                   
                  </div>
                  <!-- /Chat contacts -->

                  <!-- Chat History -->
                  <div class="col app-chat-history" id="chatRoom">
                   
                  </div>
                  <!-- /Chat History -->

                  <!-- Sidebar Right -->
                  <div class="col app-chat-sidebar-right app-sidebar overflow-hidden" id="app-chat-sidebar-right">
                    <div
                      class="sidebar-header d-flex flex-column justify-content-center align-items-center flex-wrap p-4 mt-2">
                      <div class="avatar avatar-xl avatar-online">
                        <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/2.png" alt="Avatar" class="rounded-circle" />
                      </div>
                      <h6 class="mt-3 mb-1">박재홍</h6>
                      <small class="text-muted">NextJS Developer</small>
                      <i
                        class="bx bx-x bx-sm cursor-pointer close-sidebar me-1 fs-4 d-block"
                        data-bs-toggle="sidebar"
                        data-overlay
                        data-target="#app-chat-sidebar-right"></i>
                    </div>
                    <div class="sidebar-body px-4 pb-4">
                      <div class="my-3">
                        <span class="text-muted text-uppercase">소개</span>
                        <p class="mb-0 mt-2">
                          개발자 싫어 흐긓ㄱ
                        </p>
                      </div>
                      <div class="my-4">
                        <span class="text-muted text-uppercase">프로필 정보</span>
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
            <!-- / Content -->

            <!-- Footer -->
            
            <!-- / Footer -->

          <!-- Content wrapper -->
        <!-- / Layout page -->

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

    <!-- Main JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

    <!-- Page JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/app-chat.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/header.js"></script>
  </body>
</html>
