/**
 * App Chat
 */

'use strict';




let chatsock;
function connect() {
	chatsock = new SockJS("http://localhost:8080/exodia/chat");
	chatsock.onopen = onOpen;
	chatsock.onmessage = onMessage;
	console.log(chatsock.send);

}

function onOpen() {
	var empInfo_no = $("#alarmId").val();
		var chatNo = $("#chatNo").val();
		console.log(empInfo_no+"넘버갖고오걸아");
		console.log(chatNo+"챗넘버갖고오걸아");
	
	const  data = {
		"chatRoom_no" : chatNo,
		"empInfo_no" : empInfo_no,
		"message_content" : "ENTER-CHAT"
			
	};
	let jsonData = JSON.stringify(data);
	console.log(jsonData+"어케돼있누");
	chatsock.send(jsonData);
	console.log(chatsock);
	
}


function chatRoom(emp_no) {
	console.log("들어는오나용 ㅎㅎ");
	
	  
   var data = {
		 emp_no: emp_no
	};
	
	$.ajax({
		url: "/exodia/chatRoom",
		type: "GET",
		data: data
		
	}).done(function(result) {
 
		
   	    var html = jQuery('<div>').html(result);
        var contents = html.find("div#chatRoomContent").html();
     	$("#chatRoom").html(contents);
     	
     	connect();
        new PerfectScrollbar('.app-chat-contacts .sidebar-body', {
		        wheelPropagation: false,
		        suppressScrollX: true
		      });
		    

		    // Chat history scrollbar
		      new PerfectScrollbar('.chat-history-body', {
		        wheelPropagation: false,
		        suppressScrollX: true
		      });
		    

		    // Sidebar left scrollbar
		      new PerfectScrollbar('.app-chat-sidebar-left .sidebar-body', {
		        wheelPropagation: false,
		        suppressScrollX: true
		      });
		    

		    // Sidebar right scrollbar
		      new PerfectScrollbar('.app-chat-sidebar-right .sidebar-body', {
		        wheelPropagation: false,
		        suppressScrollX: true
		     });
		    
		     $("li").removeClass("active"); // 모든 li 요소에서 active 클래스 제거
		     $("#"+emp_no).addClass("active");
		     
		     
		     const searchInput = document.querySelector('.chat-search-input');
		     searchInput.addEventListener('keyup', e => {
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
		     
		     function searchChatContacts(searchListItems, searchListItemsCount, searchValue, listItem0) {
		         searchListItems.forEach(searchListItem => {
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
		         // Display no search fount if searchListItemsCount == 0
		         if (searchListItemsCount == 0) {
		           listItem0.classList.remove('d-none');
		         } else {
		           listItem0.classList.add('d-none');
		         }
		       }
	
	});
	
}

function buttonSend() {
	  var messageInput = $('.message-input');
	  if (messageInput.val()) {
		    // Create a div and add a class
	    var renderMsg = $('<li class="chat-message chat-message-right"></li>');
	    var currentDate = new Date();
	    var options = { year: 'numeric', month: 'long', day: 'numeric', hour: '2-digit', minute: '2-digit', second: '2-digit' };
	    var formattedDate = new Intl.DateTimeFormat('en-US', options).format(currentDate);
	    console.log(formattedDate+"오늘날짜");
	    
	    
	      renderMsg.html('<div class="d-flex overflow-hidden">' +
	      '<div class="chat-message-wrapper flex-grow-1 w-50">' +
	      '<div class="chat-message-text">' +
	      '<p class="mb-0 text-break">' + messageInput.val() + '</p>' +
	      '</div>' +
	      '<div class="text-end text-muted mt-1">' +
	      '<i class="bx bx-check-double"></i>' +
	      ' <small>' + formattedDate + '</small>' +
	      '</div>' +
	      '</div>' +
	      '<div class="user-avatar flex-shrink-0 ms-3">' +
	      '<div class="avatar avatar-sm">' +
	      '<img src="/exodia/resources/assets/img/avatars/1.png" alt="Avatar" class="rounded-circle" />' +
	      '</div>' +
	      '</div>' +
	      '</div>');

	    // Append the message to the chat container
		    $('.chat-history').append(renderMsg);
	    
	    sendMessage();
	    messageInput.val('');
	    scrollToBottom();
	   /* 
	    new PerfectScrollbar('.chat-history-body', {
		        wheelPropagation: false,
		        suppressScrollX: true
		   });*/
	    	
	  }
	
}

function sendMessage() {
	var messageInput = $('.message-input').val();
	var empInfo_no = $("#alarmId").val();
	var chatNo = $("#chatNo").val();
	
	const data = {
		"chatRoom_no" : chatNo,
		"empInfo_no" : empInfo_no,
		"message_content" : messageInput
			
	};
	
	let jsonData = JSON.stringify(data);
	
	chatsock.send(jsonData);
	sock.send(jsonData);
}

function onMessage(evt) {
	console.log(evt+"들어오긴하닝 ㅎㅎ");
	
	let receive = evt.data.split(",");
	
	const data = {
			"empInfo_no" : receive[0],
			"message_content" : receive[1]
			
	};
	var empInfo_no = $("#alarmId").val();
	if(data.empInfo_no != empInfo_no) {
		checkLR(data);
	}
}


function checkLR(data) {
	
	console.log("어디가 문젠지 알ㄹ줘야 고치지?"+ data);
    var currentDate = new Date();
    var options = { year: 'numeric', month: 'long', day: 'numeric', hour: '2-digit', minute: '2-digit', second: '2-digit' };
    var formattedDate = new Intl.DateTimeFormat('en-US', options).format(currentDate);
    console.log(formattedDate+"오늘날짜");
    
    var renderMsg = $('<li class="chat-message"></li>');
    renderMsg.html('<div class="d-flex overflow-hidden">' +
    		 '<div class="user-avatar flex-shrink-0 me-3">' +
    	      '<div class="avatar avatar-sm">' +
    	      '<img src="/exodia/resources/assets/img/avatars/1.png" alt="Avatar" class="rounded-circle" />' +
    	      '</div>' +
    	      '</div>' +
      '<div class="chat-message-wrapper flex-grow-1 w-50">' +
      '<div class="chat-message-text">' +
      '<p class="mb-0 text-break">' + data.message_content + '</p>' +
      '</div>' +
      '<div class="text-end text-muted mt-1">' +
      '<i class="bx bx-check-double"></i>' +
      ' <small>' + formattedDate + '</small>' +
      '</div>' +
      '</div>' +
     
      '</div>');

	    // Append the message to the chat container
	    $('.chat-history').append(renderMsg);
    
    scrollToBottom();
    
    new PerfectScrollbar('.chat-history-body', {
	        wheelPropagation: false,
	        suppressScrollX: true
	});

	
}

function scrollToBottom() {
	  var chatHistoryBody = $('.chat-history-body');
	  chatHistoryBody.scrollTop(chatHistoryBody[0].scrollHeight);
}


document.addEventListener('DOMContentLoaded', function () {
  (function () {
    const chatContactsBody = document.querySelector('.app-chat-contacts .sidebar-body'),
      chatContactListItems = [].slice.call(
        document.querySelectorAll('.chat-contact-list-item:not(.chat-contact-list-item-title)')
      ),
      chatHistoryBody = document.querySelector('.chat-history-body'),
      chatSidebarLeftBody = document.querySelector('.app-chat-sidebar-left .sidebar-body'),
      chatSidebarRightBody = document.querySelector('.app-chat-sidebar-right .sidebar-body'),
      chatUserStatus = [].slice.call(document.querySelectorAll(".form-check-input[name='chat-user-status']")),
      chatSidebarLeftUserAbout = $('.chat-sidebar-left-user-about'),
      formSendMessage = document.querySelector('.form-send-message'),
      messageInput = document.querySelector('.message-input'),
      msgArea = document.getElementById("msgArea"),
      myName = document.getElementById("name"),
      searchInput = document.querySelector('.chat-search-input'),
      speechToText = $('.speech-to-text'), // ! jQuery dependency for speech to text
      userStatusObj = {
        active: 'avatar-online',
        offline: 'avatar-offline',
        away: 'avatar-away',
        busy: 'avatar-busy'
      };

    // Initialize PerfectScrollbar
    // ------------------------------
    
    
    if(myName){
	    var emp_no = "46";
	    var data = {
	   		 emp_no: emp_no
	   	};
	   	
	   	$.ajax({
	   		url: "/exodia/chatRoom",
	   		type: "GET",
	   		data: data
	   		
	   	}).done(function(result) {
	    
	      	  var html = jQuery('<div>').html(result);
	            var contents = html.find("div#chatRoomContent").html();
	        	  $("#chatRoom").html(contents);
	        	console.log("값은받아오나용 ㅠ");
	        	 new PerfectScrollbar('.app-chat-contacts .sidebar-body', {
     		        wheelPropagation: false,
     		        suppressScrollX: true
     		      });
     		    

     		    // Chat history scrollbar
     		      new PerfectScrollbar('.chat-history-body', {
     		        wheelPropagation: false,
     		        suppressScrollX: true
     		      });
     		    

     		    // Sidebar left scrollbar
     		      new PerfectScrollbar('.app-chat-sidebar-left .sidebar-body', {
     		        wheelPropagation: false,
     		        suppressScrollX: true
     		      });
     		    

     		    // Sidebar right scrollbar
     		      new PerfectScrollbar('.app-chat-sidebar-right .sidebar-body', {
     		        wheelPropagation: false,
     		        suppressScrollX: true
     		     });
     		    
     		     $("li").removeClass("active"); // 모든 li 요소에서 active 클래스 제거
     		     $("#"+emp_no).addClass("active");
     		    
     		    
     		    
     		    
     		  
	        	$('.form-send-message').on('submit', function (e) {
	        		  e.preventDefault();
	        		  var messageInput = $('.message-input');
	        		  if (messageInput.val()) {
	        		    // Create a div and add a class
	        		    //sendMessage();
	        		    var renderMsg = $('<div class="chat-message-text mt-2"></div>');
	        		    renderMsg.html('<p class="mb-0 text-break">' + messageInput.val() + '</p>');
	        		    $('li:last-child .chat-message-wrapper').append(renderMsg);
	        		    messageInput.val('');
	        		    
	        		    
	         		    scrollToBottom();
	         		    

	         		   function scrollToBottom() {
	         		   	  var chatHistoryBody = $('.chat-history-body');
	         		   	  chatHistoryBody.scrollTop(chatHistoryBody[0].scrollHeight);
	         		   	  scrollToBottom();
	         		   }
	        		  
	        		  }
	        	});
	        	
	        	scrollToBottom();
	        	
	   	});
    }
	 
	  
    // Chat contacts scrollbar
    if (chatContactsBody) {
      new PerfectScrollbar(chatContactsBody, {
        wheelPropagation: false,
        suppressScrollX: true
      });
    }

    // Chat history scrollbar
    if (chatHistoryBody) {
      new PerfectScrollbar(chatHistoryBody, {
        wheelPropagation: false,
        suppressScrollX: true
      });
    }

    // Sidebar left scrollbar
    if (chatSidebarLeftBody) {
      new PerfectScrollbar(chatSidebarLeftBody, {
        wheelPropagation: false,
        suppressScrollX: true
      });
    }

    // Sidebar right scrollbar
    if (chatSidebarRightBody) {
      new PerfectScrollbar(chatSidebarRightBody, {
        wheelPropagation: false,
        suppressScrollX: true
      });
    }

    // Scroll to bottom function
    function scrollToBottom() {
      chatHistoryBody.scrollTo(0, chatHistoryBody.scrollHeight);
    }
    scrollToBottom();

    // User About Maxlength Init
    if (chatSidebarLeftUserAbout.length) {
      chatSidebarLeftUserAbout.maxlength({
        alwaysShow: true,
        warningClass: 'label label-success bg-success text-white',
        limitReachedClass: 'label label-danger',
        separator: '/',
        validate: true,
        threshold: 120
      });
    }

    // Update user status
    chatUserStatus.forEach(el => {
      el.addEventListener('click', e => {
        let chatLeftSidebarUserAvatar = document.querySelector('.chat-sidebar-left-user .avatar'),
          value = e.currentTarget.value;
        //Update status in left sidebar user avatar
        chatLeftSidebarUserAvatar.removeAttribute('class');
        Helpers._addClass('avatar avatar-xl ' + userStatusObj[value] + '', chatLeftSidebarUserAvatar);
        //Update status in contacts sidebar user avatar
        let chatContactsUserAvatar = document.querySelector('.app-chat-contacts .avatar');
        chatContactsUserAvatar.removeAttribute('class');
        Helpers._addClass('flex-shrink-0 avatar ' + userStatusObj[value] + ' me-3', chatContactsUserAvatar);
      });
    });

    // Select chat or contact
    chatContactListItems.forEach(chatContactListItem => {
      // Bind click event to each chat contact list item
      chatContactListItem.addEventListener('click', e => {
    	  
    	 
	          // Remove active class from chat contact list item
	          chatContactListItems.forEach(chatContactListItem => {
	        	  chatContactListItem.classList.remove('active');
	          });
	          // Add active class to current chat contact list item
	          e.currentTarget.classList.add('active');
        
       /* var html = jQuery('<div>').html();
    	var contents = html.find("div#chatRoom").html();
    	$("#chatRoomContent").html(contents);*/
        
        
        
		
      });
    });

    // Filter Chats
    if (searchInput) {
      searchInput.addEventListener('keyup', e => {
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
    }

    // Search chat and contacts function
    function searchChatContacts(searchListItems, searchListItemsCount, searchValue, listItem0) {
      searchListItems.forEach(searchListItem => {
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
      // Display no search fount if searchListItemsCount == 0
      if (searchListItemsCount == 0) {
        listItem0.classList.remove('d-none');
      } else {
        listItem0.classList.add('d-none');
      }
    }
    
   /* function sendMessage() {
  	    sock.send(messageInput.value);
  	}*/

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

    /*// Send Message
    formSendMessage.addEventListener('submit', e => {
      e.preventDefault();
      if (messageInput.value) {
        // Create a div and add a class
    	sendMessage();
        let renderMsg = document.createElement('div');
        renderMsg.className = 'chat-message-text mt-2';
        renderMsg.innerHTML = '<p class="mb-0 text-break">' + messageInput.value + '</p>';
        document.querySelector('li:last-child .chat-message-wrapper').appendChild(renderMsg);
        messageInput.value = '';
        scrollToBottom();
      }
    });*/
    
    
  	  
  	  

    // on click of chatHistoryHeaderMenu, Remove data-overlay attribute from chatSidebarLeftClose to resolve overlay overlapping issue for two sidebar
    let chatHistoryHeaderMenu = document.querySelector(".chat-history-header [data-target='#app-chat-contacts']"),
      chatSidebarLeftClose = document.querySelector('.app-chat-sidebar-left .close-sidebar');
    chatHistoryHeaderMenu.addEventListener('click', e => {
      chatSidebarLeftClose.removeAttribute('data-overlay');
    });
    // }

    // Speech To Text
    if (speechToText.length) {
      var SpeechRecognition = SpeechRecognition || webkitSpeechRecognition;
      if (SpeechRecognition !== undefined && SpeechRecognition !== null) {
        var recognition = new SpeechRecognition(),
          listening = false;
        speechToText.on('click', function () {
          const $this = $(this);
          recognition.onspeechstart = function () {
            listening = true;
          };
          if (listening === false) {
            recognition.start();
          }
          recognition.onerror = function (event) {
            listening = false;
          };
          recognition.onresult = function (event) {
            $this.closest('.form-send-message').find('.message-input').val(event.results[0][0].transcript);
          };
          recognition.onspeechend = function (event) {
            listening = false;
            recognition.stop();
          };
        });
      }
    }
  })();
});
