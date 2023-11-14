/**
 * App eCommerce Add Product Script
 */
'use strict';

//Javascript to handle the e-commerce product add page

(function () {
  // Comment editor

  const commentEditor = document.querySelector('.comment-editor');

  if (commentEditor) {
    const quill = new Quill(commentEditor, {
      modules: {
        toolbar: '.comment-toolbar'
      },
      placeholder: '내용을 입력해 주세요',
      theme: 'snow'
    });
    let lastEditorContents = null;
    quill.on('text-change', function() {
    	const editorContents = quill.getContents();
    	
    	  const htmlContent = quill.root.innerHTML;
	  	  const inputElement = document.getElementById('noticeContent');
	  	  
	  	  
	  	  if(JSON.stringify(editorContents) !== JSON.stringify(lastEditorContents)) {
	  		  lastEditorContents = editorContents;
	  		  inputElement.value = htmlContent;
	  		  
	  	  }
	  	  
	  	  console.log(htmlContent+"뭐라 나오는지 좀 보자");
	  	  console.log(inputElement.value+"그래서 넘어가는 값이 뭐냐");
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

$(document).ready(function() {
	//add task
		console.log("insert시작");
	    $('#noticeSubmit').click(function() {
	    	console.log("공지사항 등록 클릭 성공");
	        var noticeData = {
	            notice_title: $('input[name=noticeTitle]').val(),
	            notice_content: $('#noticeContent').val(),
	            notice_no: $('#noticeNo').val()
	            //task_startdate: $('input[name=eventStartDate]').val(),
	            //task_enddate: $('input[name=eventEndDate]').val()
	        };
	        console.log(noticeData);

	        $.ajax({
	            type: 'post',
	            url: '/exodia/noticeUpdate', 
	            data: noticeData, 
	            success: function(data) {
	            	console.log("ajax부분 -> 공지사항 입력값 db로 잘 들어감");
	            	window.location.href = '/exodia/noticeDetail?notice_no='+noticeData.notice_no;
	            }
	        });
	    });
});

$(document).ready(function () {
    $("a[name='file-delete']").on("click", function (e) {
        e.preventDefault();
        deleteFile($(this).closest('p'));
    });
});

function deleteFile(elementToDelete) {
    // elementToDelete이 null이 아니면 삭제
    if (elementToDelete) {
        elementToDelete.remove();
    }

    // TODO: 삭제할 로직 추가 (예: 서버 요청 등)
}