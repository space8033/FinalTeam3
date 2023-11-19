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
          <div class="app-brand demo" style="padding-left : 1.5rem">
            <a href="/exodia/main" class="app-brand-link">
              <img src="${pageContext.request.contextPath}/resources/assets/img/backgrounds/pmslogo.png" width=40 height=40 style="margin-right : 12px"/>
              <span class=" demo menu-text fw-bold ms-2" style="font-size: 25px; padding-top: 3px">PMS</span>
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
            <li class="menu-item">
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
                <!-- <li class="menu-item">
                  <a href="dashboards-crm.html" class="menu-link">
                    <div class="text-truncate" >프로젝트 조직도</div>
                  </a>
                </li> -->
                <li class="menu-item">
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
            <li class="menu-item active">
              <a href="${pageContext.request.contextPath}/inquiryList" class="menu-link">
                <i class="menu-icon tf-icons bx bx-conversation"></i>
                <div class="text-truncate">문의하기</div>
              </a>
            </li>
            
            <!-- e-commerce-app menu start -->
                
            <li class="menu-item">
              <a href="${pageContext.request.contextPath}/calendar" class="menu-link">
             <i class="menu-icon tf-icons bx bx-task"></i>
                <div class="text-truncate">일정관리</div>
              </a>
            </li>
            <li class="menu-item">
              <a href="${pageContext.request.contextPath}/task/programManagement" class="menu-link">
                <i class="menu-icon tf-icons bx bx-server"></i>
                <div class="text-truncate">프로그램</div>
              </a>
            </li>
            
            <c:if test="${emp_id == 'admin' || emp_id == 'nonono'}">
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
	            
	            <li class="menu-item">
	              <a href="${pageContext.request.contextPath}/employee/join" class="menu-link">
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
            </c:if>
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
              <!-- <h4 class="py-3 mb-4"><span class="text-muted fw-light">eCommerce /</span><span> Add Product</span></h4> -->

              <div class="app-ecommerce">
                <!-- Add Product -->
                <div class="d-flex flex-wrap justify-content-between align-items-center mb-3">
                  <div class="d-flex flex-column justify-content-center">
                    <h4 class="mb-1 mt-3"><strong>문의사항 내용🎃🍠</strong></h4>
                    <!-- <p class="text-muted">Orders placed across your store</p> -->
                  </div>
                  <div class="d-flex align-content-center flex-wrap gap-3">
                    <!-- <button class="btn btn-label-secondary">Discard</button>
                    <button class="btn btn-label-primary">Save draft</button> -->
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
							<div><input type="hidden" value="${reply.reply_no}" id="myReply"/></div>
							<div><input type="hidden" value="${reply.empinfo_no}" id="myEmpInfoNo"/></div>
							<div><input type="hidden" value="${now_emp_no}" id="nowEmpNo"/></div>
							<div><input type="hidden" value="${now_empinfo_no}" id="nowEmpInfoNo"/></div>
                        	<div class="card-body" style="padding-top:0px;">
								<div>
									<div>
										<div>
											<p>
												<span style="font-size: 12px; display: none;">글 번호:</span> 
												<span style="font-size: 12px; display: none;">${notice.notice_no}</span>
											</p>
											
											<p>
												<span style="font-size: 28px;"><strong>${notice.notice_title}</strong></span>
											</p>
											
											<p>
												<div class="d-flex align-items-center mb-sm-0 mb-3">
												<c:if test="${notice.photo == null}">
														<c:if test="${notice.emp_no % 7 == 0}">
								                        	<span class="avatar-initial rounded-circle bg-label-success" id="nameProfile" 
								                        	style="width :50px; height: 50px; font-size: 20px; display: flex; align-items: center; justify-content: center;"> 
								                        	${notice.twoname} 
								                        	</span>
					                                	</c:if>
					                                	<c:if test="${notice.emp_no % 7 == 1}">
								                        	<span class="avatar-initial rounded-circle bg-label-primary" id="nameProfile" 
								                        	style="width :50px; height: 50px; font-size: 20px; display: flex; align-items: center; justify-content: center;"> 
								                        	${notice.twoname} 
								                        	</span>
					                                	</c:if>
					                                	<c:if test="${notice.emp_no % 7 == 2}">
								                        	<span class="avatar-initial rounded-circle bg-label-warning" id="nameProfile" 
								                        	style="width :50px; height: 50px; font-size: 20px; display: flex; align-items: center; justify-content: center;"> 
								                        	${notice.twoname} 
								                        	</span>
					                                	</c:if>
					                                	<c:if test="${notice.emp_no % 7 == 3}">
								                        	<span class="avatar-initial rounded-circle bg-label-danger" id="nameProfile" 
								                        	style="width :50px; height: 50px; font-size: 20px; display: flex; align-items: center; justify-content: center;"> 
								                        	${notice.twoname} 
								                        	</span>
					                                	</c:if>
					                                	<c:if test="${notice.emp_no % 7 == 4}">
								                        	<span class="avatar-initial rounded-circle bg-label-info" id="nameProfile" 
								                        	style="width :50px; height: 50px; font-size: 20px; display: flex; align-items: center; justify-content: center;"> 
								                        	${notice.twoname} 
								                        	</span>
					                                	</c:if>
					                                	<c:if test="${notice.emp_no % 7 == 5}">
								                        	<span class="avatar-initial rounded-circle bg-label-dark" id="nameProfile" 
								                        	style="width :50px; height: 50px; font-size: 20px; display: flex; align-items: center; justify-content: center;"> 
								                        	${notice.twoname} 
								                        	</span>
					                                	</c:if>
					                                	<c:if test="${notice.emp_no % 7 == 6}">
								                        	<span class="avatar-initial rounded-circle bg-label-secondary" id="nameProfile" 
								                        	style="width :50px; height: 50px; font-size: 20px; display: flex; align-items: center; justify-content: center;"> 
								                        	${notice.twoname} 
								                        	</span>
					                                	</c:if>
						                        </c:if>
						                        <c:if test="${notice.photo != null}">
							                        <img
							                          src="data:MIME;base64, ${notice.photo}"
							                          alt="user-avatar"
							                          class="d-block rounded-circle"
							                          height="50"
							                          width="50"
							                          id="uploadedAvatar"
							                          style="margin-bottom:7px;"/>            	            
						                        </c:if>
												<div class="flex-grow-1 ms-3">
												  <h6 class="mb-1" id="replyWriter" name="replyWriter">${notice.empinfo_name}</h6>
												  <small class="text-muted" id="replyWriterEmail" name="replyWriterEmail">${notice.empinfo_email}</small>
												  <small class="mb-0 me-3 text-muted" id="replyCreatedat" name="replyCreatedat">  /  ${notice.notice_createdat}</small>											    
												</div>
											  </div>
											</p>
										</div>	
										<div class="card email-card-last mx-sm-4 mx-3 mt-4 border" style="margin-bottom:1.5rem;">																	
											<div class="card-body pt-3">
					                            <p>
					                            	 ${notice.notice_content}
					                            </p>
					                            <span>
					                            	<c:if test="${not empty mediaList}">
							                            <hr />
							                            <p class="mb-2 ">첨부 파일</p> 
							                              <c:forEach var="media" items="${mediaList}" varStatus="a">
									                              <div class="cursor-pointer"> 	
							        	                	       	<c:if test="${media.media_type}">
							        	                	       		<i class="bx bx-file-image"></i>
							        	                	       	</c:if>
							        	                	       		<i class="bx bx-file"></i>
							            	        	          		<a class="align-middle ms-1" href ="inquiryFileDownload?mno=${media.media_no}">${media.media_name}</a> 	
							                		              </div>
							                              </c:forEach>
							                         </c:if>
					                            </span>
				                          	</div>
				                          </div>										
										<a class="btn btn-primary btn-sm mt-2" href="inquiryList">목록</a>
										<c:if test="${now_emp_no == 0}">
											<a class="btn btn-primary btn-sm mt-2" href="inquiryUpdate?notice_no=${notice.notice_no}">수정</a>
										    <a class="btn btn-primary btn-sm mt-2"data-bs-toggle="modal" data-bs-target="#exampleModal" href="#">삭제</a>									
											<!-- Modal -->
											<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
											  <div class="modal-dialog">
											    <div class="modal-content">
											      <div class="modal-header">
											        <h5 class="modal-title" id="exampleModalLabel">삭제하시겠습니까?</h5>
											        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
											      </div>
											      <div class="modal-body">
													게시물이 삭제됩니다.
											      </div>
											      <div class="modal-footer">
											      	<textarea id="noticeNo" style="display: none">${notice.notice_no}</textarea>
											        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
											        <button type="button" class="btn btn-primary" id="deleteButton">삭제</button> 
											      </div>
											    </div>
											  </div>
											</div>
										</c:if>
										<c:if test="${now_emp_no != 0}">
											<c:if test="${notice.empinfo_no == now_emp_no}">
												<a class="btn btn-primary btn-sm mt-2" href="inquiryUpdate?notice_no=${notice.notice_no}">수정</a>
											    <a class="btn btn-primary btn-sm mt-2"data-bs-toggle="modal" data-bs-target="#exampleModal" href="#">삭제</a>									
												<!-- Modal -->
												<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
												  <div class="modal-dialog">
												    <div class="modal-content">
												      <div class="modal-header">
												        <h5 class="modal-title" id="exampleModalLabel">삭제하시겠습니까?</h5>
												        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
												      </div>
												      <div class="modal-body">
														게시물이 삭제됩니다.
												      </div>
												      <div class="modal-footer">
												      	<textarea id="noticeNo" style="display: none">${notice.notice_no}</textarea>
												        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
												        <button type="button" class="btn btn-primary" id="deleteButton">삭제</button> 
												      </div>
												    </div>
												  </div>
												</div>
											</c:if>
										</c:if>
																	
										<!-- 댓글 -->
										  <hr />
										     <c:set var="replyCount" value="${fn:length(replyList)}" />
										  <p>
									         <span class="tit le"><strong>댓글</strong></span> : ${replyCount}개 <br/>
									     </p> 
									     <c:forEach var="reply" items="${replyList}" varStatus="a">
										  <div class="card email-card-last mx-sm-4 mx-3 mt-4 border" id="reply${reply.reply_no}">
										    <div class="card-header d-flex justify-content-between align-items-center flex-wrap border-bottom">
											  <div class="d-flex align-items-center mb-sm-0 mb-3">
												<c:if test="${reply.photo == null}">
													<c:if test="${reply.emp_no % 7 == 0}">
								                        	<span class="avatar-initial rounded-circle bg-label-success" id="nameProfile" 
								                        	style="width :40px; height: 40px; font-size: 16px; display: flex; align-items: center; justify-content: center;"> 
								                        	${reply.twoname} 
								                        	</span>
					                                	</c:if>
					                                	<c:if test="${reply.emp_no % 7 == 1}">
								                        	<span class="avatar-initial rounded-circle bg-label-primary" id="nameProfile" 
								                        	style="width :40px; height: 40px; font-size: 16px; display: flex; align-items: center; justify-content: center;"> 
								                        	${reply.twoname} 
								                        	</span>
					                                	</c:if>
					                                	<c:if test="${reply.emp_no % 7 == 2}">
								                        	<span class="avatar-initial rounded-circle bg-label-warning" id="nameProfile" 
								                        	style="width :40px; height: 40px; font-size: 16px; display: flex; align-items: center; justify-content: center;"> 
								                        	${reply.twoname} 
								                        	</span>
					                                	</c:if>
					                                	<c:if test="${reply.emp_no % 7 == 3}">
								                        	<span class="avatar-initial rounded-circle bg-label-danger" id="nameProfile" 
								                        	style="width :40px; height: 40px; font-size: 16px; display: flex; align-items: center; justify-content: center;"> 
								                        	${reply.twoname} 
								                        	</span>
					                                	</c:if>
					                                	<c:if test="${reply.emp_no % 7 == 4}">
								                        	<span class="avatar-initial rounded-circle bg-label-info" id="nameProfile" 
								                        	style="width :40px; height: 40px; font-size: 16px; display: flex; align-items: center; justify-content: center;"> 
								                        	${reply.twoname} 
								                        	</span>
					                                	</c:if>
					                                	<c:if test="${reply.emp_no % 7 == 5}">
								                        	<span class="avatar-initial rounded-circle bg-label-dark" id="nameProfile" 
								                        	style="width :40px; height: 40px; font-size: 16px; display: flex; align-items: center; justify-content: center;"> 
								                        	${reply.twoname} 
								                        	</span>
					                                	</c:if>
					                                	<c:if test="${reply.emp_no % 7 == 6}">
								                        	<span class="avatar-initial rounded-circle bg-label-secondary" id="nameProfile" 
								                        	style="width :40px; height: 40px; font-size: 16px; display: flex; align-items: center; justify-content: center;"> 
								                        	${reply.twoname} 
								                        	</span>
					                                	</c:if>
						                        </c:if>
						                        <c:if test="${reply.photo != null}">
							                        <img
							                          src="data:MIME;base64, ${reply.photo}"
							                          alt="user-avatar"
							                          class="d-block rounded-circle"
							                          height="40"
							                          width="40"
							                          id="uploadedAvatar" />            	            
						                        </c:if>
												<div class="flex-grow-1 ms-3">
												  <h6 class="m-0" id="replyWriter" name="replyWriter">${reply.empinfo_name}</h6>
												  <small class="text-muted" id="replyWriterEmail" name="replyWriterEmail">${reply.empinfo_email}</small>
												  <small class="mb-0 me-3 text-muted" id="replyCreatedat" name="replyCreatedat">  /  ${reply.reply_createdat}</small>											    
												</div>
											  </div>
												<div class="d-flex align-items-center">
												

													<c:if test="${now_emp_no == 0}">
														<i class="bx bx-trash email-list-delete cursor-pointer me-3 fs-4" onclick="openDeleteModal(${reply.reply_no})"></i>
													</c:if>
													<c:if test="${reply.empinfo_no != 0}">
														<c:if test="${reply.empinfo_no == now_empinfo_no}">
															<i class="bx bx-trash email-list-delete cursor-pointer me-3 fs-4" onclick="openDeleteModal(${reply.reply_no})"></i>
														</c:if>
													</c:if>
													
												<!-- 버튼 -->
													<!-- <i class="bx bx-trash email-list-delete cursor-pointer me-3 fs-4"></i> -->													
													<!-- 모달 창 -->
													<div class="modal fade" id="basicModal${reply.reply_no}" tabindex="-1" aria-labelledby="basicModalLabel" aria-hidden="true">
													  <div class="modal-dialog">
													    <div class="modal-content">
													      <div class="modal-header">
													        <h5 class="modal-title" id="basicModalLabel">내용:</h5>
													        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
													      </div>
													      <div class="modal-body">
													        	댓글을 삭제하시겠습니까?
													      </div>
													      <div class="modal-footer">
													      	<textarea id="replyNo${reply.reply_no}" style="display: none">${reply.reply_no}</textarea>
													        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
													        <button type="button" class="btn btn-primary" id="replyDeleteButton" onclick="deleteComment(${reply.reply_no})">삭제</button>
													      </div>
													    </div>
													  </div>
													</div>
											    </div>
											</div>
					                          <div class="card-body pt-3">
					                            <p>
					                            	${reply.reply_content}
					                            </p>
					                          </div>
				                          </div>
			                             </c:forEach>
 										
 										<!-- 댓글 작성 -->
 										
									     	<form action="#" id="replyDetail" enctype="multipart/form-data">
						                        <div class="card email-card-last mx-sm-4 mx-3 mt-4 border">
													<div class="card-body pt-3" style="padding-bottom:0px;">											
								                        <div style="padding-top:10px;"><strong id="replyName">${loginResponse.empInfo_name}</strong></div>
								                        <div style="padding-top:10px;">
								                        	<input type="hidden" id="noticeNo" value="${notice.notice_no}"/>
									                        <textarea id="replyContent" name="replyContent" rows="4" style="width:100%; border: none; height: 40px; outline: none;" placeholder="댓글을 작성해주세요"></textarea>
								                        </div>
														<div style="text-align: right;">
													        <button type="button" form="replyAdd" onclick="" id="replyAdd" class="btn btn-primary btn-sm mt-2" style="margin-bottom:10px;">댓글 작성</button>
													        <!-- 모달 -->
										                    <div class="modal" id="modal-no-content">
										                      <div class="modal-dialog">
										                        <div class="modal-content">
										                          <div class="modal-header">
										                            <h5 class="modal-title">댓글을 입력하세요</h5>
										                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										                          </div>
										                          <div class="modal-body text-start">내용을 작성해주세요.</div>
										                          <div class="modal-footer">
										                            <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
										                          </div>
										                        </div>
										                      </div>
										                    </div>
														</div>
													</div>
						                        </div>																				     	
									     	</form>
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
    <script src="${pageContext.request.contextPath}/resources/assets/js/inquiryDetail.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/header.js"></script>
  </body>
</html>