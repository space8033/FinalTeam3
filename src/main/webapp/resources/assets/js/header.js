$(document).ready(function(){
    $("#upgradePlanForm").submit(function(e){
        e.preventDefault(); // 기본 동작 방지

    });
    
    $("#confirmBtn").click(function(e) {
    	var emp_password = $("#choosePlan").val(); // 입력된 비밀번호 가져오기
    	
    	// AJAX 요청 보내기
    	$.ajax({
    		type: "POST",
    		url: "/exodia/employee/confirmPassword",
    		data: { emp_password: emp_password },
    		success: function(data){
    			if(data === true){
    				// 비밀번호가 일치하는 경우에 수행할 작업
    				alert("비밀번호가 확인되었습니다!");
    				$("#upgradePlanModal").modal("hide"); // 모달 닫기
    				window.location.href="/exodia/employee/initialPassword"
    					
    			} else {
    				// 비밀번호가 일치하지 않는 경우에 수행할 작업
    				alert("입력한 비밀번호가 일치하지 않습니다. 다시 시도해주세요.");
    			}
    		},
    		error: function(){
    			// 오류 처리
    			alert("서버 오류가 발생했습니다. 다시 시도해주세요.");
    		}
    	});
    	
    });
});