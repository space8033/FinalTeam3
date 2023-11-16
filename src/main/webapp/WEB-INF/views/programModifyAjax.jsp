<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="card mb-5">
    <h5 class="card-header mb-4">프로그램 상세정보 </h5>
    <form class="card-body" onsubmit="return false">
       <div><input type="hidden" value="${programModify.task_no}" id="taskNoBox"/></div>
       <div><input type="hidden" value="${programModify.emp_no}" id="empNoBox"/></div>
       <div><input type="hidden" value="${now_emp_no}" id="nowEmpNo"/></div>
       <div class="row mb-3">
         <label class="col-sm-3 col-form-label" for="multicol-email">프로그램명</label>
         <div class="col-sm-9">
           <div class="input-group input-group-merge">
             <input
               type="text"
               id="multicol-email"
               class="form-control"
               placeholder="프로그램명"
               value= "${programModify.task_name}"
               aria-label="john.doe"
               aria-describedby="multicol-email2" />
           </div>
         </div>
       </div>
       <%-- <div class="row mb-3">
         <label class="col-sm-3 col-form-label" for="multicol-user">담당자</label>
         <div class="col-sm-9">
           <input type="text" id="multicol-user" class="form-control" placeholder="담당자" value="${programModify.empinfo_name}" />
         </div>
       </div> --%>
       <div class="row mb-3">
           <label class="col-sm-3 col-form-label" for="TagifyUserList2">담당자</label>
           <div class="col-sm-9">
               <input type="text" id="TagifyUserList2" class="form-control" name="emp_note"/>
           </div>
       </div>
       
       <div class="row form-password-toggle mb-3">
         <label class="col-sm-3 col-form-label" for="multicol-password">URL</label>
         <div class="col-sm-9">
           <div class="input-group input-group-merge">
             <input
               type="text"
               id="multicol-password"
               class="form-control"
               value="${programModify.task_url}"
               placeholder="URL"
               aria-describedby="multicol-password2" />
           </div>
         </div>
       </div>
       <div class="row mb-3">
         <label class="col-sm-3 col-form-label" for="task-priority">작업 중요도</label>
         
         <div class="col-sm-9">
           <select id="task-priority" class="select2 form-select" data-allow-clear="true">
           	 <c:if test="${programModify.task_importance == null}">
	           	 <option value="">선택</option>
	             <option value="상">상</option>
	             <option value="중">중</option>
	             <option value="하">하</option>
           	 </c:if>
           	 <c:if test="${programModify.task_importance == '상'}">
	           	 <option value="">선택</option>
	             <option value="상" selected="selected">상</option>
	             <option value="중">중</option>
	             <option value="하">하</option>
           	 </c:if>
           	 <c:if test="${programModify.task_importance == '중'}">
	           	 <option value="">선택</option>
	             <option value="상">상</option>
	             <option value="중" selected="selected">중</option>
	             <option value="하">하</option>
           	 </c:if>
           	 <c:if test="${programModify.task_importance == '하'}">
	           	 <option value="">선택</option>
	             <option value="상">상</option>
	             <option value="중">중</option>
	             <option value="하" selected="selected">하</option>
           	 </c:if>
           </select>
         </div>
       </div>
       <div class="row mb-3">
         <label class="col-sm-3 col-form-label" for="multicol-country">프로그램 유형</label>
         <div class="col-sm-9">
           <select id="multicol-country" class="select2 form-select" data-allow-clear="true">
             <c:if test="${programModify.task_category == null}">
	             <option value="">Select</option>
	             <option value="온라인">온라인</option>
	             <option value="배치">배치</option>
	             <option value="선택">선택</option>
          	 </c:if>
             <c:if test="${programModify.task_category == '온라인'}">
	             <option value="">Select</option>
	             <option value="온라인" selected="selected">온라인</option>
	             <option value="배치">배치</option>
	             <option value="선택">선택</option>
          	 </c:if>
             <c:if test="${programModify.task_category == '배치'}">
	             <option value="">Select</option>
	             <option value="온라인">온라인</option>
	             <option value="배치" selected="selected">배치</option>
	             <option value="선택">선택</option>
          	 </c:if>
             <c:if test="${programModify.task_category == '선택'}">
	             <option value="">Select</option>
	             <option value="온라인">온라인</option>
	             <option value="배치">배치</option>
	             <option value="선택" selected="selected">선택</option>
          	 </c:if>
           </select>
         </div>
       </div>
       <div class="row mb-3">
         <label class="col-sm-3 col-form-label" for="detail-category">세부 유형</label>
         <div class="col-sm-9">
           <select id="detail-category" class="select2 form-select" data-allow-clear="true">
           	 <c:if test="${programModify.task_detail == null}">
	             <option value="">선택</option>
	             <option value="화면(메인)">화면(메인)</option>
	             <option value="화면(탭)">화면(탭)</option>
	             <option value="화면(팝업)">화면(팝업)</option>
	             <option value="보고서">보고서</option>
	             <option value="배치">배치</option>
          	 </c:if>
           	 <c:if test="${programModify.task_detail == '화면(메인)'}">
	             <option value="">선택</option>
	             <option value="화면(메인)" selected="selected">화면(메인)</option>
	             <option value="화면(탭)">화면(탭)</option>
	             <option value="화면(팝업)">화면(팝업)</option>
	             <option value="보고서">보고서</option>
	             <option value="배치">배치</option>
          	 </c:if>
           	 <c:if test="${programModify.task_detail == '화면(탭)'}">
	             <option value="">선택</option>
	             <option value="화면(메인)">화면(메인)</option>
	             <option value="화면(탭)" selected="selected">화면(탭)</option>
	             <option value="화면(팝업)">화면(팝업)</option>
	             <option value="보고서">보고서</option>
	             <option value="배치">배치</option>
          	 </c:if>
           	 <c:if test="${programModify.task_detail == '화면(팝업)'}">
	             <option value="">선택</option>
	             <option value="화면(메인)">화면(메인)</option>
	             <option value="화면(탭)">화면(탭)</option>
	             <option value="화면(팝업)" selected="selected">화면(팝업)</option>
	             <option value="보고서">보고서</option>
	             <option value="배치">배치</option>
          	 </c:if>
           	 <c:if test="${programModify.task_detail == '보고서'}">
	             <option value="">선택</option>
	             <option value="화면(메인)">화면(메인)</option>
	             <option value="화면(탭)">화면(탭)</option>
	             <option value="화면(팝업)">화면(팝업)</option>
	             <option value="보고서" selected="selected">보고서</option>
	             <option value="배치">배치</option>
          	 </c:if>
           	 <c:if test="${programModify.task_detail == '배치'}">
	             <option value="">선택</option>
	             <option value="화면(메인)">화면(메인)</option>
	             <option value="화면(탭)">화면(탭)</option>
	             <option value="화면(팝업)">화면(팝업)</option>
	             <option value="보고서">보고서</option>
	             <option value="배치" selected="selected">배치</option>
          	 </c:if>
           </select>
         </div>
       </div>
       <div class="row mb-3">
         <label class="col-sm-3 col-form-label" for="flatpickr-range">개발 예정 기간</label>
         <div class="col-sm-9">
           <input
             type="text"
             class="form-control"
             value="${programModify.task_date}"
             placeholder="YYYY-MM-DD to YYYY-MM-DD"
             id="flatpickr-range" />
         </div>
       </div>
     <div class="row mb-3">
	  <label class="col-sm-3 form-label" for="flatpickr-date">실적 시작</label>
	  <div class="col-sm-9">
		  <input type="text" class="form-control" placeholder="YYYY-MM-DD" value="${programModify.task_realstart}" id="flatpickr-date"/>
	  </div>
	 </div>
	             <div class="row mb-3">
	  <label class="col-sm-3 form-label" for="flatpickr-disabled-range">실적 종료</label>
	  <div class="col-sm-9">
	  	<input type="text" class="form-control" placeholder="YYYY-MM-DD" value="${programModify.task_realend}" id="flatpickr-disabled-range" />
	  </div>
	 </div>
    <div class="row mb-3">
      <label class="col-sm-3 col-form-label" for="task-progress">작업진척율</label>
      <div class="col-sm-9">
        <select id="task-progress" class="select2 form-select" data-allow-clear="true">
          <c:if test="${programModify.task_status == null}">
	          <option value="">선택</option>
	          <option value="미진행">미진행</option>
	          <option value="화면개발">화면개발</option>
	          <option value="단위테스트">단위테스트</option>
	          <option value="PL테스트">PL테스트</option>
	          <option value="완료">완료</option>
          </c:if>
          <c:if test="${programModify.task_status == '미진행'}">
	          <option value="">선택</option>
	          <option value="미진행" selected="selected">미진행</option>
	          <option value="화면개발">화면개발</option>
	          <option value="단위테스트">단위테스트</option>
	          <option value="PL테스트">PL테스트</option>
	          <option value="완료">완료</option>
          </c:if>
          <c:if test="${programModify.task_status == '화면개발'}">
	          <option value="">선택</option>
	          <option value="미진행">미진행</option>
	          <option value="화면개발" selected="selected">화면개발</option>
	          <option value="단위테스트">단위테스트</option>
	          <option value="PL테스트">PL테스트</option>
	          <option value="완료">완료</option>
          </c:if>
          <c:if test="${programModify.task_status == '단위테스트'}">
	          <option value="">선택</option>
	          <option value="미진행">미진행</option>
	          <option value="화면개발">화면개발</option>
	          <option value="단위테스트" selected="selected">단위테스트</option>
	          <option value="PL테스트">PL테스트</option>
	          <option value="완료">완료</option>
          </c:if>
          <c:if test="${programModify.task_status == 'PL테스트'}">
	          <option value="">선택</option>
	          <option value="미진행">미진행</option>
	          <option value="화면개발">화면개발</option>
	          <option value="단위테스트">단위테스트</option>
	          <option value="PL테스트" selected="selected">PL테스트</option>
	          <option value="완료">완료</option>
          </c:if>
          <c:if test="${programModify.task_status == '완료'}">
	          <option value="">선택</option>
	          <option value="미진행">미진행</option>
	          <option value="화면개발">화면개발</option>
	          <option value="단위테스트">단위테스트</option>
	          <option value="PL테스트">PL테스트</option>
	          <option value="완료" selected="selected">완료</option>
          </c:if>
        </select>
      </div>
    </div>
    <div class="pt-4">
      <c:if test="${now_emp_no == 0 || now_emp_no == 1}">
	      <div class="row justify-content-end">
	        <div class="col-sm-12 col-md-8 ps-4">
	          <button id="programModify" type="submit" class="btn btn-primary me-sm-2 me-1 mb-2" >수정</button>
	          <button id="programDelete" type="button" class="btn btn-danger me-sm-2 me-1 mb-2" onclick="javascript:deleteProgram(${programModify.task_no})">삭제</button>
	          <button type="reset" class="btn btn-label-secondary mb-2 me-1">취소</button>
	        </div>
	      </div>
      </c:if>
      <c:if test="${programModify.emp_no != 0}">
	      <c:if test="${programModify.emp_no == now_emp_no}">
		      <div class="row justify-content-end">
		        <div class="col-sm-12 col-md-8 ps-4">
		          <button id="programModify" type="submit" class="btn btn-primary me-sm-2 me-1 mb-2" >수정</button>
		          <button type="reset" class="btn btn-label-secondary mb-2 me-1">취소</button>
		        </div>
		      </div>
	      </c:if>
      </c:if>
    </div>
  </form>
</div>

    <!-- Page JS -->
<script src="${pageContext.request.contextPath}/resources/assets/js/forms-pickers.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/modifyProgramAjax.js"></script>
    
<script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/tagify/tagify.js"></script>
