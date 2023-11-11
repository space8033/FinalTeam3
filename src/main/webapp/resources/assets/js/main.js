/**
 * Main
 */

'use strict';


	
	const sock = new SockJS("http://localhost:8080/exodia/header");
	   
	sock.onopen = function() {
		
		wsSend();
		
	
	};
	
	var wsSend=()=>{
	      setInterval(function() {
	    	  var emp_id = $("#alarmId").val();
	         sock.send(emp_id);
	      }, 10000);
    }

	sock.onmessage = function(e) {
		console.log("핸들러에서 전송한 메세지",e.data);
		
		const message = JSON.parse(e.data);
		const msg = message.msg;
		const count = message.count;
		const cmd = message.cmd;
		const title = message.title;
		const sender = message.sender;
		
		
		
	    var v_alarmIcon = document.querySelector("#alarmIcon");
	    if(v_alarmIcon) {
		    v_alarmIcon.classList.remove('d-none');
		    v_alarmIcon.innerText = count;
		    var alarmContent = document.querySelector("#alarm");
		    var bellAlarm = document.querySelector("#bellAlarm");
		    bellAlarm.classList.add("vibration");
		    setTimeout(function() {
		    	bellAlarm.classList.remove("vibration");
		    }, 2000);
		    

		    if (alarmContent.classList.contains("show")) {
		        // "show" 클래스가 있을 때 실행할 작업
		        console.log("alarmContent의 클래스에 'show'가 있습니다.");
		        showAlarm();
		        // 다른 작업 수행
		    } 
	    }
	    
	    
	    /*if(msg !== "") {
	    	var alarmToast = document.querySelector("#alarmToast");
	    	alarmToast.classList.add('show');
	    	var alarmMsg = document.querySelector("#alarmMsg");
	    	alarmMsg.innerText = msg;
	    }*/
	    
	    if(cmd === "쪽지") {
	    	var alarmToast = document.querySelector("#alarmToast");
	    	alarmToast.classList.add('show');
	    	var alarmMsg = document.querySelector("#alarmMsg");
	    	alarmMsg.innerText = "제목 : " + title + sender + "님으로부터 1개의 쪽지가 도착하였습니다!"
	    	setTimeout(function() {
	    		alarmToast.classList.remove("show");
		    }, 10000);
	    	
	    } else if(cmd === "채팅") {
	    	
	    	console.log("일단 채팅 여기들어오는지");
	    	var alarmToast = document.querySelector("#alarmToast");
	    	if(alarmToast) {
		    	alarmToast.classList.add('show');
		    	var alarmMsg = document.querySelector("#alarmMsg");
		    	alarmMsg.innerHTML = sender + "님으로부터 1:1 메세지가 도착하였습니다!" + "<br>" + "내용 : " + title;
		    	setTimeout(function() {
		    		alarmToast.classList.remove("show");
			    }, 100000);
	    	}
	
	    	var chatList = $("#app-chat-contacts");
	    	if(chatList) {
	    		console.log("일단 채팅리스트가있는지");
	    		var emp_no = $("#empInfoNo").val();
	    		if(emp_no == null) {
	    			emp_no = "챗방없음";
	    		}
	    		
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
	    	
	    		
	    	
	    }
	};

	function wsSend() {
	   
	}
	
	function sendMsg() {
		var title = document.querySelector("#email-subject").value;
		var sender = document.getElementById('alarmId').value;
		var receiver = document.getElementById('emailContacts').value;
		var receiverCC = document.getElementById('selectpickerSelectDeselect').value;
		var receiverBCC = document.getElementById('selecBcc').value;
		let socketMsg = "note,"+title+","+sender+","+receiver+","+receiverCC+","+receiverBCC;
		console.log(socketMsg+"가긴가니");
		sock.send(socketMsg);
		console.log("소켓메시지");
		
	}
	
	
function pageMove(alarm_no, alarm_type, alarm_typeNo) {
	var alarmType = alarm_type;
	var noteReadNo = alarm_typeNo;
	var alarmNo = alarm_no;
	const clickedItem = event.currentTarget;
	console.log(clickedItem);
	const excludedItem = document.querySelector(".dropdown-notifications-archive");
	if(alarmType === '쪽지' && clickedItem !==excludedItem) {
		var url = "/exodia/noteDetailView?noteReadNo=" + alarm_typeNo;
		var popup = window.open(url, "MyPopup", "width=800, height=500");
		var postData = {
				alarm_no: alarmNo
		};
		
		$.ajax({
		    	url: "/exodia/alarmRead",
		        type: "POST",
		        data: postData 
		        
		        }).done(function(result) {
		        	console.log("알람읽음처리완료");
		        	var data = {
		        	        readUpdateId: noteReadNo
		                };
		                
		                // AJAX 요청으로 데이터 전송
		                $.ajax({
		                	url: "/exodia/readUpdate",
		                    type: "POST",
		                    data: data,
		                    success: function(response) {
		                    	
		                    	let inbox = "수신";
		                		var postData = {
		                			inbox: inbox
		                        };
		                        
		                        // AJAX 요청으로 데이터 전송
		                        $.ajax({
		                        	url: "/exodia/noteInbox",
		                            type: "GET",
		                            data: postData
		                           
		                        }).done(function(result) {
		                        	console.log("결과확인");
		                        	var html = jQuery('<div>').html(result);
		                        	var contents = html.find("div#noteContent").html();
		                        	$("#refreshNoteContent").html(contents);
		                        	$("#app-email-view").removeClass("show");
		                        	
		                        	var emailListInstance = new PerfectScrollbar('.email-list', {
		                        	        wheelPropagation: false,
		                        	        suppressScrollX: true
		                        	});
		                        	
		                        }).fail(function (jqXHR, textStatus, errorThrown) {
		                        	console.log("에러");
		                        	console.log(jqXHR);
		                        	console.log(textStatus);
		                        	console.log(errorThrown);
		                        	
		                        });
		                    	
		                    },
		                    error: function() {
		                        // 오류 처리
		                        alert("데이터 전송 중 오류가 발생했습니다.");
		                    }
		                });
		        	
		        	
		        }).fail(function (jqXHR, textStatus, errorThrown) {
		        	console.log("에러");
		        	console.log(jqXHR);
		        	console.log(textStatus);
		        	console.log(errorThrown);
		        	
		        });
	  	 
  		
	
		
	} else if(alarmType === '채팅' && clickedItem !==excludedItem) {
		
		var url = "/exodia/chat";
	    var popup = window.open(url, "MyPopup", "width=1100, height=700");
		
	}
}

function alarmRemove(alarm_no) {
	console.log(alarm_no+"오긴함/");
	var postData = {
			alarm_no: alarm_no
	    };
	    
	    $.ajax({
	    	url: "/exodia/alarmRemove",
	        type: "POST",
	        data: postData 
	        
	        }).done(function(result) {
	        	console.log("결과확인");
	        	
	        }).fail(function (jqXHR, textStatus, errorThrown) {
	        	console.log("에러");
	        	console.log(jqXHR);
	        	console.log(textStatus);
	        	console.log(errorThrown);
	        	
	        });
}
function alarmRemoveAll() {
	var alarm = "알람삭제";
	var postData = {
			alarm: alarm
	};
	
	$.ajax({
		url: "/exodia/alarmRemoveAll",
		type: "POST",
		data: postData 
		
	}).done(function(result) {
		var v_alarmIcon = document.querySelector("#alarmIcon");
		v_alarmIcon.classList.add('d-none');
		console.log("결과확인");
		var empId = "sion";
		var postData = {
	        empId: empId
	    };
	    
	    $.ajax({
	    	url: "/exodia/alarmDetail",
	        type: "GET",
	        data: postData 
	        
	        }).done(function(result) {
	        	console.log("결과확인");
	        	var html = jQuery('<ul>').html(result);
	        	var contents = html.find("ul#alarmContent").html();
	        	$("#alarm").html(contents);
	        	window.Helpers.initNavbarDropdownScrollbar();
	        	const notificationMarkAsReadAll = document.querySelector('.dropdown-notifications-all');
	        	  const notificationMarkAsReadList = document.querySelectorAll('.dropdown-notifications-read');

	        	  // Notification: Mark as all as read
	        	  if (notificationMarkAsReadAll) {
	        	    notificationMarkAsReadAll.addEventListener('click', event => {
	        	      notificationMarkAsReadList.forEach(item => {
	        	        item.closest('.dropdown-notifications-item').classList.add('marked-as-read');
	        	      });
	        	    });
	        	  }
	        	  // Notification: Mark as read/unread onclick of dot
	        	  if (notificationMarkAsReadList) {
	        	    notificationMarkAsReadList.forEach(item => {
	        	      item.addEventListener('click', event => {
	        	        item.closest('.dropdown-notifications-item').classList.toggle('marked-as-read');
	        	      });
	        	    });
	        	  }

	        	  // Notification: Mark as read/unread onclick of dot
	        	  const notificationArchiveMessageList = document.querySelectorAll('.dropdown-notifications-archive');
	        	  notificationArchiveMessageList.forEach(item => {
	        	    item.addEventListener('click', event => {
	        	      item.closest('.dropdown-notifications-item').remove();
	        	    });
	        	  });
	        	
	        	
	        }).fail(function (jqXHR, textStatus, errorThrown) {
	        	console.log("에러");
	        	console.log(jqXHR);
	        	console.log(textStatus);
	        	console.log(errorThrown);
	        	
	        });
		
		
		
		
	}).fail(function (jqXHR, textStatus, errorThrown) {
		console.log("에러");
		console.log(jqXHR);
		console.log(textStatus);
		console.log(errorThrown);
		
	});
}

function alarmRead(alarm_no) {
	console.log(alarm_no+"오긴함/");
	var postData = {
			alarm_no: alarm_no
	};
	
	$.ajax({
		url: "/exodia/alarmRead",
		type: "POST",
		data: postData 
		
	}).done(function(result) {
		console.log("결과확인");
		
	}).fail(function (jqXHR, textStatus, errorThrown) {
		console.log("에러");
		console.log(jqXHR);
		console.log(textStatus);
		console.log(errorThrown);
		
	});
}

function alarmAllRead() {
	
	var alarm_no = "alarmNo";
	var postData = {
			alarm_no: alarm_no
	};
	
	$.ajax({
		url: "/exodia/alarmAllRead",
		type: "POST",
		data: postData 
		
	}).done(function(result) {
		console.log("결과확인");
		
	}).fail(function (jqXHR, textStatus, errorThrown) {
		console.log("에러");
		console.log(jqXHR);
		console.log(textStatus);
		console.log(errorThrown);
		
	});
}
	
	
function showAlarm() {
	  			 
	var empId = "sion";
	var postData = {
        empId: empId
    };
    
    $.ajax({
    	url: "/exodia/alarmDetail",
        type: "GET",
        data: postData 
        
        }).done(function(result) {
        	console.log("결과확인");
        	var html = jQuery('<ul>').html(result);
        	var contents = html.find("ul#alarmContent").html();
        	$("#alarm").html(contents);
        	window.Helpers.initNavbarDropdownScrollbar();
        	const notificationMarkAsReadAll = document.querySelector('.dropdown-notifications-all');
        	  const notificationMarkAsReadList = document.querySelectorAll('.dropdown-notifications-read');

        	  // Notification: Mark as all as read
        	  if (notificationMarkAsReadAll) {
        	    notificationMarkAsReadAll.addEventListener('click', event => {
        	      notificationMarkAsReadList.forEach(item => {
        	        item.closest('.dropdown-notifications-item').classList.add('marked-as-read');
        	      });
        	    });
        	  }
        	  // Notification: Mark as read/unread onclick of dot
        	  if (notificationMarkAsReadList) {
        	    notificationMarkAsReadList.forEach(item => {
        	      item.addEventListener('click', event => {
        	        item.closest('.dropdown-notifications-item').classList.toggle('marked-as-read');
        	      });
        	    });
        	  }

        	  // Notification: Mark as read/unread onclick of dot
        	  const notificationArchiveMessageList = document.querySelectorAll('.dropdown-notifications-archive');
        	  notificationArchiveMessageList.forEach(item => {
        	    item.addEventListener('click', event => {
        	      item.closest('.dropdown-notifications-item').remove();
        	    });
        	  });
        	
        	
        }).fail(function (jqXHR, textStatus, errorThrown) {
        	console.log("에러");
        	console.log(jqXHR);
        	console.log(textStatus);
        	console.log(errorThrown);
        	
        });
	  	
}


//채팅
function chat() {
	var url = "/exodia/chat";
    var popup = window.open(url, "MyPopup", "width=1100, height=700");
	
	
}
	
	
	
	

let isRtl = window.Helpers.isRtl(),
  isDarkStyle = window.Helpers.isDarkStyle(),
  menu,
  animate,
  isHorizontalLayout = false;

if (document.getElementById('layout-menu')) {
  isHorizontalLayout = document.getElementById('layout-menu').classList.contains('menu-horizontal');
}

(function () {
  setTimeout(function () {
    window.Helpers.initCustomOptionCheck();
  }, 1000);

  // Initialize menu
  //-----------------

  let layoutMenuEl = document.querySelectorAll('#layout-menu');
  layoutMenuEl.forEach(function (element) {
    menu = new Menu(element, {
      orientation: isHorizontalLayout ? 'horizontal' : 'vertical',
      closeChildren: isHorizontalLayout ? true : false,
      // ? This option only works with Horizontal menu
      showDropdownOnHover: localStorage.getItem('templateCustomizer-' + templateName + '--ShowDropdownOnHover') // If value(showDropdownOnHover) is set in local storage
        ? localStorage.getItem('templateCustomizer-' + templateName + '--ShowDropdownOnHover') === 'true' // Use the local storage value
        : window.templateCustomizer !== undefined // If value is set in config.js
        ? window.templateCustomizer.settings.defaultShowDropdownOnHover // Use the config.js value
        : true // Use this if you are not using the config.js and want to set value directly from here
    });
    // Change parameter to true if you want scroll animation
    window.Helpers.scrollToActive((animate = false));
    window.Helpers.mainMenu = menu;
  });

  // Initialize menu togglers and bind click on each
  let menuToggler = document.querySelectorAll('.layout-menu-toggle');
  menuToggler.forEach(item => {
    item.addEventListener('click', event => {
      event.preventDefault();
      window.Helpers.toggleCollapsed();
      // Enable menu state with local storage support if enableMenuLocalStorage = true from config.js
      if (config.enableMenuLocalStorage && !window.Helpers.isSmallScreen()) {
        try {
          localStorage.setItem(
            'templateCustomizer-' + templateName + '--LayoutCollapsed',
            String(window.Helpers.isCollapsed())
          );
          // Update customizer checkbox state on click of menu toggler
          let layoutCollapsedCustomizerOptions = document.querySelector('.template-customizer-layouts-options');
          if (layoutCollapsedCustomizerOptions) {
            let layoutCollapsedVal = window.Helpers.isCollapsed() ? 'collapsed' : 'expanded';
            layoutCollapsedCustomizerOptions.querySelector(`input[value="${layoutCollapsedVal}"]`).click();
          }
        } catch (e) {}
      }
    });
  });

  // Display menu toggle (layout-menu-toggle) on hover with delay
  let delay = function (elem, callback) {
    let timeout = null;
    elem.onmouseenter = function () {
      // Set timeout to be a timer which will invoke callback after 300ms (not for small screen)
      if (!Helpers.isSmallScreen()) {
        timeout = setTimeout(callback, 300);
      } else {
        timeout = setTimeout(callback, 0);
      }
    };

    elem.onmouseleave = function () {
      // Clear any timers set to timeout
      document.querySelector('.layout-menu-toggle').classList.remove('d-block');
      clearTimeout(timeout);
    };
  };
  if (document.getElementById('layout-menu')) {
    delay(document.getElementById('layout-menu'), function () {
      // not for small screen
      if (!Helpers.isSmallScreen()) {
        document.querySelector('.layout-menu-toggle').classList.add('d-block');
      }
    });
  }

  // Menu swipe gesture

  // Detect swipe gesture on the target element and call swipe In
  window.Helpers.swipeIn('.drag-target', function (e) {
    window.Helpers.setCollapsed(false);
  });

  // Detect swipe gesture on the target element and call swipe Out
  window.Helpers.swipeOut('#layout-menu', function (e) {
    if (window.Helpers.isSmallScreen()) window.Helpers.setCollapsed(true);
  });

  // Display in main menu when menu scrolls
  let menuInnerContainer = document.getElementsByClassName('menu-inner'),
    menuInnerShadow = document.getElementsByClassName('menu-inner-shadow')[0];
  if (menuInnerContainer.length > 0 && menuInnerShadow) {
    menuInnerContainer[0].addEventListener('ps-scroll-y', function () {
      if (this.querySelector('.ps__thumb-y').offsetTop) {
        menuInnerShadow.style.display = 'block';
      } else {
        menuInnerShadow.style.display = 'none';
      }
    });
  }

  // Update light/dark image based on current style
  function switchImage(style) {
    if (style === 'system') {
      if (window.matchMedia('(prefers-color-scheme: dark)').matches) {
        style = 'dark';
      } else {
        style = 'light';
      }
    }
    const switchImagesList = [].slice.call(document.querySelectorAll('[data-app-' + style + '-img]'));
    switchImagesList.map(function (imageEl) {
      const setImage = imageEl.getAttribute('data-app-' + style + '-img');
      imageEl.src = assetsPath + 'img/' + setImage; // Using window.assetsPath to get the exact relative path
    });
  }

  //Style Switcher (Light/Dark/System Mode)
  let styleSwitcher = document.querySelector('.dropdown-style-switcher');

  // Get style from local storage or use 'system' as default
  var storedStyle = localStorage.getItem('templateCustomizer-' + templateName + '--Style');
  if (!storedStyle) {
    storedStyle = 
    	(window.templateCustomizer && window.templateCustomizer.settings && window.templateCustomizer.settings.defaultStyle) || 'light';
  } //!if there is no Customizer then use default style as light

  // Set style on click of style switcher item if template customizer is enabled
  if (window.templateCustomizer && styleSwitcher) {
    let styleSwitcherItems = [].slice.call(styleSwitcher.children[1].querySelectorAll('.dropdown-item'));
    styleSwitcherItems.forEach(function (item) {
      item.addEventListener('click', function () {
        let currentStyle = this.getAttribute('data-theme');
        if (currentStyle === 'light') {
          window.templateCustomizer.setStyle('light');
        } else if (currentStyle === 'dark') {
          window.templateCustomizer.setStyle('dark');
        } else {
          window.templateCustomizer.setStyle('system');
        }
      });
    });

    // Update style switcher icon based on the stored style

    const styleSwitcherIcon = styleSwitcher.querySelector('i');

    if (storedStyle === 'light') {
      styleSwitcherIcon.classList.add('bx-sun');
      new bootstrap.Tooltip(styleSwitcherIcon, {
        title: 'Light Mode',
        fallbackPlacements: ['bottom']
      });
    } else if (storedStyle === 'dark') {
      styleSwitcherIcon.classList.add('bx-moon');
      new bootstrap.Tooltip(styleSwitcherIcon, {
        title: 'Dark Mode',
        fallbackPlacements: ['bottom']
      });
    } else {
      styleSwitcherIcon.classList.add('bx-desktop');
      new bootstrap.Tooltip(styleSwitcherIcon, {
        title: 'System Mode',
        fallbackPlacements: ['bottom']
      });
    }
  }

  // Run switchImage function based on the stored style
  switchImage(storedStyle);

  // Internationalization (Language Dropdown)
  // ---------------------------------------

  if (typeof i18next !== 'undefined' && typeof i18NextHttpBackend !== 'undefined') {
    i18next
      .use(i18NextHttpBackend)
      .init({
        lng: 'en',
        debug: false,
        fallbackLng: 'en',
        backend: {
          loadPath: assetsPath + 'json/locales/{{lng}}.json'
        },
        returnObjects: true
      })
      .then(function (t) {
        localize();
      });
  }

  let languageDropdown = document.getElementsByClassName('dropdown-language');

  if (languageDropdown.length) {
    let dropdownItems = languageDropdown[0].querySelectorAll('.dropdown-item');

    for (let i = 0; i < dropdownItems.length; i++) {
      dropdownItems[i].addEventListener('click', function () {
        let currentLanguage = this.getAttribute('data-language');

        for (let sibling of this.parentNode.children) {
          var siblingEle = sibling.parentElement.parentNode.firstChild;

          // Loop through each sibling and push to the array
          while (siblingEle) {
            if (siblingEle.nodeType === 1 && siblingEle !== siblingEle.parentElement) {
              siblingEle.querySelector('.dropdown-item').classList.remove('active');
            }
            siblingEle = siblingEle.nextSibling;
          }
        }
        this.classList.add('active');

        i18next.changeLanguage(currentLanguage, (err, t) => {
          if (err) return console.log('something went wrong loading', err);
          localize();
        });
      });
    }
  }

  function localize() {
    let i18nList = document.querySelectorAll('[data-i18n]');
    // Set the current language in dd
    let currentLanguageEle = document.querySelector('.dropdown-item[data-language="' + i18next.language + '"]');

    if (currentLanguageEle) {
      currentLanguageEle.click();
    }

    i18nList.forEach(function (item) {
      item.innerHTML = i18next.t(item.dataset.i18n);
    });
  }

  // Notification
  // ------------
  const notificationMarkAsReadAll = document.querySelector('.dropdown-notifications-all');
  const notificationMarkAsReadList = document.querySelectorAll('.dropdown-notifications-read');

  // Notification: Mark as all as read
  if (notificationMarkAsReadAll) {
    notificationMarkAsReadAll.addEventListener('click', event => {
      notificationMarkAsReadList.forEach(item => {
        item.closest('.dropdown-notifications-item').classList.add('marked-as-read');
      });
    });
  }
  // Notification: Mark as read/unread onclick of dot
  if (notificationMarkAsReadList) {
    notificationMarkAsReadList.forEach(item => {
      item.addEventListener('click', event => {
        item.closest('.dropdown-notifications-item').classList.toggle('marked-as-read');
      });
    });
  }

  // Notification: Mark as read/unread onclick of dot
  const notificationArchiveMessageList = document.querySelectorAll('.dropdown-notifications-archive');
  notificationArchiveMessageList.forEach(item => {
    item.addEventListener('click', event => {
      item.closest('.dropdown-notifications-item').remove();
    });
  });

  // Init helpers & misc
  // --------------------

  // Init BS Tooltip
  const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
  tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl);
  });

  // Accordion active class
  const accordionActiveFunction = function (e) {
    if (e.type == 'show.bs.collapse' || e.type == 'show.bs.collapse') {
      e.target.closest('.accordion-item').classList.add('active');
    } else {
      e.target.closest('.accordion-item').classList.remove('active');
    }
  };

  const accordionTriggerList = [].slice.call(document.querySelectorAll('.accordion'));
  const accordionList = accordionTriggerList.map(function (accordionTriggerEl) {
    accordionTriggerEl.addEventListener('show.bs.collapse', accordionActiveFunction);
    accordionTriggerEl.addEventListener('hide.bs.collapse', accordionActiveFunction);
  });

  // If layout is RTL add .dropdown-menu-end class to .dropdown-menu
  // if (isRtl) {
  //   Helpers._addClass('dropdown-menu-end', document.querySelectorAll('#layout-navbar .dropdown-menu'));
  // }

  // Auto update layout based on screen size
  window.Helpers.setAutoUpdate(true);

  // Toggle Password Visibility
  window.Helpers.initPasswordToggle();

  // Speech To Text
  window.Helpers.initSpeechToText();

  // Init PerfectScrollbar in Navbar Dropdown (i.e notification)
  window.Helpers.initNavbarDropdownScrollbar();

  let horizontalMenuTemplate = document.querySelector("[data-template^='horizontal-menu']");
  if (horizontalMenuTemplate) {
    // if screen size is small then set navbar fixed
    if (window.innerWidth < window.Helpers.LAYOUT_BREAKPOINT) {
      window.Helpers.setNavbarFixed('fixed');
    } else {
      window.Helpers.setNavbarFixed('');
    }
  }

  // On window resize listener
  // -------------------------
  window.addEventListener(
    'resize',
    function (event) {
      // Hide open search input and set value blank
      if (window.innerWidth >= window.Helpers.LAYOUT_BREAKPOINT) {
        if (document.querySelector('.search-input-wrapper')) {
          document.querySelector('.search-input-wrapper').classList.add('d-none');
          document.querySelector('.search-input').value = '';
        }
      }
      // Horizontal Layout : Update menu based on window size
      if (horizontalMenuTemplate) {
        // if screen size is small then set navbar fixed
        if (window.innerWidth < window.Helpers.LAYOUT_BREAKPOINT) {
          window.Helpers.setNavbarFixed('fixed');
        } else {
          window.Helpers.setNavbarFixed('');
        }
        setTimeout(function () {
          if (window.innerWidth < window.Helpers.LAYOUT_BREAKPOINT) {
            if (document.getElementById('layout-menu')) {
              if (document.getElementById('layout-menu').classList.contains('menu-horizontal')) {
                menu.switchMenu('vertical');
              }
            }
          } else {
            if (document.getElementById('layout-menu')) {
              if (document.getElementById('layout-menu').classList.contains('menu-vertical')) {
                menu.switchMenu('horizontal');
              }
            }
          }
        }, 100);
      }
    },
    true
  );

  // Manage menu expanded/collapsed with templateCustomizer & local storage
  //------------------------------------------------------------------

  // If current layout is horizontal OR current window screen is small (overlay menu) than return from here
  if (isHorizontalLayout || window.Helpers.isSmallScreen()) {
    return;
  }

  // If current layout is vertical and current window screen is > small

  // Auto update menu collapsed/expanded based on the themeConfig
  if (typeof TemplateCustomizer !== 'undefined') {
    if (window.templateCustomizer.settings.defaultMenuCollapsed) {
      window.Helpers.setCollapsed(true, false);
    } else {
      window.Helpers.setCollapsed(false, false);
    }
  }

  // Manage menu expanded/collapsed state with local storage support If enableMenuLocalStorage = true in config.js
  if (typeof config !== 'undefined') {
    if (config.enableMenuLocalStorage) {
      try {
        if (localStorage.getItem('templateCustomizer-' + templateName + '--LayoutCollapsed') !== null)
          window.Helpers.setCollapsed(
            localStorage.getItem('templateCustomizer-' + templateName + '--LayoutCollapsed') === 'true',
            false
          );
      } catch (e) {}
    }
  }
})();

// ! Removed following code if you do't wish to use jQuery. Remember that navbar search functionality will stop working on removal.
if (typeof $ !== 'undefined') {
  $(function () {
    // ! TODO: Required to load after DOM is ready, did this now with jQuery ready.
    window.Helpers.initSidebarToggle();
    // Toggle Universal Sidebar

    // Navbar Search with autosuggest (typeahead)
    // ? You can remove the following JS if you don't want to use search functionality.
    //----------------------------------------------------------------------------------

    var searchToggler = $('.search-toggler'),
      searchInputWrapper = $('.search-input-wrapper'),
      searchInput = $('.search-input'),
      contentBackdrop = $('.content-backdrop');

    // Open search input on click of search icon
    if (searchToggler.length) {
      searchToggler.on('click', function () {
        if (searchInputWrapper.length) {
          searchInputWrapper.toggleClass('d-none');
          searchInput.focus();
        }
      });
    }
    // Open search on 'CTRL+/'
    $(document).on('keydown', function (event) {
      let ctrlKey = event.ctrlKey,
        slashKey = event.which === 191;

      if (ctrlKey && slashKey) {
        if (searchInputWrapper.length) {
          searchInputWrapper.toggleClass('d-none');
          searchInput.focus();
        }
      }
    });
    // Note: Following code is required to update container class of typeahead dropdown width on focus of search input. setTimeout is required to allow time to initiate Typeahead UI.
    setTimeout(function () {
      var twitterTypeahead = $('.twitter-typeahead');
      searchInput.on('focus', function () {
        if (searchInputWrapper.hasClass('container-xxl')) {
          searchInputWrapper.find(twitterTypeahead).addClass('container-xxl');
          twitterTypeahead.removeClass('container-fluid');
        } else if (searchInputWrapper.hasClass('container-fluid')) {
          searchInputWrapper.find(twitterTypeahead).addClass('container-fluid');
          twitterTypeahead.removeClass('container-xxl');
        }
      });
    }, 10);

    if (searchInput.length) {
      // Filter config
      var filterConfig = function (data) {
        return function findMatches(q, cb) {
          let matches;
          matches = [];
          data.filter(function (i) {
            if (i.name.toLowerCase().startsWith(q.toLowerCase())) {
              matches.push(i);
            } else if (
              !i.name.toLowerCase().startsWith(q.toLowerCase()) &&
              i.name.toLowerCase().includes(q.toLowerCase())
            ) {
              matches.push(i);
              matches.sort(function (a, b) {
                return b.name < a.name ? 1 : -1;
              });
            } else {
              return [];
            }
          });
          cb(matches);
        };
      };

      // Search JSON
      var searchJson = 'search-vertical.json'; // For vertical layout
      if ($('#layout-menu').hasClass('menu-horizontal')) {
        var searchJson = 'search-horizontal.json'; // For vertical layout
      }
      // Search API AJAX call
      var searchData = $.ajax({
        url: assetsPath + 'json/' + searchJson, //? Use your own search api instead
        dataType: 'json',
        async: false
      }).responseJSON;
      // Init typeahead on searchInput
      searchInput.each(function () {
        var $this = $(this);
        searchInput
          .typeahead(
            {
              hint: false,
              classNames: {
                menu: 'tt-menu navbar-search-suggestion',
                cursor: 'active',
                suggestion: 'suggestion d-flex justify-content-between px-3 py-2 w-100'
              }
            },
            // ? Add/Update blocks as per need
            // Pages
            {
              name: 'pages',
              display: 'name',
              limit: 5,
              source: filterConfig(searchData.pages),
              templates: {
                header: '<h6 class="suggestions-header text-primary mb-0 mx-3 mt-3 pb-2">Pages</h6>',
                suggestion: function ({ url, icon, name }) {
                  return (
                    '<a href="' +
                    url +
                    '">' +
                    '<div>' +
                    '<i class="bx ' +
                    icon +
                    ' me-2"></i>' +
                    '<span class="align-middle">' +
                    name +
                    '</span>' +
                    '</div>' +
                    '</a>'
                  );
                },
                notFound:
                  '<div class="not-found px-3 py-2">' +
                  '<h6 class="suggestions-header text-primary mb-2">Pages</h6>' +
                  '<p class="py-2 mb-0"><i class="bx bx-error-circle bx-xs me-2"></i> No Results Found</p>' +
                  '</div>'
              }
            },
            // Files
            {
              name: 'files',
              display: 'name',
              limit: 4,
              source: filterConfig(searchData.files),
              templates: {
                header: '<h6 class="suggestions-header text-primary mb-0 mx-3 mt-3 pb-2">Files</h6>',
                suggestion: function ({ src, name, subtitle, meta }) {
                  return (
                    '<a href="javascript:;">' +
                    '<div class="d-flex w-50">' +
                    '<img class="me-3" src="' +
                    assetsPath +
                    src +
                    '" alt="' +
                    name +
                    '" height="32">' +
                    '<div class="w-75">' +
                    '<h6 class="mb-0">' +
                    name +
                    '</h6>' +
                    '<small class="text-muted">' +
                    subtitle +
                    '</small>' +
                    '</div>' +
                    '</div>' +
                    '<small class="text-muted">' +
                    meta +
                    '</small>' +
                    '</a>'
                  );
                },
                notFound:
                  '<div class="not-found px-3 py-2">' +
                  '<h6 class="suggestions-header text-primary mb-2">Files</h6>' +
                  '<p class="py-2 mb-0"><i class="bx bx-error-circle bx-xs me-2"></i> No Results Found</p>' +
                  '</div>'
              }
            },
            // Members
            {
              name: 'members',
              display: 'name',
              limit: 4,
              source: filterConfig(searchData.members),
              templates: {
                header: '<h6 class="suggestions-header text-primary mb-0 mx-3 mt-3 pb-2">Members</h6>',
                suggestion: function ({ name, src, subtitle }) {
                  return (
                    '<a href="app-user-view-account.html">' +
                    '<div class="d-flex align-items-center">' +
                    '<img class="rounded-circle me-3" src="' +
                    assetsPath +
                    src +
                    '" alt="' +
                    name +
                    '" height="32">' +
                    '<div class="user-info">' +
                    '<h6 class="mb-0">' +
                    name +
                    '</h6>' +
                    '<small class="text-muted">' +
                    subtitle +
                    '</small>' +
                    '</div>' +
                    '</div>' +
                    '</a>'
                  );
                },
                notFound:
                  '<div class="not-found px-3 py-2">' +
                  '<h6 class="suggestions-header text-primary mb-2">Members</h6>' +
                  '<p class="py-2 mb-0"><i class="bx bx-error-circle bx-xs me-2"></i> No Results Found</p>' +
                  '</div>'
              }
            }
          )
          //On typeahead result render.
          .bind('typeahead:render', function () {
            // Show content backdrop,
            contentBackdrop.addClass('show').removeClass('fade');
          })
          // On typeahead select
          .bind('typeahead:select', function (ev, suggestion) {
            // Open selected page
            if (suggestion.url) {
              window.location = suggestion.url;
            }
          })
          // On typeahead close
          .bind('typeahead:close', function () {
            // Clear search
            searchInput.val('');
            $this.typeahead('val', '');
            // Hide search input wrapper
            searchInputWrapper.addClass('d-none');
            // Fade content backdrop
            contentBackdrop.addClass('fade').removeClass('show');
          });

        // On searchInput keyup, Fade content backdrop if search input is blank
        searchInput.on('keyup', function () {
          if (searchInput.val() == '') {
            contentBackdrop.addClass('fade').removeClass('show');
          }
        });
      });

      // Init PerfectScrollbar in search result
      var psSearch;
      $('.navbar-search-suggestion').each(function () {
        psSearch = new PerfectScrollbar($(this)[0], {
          wheelPropagation: false,
          suppressScrollX: true
        });
      });

      searchInput.on('keyup', function () {
        psSearch.update();
      });
    }
  });
}
