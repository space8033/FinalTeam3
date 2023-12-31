/**
 * App eCommerce Add Product Script
 */
'use strict';

//Javascript to handle the e-commerce product add page



function unReadNotice(empInfo_no, notice_no) {
	console.log(empInfo_no+"나인간번호");
	console.log(notice_no+"나공지번호");
	var postData = {
			empInfo_no: empInfo_no,
			notice_no: notice_no
        };
        
        // AJAX 요청으로 데이터 전송
        $.ajax({
        	url: "/exodia/unReaderAlarm",
            type: "POST",
            data: postData,
            success: function(response) {
            	
            	alert("알람 보내기 성공");
            	
            },
            error: function() {
                // 오류 처리
                alert("데이터 전송 중 오류가 발생했습니다.");
            }
        });
	
	
}
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
		  url: '/exodia/noticeDelete',
		  data: noticeData,
		  success: function (data) {
			  console.log("성공이요 성공");
			  window.location.href = '/exodia/noticeList';
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
