                                                                                                                                                                                                                                                                                                         <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style>

 .alarmBell {
 
 }
 
 .alarmBell.vibration {
 	animation: vibration .3s infinite;
 }
 
 @keyframes vibration {
 	from {
 		transform: rotate(10deg);
 	}
 	to {
 		transform: rotate(-10deg);
 	}
 }



</style>

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

<script>
window.addEventListener('message', function (event) {
    if (event.data.type === 'websocket_message') {
        const message = event.data.data;
        // 여기서 메시지를 처리
        handleWebSocketMessage(message);
    }
});

function handleWebSocketMessage(message) {
    // 웹소켓 메시지 처리 로직
    console.log('Handling WebSocket Message:', message);
    const msg = message.msg;
    const count = message.count;
    const cmd = message.cmd;
    const title = message.title;
    const sender = message.sender;
    if(cmd === "쪽지") {
    	var alarmToast = document.querySelector("#alarmToast");
    	alarmToast.classList.add('show');
    	var alarmMsg = document.querySelector("#alarmMsg");
    	alarmMsg.innerText = "제목 : " + title + "<br>" + sender + "님으로부터 1개의 쪽지가 도착하였습니다!"
    	setTimeout(function() {
    		alarmToast.classList.remove("show");
	    }, 3000);
    	
    } else if(cmd === "채팅") {
    	var alarmToast = document.querySelector("#alarmToast");
		if(alarmToast) {
	    	alarmToast.classList.add('show');
	    	var alarmMsg = document.querySelector("#alarmMsg");
	    	alarmMsg.innerHTML = sender + "님으로부터 1:1 채팅이 도착하였습니다!" + "<br>" + "내용 : " + title;
	    	setTimeout(function() {
	    		alarmToast.classList.remove("show");
		    }, 3000);
		}
    	
       /* updateChatList(message);*/
    	
    }
}
</script>




	<nav class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
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
             <!-- <a class="nav-item nav-link search-toggler px-0" href="javascript:void(0);">
               <i class="bx bx-search bx-sm"></i>
               <span class="d-none d-md-inline-block text-muted">Search (Ctrl+/)</span>
             </a> -->
           </div>
         </div>
         <!-- /Search -->

         <ul class="navbar-nav flex-row align-items-center ms-auto">
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

           <!-- 실시간 알람 -->
           <li class="nav-item dropdown-notifications navbar-dropdown dropdown me-3 me-xl-1">
             <a
               class="nav-link dropdown-toggle hide-arrow cursor-pointer"
               onclick="javascript:showAlarm()"
               data-bs-toggle="dropdown"
               data-bs-auto-close="outside"
               aria-expanded="false">
               <i class="alarmBell bx bx-bell bx-sm" id="bellAlarm"></i> <input id="alarmId" type="hidden" value="${emp_id}">
               <span id="alarmIcon" class="d-none badge bg-danger rounded-pill badge-notifications"></span>
             </a>
       				 
             <ul class="dropdown-menu dropdown-menu-end py-0" id="alarm">
               		<!-- 알람내역 비동기처리 -->
             </ul> 
           </li>
           <!--/ Notification -->
           <!-- User -->
           <li class="nav-item navbar-dropdown dropdown-user dropdown">
             <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
               <div class="avatar avatar-online">
                  <img
	                          src=""
	                          alt="user-avatar"
	                          class="d-block rounded-circle d-none"
	                          height="40"
	                          width="40"
	                          id="header_image" />
                 <span class="avatar-initial rounded-circle d-none" id="header_twoName">
                        	
                 </span>
               </div>
             </a>
             <ul class="dropdown-menu dropdown-menu-end">
               <li>
      			  <a class="dropdown-item" href="${pageContext.request.contextPath}/employee/userModify">
                   <div class="d-flex">
                     <div class="flex-shrink-0 me-3">
                       <div class="avatar avatar-online">
                         <%-- <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle" />
                          --%>
                        <img
	                          src=""
	                          alt="user-avatar"
	                          class="d-block rounded-circle d-none"
	                          height="40"
	                          width="40"
	                          id="header_image2" />
		                 <span class="avatar-initial rounded-circle d-none" id="header_twoName2">
		                        	
		                 </span>
                         
                       </div>
                     </div>
                     <div class="flex-grow-1">
                       <span class="fw-medium d-block">${empInfo_name}</span>
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
                <a class="dropdown-item" href="#" data-bs-target="#upgradePlanModal" data-bs-toggle="modal">
                   <i class="bx bx-lock me-2"></i>
                   <span class="align-middle mx-1">비밀번호 변경</span>
                 </a>
               </li>
               <li>
                 <div class="dropdown-divider"></div>
               </li>
               <c:if test="${emp_id != 'admin'}">
	               <li>
	                 <a class="dropdown-item" href="${pageContext.request.contextPath}/note">
	                   <span class="d-flex align-items-center align-middle">
	               	  <i class="bx bx-envelope me-3"></i>
	                	  <span class="flex-grow-1 align-middle">쪽지함</span>
	                 	  <span class="badge badge-center rounded-pill bg-label-warning" id="moveNote">1</span>
	                 	</span>
	                 </a>
	               </li>
	               <li>
	                 <a class="dropdown-item" href="javascript:chat();">
	                   <span class="d-flex align-items-center align-middle">
	                     <i class="bx bx-chat me-3"></i>
	                     <span class="flex-grow-1 align-middle">채팅</span>
	                     <span class="badge badge-center rounded-pill bg-label-primary" id="moveChat">1</span>
	                   </span>
	                 </a>
	               </li>
	
	               <li>
	                 <div class="dropdown-divider"></div>
	               </li>
               
               </c:if>
               <li>
                 <a class="dropdown-item" href="${pageContext.request.contextPath}/logout">
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
     
     
       
     
     
     <div class="modal fade" id="upgradePlanModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-simple modal-upgrade-plan">
          <div class="modal-content p-3 p-md-5">
            <div class="modal-body">
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              <div class="text-center mb-4">
                <h3>비밀번호 변경</h3>
                <p>본인 확인을 위해 비밀번호를 입력하세요</p>
              </div>
              <form id="upgradePlanForm" class="row g-3" onsubmit="return false">
                <div class="col-sm-9 mt-4">
	                  <label class="form-label" for="choosePlan">현재 비밀번호 입력</label>
                	<div class="input-group">
	                  <input
	                            type="password"
	                            class="form-control"
	                            id="choosePlan"
	                            placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
	                            aria-describedby="basic-default-password2" />
	                  <span id="basic-default-password2" class="input-group-text cursor-pointer">
	                  	<i class="bx bx-hide"></i>    
	                  </span>
                	</div>
                  
                  
                  <!-- <input name="choosePlan" type="password" class="form-control"/> -->
                </div>
                <div class="col-sm-3 d-flex align-items-end">
                  <button type="submit" class="btn btn-primary" id="confirmBtn">확인</button>
                </div>
              </form>
            </div>
           </div>
         </div>
      </div>
      
      
      
      	<!-- 토스트 메세지 -->
       <div
       		 id="alarmToast"
             class="bs-toast toast fade bg-primary position-fixed top-10 end-0"
             role="alert"
             aria-live="assertive"
             aria-atomic="true"
             style="margin-right:130px;">
             
             <div class="toast-header">
               <i class="bx bx-bell me-2"></i>
               <div class="me-auto fw-medium">알람</div>
               <small>1초 전</small>
               <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
             </div>
             
             <div id="alarmMsg" class="toast-body">
               
             </div>
       </div>
