/**
 * App Email
 */

'use strict';

//쪽지 상세보기
function showDetail(noteReadNo) {
  	 var data = {
  			 noteReadNo: noteReadNo
	        };
  	 
	  		var postData = {
		        readUpdateId: noteReadNo
	        };
	        
	        // AJAX 요청으로 데이터 전송
	        $.ajax({
	        	url: "/exodia/readUpdate",
	            type: "POST",
	            data: postData,
	            success: function(response) {
	            	$('#' + noteReadNo).addClass('email-marked-read');
	            	$('#li-' + noteReadNo).removeClass('email-unread');
	            	$('#li-' + noteReadNo).addClass('email-read');
	            	$('#i-' + noteReadNo).removeClass('bx-envelope');
	            	$('#i-' + noteReadNo).addClass('bx-envelope-open');
	            	
	            	
	            },
	            error: function() {
	                // 오류 처리
	                alert("데이터 전송 중 오류가 발생했습니다.");
	            }
	        });
	        
	        $.ajax({
	        	url: "/exodia/noteDetail",
	            type: "GET",
	            data: data 
	            
	            }).done(function(result) {
		        	console.log("결과확인");
		        	var html = jQuery('<div>').html(result);
		        	var contents = html.find("div#noteDetail").html();
		        	$("#app-email-view").html(contents);
		        	$("#app-email-view").addClass("show");
		        	/*$("#refreshNoteContent").hide();*/
		        	var quill = new Quill('.email-reply-editor', {
		                modules: {
		                    toolbar: '.email-reply-toolbar'
		                  },
		                  placeholder: 'Write your message... ',
		                  theme: 'snow'
		            });
		        	let lastEditorContents = null;
		        	quill.on('text-change', function() {
		        		  const editorContents = quill.getContents();
		        		  
		        		  const htmlContent = quill.root.innerHTML;
		        		  const inputElement = document.getElementById('reply');
		        		  if(JSON.stringify(editorContents) !== JSON.stringify(lastEditorContents)) {
		        			  lastEditorContents = editorContents;
		        			  inputElement.value = htmlContent;
		        			  
		        		  }
		        		  
		        		  console.log(htmlContent+"뭐라 나오는지 좀 보자");
		        		  console.log(inputElement.value+"그래서 넘어가는 값이 뭐냐");
		        	});
		        	
		        	//이전 메세지 클릭시 내용 보기
		        	 let earlierMsg = $('.email-earlier-msgs');
	        	      earlierMsg.on('click', function () {
	        	        let $this = $(this);
	        	        $this.parents().find('.email-card-last').addClass('hide-pseudo');
	        	        $this.next('.email-card-prev').slideToggle();
	        	        $this.remove();
	        	      });
		        	
	        	     //답장 클릭시 스크롤 내림
	        	     let emailViewContent = $('.app-email-view-content');
	        	     emailViewContent.find('.scroll-to-reply').on('click', function () {
	        	       if (emailViewContent[0].scrollTop === 0) {
	        	         emailViewContent.animate(
	        	           {
	        	             scrollTop: emailViewContent[0].scrollHeight
	        	           },
	        	            1500
	        	         );
	        	       }
	        	     });
 
		        	
		        	
		        	var scrollbar = new PerfectScrollbar('.app-email-view-content', {
		     	        wheelPropagation: false,
		     	        suppressScrollX: true
		     	    });
		        	
		        }).fail(function (jqXHR, textStatus, errorThrown) {
		        	console.log("에러");
		        	console.log(jqXHR);
		        	console.log(textStatus);
		        	console.log(errorThrown);
		        	
		        });
  	
}

//상세보기에서 뒤로가기 클릭시
function showNoteList() {
	$("#app-email-view").removeClass("show");
}

//쪽지함별 페이징처리
function showEmailList(contentType, pageNo) {
	console.log(contentType+":내용타입"+pageNo+":페이지넘버");
	var content = contentType;
	if(content === '수신') {
		let inbox = "수신";
		var postData = {
			inbox: inbox,
			pageInbox: pageNo
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
		
		
	} else if(content === '발신') {
		let noteSent = "발신";
		var postData = {
			noteSent: noteSent,
			pageSent: pageNo
        };
        
        // AJAX 요청으로 데이터 전송
        $.ajax({
        	url: "/exodia/noteSent",
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
		
	} else if(content === '임시저장') {
		let noteDraft = "임시저장";
		var postData = {
				noteDraft: noteDraft,
				pageDraft: pageNo
		};
		
		// AJAX 요청으로 데이터 전송
		$.ajax({
			url: "/exodia/noteDraft",
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
	
    } else if(content === '중요') {
		let noteStarred = "중요";
		var postData = {
				noteStarred: noteStarred,
				pageStarred: pageNo
		};
		
		// AJAX 요청으로 데이터 전송
		$.ajax({
			url: "/exodia/noteStarred",
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
	
    } else {
    	let noteTrash = "휴지통";
		var postData = {
				noteTrash: noteTrash,
				pageTrash: pageNo
		};
		
		// AJAX 요청으로 데이터 전송
		$.ajax({
			url: "/exodia/noteTrash",
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
    	
    
    }
}

//중요쪽지 선택 및 해제
function bookMark(noteReadNo) {
	  console.log(noteReadNo + " 잘 가져오나 몇 번인지");
	  // `emailItem`을 선택
	  let emailItem = $("#" + noteReadNo);
	  
	  // 'data-starred' 속성의 값을 확인
	  if (emailItem.attr('data-starred') === 'true') {
	    // 'data-starred' 속성이 'true'인 경우 제거
		  
		  emailItem.removeAttr('data-starred');
		  
		  let noteStarred = "";
		  var postData = {
			        noteStarred: noteStarred,
			        noteReadNo: noteReadNo
		        };
		        
		        // AJAX 요청으로 데이터 전송
		        $.ajax({
		        	url: "/exodia/noteStarredUpdate",
		            type: "POST",
		            data: postData,
		            success: function(response) {
		            	
		            },
		            error: function() {
		                // 오류 처리
		                alert("데이터 전송 중 오류가 발생했습니다.");
		            }
		        });
		  
	  } else {
	    // 'data-starred' 속성이 'true'가 아닌 경우 추가
	    emailItem.attr('data-starred', 'true');
	    
	    	let noteStarred = "starred";
	    	var postData = {
		        noteStarred: noteStarred,
		        noteReadNo: noteReadNo
	        };
	        
	        // AJAX 요청으로 데이터 전송
	        $.ajax({
	        	url: "/exodia/noteStarredUpdate",
	            type: "POST",
	            data: postData,
	            success: function(response) {
	            	
	            },
	            error: function() {
	                // 오류 처리
	                alert("데이터 전송 중 오류가 발생했습니다.");
	            }
	        });
	  }
}

//전체 선택
function checkAll() {
	console.log("나체크댐");
	   let selectChk = $(".email-list-item-input");
	   let selectAll = $("#email-select-all");
	    
	    if (selectAll.prop('checked')) {
	        selectChk.prop('checked', true);
	    } else {
	        selectChk.prop('checked', false);
	    }
}

//선택된 항목 휴지통보내기
function trashCheck(type) {
	console.log("체크삭제");
	var contentType = type;
	
	// 모든 체크된 체크박스를 선택
	var checkedCheckboxes = $('input[type="checkbox"]:checked').not('#email-select-all');

	// 체크된 체크박스의 ID를 가져오고 배열에 저장
	var checkedIds = checkedCheckboxes.map(function() {
		return this.id.replace('email-', '');
	}).get();

	// 체크된 체크박스의 ID 배열을 문자열로 조인
	var checkedIdsString = checkedIds.join(', ');

	
	var postData = {
			checkedIdsString: checkedIdsString,
			contentType: contentType
        };
        
	console.log("체크된 체크박스의 ID: " + checkedIdsString);
        // AJAX 요청으로 데이터 전송
        $.ajax({
        	url: "/exodia/trashNote",
            type: "POST",
            data: postData,
            success: function(response) {
            	$.each(checkedIds, function(index, id) {
            	    $('#' + id).hide();
            	});
	        
            },
            error: function() {
                // 오류 처리
                alert("데이터 전송 중 오류가 발생했습니다.");
            }
        });
	// 체크된 체크박스의 ID 출력
	
	
}

//휴지통복구하기
function recoveryCheck() {
	console.log("체크복구");
	
	// 모든 체크된 체크박스를 선택
	var checkedCheckboxes = $('input[type="checkbox"]:checked').not('#email-select-all');
	
	// 체크된 체크박스의 ID를 가져오고 배열에 저장
	var checkedIds = checkedCheckboxes.map(function() {
		return this.id.replace('email-', '');
	}).get();
	
	// 체크된 체크박스의 ID 배열을 문자열로 조인
	var checkedIdsString = checkedIds.join(', ');
	
	
	var postData = {
			checkedIdsString: checkedIdsString,
	};
	
	console.log("체크된 체크박스의 ID: " + checkedIdsString);
	// AJAX 요청으로 데이터 전송
	$.ajax({
		url: "/exodia/recoveryNote",
		type: "POST",
		data: postData,
		success: function(response) {
			$.each(checkedIds, function(index, id) {
				$('#' + id).hide();
			});
			
		},
		error: function() {
			// 오류 처리
			alert("데이터 전송 중 오류가 발생했습니다.");
		}
	});
	// 체크된 체크박스의 ID 출력
	
	
}

function trashSingleNote(noteReadNo) {
	  var postData = {
			  checkedIdsString: noteReadNo
	        };
	        
	        // AJAX 요청으로 데이터 전송
	        $.ajax({
	        	url: "/exodia/trashNote",
	            type: "POST",
	            data: postData,
	            success: function(response) {
	            	$('#' + noteReadNo).hide();
	            	
	            },
	            error: function() {
	                // 오류 처리
	                alert("데이터 전송 중 오류가 발생했습니다.");
	            }
	        });
	
}


document.addEventListener('DOMContentLoaded', function () {
	

  
  (function () {
    const emailList = document.querySelector('.email-list'),
      emailListItems = [].slice.call(document.querySelectorAll('.email-list-item')),
      emailListItemInputs = [].slice.call(document.querySelectorAll('.email-list-item-input')),
      emailViews = [].slice.call(document.querySelectorAll('.app-email-view-content')),
      emailFilters = document.querySelector('.email-filters'),
      emailFilterByFolders = [].slice.call(document.querySelectorAll('.email-filter-folders li')),
      emailEditor = document.querySelector('.email-editor'),
      appEmailSidebar = document.querySelector('.app-email-sidebar'),
      appOverlay = document.querySelector('.app-overlay'),
      emailReplyContainers = [].slice.call(document.querySelectorAll('.email-reply')),		
      emailReplyEditors = [].slice.call(document.querySelectorAll('.email-reply-editor')),
      emailReplyToolbars = [].slice.call(document.querySelectorAll('.email-reply-toolbar')),
      bookmarkEmail = [].slice.call(document.querySelectorAll('.email-list-item-bookmark')),
      selectAllEmails = document.getElementById('email-select-all'),
      emailSearch = document.querySelector('.email-search-input'),
      toggleCC = document.querySelector('.email-compose-toggle-cc'),
      toggleBCC = document.querySelector('.email-compose-toggle-bcc'),
      toggleReserv = document.querySelector('.send-toggle-reserv'),
      emailCompose = document.querySelector('.app-email-compose'),
      emailListDelete = document.querySelector('.email-list-delete'),
      emailListRead = document.querySelector('.email-list-read'),
      emailListEmpty = document.querySelector('.email-list-empty'),
      refreshEmails = document.querySelector('.email-refresh'),
      emailViewContainers = Array.from(document.querySelectorAll('.app-email-view')),
      emailFilterFolderLists = [].slice.call(document.querySelectorAll('.email-filter-folders li')),
      emailListItemActions = [].slice.call(document.querySelectorAll('.email-list-item-actions li')),
      receiverInput = document.getElementById('note_receiver'),
      sentNoteList = document.getElementById('sentNoteList'),
      starredNoteList = document.getElementById('starredNoteList'),
      inboxNoteList = document.getElementById('inboxNoteList'),
      trashNoteList = document.getElementById('trashNoteList'),
      draftNoteList = document.getElementById('draftNoteList');

    // Initialize PerfectScrollbar
    // ------------------------------
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
    
    //발신함
    if(sentNoteList) {
    	sentNoteList.addEventListener('click', e => {
    		let noteSent = "발신";
			var postData = {
				noteSent: noteSent
	        };
	        
	        // AJAX 요청으로 데이터 전송
	        $.ajax({
	        	url: "/exodia/noteSent",
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
	        
        });
    	
    }
    //임시저장
    if(draftNoteList) {
    	draftNoteList.addEventListener('click', e => {
    		let noteDraft = "임시저장";
    		var postData = {
    				noteDraft: noteDraft
    		};
    		
    		// AJAX 요청으로 데이터 전송
    		$.ajax({
    			url: "/exodia/noteDraft",
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
    		
    	});
    	
    }
    
    //수신함
    if(inboxNoteList) {
    	inboxNoteList.addEventListener('click', e => {
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
	        
        });
    	
    }
    
    //중요
    if(starredNoteList) {
    	starredNoteList.addEventListener('click', e => {
    		let noteStarred = "중요";
    		var postData = {
    				noteStarred: noteStarred
    		};
    		
    		// AJAX 요청으로 데이터 전송
    		$.ajax({
    			url: "/exodia/noteStarred",
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
    		
    	});
    	
    }
    
    //쪽지 휴지통
    if(trashNoteList) {
    	trashNoteList.addEventListener('click', e => {
    		let noteTrash = "휴지통";
    		var postData = {
    				noteTrash: noteTrash
    		};
    		
    		// AJAX 요청으로 데이터 전송
    		$.ajax({
    			url: "/exodia/noteTrash",
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
    		
    	});
    	
    }
    
    
    // Email list scrollbar
   
    // Sidebar tags scrollbar
    if (emailFilters) {
      new PerfectScrollbar(emailFilters, {
        wheelPropagation: false,
        suppressScrollX: true
      });
    }


    // Initialize Quill Editor
    // ------------------------------
    if (emailEditor) {
      const quill = new Quill('.email-editor', {
        modules: {
          toolbar: '.email-editor-toolbar'
        },
        placeholder: '메세지를 입력하세요. ',
        theme: 'snow'
      });
      
      let lastEditorContents = null;
      quill.on('text-change', function() {
    	  const editorContents = quill.getContents();
    	  
    	  const htmlContent = quill.root.innerHTML;
    	  const inputElement = document.getElementById('note-content');
    	  if(JSON.stringify(editorContents) !== JSON.stringify(lastEditorContents)) {
    		  lastEditorContents = editorContents;
    		  inputElement.value = htmlContent;
    		  
    	  }
    	  
    	  console.log(htmlContent+"뭐라 나오는지 좀 보자");
    	  console.log(inputElement.value+"그래서 넘어가는 값이 뭐냐");
      });
    }


    emailReplyContainers.forEach((container, index) => {
    	
    	const editorElement = container.querySelector('.email-reply-editor');
    	const toolbarElement = container.querySelector('.email-reply-toolbar');
    
    // 답장
	    if (editorElement && toolbarElement) {
	    	
		      new Quill(editorElement, {
		        modules: {
		          toolbar: toolbarElement
		        },
		        placeholder: '메세지를 입력하세요. ',
		        theme: 'snow'
		      });
	    }
    
    });

    // Bookmark email
    if (bookmarkEmail) {
      bookmarkEmail.forEach(emailItem => {
        emailItem.addEventListener('click', e => {
          let emailItem = e.currentTarget.parentNode.parentNode;
          let starredAttr = emailItem.getAttribute('data-starred');
          e.stopPropagation();
          if (!starredAttr) {
            emailItem.setAttribute('data-starred', 'true');
          } else {
            emailItem.removeAttribute('data-starred');
          }
        });
      });
    }

    // Select all
    if (selectAllEmails) {
      selectAllEmails.addEventListener('click', e => {
        if (e.currentTarget.checked) {
          emailListItemInputs.forEach(c => (c.checked = 1));
        } else {
          emailListItemInputs.forEach(c => (c.checked = 0));
        }
      });
    }

    // Select single email
    if (emailListItemInputs) {
      emailListItemInputs.forEach(emailListItemInput => {
        emailListItemInput.addEventListener('click', e => {
          e.stopPropagation();
          // Check input count to reset the indeterminate state
          let emailListItemInputCount = 0;
          emailListItemInputs.forEach(emailListItemInput => {
            if (emailListItemInput.checked) {
              emailListItemInputCount++;
            }
          });

          if (emailListItemInputCount < emailListItemInputs.length) {
            if (emailListItemInputCount == 0) {
              selectAllEmails.indeterminate = false;
            } else {
              selectAllEmails.indeterminate = true;
            }
          } else {
            if (emailListItemInputCount == emailListItemInputs.length) {
              selectAllEmails.indeterminate = false;
              selectAllEmails.checked = true;
            } else {
              selectAllEmails.indeterminate = false;
            }
          }
        });
      });
    }

    // Search email based on searched text
    if (emailSearch) {
      emailSearch.addEventListener('keyup', e => {
        let searchValue = e.currentTarget.value.toLowerCase(),
          searchEmailListItems = {},
          selectedFolderFilter = document.querySelector('.email-filter-folders .active').getAttribute('data-target');

        // Filter emails based on selected folders
        if (selectedFolderFilter != 'inbox') {
          searchEmailListItems = [].slice.call(
            document.querySelectorAll('.email-list-item[data-' + selectedFolderFilter + '="true"]')
          );
        } else {
          searchEmailListItems = [].slice.call(document.querySelectorAll('.email-list-item'));
        }

        // console.log(searchValue);
        searchEmailListItems.forEach(searchEmailListItem => {
          let searchEmailListItemText = searchEmailListItem.textContent.toLowerCase();
          if (searchValue) {
            if (-1 < searchEmailListItemText.indexOf(searchValue)) {
              searchEmailListItem.classList.add('d-block');
            } else {
              searchEmailListItem.classList.add('d-none');
            }
          } else {
            searchEmailListItem.classList.remove('d-none');
          }
        });
      });
    }

    // Filter based on folder type (Inbox, Sent, Draft etc...)
    emailFilterByFolders.forEach(emailFilterByFolder => {
      emailFilterByFolder.addEventListener('click', e => {
        let currentTarget = e.currentTarget,
          currentTargetData = currentTarget.getAttribute('data-target');

        appEmailSidebar.classList.remove('show');
       /* appOverlay.classList.remove('show');*/

        // Remove active class from each folder filters
        Helpers._removeClass('active', emailFilterByFolders);
        // Add active class to selected folder filters
        currentTarget.classList.add('active');
        emailListItems.forEach(emailListItem => {
          // If folder filter is Inbox
          if (currentTargetData == 'inbox') {
            emailListItem.classList.add('d-block');
            emailListItem.classList.remove('d-none');
            
          } else if (emailListItem.hasAttribute('data-' + currentTargetData)) {
            emailListItem.classList.add('d-block');
            emailListItem.classList.remove('d-none');
           
          } else {
            emailListItem.classList.add('d-none');
            emailListItem.classList.remove('d-block');
          }
        });
      });
    });
    
   
   
    

    
    
    
    if (emailListItems) {
    	emailListItems.forEach(emailListItem => {
    		emailListItem.addEventListener('click', e => {
    			let currentTarget = e.currentTarget;
    			let currentTargetId = currentTarget.id;
    			console.log(currentTargetId+"아이디 잘 가져오고 있나 ㅋㅋ");
    			var postData = {
    		        readUpdateId: currentTargetId
		        };
		        
		        // AJAX 요청으로 데이터 전송
		        $.ajax({
		        	url: "/exodia/readUpdate",
		            type: "POST",
		            data: postData,
		            success: function(response) {

		            },
		            error: function() {
		                // 오류 처리
		                alert("데이터 전송 중 오류가 발생했습니다.");
		            }
		        });
		        
		        
		       
		        
            });
        });
    }
    

    // Toggle CC/BCC input
    if (toggleBCC) {
      toggleBCC.addEventListener('click', e => {
        Helpers._toggleClass(document.querySelector('.email-compose-bcc'), 'd-block', 'd-none');
      });
    }

    if (toggleCC) {
      toggleCC.addEventListener('click', e => {
        Helpers._toggleClass(document.querySelector('.email-compose-cc'), 'd-block', 'd-none');
      });
    }
    
    if (toggleReserv) {
    	toggleReserv.addEventListener('click', e => {
          Helpers._toggleClass(document.querySelector('.send-reserv'), 'd-block', 'd-none');
        });
      }

    // Empty compose email message inputs when modal is hidden
    emailCompose.addEventListener('hidden.bs.modal', event => {
      $('#emailContacts').val('');
      initSelect2();
    });

    // Delete multiple email
    if (emailListDelete) {
      emailListDelete.addEventListener('click', e => {
        emailListItemInputs.forEach(emailListItemInput => {
          if (emailListItemInput.checked) {
            emailListItemInput.parentNode.closest('li.email-list-item').remove();
          }
        });
        selectAllEmails.indeterminate = false;
        selectAllEmails.checked = false;
        var emailListItem = document.querySelectorAll('.email-list-item');
        if (emailListItem.length == 0) {
          emailListEmpty.classList.remove('d-none');
        }
      });
    }

    // Mark as read
    if (emailListRead) {
      emailListRead.addEventListener('click', e => {
        emailListItemInputs.forEach(emailListItemInput => {
          if (emailListItemInput.checked) {
            emailListItemInput.checked = false;
            emailListItemInput.parentNode.closest('li.email-list-item').classList.add('email-marked-read');
            let emailItemEnvelop = emailListItemInput.parentNode
              .closest('li.email-list-item')
              .querySelector('.email-list-item-actions li');

            if (Helpers._hasClass('email-read', emailItemEnvelop)) {
              emailItemEnvelop.classList.remove('email-read');
              emailItemEnvelop.classList.add('email-unread');
              emailItemEnvelop.querySelector('i').classList.remove('bx-envelope-open');
              emailItemEnvelop.querySelector('i').classList.add('bx-envelope');
            }
          }
        });
        selectAllEmails.indeterminate = false;
        selectAllEmails.checked = false;
      });
    }

    // Refresh Mails

    if (refreshEmails && emailList) {
      let emailListJq = $('.email-list'),
        emailListInstance = new PerfectScrollbar(emailList, {
          wheelPropagation: false,
          suppressScrollX: true
        });
      // ? Using jquery vars due to BlockUI jQuery dependency
      refreshEmails.addEventListener('click', e => {
        emailListJq.block({
          message: '<div class="spinner-border text-primary" role="status"></div>',
          timeout: 1000,
          css: {
            backgroundColor: 'transparent',
            border: '0'
          },
          overlayCSS: {
            backgroundColor: '#000',
            opacity: 0.1
          },
          onBlock: function () {
            emailListInstance.settings.suppressScrollY = true;
          },
          onUnblock: function () {
            emailListInstance.settings.suppressScrollY = false;
          }
        });
      });
    }

    // Earlier msgs
    // ? Using jquery vars due to jQuery animation (slideToggle) dependency
    let earlierMsg = $('.email-earlier-msgs');
    if (earlierMsg.length) {
      earlierMsg.on('click', function () {
        let $this = $(this);
        $this.parents().find('.email-card-last').addClass('hide-pseudo');
        $this.next('.email-card-prev').slideToggle();
        $this.remove();
      });
    }

    // Email contacts (select2)
    // ? Using jquery vars due to select2 jQuery dependency
    let emailContacts = $('#emailContacts');
    function initSelect2() {
      if (emailContacts.length) {
        function renderContactsAvatar(option) {
          if (!option.id) {
            return option.text;
          }
          let $avatar =
            "<div class='d-flex flex-wrap align-items-center'>" +
            "<div class='avatar avatar-xs me-2 w-px-20 h-px-20'>" +
            "<img src='" +
            assetsPath +
            'img/avatars/' +
            $(option.element).data('avatar') +
            "' alt='avatar' class='rounded-circle' />" +
            '</div>' +
            option.text + $(option.element).data('subtext') +
            '</div>';

          return $avatar;
        }
        emailContacts.wrap('<div class="position-relative"></div>').select2({
          placeholder: '선택',
          dropdownParent: emailContacts.parent(),
          closeOnSelect: false,
          templateResult: renderContactsAvatar,
          templateSelection: renderContactsAvatar,
          escapeMarkup: function (es) {
            return es;
          }
        });
        
        emailContacts.on('change', function () {
            const selectedOptions = emailContacts.val();
            console.log(selectedOptions + " 값은 가져오냐잉");
            receiverInput.value = selectedOptions;
            console.log(receiverInput.value + " 값은 들어가냐잉");
        });
      }
    }
    initSelect2();
    


    // Scroll to bottom on reply click
    // ? Using jquery vars due to jQuery animation dependency
    let emailViewContent = $('.app-email-view-content');
    emailViewContent.find('.scroll-to-reply').on('click', function () {
      if (emailViewContent[0].scrollTop === 0) {
        emailViewContent.animate(
          {
            scrollTop: emailViewContent[0].scrollHeight
          },
          1500
        );
      }
    });

    // Close view on email filter folder list click
    /*if (emailFilterFolderLists) {
        emailFilterFolderLists.forEach(emailFilterFolderList => {
          emailFilterFolderList.addEventListener('click', e => {
            emailViewContainers.forEach(container => {
            	container.classList.remove('show');
            });
          });
        });
    }*/

    // Email List Items Actions
    if (emailListItemActions) {
      emailListItemActions.forEach(emailListItemAction => {
        emailListItemAction.addEventListener('click', e => {
          e.stopPropagation();
          let currentTarget = e.currentTarget;
          if (Helpers._hasClass('email-delete', currentTarget)) {
            currentTarget.parentNode.closest('li.email-list-item').remove();
            var emailListItem = document.querySelectorAll('.email-list-item');
            if (emailListItem.length == 0) {
              emailListEmpty.classList.remove('d-none');
            }
          } /*else if (Helpers._hasClass('email-read', currentTarget)) {
            currentTarget.parentNode.closest('li.email-list-item').classList.add('email-marked-read');
            Helpers._toggleClass(currentTarget, 'email-read', 'email-unread');
            Helpers._toggleClass(currentTarget.querySelector('i'), 'bx-envelope-open', 'bx-envelope');
          } else if (Helpers._hasClass('email-unread', currentTarget)) {
            currentTarget.parentNode.closest('li.email-list-item').classList.remove('email-marked-read');
            Helpers._toggleClass(currentTarget, 'email-read', 'email-unread');
            Helpers._toggleClass(currentTarget.querySelector('i'), 'bx-envelope-open', 'bx-envelope');
          }*/
        });
      });
    }
  })();
});
