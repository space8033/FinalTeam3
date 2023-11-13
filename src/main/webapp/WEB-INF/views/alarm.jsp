<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


             <ul class="dropdown-menu dropdown-menu-end py-0" id="alarmContent">
             
             
               <li class="dropdown-menu-header border-bottom">
                 <div class="dropdown-header d-flex align-items-center py-3">
                   <h5 class="text-body mb-0 me-auto"><Strong>실시간 알림</Strong></h5>
                   <a
                     href="javascript:alarmAllRead();"
                     class="dropdown-notifications-all text-body"
                     data-bs-toggle="tooltip"
                     data-bs-placement="top"
                     title="모두 읽음 처리"
                     ><i class="bx fs-4 bx-envelope-open"></i
                   ></a>
                 </div>
               </li>
                <li class="dropdown-notifications-list scrollable-container">
                 <ul class="list-group list-group-flush">
                 
                 <%--
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
                   </li> --%>
                   <c:forEach var="alarm" items="${list}">
	                    <c:if test="${alarm.alarm_isRead == true}">
		                   <li id="a-${alarm.alarm_no}" class="list-group-item list-group-item-action dropdown-notifications-item marked-as-read">
		                </c:if>     
		                <c:if test="${alarm.alarm_isRead == false}">
		                   <li id="a-${alarm.alarm_no}" class="list-group-item list-group-item-action dropdown-notifications-item">
		                </c:if>
	                     <div class="d-flex">
	                       <div class="flex-shrink-0 me-3" onclick="javascript:pageMove('${alarm.alarm_no}', '${alarm.alarm_type}', '${alarm.alarm_typeNo}');">
	                         
	                         <div class="avatar">
	                        	<c:choose>
		                            <c:when test="${alarm.alarm_type == '프로그램'}">
		                           		 <span class="avatar-initial rounded-circle bg-label-primary"><i class="bx bx-pie-chart-alt"></i></span>
		                            </c:when>
		                            <c:when test="${alarm.alarm_type == '공지'}">
		                           		<span class="avatar-initial rounded-circle bg-label-warning"><i class="bx bx-bell"></i></span>
		                            </c:when>
		                            <c:when test="${alarm.alarm_type == '문의'}">
		                           		<span class="avatar-initial rounded-circle bg-label-success"><i class="bx bx-conversation"></i></span>
		                            </c:when>
		                            <c:when test="${alarm.alarm_type == '댓글'}">
		                           		<span class="avatar-initial rounded-circle bg-label-info"><i class="bx bx-registered"></i></span>
		                            </c:when>
		                           
		                            <c:otherwise>
		                            
		                             <c:if test="${alarm.base64 == null}">
		                             	<div class="avatar me-3">
			                            	<span class="avatar-initial rounded-circle ${alarm.two_name_color}" style="font-size: 13px;">${alarm.two_name}
								            </span>
							            </div>
		                             </c:if>
		                             <c:if test="${alarm.base64 != null}">
		                            	<img
					                          src="data:MIME;base64, ${alarm.base64}"
					                          alt="user-avatar"
					                          class="d-block flex-shrink-0 rounded-circle me-sm-3 me-0"
					                          height="40"
		                                      width="40"/> 
		                             </c:if>
		                            	
		                            	
		                            </c:otherwise>
	                            </c:choose>
	                         
	                        </div>
	                         
	                       </div>
	                       <div class="flex-grow-1" onclick="javascript:pageMove('${alarm.alarm_no}', '${alarm.alarm_type}', '${alarm.alarm_typeNo}');">
	                         <c:if test="${alarm.alarm_type == '쪽지'}">
	                         	<h6 class="mb-1">새 메세지 ✉️</h6>
	                         	 <p class="mb-0">${alarm.emp_name}님으로부터 ${alarm.alarm_type}가 도착하였습니다!</p>
	                         </c:if>
	                         <c:if test="${alarm.alarm_type == '채팅'}">
	                         	<h6 class="mb-1">채팅 메세지 💬</h6>
	                         	 <p class="mb-0">${alarm.emp_name}님으로부터 1:1 채팅이 도착하였습니다!</p>
	                         </c:if>
	                         <c:if test="${alarm.alarm_type == '프로그램'}">
	                         	<h6 class="mb-1">업무 시작일 📅</h6>
	                         	 <p class="mb-0">오늘은  '${alarm.alarm_content}' 업무 시작일입니다. 파이팅하세요!</p>
	                         </c:if>
	                         <c:if test="${alarm.alarm_type == '공지'}">
	                         	<h6 class="mb-1">새로운 공지사항 🔊</h6>
	                         	 <p class="mb-0">새 공지사항이 등록되었습니다. <br> [제목 : ${alarm.alarm_content}]
	                   			 </p>
	                         </c:if>
	                         <c:if test="${alarm.alarm_type == '문의'}">
	                         	<h6 class="mb-1">새로운 문의사항❔</h6>
	                         	 <p class="mb-0">${alarm.emp_name}님으로부터 새 문의사항이 <br>등록되었습니다. <br> [제목 : ${alarm.alarm_content}]
	                   			 </p>
	                         </c:if>
	                         <c:if test="${alarm.alarm_type == '댓글'}">
	                         	<h6 class="mb-1">새로운 댓글 ✅</h6>
	                         	 <p class="mb-0">${alarm.emp_name}님이 [${alarm.alarm_content}] 글에 새 댓글을 달았습니다.
	                   			 </p>
	                         </c:if>
	                         

	                         <c:if test="${alarm.alarm_type == '공지'}">
	                         	<h6 class="mb-1">새로운 필독사항 🚨</h6>
	                         	 <p class="mb-0">새 필독사항이 등록되었습니다. <br> [제목 : ${alarm.alarm_content}]
	                   			 </p>
	                         </c:if>
	                         
	                         
	                         
	                         
	                         
	                        
	                         <small class="text-muted">${alarm.alarm_createdAt}</small>
	                       </div>
	                       <div class="flex-shrink-0 dropdown-notifications-actions">
	                       
	                       
	                         <a href="javascript:void(0)" class="dropdown-notifications-read"
	                           ><span class="badge badge-dot"></span
	                         ></a>
	                      
	                         <a href="javascript:alarmRemove('${alarm.alarm_no}');" class="dropdown-notifications-archive"
	                           ><span class="bx bx-x"></span
	                         ></a>
	                       </div>
	                     </div>
	                   </li>
	                </c:forEach>
   <%--                 <li class="list-group-item list-group-item-action dropdown-notifications-item">
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
                   </li> --%>
                  
                 </ul>
               </li>
               <li class="dropdown-menu-footer border-top p-3">
                 <button class="btn btn-primary text-uppercase w-100" onclick="javascript:alarmRemoveAll();">알림 모두 삭제</button>
               </li>
             </ul>
           
      