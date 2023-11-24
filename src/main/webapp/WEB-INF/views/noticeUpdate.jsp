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

                <li class="menu-item">
                  <a href="${pageContext.request.contextPath}/project/searchUser" class="menu-link">
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
	            
	            <c:if test="${emp_id == 'admin'}">
		            <li class="menu-item">
		              <a href="${pageContext.request.contextPath}/employee/join" class="menu-link">
		                <i class="menu-icon tf-icons bx bx-user"></i>
		                <div class="text-truncate">사용자 등록</div>
		              </a>
		            </li>
	            </c:if>
	            
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
                    <h4 class="mb-1 mt-3"><strong>공지사항 수정하기</strong></h4>
                    <!-- <p class="text-muted">Orders placed across your store</p> -->
                  </div>
                  <div class="d-flex align-content-center flex-wrap gap-3">
                    <!-- <button class="btn btn-label-secondary">Discard</button>
                    <button class="btn btn-label-primary">Save draft</button> -->
                    <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal">
					  취소
					</button>
					
					<!-- Modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">나가시겠습니까?</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
							내용이 저장되지 않았습니다.
							나가시겠습니까?
					      </div>
					      <div class="modal-footer">
					      	<textarea id="noticeNo" style="display: none">${notice.notice_no}</textarea>
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					        <button type="button" class="btn btn-primary" onclick="location.href='noticeList'">나가기</button>
					      </div>
					    </div>
					  </div>
					</div>
                    <button type="button" form="noticeUpdate" id="noticeSubmit" class="btn btn-primary">수정</button>
                    <!-- 모달 -->
                    <div class="modal" id="modal-no-content">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title">내용을 입력하세요</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                          </div>
                          <div class="modal-body"> 제목이나 내용을 입력해주세요. </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
				<form action="noticeUpdate" id="noticeUpdate" method="post" enctype="multipart/form-data">
                <div class="row">
                  <input name="noticeNo" type="hidden" value="${notice.notice_no}"/>
                  <!-- First column-->
                  <div class="col-12 col-lg-12">
                    <!-- Product Information -->
                    <div class="card mb-4">
                      <div class="card-body">
                        <div class="row">
						  <div class="col-8 mb-3">
						    <label class="form-label" for="ecommerce-product-name">제목</label>
						    <input
						      type="text"
						      class="form-control"
						      id="ecommerce-product-name"
						      value="${notice.notice_title }"
						      placeholder="제목을 입력해 주세요"
						      name="noticeTitle"
						      aria-label="Notice title" />
						  </div>
						  
						</div>
                        <!-- Description -->
                        <div>
                          <label class="form-label">내용</label>
                          <div class="form-control p-0 pt-1">
                            <div class="comment-toolbar border-0 border-bottom">
                              <div class="d-flex justify-content-start">
                                <span class="ql-formats">
		                          <select class="ql-font"></select>
		                          <select class="ql-size"></select>
		                        </span>
		                        <span class="ql-formats">
		                          <button class="ql-bold"></button>
		                          <button class="ql-italic"></button>
		                          <button class="ql-underline"></button>
		                          <button class="ql-strike"></button>
		                        </span>
		                        <span class="ql-formats">
		                          <select class="ql-color"></select>
		                          <select class="ql-background"></select>
		                        </span>
		                        <span class="ql-formats">
		                          <button class="ql-script" value="sub"></button>
		                          <button class="ql-script" value="super"></button>
		                        </span>
		                        <span class="ql-formats">
		                          <button class="ql-header" value="1"></button>
		                          <button class="ql-header" value="2"></button>
		                          <button class="ql-blockquote"></button>
		                          <button class="ql-code-block"></button>
		                          <button class="ql-link"></button>
                                  <button class="ql-image"></button>
                                  <button class="ql-video"></button>
		                        </span>
                              </div>
                            </div>
                            <div class="comment-editor border-0 pb-4" id="ecommerce-category-description">${notice.notice_content}</div>
                            <textarea id="noticeContent" name="noticeContent" style="display: none">${notice.notice_content}</textarea>
                            <div class="input-group">							
								<input type="file" name="files" class="form-control" id="attach-file" multiple/>
							</div>
								<div class="file-group" style="padding-top:15px; padding-left:10px;">
							        <c:forEach var="media" items="${mediaList}">
							            <p id="p${media.media_no}">
							            	<span><i class='bx bx-file-blank'></i></span>
							                <span>${media.media_name}</span>
							                <span style="display: none;" id="media">${media.media_no}</span>
							                <a href="#this" style="border: 1px solid #ccc; padding: 5px 10px; display: inline-block; text-decoration: none; color: #333;"
							                   onclick="deleteFile(${media.media_no})">삭제</a>
							            </p>
							        </c:forEach>
							    </div>
							    
							    <script>
								    function deleteFile(media_no) {
								    	console.log("미디어넘버를 잘 받아오나요?" + media_no);
								    	if(confirm("삭제하시겠습니까?")){
								       		 // AJAX 통신
									        $.ajax({
									            type: "POST",
									            url: "/exodia/mediaDelete",
									            data: { media_no: media_no },
									            success: function (response) {
									                // 성공적으로 서버에서 응답을 받았을 때 수행할 작업
									                console.log("삭제가 돼?"); // 서버에서 보낸 응답을 콘솔에 출력 (디버깅용)
									                const elementToDelete = document.getElementById('p'+media_no);

									                // elementToDelete이 null이 아니면 숨기기
									                if (elementToDelete) {
									                    elementToDelete.remove();
									                }
									                // 여기에서 필요한 업데이트 또는 화면 조작을 수행
									                // 예: 화면 갱신, 삭제된 항목 감춤 등
									            },
									            error: function (error) {
									                // 서버 요청 중에 오류가 발생했을 때 수행할 작업
									                console.log("제발...뭐가 문제야");
									                console.error(error); // 에러를 콘솔에 출력 (디버깅용)
									            }
									        });
								    		
								    	}
								    }
								</script>
                          </div>
                        </div>
                        </form>
                      </div>
                    </div>
                    <!-- /Product Information -->
                    <!-- Media -->
                    
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
    <script src="${pageContext.request.contextPath}/resources/assets/js/noticeUpdate.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/header.js"></script>
  </body>
</html>
