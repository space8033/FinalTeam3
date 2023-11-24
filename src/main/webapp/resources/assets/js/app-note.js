/**
 * App Email
 */

'use strict';


//폼 제출 시
function validateForm() {
    // 예시: 입력값 검사
	removeBeforeUnloadHandler();
    var note_receiver = document.getElementById("emailContacts").value;
    var note_title = document.getElementById("email-subject").value;

    if (note_receiver === "" || note_title === "") {
    	Swal.fire({
            text: '모든 필드를 입력해주세요',
            icon: 'error',
            customClass: {
              confirmButton: 'btn btn-secondary'
            },
            buttonsStyling: false
          });
        return false; // 폼 제출 취소
    } else {

    Swal.fire({
        text: '쪽지 전송이 완료되었습니다.',
        icon: 'success',
        customClass: {
          confirmButton: 'btn btn-primary'
        },
        buttonsStyling: false
      });
    	
    }
    
    window.removeEventListener('beforeunload', beforeUnloadHandler);
    setTimeout(function () {
        document.getElementById("noteSend").submit();
    }, 2000);
    
    return false;
}

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
		                  placeholder: '메세지를 입력하세요. ',
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
 
		        	
		            var detailscrollbar = new PerfectScrollbar('.app-email-view-content', {
		        		wheelPropagation: false,
		        		suppressScrollX: true
		        	});
		        	
		        	
		        	document.getElementById('reply-attach-file').addEventListener('change', function () {
		        	    const fileName = document.getElementById('reply-attach-file').files[0].name;
		        	    
		        	    const fileCount = document.getElementById('reply-attach-file').files.length;
		        	    if (fileCount > 1) {
		        	        document.getElementById('reply-filename').value = fileName + " 외 " + (fileCount - 1) + "개";
		        	    } else {
		        	        document.getElementById('reply-filename').value = fileName;
		        	    }
		        	});
		        }).fail(function (jqXHR, textStatus, errorThrown) {
		        	console.log("에러");
		        	console.log(jqXHR);
		        	console.log(textStatus);
		        	console.log(errorThrown);
		        	
		        });
  	
}

function showDetailSent(noteNo) {
	var data = {
			noteNo: noteNo
	};
	
	$.ajax({
		url: "/exodia/noteDetailSent",
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
			placeholder: '메세지를 입력하세요. ',
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
		
		
		
		 var detailscrollbar = new PerfectScrollbar('.app-email-view-content', {
     		wheelPropagation: false,
     		suppressScrollX: true
     	});
		
		
		document.getElementById('reply-attach-file').addEventListener('change', function () {
			const fileName = document.getElementById('reply-attach-file').files[0].name;
			
			const fileCount = document.getElementById('reply-attach-file').files.length;
			if (fileCount > 1) {
				document.getElementById('reply-filename').value = fileName + " 외 " + (fileCount - 1) + "개";
			} else {
				document.getElementById('reply-filename').value = fileName;
			}
		});
		
		
		
		
		
		
		
	}).fail(function (jqXHR, textStatus, errorThrown) {
		console.log("에러");
		console.log(jqXHR);
		console.log(textStatus);
		console.log(errorThrown);
		
	});
	
}

function showDetailDraft(noteNo) {
	var data = {
			noteNo: noteNo
	};
	
	$.ajax({
		url: "/exodia/noteDetailDraft",
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
			placeholder: '메세지를 입력하세요.',
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
		
		
		document.getElementById('reply-attach-file').addEventListener('change', function () {
			const fileName = document.getElementById('reply-attach-file').files[0].name;
			
			const fileCount = document.getElementById('reply-attach-file').files.length;
			if (fileCount > 1) {
				document.getElementById('reply-filename').value = fileName + " 외 " + (fileCount - 1) + "개";
			} else {
				document.getElementById('reply-filename').value = fileName;
			}
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

//발송 취소
function sentCancel(noteNo) {
	console.log("발송취소 넘어는 오나");
	
	
	    var data = {
			  noteNo: noteNo
	    };
	    
	    
  		$.ajax({
	  	    url: "/exodia/noteSentCancelList",
	        type: "GET",
	        data: data 
      
        }).done(function(result) {
        	console.log("결과확인");
        	var html = jQuery('<div>').html(result);
        	var contents = html.find("div#sendCancelContent").html();
        	$("#sendCancel").html(contents);

        	
        	
        }).fail(function (jqXHR, textStatus, errorThrown) {
        	console.log("에러");
        	console.log(jqXHR);
        	console.log(textStatus);
        	console.log(errorThrown);
        	
        });
	
	
}

function sentCancelNo(noteReadNo) {
	
	var data = {
			noteReadNo: noteReadNo
	};
	  
	$.ajax({
    url: "/exodia/noteSentCancel",
    type: "POST",
    data: data 
  
    }).done(function(result) {
    	
    	console.log("결과확인");
    	$("#s-" + noteReadNo).removeClass("d-none");
    	$("#b-" + noteReadNo).addClass("d-none");
    	
    
    	
    	
    }).fail(function (jqXHR, textStatus, errorThrown) {
    	console.log("에러");
    	console.log(jqXHR);
    	console.log(textStatus);
    	console.log(errorThrown);
    	
    });
	
	
}

function sentCancelAll() {
	console.log("일괄취소요.");
	var elementIds = [];
	$(".cancelList").each(function() {
	    elementIds.push($(this).attr("id"));
	});
	
	console.log(elementIds+"ㅇㅇ머머있나 아이디 보자");
	// 체크된 체크박스의 ID를 가져오고 배열에 저장
	var checkedIds = elementIds.map(element => element.replace('b-', ''));

	// 체크된 체크박스의 ID 배열을 문자열로 조인
	var noteReadNo = checkedIds.join(', ');
	
	if(noteReadNo === "") {
		 Swal.fire({
		        text: "발송취소할 목록이 없습니다.",
		        icon: 'warning',
		        customClass: {
		          confirmButton: 'btn btn-primary'
		        },
		        buttonsStyling: false
		      });
	} else {
		var data = {
				noteReadNo: noteReadNo
		};
		
		$.ajax({
			url: "/exodia/noteSentCancel",
			type: "POST",
			data: data 
			
		}).done(function(result) {
			 console.log("발송취소 성공");
			 console.log(result.noCancel+"넌 값이뭐냐 대체"); 
			 if(result.noCancel === "발송취소할 목록이 없습니다.") {
				 Swal.fire({
				        text: result.noCancel,
				        icon: 'warning',
				        customClass: {
				          confirmButton: 'btn btn-primary'
				        },
				        buttonsStyling: false
				      });
			 } else {
				 Swal.fire({
				        text: result.noCancel,
				        icon: 'success',
				        customClass: {
				          confirmButton: 'btn btn-primary'
				        },
				        buttonsStyling: false
				      });
				 
				 
				 
			 }
			$(".cancelComplete").removeClass("d-none");
			$(".cancelList").addClass("d-none");
			
			
		
			
		}).fail(function (jqXHR, textStatus, errorThrown) {
			console.log("에러");
			console.log(jqXHR);
			console.log(textStatus);
			console.log(errorThrown);
			
		});
	}
	
	
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

//검색 쪽지함 페이징처리
function showSearchEmailList(searchKeyword, contentType, pageNo) {
	console.log(contentType+":내용타입"+pageNo+":페이지넘버"+searchKeyword+"야 서치키워드 잘오냐");
	var content = contentType;
	if(content === '수신') {
		var postData = {
				searchKeyword: searchKeyword,
				pageInboxSearch: pageNo
		};
		
		// AJAX 요청으로 데이터 전송
		$.ajax({
			url: "/exodia/noteInboxSearch",
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
				searchKeyword: searchKeyword,
				pageSentSearch: pageNo
		};
		
		// AJAX 요청으로 데이터 전송
		$.ajax({
			url: "/exodia/noteSentSearch",
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
				searchKeyword: searchKeyword,
				pageDraftSearch: pageNo
		};
		
		// AJAX 요청으로 데이터 전송
		$.ajax({
			url: "/exodia/noteDraftSearch",
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
				searchKeyword: searchKeyword,
				pageStarredSearch: pageNo
		};
		
		// AJAX 요청으로 데이터 전송
		$.ajax({
			url: "/exodia/noteStarredSearch",
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
				searchKeyword: searchKeyword,
				pageTrashSearch: pageNo
		};
		
		// AJAX 요청으로 데이터 전송
		$.ajax({
			url: "/exodia/noteTashSearch",
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
		            	$.ajax({
			        	    url: '/exodia/updateNoteNo',
			        	    type: 'GET',
			        	    dataType: 'json', // 반환되는 데이터 형식을 JSON으로 지정
			        	    success: function(response) {
			        	        // 서버에서 받아온 숫자 값
			        	        var uckNo = response.uckNo;
			        	        var trashNo = response.trashNo;
			        	        var draftNo = response.draftNo;
			        	        var starredNo = response.starredNo;
			        	        

			        	        // 여기에서 숫자 값을 사용하도록 로직을 추가
			        	        console.log('Received number:', uckNo);
			        	        var unreadNote = document.querySelector("#unreadNote");
			        	        if (uckNo === 0) {
			        	        	unreadNote.classList.add('d-none');
			        	        } else if(uckNo !== 0){
			        	        	unreadNote.classList.remove('d-none');
			        	        	unreadNote.innerText = uckNo;
			        	        }
			        	        var draftNote = document.querySelector("#draftNote");
			        	        if (draftNo === 0) {
			        	        	draftNote.classList.add('d-none');
			        	        } else if(draftNo !== 0){
			        	        	draftNote.classList.remove('d-none');
			        	        	draftNote.innerText = draftNo;
			        	        }
			        	        var starredNote = document.querySelector("#starredNote");
			        	        if (starredNo === 0) {
			        	        	starredNote.classList.add('d-none');
			        	        	console.log('uckNo is 0');
			        	        } else if(starredNo !== 0){
			        	        	starredNote.classList.remove('d-none');
			        	        	starredNote.innerText = starredNo;
			        	        }
			        	        var trashNote = document.querySelector("#trashNote");
			        	        if (trashNo === 0) {
			        	        	trashNote.classList.add('d-none');
			        	        	console.log('uckNo is 0');
			        	        } else if(trashNo !== 0){
			        	        	trashNote.classList.remove('d-none');
			        	        	trashNote.innerText = trashNo;
			        	        	console.log('uckNo is not 0');
			        	        }
			        	        
			        	        
			        	    },
			        	    error: function(error) {
			        	        console.error('Error fetching data:', error);
			        	    }
			        	});
		            	
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
	            	$.ajax({
		        	    url: '/exodia/updateNoteNo',
		        	    type: 'GET',
		        	    dataType: 'json', // 반환되는 데이터 형식을 JSON으로 지정
		        	    success: function(response) {
		        	        // 서버에서 받아온 숫자 값
		        	        var uckNo = response.uckNo;
		        	        var trashNo = response.trashNo;
		        	        var draftNo = response.draftNo;
		        	        var starredNo = response.starredNo;
		        	        

		        	        // 여기에서 숫자 값을 사용하도록 로직을 추가
		        	        console.log('Received number:', uckNo);
		        	        var unreadNote = document.querySelector("#unreadNote");
		        	        if (uckNo === 0) {
		        	        	unreadNote.classList.add('d-none');
		        	        } else if(uckNo !== 0){
		        	        	unreadNote.classList.remove('d-none');
		        	        	unreadNote.innerText = uckNo;
		        	        }
		        	        var draftNote = document.querySelector("#draftNote");
		        	        if (draftNo === 0) {
		        	        	draftNote.classList.add('d-none');
		        	        } else if(draftNo !== 0){
		        	        	draftNote.classList.remove('d-none');
		        	        	draftNote.innerText = draftNo;
		        	        }
		        	        var starredNote = document.querySelector("#starredNote");
		        	        if (starredNo === 0) {
		        	        	starredNote.classList.add('d-none');
		        	        	console.log('uckNo is 0');
		        	        } else if(starredNo !== 0){
		        	        	starredNote.classList.remove('d-none');
		        	        	starredNote.innerText = starredNo;
		        	        }
		        	        var trashNote = document.querySelector("#trashNote");
		        	        if (trashNo === 0) {
		        	        	trashNote.classList.add('d-none');
		        	        	console.log('uckNo is 0');
		        	        } else if(trashNo !== 0){
		        	        	trashNote.classList.remove('d-none');
		        	        	trashNote.innerText = trashNo;
		        	        	console.log('uckNo is not 0');
		        	        }
		        	        
		        	        
		        	    },
		        	    error: function(error) {
		        	        console.error('Error fetching data:', error);
		        	    }
		        	});
	            	
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

//수신함 선택된 항목 휴지통보내기
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
     		    	$.ajax({
    	        	    url: '/exodia/updateNoteNo',
    	        	    type: 'GET',
    	        	    dataType: 'json', // 반환되는 데이터 형식을 JSON으로 지정
    	        	    success: function(response) {
    	        	        // 서버에서 받아온 숫자 값
    	        	        var uckNo = response.uckNo;
    	        	        var trashNo = response.trashNo;
    	        	        var draftNo = response.draftNo;
    	        	        var starredNo = response.starredNo;
    	        	        

    	        	        // 여기에서 숫자 값을 사용하도록 로직을 추가
    	        	        console.log('Received number:', uckNo);
    	        	        var unreadNote = document.querySelector("#unreadNote");
		        	        if (uckNo === 0) {
		        	        	unreadNote.classList.add('d-none');
		        	        } else if(uckNo !== 0){
		        	        	unreadNote.classList.remove('d-none');
		        	        	unreadNote.innerText = uckNo;
		        	        }
		        	        var draftNote = document.querySelector("#draftNote");
		        	        if (draftNo === 0) {
		        	        	draftNote.classList.add('d-none');
		        	        } else if(draftNo !== 0){
		        	        	draftNote.classList.remove('d-none');
		        	        	draftNote.innerText = draftNo;
		        	        }
		        	        var starredNote = document.querySelector("#starredNote");
		        	        if (starredNo === 0) {
		        	        	starredNote.classList.add('d-none');
		        	        	console.log('uckNo is 0');
		        	        } else if(starredNo !== 0){
		        	        	starredNote.classList.remove('d-none');
		        	        	starredNote.innerText = starredNo;
		        	        }
		        	        var trashNote = document.querySelector("#trashNote");
		        	        if (trashNo === 0) {
		        	        	trashNote.classList.add('d-none');
		        	        	console.log('uckNo is 0');
		        	        } else if(trashNo !== 0){
		        	        	trashNote.classList.remove('d-none');
		        	        	trashNote.innerText = trashNo;
		        	        	console.log('uckNo is not 0');
		        	        }
    	        	        
    	        	    },
    	        	    error: function(error) {
    	        	        console.error('Error fetching data:', error);
    	        	    }
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
	// 체크된 체크박스의 ID 출력
	
	
}

//중요 메세지함 선택된 항목 휴지통보내기
function deleteStarredNote(type) {
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
	 Swal.fire({
		 	title: "중요 쪽지입니다.",
	        text: "휴지통으로 보내시겠습니까?",
	        icon: 'warning',
	        showCancelButton: true,
	        confirmButtonText: '보내기',
	        cancelButtonText: '취소',
	        customClass: {
	          confirmButton: 'btn btn-primary me-3',
	          cancelButton: 'btn btn-label-secondary'
	        },
	        buttonsStyling: false
	      }).then(function (result) {
	        if (result.value) {
	          Swal.fire({
	            icon: 'success',
	            text: '휴지통으로 이동되었습니다.',
	            customClass: {
	              confirmButton: 'btn btn-success'
	            }
	          });
	
			console.log("체크된 체크박스의 ID: " + checkedIdsString);
			// AJAX 요청으로 데이터 전송
			$.ajax({
				url: "/exodia/trashNote",
				type: "POST",
				data: postData,
				success: function(response) {
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
		    			$.ajax({
			        	    url: '/exodia/updateNoteNo',
			        	    type: 'GET',
			        	    dataType: 'json', // 반환되는 데이터 형식을 JSON으로 지정
			        	    success: function(response) {
			        	        // 서버에서 받아온 숫자 값
			        	        var uckNo = response.uckNo;
			        	        var trashNo = response.trashNo;
			        	        var draftNo = response.draftNo;
			        	        var starredNo = response.starredNo;
			        	        
		
			        	        // 여기에서 숫자 값을 사용하도록 로직을 추가
			        	        console.log('Received number:', uckNo);
			        	        var unreadNote = document.querySelector("#unreadNote");
			        	        if (uckNo === 0) {
			        	        	unreadNote.classList.add('d-none');
			        	        } else if(uckNo !== 0){
			        	        	unreadNote.classList.remove('d-none');
			        	        	unreadNote.innerText = uckNo;
			        	        }
			        	        var draftNote = document.querySelector("#draftNote");
			        	        if (draftNo === 0) {
			        	        	draftNote.classList.add('d-none');
			        	        } else if(draftNo !== 0){
			        	        	draftNote.classList.remove('d-none');
			        	        	draftNote.innerText = draftNo;
			        	        }
			        	        var starredNote = document.querySelector("#starredNote");
			        	        if (starredNo === 0) {
			        	        	starredNote.classList.add('d-none');
			        	        	console.log('uckNo is 0');
			        	        } else if(starredNo !== 0){
			        	        	starredNote.classList.remove('d-none');
			        	        	starredNote.innerText = starredNo;
			        	        }
			        	        var trashNote = document.querySelector("#trashNote");
			        	        if (trashNo === 0) {
			        	        	trashNote.classList.add('d-none');
			        	        	console.log('uckNo is 0');
			        	        } else if(trashNo !== 0){
			        	        	trashNote.classList.remove('d-none');
			        	        	trashNote.innerText = trashNo;
			        	        	console.log('uckNo is not 0');
			        	        }
			        	        
			        	        
			        	    },
			        	    error: function(error) {
			        	        console.error('Error fetching data:', error);
			        	    }
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
	       }
	     });
}

//선택된 항목 휴지통비우기
function trashDelete(type) {
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
	
	
	 Swal.fire({
	        text: "휴지통에서 삭제한 쪽지는 영구삭제됩니다.",
	        icon: 'warning',
	        showCancelButton: true,
	        confirmButtonText: '비우기',
	        cancelButtonText: '취소',
	        customClass: {
	          confirmButton: 'btn btn-primary me-3',
	          cancelButton: 'btn btn-label-secondary'
	        },
	        buttonsStyling: false
	      }).then(function (result) {
	        if (result.value) {
	          Swal.fire({
	            icon: 'success',
	            text: '쪽지가 삭제되었습니다.',
	            customClass: {
	              confirmButton: 'btn btn-success'
	            }
	          });
	          
	          
	          
	          $.ajax({
	      		url: "/exodia/deleteTrashNote",
	      		type: "POST",
	      		data: postData,
	      		success: function(response) {
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
	          			$.ajax({
	      	        	    url: '/exodia/updateNoteNo',
	      	        	    type: 'GET',
	      	        	    dataType: 'json', // 반환되는 데이터 형식을 JSON으로 지정
	      	        	    success: function(response) {
	      	        	        // 서버에서 받아온 숫자 값
	      	        	        var uckNo = response.uckNo;
	      	        	        var trashNo = response.trashNo;
	      	        	        var draftNo = response.draftNo;
	      	        	        var starredNo = response.starredNo;
	      	        	        

	      	        	        // 여기에서 숫자 값을 사용하도록 로직을 추가
	      	        	        console.log('Received number:', uckNo);
	      	        	        var unreadNote = document.querySelector("#unreadNote");
	      	        	        if (uckNo === 0) {
	      	        	        	unreadNote.classList.add('d-none');
	      	        	        } else if(uckNo !== 0){
	      	        	        	unreadNote.classList.remove('d-none');
	      	        	        	unreadNote.innerText = uckNo;
	      	        	        }
	      	        	        var draftNote = document.querySelector("#draftNote");
	      	        	        if (draftNo === 0) {
	      	        	        	draftNote.classList.add('d-none');
	      	        	        } else if(draftNo !== 0){
	      	        	        	draftNote.classList.remove('d-none');
	      	        	        	draftNote.innerText = draftNo;
	      	        	        }
	      	        	        var starredNote = document.querySelector("#starredNote");
	      	        	        if (starredNo === 0) {
	      	        	        	starredNote.classList.add('d-none');
	      	        	        	console.log('uckNo is 0');
	      	        	        } else if(starredNo !== 0){
	      	        	        	starredNote.classList.remove('d-none');
	      	        	        	starredNote.innerText = starredNo;
	      	        	        }
	      	        	        var trashNote = document.querySelector("#trashNote");
	      	        	        if (trashNo === 0) {
	      	        	        	trashNote.classList.add('d-none');
	      	        	        	console.log('uckNo is 0');
	      	        	        } else if(trashNo !== 0){
	      	        	        	trashNote.classList.remove('d-none');
	      	        	        	trashNote.innerText = trashNo;
	      	        	        	console.log('uckNo is not 0');
	      	        	        }
	      	        	        
	      	        	        
	      	        	    },
	      	        	    error: function(error) {
	      	        	        console.error('Error fetching data:', error);
	      	        	    }
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
	          
	        }
	      });
	// AJAX 요청으로 데이터 전송
	
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
    			$.ajax({
	        	    url: '/exodia/updateNoteNo',
	        	    type: 'GET',
	        	    dataType: 'json', // 반환되는 데이터 형식을 JSON으로 지정
	        	    success: function(response) {
	        	        // 서버에서 받아온 숫자 값
	        	        var uckNo = response.uckNo;
	        	        var trashNo = response.trashNo;
	        	        var draftNo = response.draftNo;
	        	        var starredNo = response.starredNo;
	        	        

	        	        // 여기에서 숫자 값을 사용하도록 로직을 추가
	        	        console.log('Received number:', uckNo);
	        	        var unreadNote = document.querySelector("#unreadNote");
	        	        if (uckNo === 0) {
	        	        	unreadNote.classList.add('d-none');
	        	        } else if(uckNo !== 0){
	        	        	unreadNote.classList.remove('d-none');
	        	        	unreadNote.innerText = uckNo;
	        	        }
	        	        var draftNote = document.querySelector("#draftNote");
	        	        if (draftNo === 0) {
	        	        	draftNote.classList.add('d-none');
	        	        } else if(draftNo !== 0){
	        	        	draftNote.classList.remove('d-none');
	        	        	draftNote.innerText = draftNo;
	        	        }
	        	        var starredNote = document.querySelector("#starredNote");
	        	        if (starredNo === 0) {
	        	        	starredNote.classList.add('d-none');
	        	        	console.log('uckNo is 0');
	        	        } else if(starredNo !== 0){
	        	        	starredNote.classList.remove('d-none');
	        	        	starredNote.innerText = starredNo;
	        	        }
	        	        var trashNote = document.querySelector("#trashNote");
	        	        if (trashNo === 0) {
	        	        	trashNote.classList.add('d-none');
	        	        	console.log('uckNo is 0');
	        	        } else if(trashNo !== 0){
	        	        	trashNote.classList.remove('d-none');
	        	        	trashNote.innerText = trashNo;
	        	        	console.log('uckNo is not 0');
	        	        }
	        	        
	        	        
	        	    },
	        	    error: function(error) {
	        	        console.error('Error fetching data:', error);
	        	    }
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
	// 체크된 체크박스의 ID 출력
	
	
}
//수신함 휴지통 보내기
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
	     		    	$.ajax({
	    	        	    url: '/exodia/updateNoteNo',
	    	        	    type: 'GET',
	    	        	    dataType: 'json', // 반환되는 데이터 형식을 JSON으로 지정
	    	        	    success: function(response) {
	    	        	        // 서버에서 받아온 숫자 값
	    	        	        var uckNo = response.uckNo;
	    	        	        var trashNo = response.trashNo;
	    	        	        var draftNo = response.draftNo;
	    	        	        var starredNo = response.starredNo;
	    	        	        

	    	        	        // 여기에서 숫자 값을 사용하도록 로직을 추가
	    	        	        console.log('Received number:', uckNo);
	    	        	        var unreadNote = document.querySelector("#unreadNote");
			        	        if (uckNo === 0) {
			        	        	unreadNote.classList.add('d-none');
			        	        } else if(uckNo !== 0){
			        	        	unreadNote.classList.remove('d-none');
			        	        	unreadNote.innerText = uckNo;
			        	        }
			        	        var draftNote = document.querySelector("#draftNote");
			        	        if (draftNo === 0) {
			        	        	draftNote.classList.add('d-none');
			        	        } else if(draftNo !== 0){
			        	        	draftNote.classList.remove('d-none');
			        	        	draftNote.innerText = draftNo;
			        	        }
			        	        var starredNote = document.querySelector("#starredNote");
			        	        if (starredNo === 0) {
			        	        	starredNote.classList.add('d-none');
			        	        	console.log('uckNo is 0');
			        	        } else if(starredNo !== 0){
			        	        	starredNote.classList.remove('d-none');
			        	        	starredNote.innerText = starredNo;
			        	        }
			        	        var trashNote = document.querySelector("#trashNote");
			        	        if (trashNo === 0) {
			        	        	trashNote.classList.add('d-none');
			        	        	console.log('uckNo is 0');
			        	        } else if(trashNo !== 0){
			        	        	trashNote.classList.remove('d-none');
			        	        	trashNote.innerText = trashNo;
			        	        	console.log('uckNo is not 0');
			        	        }
	    	        	        
	    	        	        
	    	        	    },
	    	        	    error: function(error) {
	    	        	        console.error('Error fetching data:', error);
	    	        	    }
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
	
}
//중요메세지함 휴지통 보내기
function deleteStarredSingleNote(noteReadNo) {
	var postData = {
			checkedIdsString: noteReadNo
	};
	 Swal.fire({
		 	title: "중요 쪽지입니다.",
	        text: "휴지통으로 보내시겠습니까?",
	        icon: 'warning',
	        showCancelButton: true,
	        confirmButtonText: '보내기',
	        cancelButtonText: '취소',
	        customClass: {
	          confirmButton: 'btn btn-primary me-3',
	          cancelButton: 'btn btn-label-secondary'
	        },
	        buttonsStyling: false
	      }).then(function (result) {
	        if (result.value) {
	          Swal.fire({
	            icon: 'success',
	            text: '휴지통으로 이동되었습니다.',
	            customClass: {
	              confirmButton: 'btn btn-success'
	            }
	          });
				// AJAX 요청으로 데이터 전송
				$.ajax({
					url: "/exodia/trashNote",
					type: "POST",
					data: postData,
					success: function(response) {
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
			    			$.ajax({
				        	    url: '/exodia/updateNoteNo',
				        	    type: 'GET',
				        	    dataType: 'json', // 반환되는 데이터 형식을 JSON으로 지정
				        	    success: function(response) {
				        	        // 서버에서 받아온 숫자 값
				        	        var uckNo = response.uckNo;
				        	        var trashNo = response.trashNo;
				        	        var draftNo = response.draftNo;
				        	        var starredNo = response.starredNo;
				        	        
			
				        	        // 여기에서 숫자 값을 사용하도록 로직을 추가
				        	        console.log('Received number:', uckNo);
				        	        var unreadNote = document.querySelector("#unreadNote");
				        	        if (uckNo === 0) {
				        	        	unreadNote.classList.add('d-none');
				        	        } else if(uckNo !== 0){
				        	        	unreadNote.classList.remove('d-none');
				        	        	unreadNote.innerText = uckNo;
				        	        }
				        	        var draftNote = document.querySelector("#draftNote");
				        	        if (draftNo === 0) {
				        	        	draftNote.classList.add('d-none');
				        	        } else if(draftNo !== 0){
				        	        	draftNote.classList.remove('d-none');
				        	        	draftNote.innerText = draftNo;
				        	        }
				        	        var starredNote = document.querySelector("#starredNote");
				        	        if (starredNo === 0) {
				        	        	starredNote.classList.add('d-none');
				        	        	console.log('uckNo is 0');
				        	        } else if(starredNo !== 0){
				        	        	starredNote.classList.remove('d-none');
				        	        	starredNote.innerText = starredNo;
				        	        }
				        	        var trashNote = document.querySelector("#trashNote");
				        	        if (trashNo === 0) {
				        	        	trashNote.classList.add('d-none');
				        	        	console.log('uckNo is 0');
				        	        } else if(trashNo !== 0){
				        	        	trashNote.classList.remove('d-none');
				        	        	trashNote.innerText = trashNo;
				        	        	console.log('uckNo is not 0');
				        	        }
				        	        
				        	        
				        	    },
				        	    error: function(error) {
				        	        console.error('Error fetching data:', error);
				        	    }
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
	        }
	     });
	
}

//휴지통 개별항목 지우기
function deleteTrashSingleNote(noteReadNo) {
	var postData = {
			checkedIdsString: noteReadNo
	};
	
	 Swal.fire({
		 	title: "휴지통 비우기",
	        text: "휴지통에서 삭제한 쪽지는 영구삭제됩니다.",
	        icon: 'warning',
	        showCancelButton: true,
	        confirmButtonText: '비우기',
	        cancelButtonText: '취소',
	        customClass: {
	          confirmButton: 'btn btn-primary me-3',
	          cancelButton: 'btn btn-label-secondary'
	        },
	        buttonsStyling: false
	      }).then(function (result) {
	        if (result.value) {
	          Swal.fire({
	            icon: 'success',
	            text: '쪽지가 삭제되었습니다.',
	            customClass: {
	              confirmButton: 'btn btn-success'
	            }
	          });
	// AJAX 요청으로 데이터 전송
	          $.ajax({
	      		url: "/exodia/deleteTrashNote",
	      		type: "POST",
	      		data: postData,
	      		success: function(response) {
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
	          			$.ajax({
	      	        	    url: '/exodia/updateNoteNo',
	      	        	    type: 'GET',
	      	        	    dataType: 'json', // 반환되는 데이터 형식을 JSON으로 지정
	      	        	    success: function(response) {
	      	        	        // 서버에서 받아온 숫자 값
	      	        	        var uckNo = response.uckNo;
	      	        	        var trashNo = response.trashNo;
	      	        	        var draftNo = response.draftNo;
	      	        	        var starredNo = response.starredNo;
	      	        	        

	      	        	        // 여기에서 숫자 값을 사용하도록 로직을 추가
	      	        	        console.log('Received number:', uckNo);
	      	        	        var unreadNote = document.querySelector("#unreadNote");
	      	        	        if (uckNo === 0) {
	      	        	        	unreadNote.classList.add('d-none');
	      	        	        } else if(uckNo !== 0){
	      	        	        	unreadNote.classList.remove('d-none');
	      	        	        	unreadNote.innerText = uckNo;
	      	        	        }
	      	        	        var draftNote = document.querySelector("#draftNote");
	      	        	        if (draftNo === 0) {
	      	        	        	draftNote.classList.add('d-none');
	      	        	        } else if(draftNo !== 0){
	      	        	        	draftNote.classList.remove('d-none');
	      	        	        	draftNote.innerText = draftNo;
	      	        	        }
	      	        	        var starredNote = document.querySelector("#starredNote");
	      	        	        if (starredNo === 0) {
	      	        	        	starredNote.classList.add('d-none');
	      	        	        	console.log('uckNo is 0');
	      	        	        } else if(starredNo !== 0){
	      	        	        	starredNote.classList.remove('d-none');
	      	        	        	starredNote.innerText = starredNo;
	      	        	        }
	      	        	        var trashNote = document.querySelector("#trashNote");
	      	        	        if (trashNo === 0) {
	      	        	        	trashNote.classList.add('d-none');
	      	        	        	console.log('uckNo is 0');
	      	        	        } else if(trashNo !== 0){
	      	        	        	trashNote.classList.remove('d-none');
	      	        	        	trashNote.innerText = trashNo;
	      	        	        	console.log('uckNo is not 0');
	      	        	        }
	      	        	        
	      	        	        
	      	        	    },
	      	        	    error: function(error) {
	      	        	        console.error('Error fetching data:', error);
	      	        	    }
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
	        }
	    });
	        
}

//발신 개별 메세지 지우기
function deleteSentSingleNote(noteNo) {
	var postData = {
			checkedIdsString: noteNo
	};
	 Swal.fire({
		 	title: "발신 쪽지 삭제",
	        text: "발신 쪽지는 삭제시 복구할 수 없습니다.",
	        icon: 'warning',
	        showCancelButton: true,
	        confirmButtonText: '지우기',
	        cancelButtonText: '취소',
	        customClass: {
	          confirmButton: 'btn btn-primary me-3',
	          cancelButton: 'btn btn-label-secondary'
	        },
	        buttonsStyling: false
	      }).then(function (result) {
	        if (result.value) {
	          Swal.fire({
	            icon: 'success',
	            text: '삭제되었습니다.',
	            customClass: {
	              confirmButton: 'btn btn-success'
	            }
	          });
				// AJAX 요청으로 데이터 전송
				$.ajax({
					url: "/exodia/deleteSentNote",
					type: "POST",
					data: postData,
					success: function(response) {
						
						
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
				        	console.log("발신메세지함 넘어오니");
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
	        }
	   });
	 
				
}

//임시저장 개별항목지우기
function deleteDraftSingleNote(noteNo) {
	var postData = {
			checkedIdsString: noteNo
	};
	 Swal.fire({
		 	title: "임시저장 쪽지 삭제",
	        text: "임시저장 쪽지는 삭제시 복구할 수 없습니다.",
	        icon: 'warning',
	        showCancelButton: true,
	        confirmButtonText: '지우기',
	        cancelButtonText: '취소',
	        customClass: {
	          confirmButton: 'btn btn-primary me-3',
	          cancelButton: 'btn btn-label-secondary'
	        },
	        buttonsStyling: false
	      }).then(function (result) {
	        if (result.value) {
	          Swal.fire({
	            icon: 'success',
	            text: '삭제되었습니다.',
	            customClass: {
	              confirmButton: 'btn btn-success'
	            }
	          });
				// AJAX 요청으로 데이터 전송
				$.ajax({
					url: "/exodia/deleteSentNote",
					type: "POST",
					data: postData,
					success: function(response) {
						
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
			    			$.ajax({
				        	    url: '/exodia/updateNoteNo',
				        	    type: 'GET',
				        	    dataType: 'json', // 반환되는 데이터 형식을 JSON으로 지정
				        	    success: function(response) {
				        	        // 서버에서 받아온 숫자 값
				        	        var uckNo = response.uckNo;
				        	        var trashNo = response.trashNo;
				        	        var draftNo = response.draftNo;
				        	        var starredNo = response.starredNo;
				        	        
			
				        	        // 여기에서 숫자 값을 사용하도록 로직을 추가
				        	        console.log('Received number:', uckNo);
				        	        var unreadNote = document.querySelector("#unreadNote");
				        	        if (uckNo === 0) {
				        	        	unreadNote.classList.add('d-none');
				        	        } else if(uckNo !== 0){
				        	        	unreadNote.classList.remove('d-none');
				        	        	unreadNote.innerText = uckNo;
				        	        }
				        	        var draftNote = document.querySelector("#draftNote");
				        	        if (draftNo === 0) {
				        	        	draftNote.classList.add('d-none');
				        	        } else if(draftNo !== 0){
				        	        	draftNote.classList.remove('d-none');
				        	        	draftNote.innerText = draftNo;
				        	        }
				        	        var starredNote = document.querySelector("#starredNote");
				        	        if (starredNo === 0) {
				        	        	starredNote.classList.add('d-none');
				        	        	console.log('uckNo is 0');
				        	        } else if(starredNo !== 0){
				        	        	starredNote.classList.remove('d-none');
				        	        	starredNote.innerText = starredNo;
				        	        }
				        	        var trashNote = document.querySelector("#trashNote");
				        	        if (trashNo === 0) {
				        	        	trashNote.classList.add('d-none');
				        	        	console.log('uckNo is 0');
				        	        } else if(trashNo !== 0){
				        	        	trashNote.classList.remove('d-none');
				        	        	trashNote.innerText = trashNo;
				        	        	console.log('uckNo is not 0');
				        	        }
				        	        
				        	    },
				        	    error: function(error) {
				        	        console.error('Error fetching data:', error);
				        	    }
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
	        }
	    });
	
}

//선택된 항목 발신 메세지 지우기
function deleteSentNote(type) {
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
	 Swal.fire({
		 	title: "발신 쪽지 삭제",
	        text: "발신 쪽지는 삭제시 복구할 수 없습니다.",
	        icon: 'warning',
	        showCancelButton: true,
	        confirmButtonText: '지우기',
	        cancelButtonText: '취소',
	        customClass: {
	          confirmButton: 'btn btn-primary me-3',
	          cancelButton: 'btn btn-label-secondary'
	        },
	        buttonsStyling: false
	      }).then(function (result) {
	        if (result.value) {
	          Swal.fire({
	            icon: 'success',
	            text: '삭제되었습니다.',
	            customClass: {
	              confirmButton: 'btn btn-success'
	            }
	          });
				// AJAX 요청으로 데이터 전송
				$.ajax({
					url: "/exodia/deleteSentNote",
					type: "POST",
					data: postData,
					success: function(response) {
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
				        	console.log("발신메세지함 넘어오니");
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
				// 체크된 체크박스의 ID 출력
	        }
	   });
}

//선택된 항목 임시 메세지 지우기
function deleteDraftNote(type) {
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
	 Swal.fire({
		 	title: "임시저장 쪽지 삭제",
	        text: "임시저장 쪽지는 삭제시 복구할 수 없습니다",
	        icon: 'warning',
	        showCancelButton: true,
	        confirmButtonText: '지우기',
	        cancelButtonText: '취소',
	        customClass: {
	          confirmButton: 'btn btn-primary me-3',
	          cancelButton: 'btn btn-label-secondary'
	        },
	        buttonsStyling: false
	      }).then(function (result) {
	        if (result.value) {
	          Swal.fire({
	            icon: 'success',
	            text: '삭제되었습니다.',
	            customClass: {
	              confirmButton: 'btn btn-success'
	            }
	          });
				// AJAX 요청으로 데이터 전송
				$.ajax({
					url: "/exodia/deleteSentNote",
					type: "POST",
					data: postData,
					success: function(response) {
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
			    			$.ajax({
				        	    url: '/exodia/updateNoteNo',
				        	    type: 'GET',
				        	    dataType: 'json', // 반환되는 데이터 형식을 JSON으로 지정
				        	    success: function(response) {
				        	        // 서버에서 받아온 숫자 값
				        	        var uckNo = response.uckNo;
				        	        var trashNo = response.trashNo;
				        	        var draftNo = response.draftNo;
				        	        var starredNo = response.starredNo;
				        	        
			
				        	        // 여기에서 숫자 값을 사용하도록 로직을 추가
				        	        console.log('Received number:', uckNo);
				        	        var unreadNote = document.querySelector("#unreadNote");
				        	        if (uckNo === 0) {
				        	        	unreadNote.classList.add('d-none');
				        	        } else if(uckNo !== 0){
				        	        	unreadNote.classList.remove('d-none');
				        	        	unreadNote.innerText = uckNo;
				        	        }
				        	        var draftNote = document.querySelector("#draftNote");
				        	        if (draftNo === 0) {
				        	        	draftNote.classList.add('d-none');
				        	        } else if(draftNo !== 0){
				        	        	draftNote.classList.remove('d-none');
				        	        	draftNote.innerText = draftNo;
				        	        }
				        	        var starredNote = document.querySelector("#starredNote");
				        	        if (starredNo === 0) {
				        	        	starredNote.classList.add('d-none');
				        	        	console.log('uckNo is 0');
				        	        } else if(starredNo !== 0){
				        	        	starredNote.classList.remove('d-none');
				        	        	starredNote.innerText = starredNo;
				        	        }
				        	        var trashNote = document.querySelector("#trashNote");
				        	        if (trashNo === 0) {
				        	        	trashNote.classList.add('d-none');
				        	        	console.log('uckNo is 0');
				        	        } else if(trashNo !== 0){
				        	        	trashNote.classList.remove('d-none');
				        	        	trashNote.innerText = trashNo;
				        	        	console.log('uckNo is not 0');
				        	        }
				        	        
				        	    },
				        	    error: function(error) {
				        	        console.error('Error fetching data:', error);
				        	    }
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
				// 체크된 체크박스의 ID 출력
	        }
	   });
}
window.addEventListener('beforeunload', beforeUnloadHandler);
function beforeUnloadHandler(event) {
    var note_receiver = $("#emailContacts").val();
    var note_title = $("#email-subject").val();

    if (note_receiver !== "" && note_title !== "") {
        // 임시 저장 로직 호출
    	showdraft();
    }
}
function removeBeforeUnloadHandler() {
    window.removeEventListener('beforeunload', beforeUnloadHandler);
}

function showdraft() {
	  var note_receiver = $("#emailContacts").val();
	  var note_receiver_cc = $("#selectpickerSelectDeselect").val();
	  var note_receiver_bcc = $("#selecBcc").val();
	  var note_title = $("#email-subject").val();
	  var note_content = $("#note-content").val();
	  var note_label = $("#note_label").val();
	  const fileInput = $("#attach-file");

	  const formData = new FormData();
	  formData.append('note_receiver', note_receiver);
	  formData.append('note_receiver_cc', note_receiver_cc);
	  formData.append('note_receiver_bcc', note_receiver_bcc);
	  formData.append('note_title', note_title);
	  formData.append('note_content', note_content);
	  formData.append('note_label', note_label);
	  
	  for(var i=0; i<fileInput.length; i++) {
		  console.log("뭐냐고 파일 들어오지도않냐");
		  if(fileInput[i].files.length >0) {
			  for(var j = 0; j < fileInput[i].files.length; j++) {
				  formData.append('files', $("#attach-file")[i].files[j]);
				  console.log($("#attach-file")[i].files[j]+"뭐냐고 파일");
			  }
			  
		  }
	  }

	  //formData.append('files', files);

	  console.log([...formData]+"폼데이터뭔데");
	  // AJAX 요청으로 데이터 전송
	  $.ajax({
	    url: "/exodia/draftNote",
	    type: "POST",
	    data: formData,
	    processData: false,
	    contentType: false,
	    enctype : 'multipart/form-data',
	    success: function (response) {
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
    			
    			$("#inboxTab").removeClass("active");
    			$("#sentTab").removeClass("active");
    			$("#starredTab").removeClass("active");
    			$("#trashTab").removeClass("active");
    			$("#draftTab").addClass("active");
    			
    			
			    $.ajax({
	        	    url: '/exodia/updateNoteNo',
	        	    type: 'GET',
	        	    dataType: 'json', // 반환되는 데이터 형식을 JSON으로 지정
	        	    success: function(response) {
	        	        // 서버에서 받아온 숫자 값
	        	        var uckNo = response.uckNo;
	        	        var trashNo = response.trashNo;
	        	        var draftNo = response.draftNo;
	        	        var starredNo = response.starredNo;
	        	        

	        	        // 여기에서 숫자 값을 사용하도록 로직을 추가
	        	        console.log('Received number:', uckNo);
	        	        var unreadNote = document.querySelector("#unreadNote");
	        	        if (uckNo === 0) {
	        	        	unreadNote.classList.add('d-none');
	        	        } else if(uckNo !== 0){
	        	        	unreadNote.classList.remove('d-none');
	        	        	unreadNote.innerText = uckNo;
	        	        }
	        	        var draftNote = document.querySelector("#draftNote");
	        	        if (draftNo === 0) {
	        	        	draftNote.classList.add('d-none');
	        	        } else if(draftNo !== 0){
	        	        	draftNote.classList.remove('d-none');
	        	        	draftNote.innerText = draftNo;
	        	        }
	        	        var starredNote = document.querySelector("#starredNote");
	        	        if (starredNo === 0) {
	        	        	starredNote.classList.add('d-none');
	        	        	console.log('uckNo is 0');
	        	        } else if(starredNo !== 0){
	        	        	starredNote.classList.remove('d-none');
	        	        	starredNote.innerText = starredNo;
	        	        }
	        	        var trashNote = document.querySelector("#trashNote");
	        	        if (trashNo === 0) {
	        	        	trashNote.classList.add('d-none');
	        	        	console.log('uckNo is 0');
	        	        } else if(trashNo !== 0){
	        	        	trashNote.classList.remove('d-none');
	        	        	trashNote.innerText = trashNo;
	        	        	console.log('uckNo is not 0');
	        	        }
	        	        
	        	        
	        	    },
	        	    error: function(error) {
	        	        console.error('Error fetching data:', error);
	        	    }
	        	});
    			
    			
    		}).fail(function (jqXHR, textStatus, errorThrown) {
    			console.log("에러");
    			console.log(jqXHR);
    			console.log(textStatus);
    			console.log(errorThrown);
    			
    		});
	    },
	    error: function () {
	      // 오류 처리
	      alert("데이터 전송 중 오류가 발생했습니다.");
	    }
	  });
}
//상세보기 팝업띄우기 - 수신
function noteDetailView(noteReadNo) {
	console.log(noteReadNo+"값 넘어오니?");
	
	var data = {
			noteReadNo: noteReadNo
	};
	
	$.ajax({
		url: "/exodia/noteDetailView",
		type: "GET",
		data: data
		
	}).done(function(result) {
		
		var url = "/exodia/noteDetailView?noteReadNo=" + noteReadNo;
        var popup = window.open(url, "MyPopup", "width=800, height=500");
		
		
	}).fail(function (jqXHR, textStatus, errorThrown) {
		console.log("에러");
		console.log(jqXHR);
		console.log(textStatus);
		console.log(errorThrown);
		
	});
	
	
}

//팝업창 띄우기 발신/임시저장
function noteDetailViewSent(noteNo) {
	console.log(noteNo+"값 넘어오니?");
	
	var data = {
			noteNo: noteNo
	};
	
	$.ajax({
		url: "/exodia/sentNoteDetailView",
		type: "GET",
		data: data
		
	}).done(function(result) {
		
		var url = "/exodia/sentNoteDetailView?noteNo=" + noteNo;
		var popup = window.open(url, "MyPopup", "width=800, height=500");
		
		
	}).fail(function (jqXHR, textStatus, errorThrown) {
		console.log("에러");
		console.log(jqXHR);
		console.log(textStatus);
		console.log(errorThrown);
		
	});
	
	
}
//수신함 검색
function searchInboxMail() {
	
	var searchKeyword = document.getElementById("searchNote").value;
	
	console.log(searchKeyword+"머 검색값은 잘가냐");
	
	var data = {
			searchKeyword: searchKeyword
	};
	
	$.ajax({
		url: "/exodia/noteInboxSearch",
		type: "GET",
		data: data
		
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
//발신함 검색
function searchSentMail() {
	
	var searchKeyword = document.getElementById("searchNote").value;
	
	console.log(searchKeyword+"머 검색값은 잘가냐");
	
	var data = {
			searchKeyword: searchKeyword
	};
	
	$.ajax({
		url: "/exodia/noteSentSearch",
		type: "GET",
		data: data
		
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
//중요함 검색
function searchStarredMail() {
	
	var searchKeyword = document.getElementById("searchNote").value;
	
	console.log(searchKeyword+"머 검색값은 잘가냐");
	
	var data = {
			searchKeyword: searchKeyword
	};
	
	$.ajax({
		url: "/exodia/noteStarredSearch",
		type: "GET",
		data: data
		
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
//휴지통 검색
function searchTrashMail() {
	
	var searchKeyword = document.getElementById("searchNote").value;
	
	console.log(searchKeyword+"머 검색값은 잘가냐");
	
	var data = {
			searchKeyword: searchKeyword
	};
	
	$.ajax({
		url: "/exodia/noteTashSearch",
		type: "GET",
		data: data
		
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
//임시저장함 검색
function searchDraftMail() {
	
	var searchKeyword = document.getElementById("searchNote").value;
	
	console.log(searchKeyword+"머 검색값은 잘가냐");
	
	var data = {
			searchKeyword: searchKeyword
	};
	
	$.ajax({
		url: "/exodia/noteDraftSearch",
		type: "GET",
		data: data
		
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


function editDraft() {
	
var button = document.getElementById("emailComposeSidebarLabel");
var emailccLink = document.getElementById("emailcc");
var emailbccLink = document.getElementById("emailbcc");
    if (button) {
        button.click(); // 버튼을 클릭합니다.
        
        
        
        var noteTitle = document.getElementById("noteTitle").value;
        var noteContent = document.getElementById("noteContent").value;
        
        
        var receiverInputs = document.querySelectorAll(".receiver");
        var receiverValues = [];

        receiverInputs.forEach(function(input) {
            receiverValues.push(input.value);
        });
        
        var ccInputs = document.querySelectorAll(".noteCC");
        var ccValues = [];
        if(ccValues) {
        	emailccLink.click(); 
        }
        ccInputs.forEach(function(input) {
        	ccValues.push(input.value);
        });
        
        var bccInputs = document.querySelectorAll(".noteBCC");
        var bccValues = [];
        if(bccValues) {
        	emailbccLink.click(); 
        }
        
        bccInputs.forEach(function(input) {
        	bccValues.push(input.value);
        });
        
        var fileInputs = document.querySelectorAll(".noteFiles");
        var fileValue = [];
        
        
        fileInputs.forEach(function(input) {
        	fileValue.push(input.value);
        });
    	

    	// 체크된 체크박스의 ID 배열을 문자열로 조인
    	var fileValues = fileValue.join(', ');
        
        
        
        if(fileValues.length === 0) {
        	
        	 
            document.getElementById("email-subject").value = noteTitle;
            console.log(receiverValues+"수신자");
            
            $('#selectpickerSelectDeselect').selectpicker('refresh');
            $('#selectpickerSelectDeselect').selectpicker('destroy');
            $('#selectpickerSelectDeselect').selectpicker(''); 
            $('#selecBcc').selectpicker('refresh');
            $('#selecBcc').selectpicker('destroy');
            $('#selecBcc').selectpicker(''); 
            
            $('#emailContacts').val(receiverValues).trigger('change');
            $('#selectpickerSelectDeselect').val(ccValues);
            $('#selecBcc').val(bccValues);
            console.log(ccValues+"참조");
            console.log(bccValues+"비밀참조");
            
            const quill = new Quill('.email-editor', {
                modules: {
                  toolbar: '.email-editor-toolbar'
                },
                placeholder: '메세지를 입력하세요.',
                theme: 'snow'
            });
            
            quill.clipboard.dangerouslyPasteHTML(noteContent);
        	
        	
        } else {
        	
        	console.log(fileValues+"파일밸류알려달라");
        	var data = {
        			fileValues: fileValues
        	};
        	
        	$.ajax({
        		url: "/exodia/editFileGet",
        		type: "POST",
        		data: data
        		
        	}).done(function(mediaList) {
        		
        		 if (Array.isArray(mediaList)) {
        		        mediaList.forEach(function (media) {
        		            // 파일 데이터를 나타낼 HTML 요소 생성
        		            var fileElement = document.createElement('a');
        		            fileElement.href = 'data:' + media.media_type + ';base64,' + btoa(String.fromCharCode.apply(null, new Uint8Array(media.media_data)));
        		            fileElement.download = media.media_name;
        		            fileElement.innerText = media.media_name;
        		            
        		            // input file multiple 필드에 파일 추가
        		            var fileInput = document.getElementById('attach-file'); // 필드의 ID를 사용하여 가져옵니다.
        		            fileInput.parentNode.insertBefore(fileElement, fileInput.nextSibling);
        		        });
    		    } else {
    		        console.error('서버 응답이 배열 형식이 아닙니다.'); // 예외 처리
    		    }
    		
        		 
                document.getElementById("email-subject").value = noteTitle;
                console.log(receiverValues+"수신자");
                $('#emailContacts').val(receiverValues).trigger('change');
                $('#selectpickerSelectDeselect').val(ccValues);
                $('#selecBcc').val(bccValues);
                console.log(ccValues+"참조");
                console.log(bccValues+"비밀참조");
                
                const quill = new Quill('.email-editor', {
                    modules: {
                      toolbar: '.email-editor-toolbar'
                    },
                    placeholder: '메세지를 입력하세요.',
                    theme: 'snow'
                });
                
                quill.clipboard.dangerouslyPasteHTML(noteContent);
        		
        		
        	}).fail(function (jqXHR, textStatus, errorThrown) {
        		console.log("에러");
        		console.log(jqXHR);
        		console.log(textStatus);
        		console.log(errorThrown);
        		
        	});
        	
        	
        }
        
        //var noteBCC = document.getElementById("noteBCC").textContent;
       
        
    }
}


function sendDraft(noteNo) {
	var data = {
			noteNo: noteNo
	};
	
	
	 Swal.fire({
		 	title: "임시저장 쪽지 전송",
	        text: "임시저장 쪽지를 전송하시겠습니까?",
	        icon: 'warning',
	        showCancelButton: true,
	        confirmButtonText: '전송',
	        cancelButtonText: '취소',
	        customClass: {
	          confirmButton: 'btn btn-primary me-3',
	          cancelButton: 'btn btn-label-secondary'
	        },
	        buttonsStyling: false
	      }).then(function (result) {
	        if (result.value) {
	          Swal.fire({
	            icon: 'success',
	            text: '쪽지가 전송되었습니다.',
	            customClass: {
	              confirmButton: 'btn btn-success'
	            }
	          });
	
				$.ajax({
					url: "/exodia/sentDraft",
					type: "GET",
					data: data
					
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
			    	$("#draftTab").removeClass("active");
			    	$("#inboxTab").removeClass("active");
					$("#sentTab").addClass("active");
					$("#starredTab").removeClass("active");
					$("#trashTab").removeClass("active");
					$.ajax({
			    	    url: '/exodia/updateNoteNo',
			    	    type: 'GET',
			    	    dataType: 'json', // 반환되는 데이터 형식을 JSON으로 지정
			    	    success: function(response) {
			    	        // 서버에서 받아온 숫자 값
			    	        var uckNo = response.uckNo;
			    	        var trashNo = response.trashNo;
			    	        var draftNo = response.draftNo;
			    	        var starredNo = response.starredNo;
			    	        
			
			    	        // 여기에서 숫자 값을 사용하도록 로직을 추가
			    	        var unreadNote = document.querySelector("#unreadNote");
			    	        if (uckNo === 0) {
			    	        	unreadNote.classList.add('d-none');
			    	        } else if(uckNo !== 0){
			    	        	unreadNote.classList.remove('d-none');
			    	        	unreadNote.innerText = uckNo;
			    	        }
			    	        var draftNote = document.querySelector("#draftNote");
			    	        if (draftNo === 0) {
			    	        	draftNote.classList.add('d-none');
			    	        } else if(draftNo !== 0){
			    	        	draftNote.classList.remove('d-none');
			    	        	draftNote.innerText = draftNo;
			    	        }
			    	        var starredNote = document.querySelector("#starredNote");
			    	        if (starredNo === 0) {
			    	        	starredNote.classList.add('d-none');
			    	        	console.log('uckNo is 0');
			    	        } else if(starredNo !== 0){
			    	        	starredNote.classList.remove('d-none');
			    	        	starredNote.innerText = starredNo;
			    	        }
			    	        var trashNote = document.querySelector("#trashNote");
			    	        if (trashNo === 0) {
			    	        	trashNote.classList.add('d-none');
			    	        	console.log('uckNo is 0');
			    	        } else if(trashNo !== 0){
			    	        	trashNote.classList.remove('d-none');
			    	        	trashNote.innerText = trashNo;
			    	        	console.log('uckNo is not 0');
			    	        }
			    	        
			    	        
			    	    },
			    	    error: function(error) {
			    	        console.error('Error fetching data:', error);
			    	    }
			    	});
					
					
					
				}).fail(function (jqXHR, textStatus, errorThrown) {
					console.log("에러");
					console.log(jqXHR);
					console.log(textStatus);
					console.log(errorThrown);
					
				});
	        }
	   });
	
}

function showReserv() {
	$('#send-reserv').removeClass('d-none');
	$("#flatpickr-datetime").attr("name", "note_reserve_time");
}

function hideReserv() {
	$('#send-reserv').addClass('d-none');
	$("#flatpickr-datetime").attr("name", "");
	
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
      draftNoteList = document.getElementById('draftNoteList'),
      sendMsg = document.getElementById('sendMsg'),
      attachFile = document.getElementById('attach-file'),
      
      labelRed = document.getElementById('label-red'),
      labelYellow = document.getElementById('label-yellow'),
      labelGreen = document.getElementById('label-green'),
      labelBlue = document.getElementById('label-blue');

    // Initialize PerfectScrollbar
    // ------------------------------
     const noteRead = document.getElementById('conType');
	 var noteReadNo = noteRead.value;
	 
	 var searchUser = document.getElementById('searchUserFrom');
	 
	 if(searchUser.value!=='') {
		 console.log(searchUser.value+"잘 받아오니?");
		 var button = document.getElementById("emailComposeSidebarLabel");
		 button.click();
		 $('#emailContacts').val(searchUser.value);
	 }
	 
     console.log(noteReadNo+"받아는오나");
	 // noteReadNo를 사용하여 필요한 작업을 수행합니다.
     var unreadNote = document.querySelector("#unreadNote");
     if (unreadNote.innerText.trim() === "0") {
     	unreadNote.classList.add('d-none');
     } else if(unreadNote.innerText.trim() !== "0"){
     	unreadNote.classList.remove('d-none');
     	
     }
     var draftNote = document.querySelector("#draftNote");
     if (draftNote.innerText.trim() === "0") {
    	 console.log(""+draftNote.value);
     	draftNote.classList.add('d-none');
     } else if(draftNote.innerText.trim() !== "0"){
    	 console.log(""+draftNote.value);
     	draftNote.classList.remove('d-none');
     }
     var starredNote = document.querySelector("#starredNote");
     if (starredNote.innerText.trim() === "0") {
     	starredNote.classList.add('d-none');
     } else if(starredNote.innerText.trim() !== "0"){
    	 
     	starredNote.classList.remove('d-none');
     }
     var trashNote = document.querySelector("#trashNote");
     if (trashNote.innerText.trim() === "0") {
     	trashNote.classList.add('d-none');
     	console.log('uckNo is 0');
     } else if(trashNote.innerText.trim() !== "0"){
     	trashNote.classList.remove('d-none');
     	console.log('uckNo is not 0');
     }
     
     
     
	 if (noteReadNo) {
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
			                  placeholder: '메세지를 입력하세요. ',
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
		 
		 
		 
		 
		 
	     console.log("noteReadNo: " + noteReadNo);
	 } else {
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
	 }
    
    
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
    
    //첨부파일 이름 변경
    if(attachFile) {
	    attachFile.addEventListener('change', function () {
	        const fileName = attachFile.files[0].name;
	        
	        const fileCount = attachFile.files.length;
	        if(fileCount > 1) {
		        
		        document.getElementById('filename').value = fileName+" 외 "+(fileCount-1)+"개";
	        } else {
		        document.getElementById('filename').value = fileName;
	        }
	        
	    });
    }
    
   
    
    labelRed.addEventListener('click', e => {
      var labelSelect = document.getElementById('label-select');
      console.log(labelSelect+"머가막혔니");
      labelSelect.classList.remove('bg-primary');
      labelSelect.classList.remove('bg-warning');
      labelSelect.classList.remove('bg-success');
      
      labelSelect.classList.add('bg-danger');

      var noteLabel = document.getElementById('note_label');
      noteLabel.value = "긴급 필독";
      console.log(noteLabel.value+"ㅇㅇ");
      
      
    });
    
    labelYellow.addEventListener('click', e => {
    	var labelSelect = document.getElementById('label-select');
    	labelSelect.classList.remove('bg-primary');
    	labelSelect.classList.remove('bg-danger');
    	labelSelect.classList.remove('bg-success');
    	
    	labelSelect.classList.add('bg-warning');
    	
    	var noteLabel = document.getElementById('note_label');
    	noteLabel.value = "공지 관련";
    	console.log(noteLabel.value+"ㅇㅇ");
    	
    	
    });
    
    labelGreen.addEventListener('click', e => {
    	var labelSelect = document.getElementById('label-select');
    	labelSelect.classList.remove('bg-primary');
    	labelSelect.classList.remove('bg-warning');
    	labelSelect.classList.remove('bg-danger');
    	
    	labelSelect.classList.add('bg-success');
    	
    	var noteLabel = document.getElementById('note_label');
    	noteLabel.value = "기능 문의";
    	console.log(noteLabel.value+"ㅇㅇ");
    	
    	
    });
    
    labelBlue.addEventListener('click', e => {
    	var labelSelect = document.getElementById('label-select');
    	labelSelect.classList.remove('bg-danger');
    	labelSelect.classList.remove('bg-warning');
    	labelSelect.classList.remove('bg-success');
    	
    	labelSelect.classList.add('bg-primary');
    	
    	var noteLabel = document.getElementById('note_label');
    	noteLabel.value = "일반 쪽지";
    	console.log(noteLabel.value+"ㅇㅇ");
    	
    });

    
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
    
   

    // Empty compose email message inputs when modal is hidden
    emailCompose.addEventListener('hidden.bs.modal', event => {
      //$('#emailContacts').val('');
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
            "<div class='py-2'>" +
            /*"<img src='" +
            assetsPath +
            'img/avatars/' +
            $(option.element).data('avatar') +
            "' alt='avatar' class='rounded-circle' />" +*/
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
        
      //수신 인원 변경시 나머지 인원 select disabled
        emailContacts.on('change', function () {
        	 
            const selectedOptions = emailContacts.val();
            console.log(selectedOptions + " 값은 가져오냐잉");
            receiverInput.value = selectedOptions;
            console.log(receiverInput.value + " 값은 들어가냐잉");
            //const selectedOptions = document.getElementById('note_receiver').value;
            const selectOptions = String(selectedOptions);

            var receiverValues = selectOptions.split(',');
            console.log(receiverValues + " 응 나 리시버 밸류 쪼개진 값");
            var otherSelectElement = document.getElementById('selectpickerSelectDeselect'); // 다른 select 엘리먼트의 ID를 입력
            var theotherSelectElement = document.getElementById('selecBcc'); // 다른 select 엘리먼트의 ID를 입력
            
                var options = otherSelectElement.getElementsByTagName('option');
                var bccoptions = theotherSelectElement.getElementsByTagName('option');
                console.log(options + " 응 나 옵션들");

                for (var i = 0; i < options.length; i++) {
                    var option = options[i];
                    
                    if (receiverValues.includes(option.value)) {
                    	console.log(option.value + " ㅇㅇㅇㅇ옵션포함됨!!");
                    	option.setAttribute('disabled', 'true');
                    	
                    } else {
                    	console.log(option.value + " 응 나 옵션값들 포함안됨");
                    	if (option.hasAttribute('disabled')) {
                    	    // option이 disabled인 경우
                    	    // 이곳에 수행할 작업 추가
                    	} else {
                    		option.removeAttribute('disabled');
                    	}
                    }
                }

                $('#selectpickerSelectDeselect').selectpicker('refresh');
                $('#selectpickerSelectDeselect').selectpicker('destroy');
                $('#selectpickerSelectDeselect').selectpicker(''); 
                
                for (var i = 0; i < bccoptions.length; i++) {
                	var bccoption = bccoptions[i];
                	
                	if (receiverValues.includes(bccoption.value)) {
                		console.log(bccoption.value + " ㅇㅇㅇㅇ옵션포함됨!!");
                		bccoption.setAttribute('disabled', 'true');
                		
                	} else {
                		console.log(bccoption.value + " 응 나 옵션값들 포함안됨");
                		if (bccoption.hasAttribute('disabled')) {
                    	    // option이 disabled인 경우
                    	    // 이곳에 수행할 작업 추가
                    	} else {
                    		bccoption.removeAttribute('disabled');
                    	}
                		
                		
                	}
                }
        	
                $('#selecBcc').selectpicker('refresh'); 
                $('#selecBcc').selectpicker('destroy');
                $('#selecBcc').selectpicker(''); 
            
        });
      }
    }
    initSelect2();
    
    //참조 인원 변경시 나머지 인원 select disabled
    let selectpickerSelectDeselect = $('#selectpickerSelectDeselect');
    if(selectpickerSelectDeselect) {
    	selectpickerSelectDeselect.on('change', function(){
	    	console.log("여 히사시부리 ㅋ");
	    	
	    	const selectedOption = $('#selectpickerSelectDeselect').val();

	    	
	    	const selectedOptions = String(selectedOption);
	    	const receiverValues = selectedOptions.split(',');
	
	    	// 비밀참조 select 엘리먼트 가져오기
	    	const otherSelectElement = $('#selecBcc');
	    	
	    	//수신자
	    	const SelectElement = $('#emailContacts');
	
	    	// 다른 select 엘리먼트에서 option 가져오기
	    	const options = otherSelectElement.find('option');
	    	const receiveroptions = SelectElement.find('option');
	
	    	options.each(function() {
	    	    var option = $(this);
	    	    if (receiverValues.includes(option.val())) {
	    	        console.log(option.val() + " ㅇㅇㅇㅇ옵션포함됨!!");
	    	        option.attr('disabled',true);
	    	    } else {
	    	        console.log(option.val() + " 응 나 옵션값들 포함안됨");
	    	        if(option.attr('disabled')) {
	    	        	
	    			} else {
	    				option.attr('disabled',false);
	    			}
	    	    }
	    	});
	    	
	    	receiveroptions.each(function() {
	    		var receiveroption = $(this);
	    		if (receiverValues.includes(receiveroption.val())) {
	    			console.log(receiveroption.val() + " ㅇㅇㅇㅇ옵션포함됨!!");
	    			receiveroption.attr('disabled',true);
	    		} else {
	    			console.log(receiveroption.val() + " 응 나 옵션값들 포함안됨");
	    			if(receiveroption.attr('disabled')) {
	    				
	    			} else {
	    				receiveroption.attr('disabled',false);
	    			}
	    		}
	    	});
	    	
	    	 $('#selecBcc').selectpicker('refresh');
             $('#selecBcc').selectpicker('destroy');
             $('#selecBcc').selectpicker(''); 
	    	
	    });
    
    }
    
    //비밀참조 인원 변경시 disabled
    let selecBcc = $('#selecBcc');
    if(selecBcc) {
    	selecBcc.on('change', function(){
    		
    		const selectedOption = $('#selecBcc').val();
    		const selectedOptions = String(selectedOption);
    		const receiverValues = selectedOptions.split(',');
    		
    		// 다른 select 엘리먼트 가져오기
    		const otherSelectElement = $('#selectpickerSelectDeselect');
    		
    		//수신자
	    	const SelectElement = $('#emailContacts');
    		
    		// 다른 select 엘리먼트에서 option 가져오기
    		const options = otherSelectElement.find('option');
    		
    		const receiveroptions = SelectElement.find('option');
    		
    		options.each(function() {
    			var option = $(this);
    			if (receiverValues.includes(option.val())) {
    				console.log(option.val() + " ㅇㅇㅇㅇ옵션포함됨!!");
    				option.attr('disabled',true);
    			} else {
    				console.log(option.val() + " 응 나 옵션값들 포함안됨");
    				if(option.attr('disabled')) {
    					
	    			} else {
	    				option.attr('disabled',false);
	    			}
    				
    			}
    		});
    		receiveroptions.each(function() {
	    		var receiveroption = $(this);
	    		if (receiverValues.includes(receiveroption.val())) {
	    			console.log(receiveroption.val() + " ㅇㅇㅇㅇ옵션포함됨!!");
	    			receiveroption.attr('disabled',true);
	    		} else {
	    			if(receiveroption.attr('disabled')) {
	    				
	    			} else {
	    				receiveroption.attr('disabled',false);
	    			}
	    		}
	    	});
    		
    		$('#selectpickerSelectDeselect').selectpicker('refresh');
    		$('#selectpickerSelectDeselect').selectpicker('destroy');
    		$('#selectpickerSelectDeselect').selectpicker(''); 
    	});
    }

  
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
