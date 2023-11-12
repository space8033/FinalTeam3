/**
 * App Chat
 */

'use strict';




let chatsock;
function connect() {
	
	if(chatsock) {
		chatsock.close();
		
	}
	
	chatsock = new SockJS("http://192.168.0.27:8080/exodia/chat");
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
     	
     	var chatNo = $("#chatNo").val();
     	console.log(chatNo+"챗방번호");
     	
     	var postdata = {
     			 emp_no: emp_no,
     			 chatNo: chatNo 
     		};
     		
     		$.ajax({
     			url: "/exodia/updateUckMsg",
     			type: "POST",
     			data: postdata
     			
     		}).done(function(result) {
     	
     		$("#uck-" + emp_no).text(' ');
     		$("#uck-" + emp_no).removeClass("bg-danger");
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
			     
			     var empinfono = $("#chatEmpInfoNo").val();
			     $("#"+empinfono).addClass("active");
			     console.log(empinfono+"모지?ㅠ");
			     scrollToBottom();
			     
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
			     
			     function handleKeyPress(event) {
			    	    if (event.key === "Enter") {
			    	    	buttonSend();
			    	    }
			    	}
			     
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
	
	});
	
}



function buttonSend() {
	  var inputValue = $('.message-input').val();
	  if (inputValue.trim() !== "") {
		    // Create a div and add a class
	    var renderMsg = $('<li class="chat-message chat-message-right"></li>');
	    var currentDate = new Date();
	    var hour = currentDate.getHours();
	    var minute = currentDate.getMinutes();
	    var period = (hour < 12) ? '오전' : '오후';

	    if (hour > 12) {
	        hour -= 12;
	    }

	    var formattedDate = period + ' ' + hour + ':' + (minute < 10 ? '0' : '') + minute;
	    console.log(formattedDate + " 오늘날짜");
	    
	    
	      renderMsg.html('<div class="d-flex overflow-hidden">' +
	      '<div class="chat-message-wrapper flex-grow-1 w-50">' +
	      '<div class="chat-message-text">' +
	      '<p class="mb-0 text-break">' + inputValue + '</p>' +
	      '</div>' +
	      '<div class="text-end text-muted mt-1">' +
	      '<i class="bx bx-check-double"></i>' +
	      ' <small>' + formattedDate + '</small>' +
	      '</div>' +
	      '</div>' +
	      '<div class="user-avatar flex-shrink-0 ms-3">' +
	      '<div class="avatar">' +
	      '<span class="avatar-initial rounded-circle bg-label-primary" style="font-size: 13px;">시온</span>' +
	      '</div>' +
	      '</div>' +
	      '</div>');

	      var appendedMsg = $('.chat-history').append(renderMsg);
	      sendMessage();

	        // Find the appended checkDoubleElement and add the class
	        
	    var messageInput = $('.message-input');
	    messageInput.val('');
	    
	    scrollToBottom();
	    	
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
	//sock.send(jsonData);
}

function onMessage(evt) {
	var emp_no = $("#chatEmpInfoNo").val();
	
    var postdata = {
   		 emp_no: emp_no
   	};
   	
   	$.ajax({
   		url: "/exodia/chatList",
   		type: "GET",
   		data: postdata
   		
   	}).done(function(result) {
    
   		
      	    var html = jQuery('<div>').html(result);
           var contents = html.find("div#chatList").html();
        	$("#app-chat-contacts").html(contents);
        	
           new PerfectScrollbar('.app-chat-contacts .sidebar-body', {
   		        wheelPropagation: false,
   		        suppressScrollX: true
   		      });
           $("li").removeClass("active"); // 모든 li 요소에서 active 클래스 제거
		     
		     var empinfono = $("#chatEmpInfoNo").val();
		     $("#"+empinfono).addClass("active");
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
   		     
   		     function handleKeyPress(event) {
   		    	    if (event.key === "Enter") {
   		    	    	buttonSend();
   		    	    }
   		    	}
   		     
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
   
	$("li").removeClass("active"); // 모든 li 요소에서 active 클래스 제거
    
    var empinfono = $("#chatEmpInfoNo").val();
    console.log(empinfono+"왜애드클래스갑자기못해너?");
    $("#"+empinfono).addClass("active");
	
	console.log(evt+"들어오긴하닝 ㅎㅎ");
	
	let receive = evt.data.split(",");
	
	const data = {
			"emp_read" : receive[0],
			"empInfo_no" : receive[1],
			"message_content" : receive[2]
			
	};
	var empInfo_no = $("#alarmId").val();
	
	// 실시간 읽음 확인용
	
	if(data.emp_read === "읽음") {
		var checkDoubleElement = $('.bx.bx-check-double');
	    checkDoubleElement.addClass('text-success');
	}
	
	if(data.empInfo_no != empInfo_no && data.message_content != null) {
		checkLR(data);
	}
	

	
}


function checkLR(data) {
	
	console.log("어디가 문젠지 알ㄹ줘야 고치지?"+ data);
	var renderMsg = $('<li class="chat-message chat-message-right"></li>');
    var currentDate = new Date();
    var hour = currentDate.getHours();
    var minute = currentDate.getMinutes();
    var period = (hour < 12) ? '오전' : '오후';

    if (hour > 12) {
        hour -= 12;
    }

    var formattedDate = period + ' ' + hour + ':' + (minute < 10 ? '0' : '') + minute;
    console.log(formattedDate + " 오늘날짜");
    
    var renderMsg = $('<li class="chat-message"></li>');
    renderMsg.html('<div class="d-flex overflow-hidden">' +
    		 '<div class="user-avatar flex-shrink-0 me-3">' +
    	      '<div class="avatar">' +
    	      '<span class="avatar-initial rounded-circle bg-label-primary" style="font-size: 13px;">재롱</span>' +
    	      '</div>' +
    	      '</div>' +
      '<div class="chat-message-wrapper flex-grow-1 w-50">' +
      '<div class="chat-message-text">' +
      '<p class="mb-0 text-break">' + data.message_content + '</p>' +
      '</div>' +
      '<div class="text-muted mt-1">' +
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
      chatList = document.getElementById("app-chat-contacts"),
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

    if(chatList) {
    	var emp_no = "24";
	    var data = {
	   		 emp_no: emp_no
	   	};
	   	
	   	$.ajax({
	   		url: "/exodia/chatList",
	   		type: "GET",
	   		data: data
	   		
	   	}).done(function(result) {
	    
	   		
	      	    var html = jQuery('<div>').html(result);
	           var contents = html.find("div#chatList").html();
	        	$("#app-chat-contacts").html(contents);
	        	
	           new PerfectScrollbar('.app-chat-contacts .sidebar-body', {
	   		        wheelPropagation: false,
	   		        suppressScrollX: true
	   		      });
	   		    
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
	   		     
	   		     function handleKeyPress(event) {
	   		    	    if (event.key === "Enter") {
	   		    	    	buttonSend();
	   		    	    }
	   		    	}
	   		     
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
  /*  function scrollToBottom() {
      chatHistoryBody.scrollTo(0, chatHistoryBody.scrollHeight);
    }
    scrollToBottom();*/

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
  /*  let chatHistoryHeaderMenu = document.querySelector(".chat-history-header [data-target='#app-chat-contacts']"),
      chatSidebarLeftClose = document.querySelector('.app-chat-sidebar-left .close-sidebar');
    chatHistoryHeaderMenu.addEventListener('click', e => {
      chatSidebarLeftClose.removeAttribute('data-overlay');
    });*/
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
