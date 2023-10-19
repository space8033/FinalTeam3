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

    <!-- Helpers -->
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/js/helpers.js"></script>
    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Template customizer: To hide customizer set displayCustomizer value false in config.js.  -->
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/js/template-customizer.js"></script>
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/config.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script type="text/javascript">



    document.addEventListener("DOMContentLoaded", function () {
    	  // 전송 버튼 요소와 메시지 입력란 요소 가져오기
    	  const sendButton = document.getElementById("button-send");
    	  const messageInput = document.getElementById("msg");
    	  const msgArea = document.getElementById("msgArea");

    	  if (sendButton) {
    	    // 전송 버튼에 클릭 이벤트 리스너 추가
    	    sendButton.addEventListener("click", function (e) {
    	      sendMessage();
    	      console.log("되???");
    	    });
    	  }

    	  const sock = new SockJS("http://localhost:8080/exodia/chat4");
    	  sock.onmessage = onMessage;
    	  sock.onclose = onClose;
    	  sock.onopen = onOpen;

    	  function sendMessage() {
    	    sock.send(messageInput.value);
    	  }

    	  function onMessage(msg) {
    	    const data = msg.data;
    	    const arr = data.split(":");

    	    for (let i = 0; i < arr.length; i++) {
    	      console.log("arr[" + i + "]: " + arr[i]);
    	    }

    	    const cur_session = "YOUR_USER_ID"; // 현재 세션에 로그인 한 사람
    	    console.log("cur_session : " + cur_session);

    	    const sessionId = arr[0];
    	    const message = arr[1];

    	    if (sessionId === cur_session) {
    	      appendMessage(msgArea, sessionId, message, "alert-secondary");
    	    } else {
    	      appendMessage(msgArea, sessionId, message, "alert-warning");
    	    }
    	  }

    	  function onClose(evt) {
    	    const user = "YOUR_USERNAME";
    	    const str = user + " 님이 퇴장하셨습니다.";
    	    appendMessage(msgArea, "", str, "alert-info");
    	  }

    	  function onOpen(evt) {
    	    const user = "YOUR_USERNAME";
    	    const str = user + " 님이 입장하셨습니다.";
    	    appendMessage(msgArea, "", str, "alert-info");
    	  }

    	  // 메시지를 추가하는 함수
    	  function appendMessage(parent, sessionId, message, className) {
    	    const div = document.createElement("div");
    	    div.className = "col-6";
    	    const alertDiv = document.createElement("div");
    	    alertDiv.className = "alert " + className;
    	    alertDiv.innerHTML = "<b>" + sessionId + " : " + message + "</b>";
    	    div.appendChild(alertDiv);
    	    parent.appendChild(div);
    	  }
    	});


</script>
  </head>

  <body>
   <div class="container">
	<div class="col-6">
		<label><b>채팅방</b></label>
	</div>
	<div>
		<div id="msgArea" class="col">
		
		</div>
		<div class="col-6">
		<div class="input-group mb-3">
			<input type="text" id="msg" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2">
			<div class="input-group-append">
				<button class="btn btn-outline-secondary" type="button" id="button-send">전송</button>
			</div>
		</div>
		</div>
	</div>
	<div class="col-6">
	</div>
	</div>
  </body>
</html>
