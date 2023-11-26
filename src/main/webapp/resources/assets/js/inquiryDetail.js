/**
 * App eCommerce Add Product Script
 */
'use strict';
//이름 프로필 랜덤 색 바꾸기
/*$(document).ready(function(){
	console.log("실행");
    var colors = ["bg-label-success", "bg-label-primary", "bg-label-warning", "bg-label-danger", "bg-label-info", "bg-label-dark", "bg-label-secondary"];
    var randomClass = colors[Math.floor(Math.random() * colors.length)];
    $('#nameProfile').addClass(randomClass);
});*/

//Javascript to handle the e-commerce product add page

(function () {
  // Comment editor

  const commentEditor = document.querySelector('.comment-editor');

  if (commentEditor) {
    new Quill(commentEditor, {
      modules: {
        toolbar: '.comment-toolbar'
      },
      placeholder: 'Product Description',
      theme: 'snow'
    });
  }

  // previewTemplate: Updated Dropzone default previewTemplate

  // ! Don't change it unless you really know what you are doing

  const previewTemplate = `<div class="dz-preview dz-file-preview">
<div class="dz-details">
  <div class="dz-thumbnail">
    <img data-dz-thumbnail>
    <span class="dz-nopreview">No preview</span>
    <div class="dz-success-mark"></div>
    <div class="dz-error-mark"></div>
    <div class="dz-error-message"><span data-dz-errormessage></span></div>
    <div class="progress">
      <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuemin="0" aria-valuemax="100" data-dz-uploadprogress></div>
    </div>
  </div>
  <div class="dz-filename" data-dz-name></div>
  <div class="dz-size" data-dz-size></div>
</div>
</div>`;

  // ? Start your code from here

  // Basic Dropzone

  const dropzoneBasic = document.querySelector('#dropzone-basic');
  if (dropzoneBasic) {
    const myDropzone = new Dropzone(dropzoneBasic, {
      previewTemplate: previewTemplate,
      parallelUploads: 1,
      maxFilesize: 5,
      acceptedFiles: '.jpg,.jpeg,.png,.gif',
      addRemoveLinks: true,
      maxFiles: 1
    });
  }

  // Basic Tags

  const tagifyBasicEl = document.querySelector('#ecommerce-product-tags');
  const TagifyBasic = new Tagify(tagifyBasicEl);

  // Flatpickr

  // Datepicker
  const date = new Date();

  const productDate = document.querySelector('.product-date');

  if (productDate) {
    productDate.flatpickr({
      monthSelectorType: 'static',
      defaultDate: date
    });
  }
})();

//Jquery to handle the e-commerce product add page

$(function () {
  // Select2
  var select2 = $('.select2');
  if (select2.length) {
    select2.each(function () {
      var $this = $(this);
      $this.wrap('<div class="position-relative"></div>').select2({
        dropdownParent: $this.parent(),
        placeholder: $this.data('placeholder') // for dynamic placeholder
      });
    });
  }
  
 
  $('#deleteButton').click(function() {
	  console.log("공지사항 삭제버튼 누름");
	  var noticeData = {
			  notice_no: $('#noticeNo').val()
	  };
	  
	  $.ajax({
		  type: 'POST', 
		  url: '/exodia/inquiryDelete',
		  data: noticeData,
		  success: function (data) {
			  console.log("성공이요 성공");
			  window.location.href = '/exodia/inquiryList';
		  },
		  error: function (xhr, status, error) {
		        console.error('오류 발생:');
		        console.error('상태 코드: ' + xhr.status);
		        console.error('에러 메시지: ' + error);
		    }
	  });
  });

  var formRepeater = $('.form-repeater');

  // Form Repeater
  // ! Using jQuery each loop to add dynamic id and class for inputs. You may need to improve it based on form fields.
  // -----------------------------------------------------------------------------------------------------------------

  if (formRepeater.length) {
    var row = 2;
    var col = 1;
    formRepeater.on('submit', function (e) {
      e.preventDefault();
    });
    formRepeater.repeater({
      show: function () {
        var fromControl = $(this).find('.form-control, .form-select');
        var formLabel = $(this).find('.form-label');

        fromControl.each(function (i) {
          var id = 'form-repeater-' + row + '-' + col;
          $(fromControl[i]).attr('id', id);
          $(formLabel[i]).attr('for', id);
          col++;
        });

        row++;
        $(this).slideDown();
        $('.select2-container').remove();
        $('.select2.form-select').select2({
          placeholder: 'Placeholder text'
        });
        $('.select2-container').css('width', '100%');
        $('.form-repeater:first .form-select').select2({
          placeholder: 'Placeholder text'
        });
      }
    });
  }
  
});


	//add reply
	    $('#replyAdd').click(function() {
	    	console.log("댓글 등록 클릭 성공");
	    	var reply_content = $('#replyContent').val();
	        var empInfoName = $('#replyName').html(); // empInfo_name
	        var notice_no = $('#noticeNo').val();
	        console.log("replyContent : "+ reply_content);
	        console.log("empinfoname : "+ empInfoName);
	        console.log("noticeNo : " + notice_no);

	        if (!reply_content) {
	            $('#modal-no-content').modal('show');
	        } else {
	            var replyData = {
	            		reply_content: reply_content,
	            		empinfo_name: $('#replyName').html(),
	            		notice_no: $('#noticeNo').val()
	            		//empInfoName: empInfoName
	            };
	            console.log("댓글 저장 내용 : " + replyData);

	        $.ajax({
	            type: 'post',
	            url: '/exodia/replyAdd', 
	            data: replyData, 
	            success: function(data) {
	            	console.log("ajax부분 -> 댓글 입력값 db로 잘 들어감?");
	            	location.reload();
	            	
	            },
	            error: function(xhr, textStatus, errorThrown) {
                    // 오류 처리
	            	//location.reload();
                    console.error("댓글 저장 중 오류가 발생했습니다.");
                }
            });
	        }
	    });
	    
	    function openDeleteModal(replyNumber) {
	    	  console.log("아이콘 클릭");
	    	  // 댓글 삭제 모달 열기
	    	  
	    	  $('#basicModal'+replyNumber).modal('show');
	    }
	    function deleteComment(replyNumber) {
	    	console.log("댓글삭제버튼클릭");
	  	    var replyData = {
	  	    		reply_no: replyNumber
	  	    };
	  	    console.log("받아온 reply_no :" + replyData);
	  	    // 댓글을 삭제하는 AJAX 요청
	  	    $.ajax({
	  	        type: 'POST',
	  	        url: '/exodia/replyDelete',
	  	        data: replyData,
	  	        success: function (data) {
	  	        	console.log('이제 좀 다른거하고싶다');
	  	               location.reload();
	  	        },
	  	        error: function (xhr, status, error) {
	  	            console.error('댓글 삭제 중 오류 발생:');
	  	            console.error('상태 코드: ' + xhr.status);
	  	            console.error('에러 메시지: ' + error);
	  	        }
	  	    });
	  	};
	  	
	  	
	  	$(document).ready(function () {
	  	    function replyModify(replyNo) {
	  	        // 해당 댓글의 내용과 번호를 가져옴
	  	        var replyContent = $(this).closest('.card').find('.replyContent');
	  	        var replyText = replyContent.text().trim();
	  	        var replyNo = $(this).closest('.card').find('[id^="replyNo"]').val();
	  	        console.log("replyNo" + replyNo);

	  	        // 댓글 내용을 textarea로 변경
	  	        var textarea = $('<textarea class="form-control">' + replyText + '</textarea>');
	  	        replyContent.replaceWith(textarea);

	  	        $(this).addClass('d-none'); // 수정 버튼 숨기기
	  	        $(this).closest('.card-footer').find('.bx-check-circle').removeClass('d-none'); // 완료 버튼 아이콘 보이기

	  	        var completeButton = $(this).closest('.card-footer').find('.bx-check-circle');
	  	        // 완료 버튼 클릭 시
	  	        completeButton.on('click', function () {
	  	            console.log("완료버튼누름" + replyNo);
	  	            // 수정이 완료된 경우
	  	            // textarea에서의 텍스트를 가져와서 p 요소로 변경
	  	            var editedText = textarea.val().trim();
	  	            var editedContent = $('<p class="replyContent">' + editedText + '</p>');
	  	            textarea.replaceWith(editedContent);

	  	            // 여기에서 수정된 댓글 내용을 서버로 전송하는 코드를 추가할 수 있습니다.
	  	            $.ajax({
	  	                url: '/exodia/replyUpdate', // 실제 수정 처리를 담당하는 서버 엔드포인트로 변경해야 합니다.
	  	                type: 'POST',
	  	                data: {
	  	                    replyNo: replyNo,
	  	                    editedText: editedText
	  	                },
	  	                success: function (response) {
	  	                    // 서버에서 응답이 성공적으로 왔을 때 처리

	  	                    // 완료 버튼을 수정 버튼으로 변경
	  	                    $(this).removeClass('d-none'); // 수정 버튼 숨기기
	  	                    $(this).closest('.card-footer').find('.bx-check-circle').removeClass('d-none'); // 완료 버튼 아이콘 보이기
	  	                    location.reload();
	  	                },
	  	                error: function (error) {
	  	                    // 서버에서 응답이 오류일 때 처리
	  	                    alert('에러 발생: ' + error.statusText);
	  	                }
	  	            });

	  	            // 수정 버튼 클릭 이벤트 중지
	  	            return false;
	  	        });

	  	        // 수정 버튼 클릭 이벤트 중지
	  	        return false;
	  	    }

	  	    // 클릭 이벤트 바인딩
	  	    $(document).on('click', '.bx-edit-alt', replyModify);
	  	});
	  	
	  	
	  	
	  	
	  	//댓글 수정하기
	  	/*$(document).ready(function () {
	        // 수정 버튼 클릭 시
	        $(document).on('click', '.btn-primary[id^="replyModifyButton"]', function () {
	            // 해당 댓글의 내용과 번호를 가져옴
	            var replyContent = $(this).closest('.card').find('.replyContent');
	            var replyText = replyContent.text().trim();
	            var replyNo = $(this).closest('.card').find('[id^="replyNo"]').val();
	            console.log("replyNo" + replyNo);

	            // 댓글 내용을 textarea로 변경
	            var textarea = $('<textarea class="form-control">' + replyText + '</textarea>');
	            replyContent.replaceWith(textarea);
	            
	            $(this).addClass('d-none'); // 수정 버튼 숨기기
	            $(this).closest('.card-footer').find('.btn-primary[id^="replyModifyFinish"]').removeClass('d-none'); // 완료 버튼 보이기

	            


	            var completeButton = $(this).closest('.card-footer').find('.btn-primary[id^="replyModifyFinish"]');	
	            // 완료 버튼 클릭 시
	            completeButton.on('click', function () {
	            	console.log("완료버튼누름"+replyNo);
	                // 수정이 완료된 경우
	                // textarea에서의 텍스트를 가져와서 p 요소로 변경
	                var editedText = textarea.val().trim();
	                var editedContent = $('<p class="replyContent">' + editedText + '</p>');
	                textarea.replaceWith(editedContent);

	                // 여기에서 수정된 댓글 내용을 서버로 전송하는 코드를 추가할 수 있습니다.
	                $.ajax({
	                    url: '/exodia/replyUpdate', // 실제 수정 처리를 담당하는 서버 엔드포인트로 변경해야 합니다.
	                    type: 'POST',
	                    data: {
	                        replyNo: replyNo,
	                        editedText: editedText
	                    },
	                    success: function (response) {
	                        // 서버에서 응답이 성공적으로 왔을 때 처리
	                        

	                        // 완료 버튼을 수정 버튼으로 변경
	                        $(this).removeClass('d-none'); // 수정 버튼 숨기기
	        	            $(this).closest('.card-footer').find('.btn-primary[id^="replyModifyFinish"]').addClass('d-none'); // 완료 버튼 보이기
	        	            location.reload();
	                    },
	                    error: function (error) {
	                        // 서버에서 응답이 오류일 때 처리
	                        alert('에러 발생: ' + error.statusText);
	                    }
	                });

	                // 수정 버튼 클릭 이벤트 중지
	                return false;
	            });


	            // 수정 버튼 클릭 이벤트 중지
	            return false;
	        });
	    });*/

	   