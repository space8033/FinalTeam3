/**
 * Form Picker
 */

'use strict';

(function () {
  // Flat Picker
  // --------------------------------------------------------------------
  const flatpickrDate = document.querySelector('#flatpickr-date'),
    flatpickrTime = document.querySelector('#flatpickr-time'),
    flatpickrDateTime = document.querySelector('#flatpickr-datetime'),
    flatpickrMulti = document.querySelector('#flatpickr-multi'),
    flatpickrRange = document.querySelector('#flatpickr-range'),
    flatpickrInline = document.querySelector('#flatpickr-inline'),
    flatpickrFriendly = document.querySelector('#flatpickr-human-friendly'),
    flatpickrDisabledRange = document.querySelector('#flatpickr-disabled-range');

  // Date
  if (flatpickrDate) {
    flatpickrDate.flatpickr({
      monthSelectorType: 'static'
    });
  }


  // Time
  if (flatpickrTime) {
    flatpickrTime.flatpickr({
      enableTime: true,
      noCalendar: true
    });
  }

  // Datetime
  if (flatpickrDateTime) {
	  const currentDate = new Date();
	  const fromDate = new Date(currentDate.getTime()); 

	  flatpickrDateTime.flatpickr({
	    enableTime: true,
	    dateFormat: 'Y-m-d H:i',
	    minDate: fromDate,
	    minuteIncrement: 1,
	    defaultDate: [fromDate],
	  });
	}
  
  // Multi Date Select
  if (flatpickrMulti) {
    flatpickrMulti.flatpickr({
      weekNumbers: true,
      enableTime: true,
      mode: 'multiple',
      minDate: 'today'
    });
  }

  // Range
  if (typeof flatpickrRange != undefined) {
    flatpickrRange.flatpickr({
      mode: 'range'
    });
  }

  // Inline
  if (flatpickrInline) {
    flatpickrInline.flatpickr({
      inline: true,
      allowInput: false,
      monthSelectorType: 'static'
    });
  }

  // Human Friendly
  if (flatpickrFriendly) {
    flatpickrFriendly.flatpickr({
      altInput: true,
      altFormat: 'F j, Y',
      dateFormat: 'Y-m-d'
    });
  }

  // Disabled Date Range
  if (flatpickrDisabledRange) {
    const fromDate = new Date(Date.now() - 3600 * 1000 * 48 * 15);
    const toDate = new Date(Date.now() - 3600 * 1000 * 48 * 14);

    flatpickrDisabledRange.flatpickr({
      dateFormat: 'Y-m-d',
      disable: [
        {
          from: fromDate.toISOString().split('T')[0],
          to: toDate.toISOString().split('T')[0]
        }
      ]
    });
  }
})();

// * Pickers with jQuery dependency (jquery)
$(function () {
  // Bootstrap Datepicker
  // --------------------------------------------------------------------
  var bsDatepickerBasic = $('#bs-datepicker-basic'),
    bsDatepickerFormat = $('#bs-datepicker-format'),
    bsDatepickerRange = $('#bs-datepicker-daterange'),
    bsDatepickerDisabledDays = $('#bs-datepicker-disabled-days'),
    bsDatepickerMultidate = $('#bs-datepicker-multidate'),
    bsDatepickerOptions = $('#bs-datepicker-options'),
    bsDatepickerAutoclose = $('#bs-datepicker-autoclose'),
    bsDatepickerInlinedate = $('#bs-datepicker-inline');

  // Basic
  if (bsDatepickerBasic.length) {
    bsDatepickerBasic.datepicker({
      todayHighlight: true,
      orientation: isRtl ? 'auto right' : 'auto left'
    });
  }

  // Format
  if (bsDatepickerFormat.length) {
    bsDatepickerFormat.datepicker({
      todayHighlight: true,
      format: 'dd/mm/yyyy',
      orientation: isRtl ? 'auto right' : 'auto left'
    });
  }

  // Range
  if (bsDatepickerRange.length) {
    bsDatepickerRange.datepicker({
      todayHighlight: true,
      orientation: isRtl ? 'auto right' : 'auto left'
    });
  }

  // Disabled Days
  if (bsDatepickerDisabledDays.length) {
    bsDatepickerDisabledDays.datepicker({
      todayHighlight: true,
      daysOfWeekDisabled: [0, 6],
      orientation: isRtl ? 'auto right' : 'auto left'
    });
  }

  // Multiple
  if (bsDatepickerMultidate.length) {
    bsDatepickerMultidate.datepicker({
      multidate: true,
      todayHighlight: true,
      orientation: isRtl ? 'auto right' : 'auto left'
    });
  }

  // Options
  if (bsDatepickerOptions.length) {
    bsDatepickerOptions.datepicker({
      calendarWeeks: true,
      clearBtn: true,
      todayHighlight: true,
      orientation: isRtl ? 'auto left' : 'auto right'
    });
  }

  // Auto close
  if (bsDatepickerAutoclose.length) {
    bsDatepickerAutoclose.datepicker({
      todayHighlight: true,
      autoclose: true,
      orientation: isRtl ? 'auto right' : 'auto left'
    });
  }

  // Inline picker
  if (bsDatepickerInlinedate.length) {
    bsDatepickerInlinedate.datepicker({
      todayHighlight: true
    });
  }

  // Bootstrap Daterange Picker
  // --------------------------------------------------------------------
  var bsRangePickerBasic = $('#bs-rangepicker-basic'),
    bsRangePickerSingle = $('#bs-rangepicker-single'),
    bsRangePickerTime = $('#bs-rangepicker-time'),
    bsRangePickerRange = $('#bs-rangepicker-range'),
    bsRangePickerWeekNum = $('#bs-rangepicker-week-num'),
    bsRangePickerDropdown = $('#bs-rangepicker-dropdown');

  // Basic
  if (bsRangePickerBasic.length) {
    bsRangePickerBasic.daterangepicker({
      opens: isRtl ? 'left' : 'right'
    });
  }

  // Single
  if (bsRangePickerSingle.length) {
    bsRangePickerSingle.daterangepicker({
      singleDatePicker: true,
      opens: isRtl ? 'left' : 'right'
    });
  }

  // Time & Date
  if (bsRangePickerTime.length) {
    bsRangePickerTime.daterangepicker({
      timePicker: true,
      timePickerIncrement: 30,
      locale: {
        format: 'MM/DD/YYYY h:mm A'
      },
      opens: isRtl ? 'left' : 'right'
    });
  }

  if (bsRangePickerRange.length) {
    bsRangePickerRange.daterangepicker({
      ranges: {
        Today: [moment(), moment()],
        Yesterday: [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
        'Last 7 Days': [moment().subtract(6, 'days'), moment()],
        'Last 30 Days': [moment().subtract(29, 'days'), moment()],
        'This Month': [moment().startOf('month'), moment().endOf('month')],
        'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
      },
      opens: isRtl ? 'left' : 'right'
    });
  }

  // Week Numbers
  if (bsRangePickerWeekNum.length) {
    bsRangePickerWeekNum.daterangepicker({
      showWeekNumbers: true,
      opens: isRtl ? 'left' : 'right'
    });
  }
  // Dropdown
  if (bsRangePickerDropdown.length) {
    bsRangePickerDropdown.daterangepicker({
      showDropdowns: true,
      opens: isRtl ? 'left' : 'right'
    });
  }

  // jQuery Timepicker
  // --------------------------------------------------------------------
  var basicTimepicker = $('#timepicker-basic'),
    minMaxTimepicker = $('#timepicker-min-max'),
    disabledTimepicker = $('#timepicker-disabled-times'),
    formatTimepicker = $('#timepicker-format'),
    stepTimepicker = $('#timepicker-step'),
    altHourTimepicker = $('#timepicker-24hours');

  // Basic
  if (basicTimepicker.length) {
    basicTimepicker.timepicker({
      orientation: isRtl ? 'r' : 'l'
    });
  }

  // Min & Max
  if (minMaxTimepicker.length) {
    minMaxTimepicker.timepicker({
      minTime: '2:00pm',
      maxTime: '7:00pm',
      showDuration: true,
      orientation: isRtl ? 'r' : 'l'
    });
  }

  // Disabled Picker
  if (disabledTimepicker.length) {
    disabledTimepicker.timepicker({
      disableTimeRanges: [
        ['12am', '3am'],
        ['4am', '4:30am']
      ],
      orientation: isRtl ? 'r' : 'l'
    });
  }

  // Format Picker
  if (formatTimepicker.length) {
    formatTimepicker.timepicker({
      timeFormat: 'H:i:s',
      orientation: isRtl ? 'r' : 'l'
    });
  }

  // Steps Picker
  if (stepTimepicker.length) {
    stepTimepicker.timepicker({
      step: 15,
      orientation: isRtl ? 'r' : 'l'
    });
  }

  // 24 Hours Format
  if (altHourTimepicker.length) {
    altHourTimepicker.timepicker({
      show: '24:00',
      timeFormat: 'H:i:s',
      orientation: isRtl ? 'r' : 'l'
    });
  }
});

// color picker (pickr)
// --------------------------------------------------------------------
(function () {
  const classicPicker = document.querySelector('#color-picker-classic'),
    monolithPicker = document.querySelector('#color-picker-monolith'),
    nanoPicker = document.querySelector('#color-picker-nano');

  // classic
  if (classicPicker) {
    pickr.create({
      el: classicPicker,
      theme: 'classic',
      default: 'rgba(102, 108, 232, 1)',
      swatches: [
        'rgba(102, 108, 232, 1)',
        'rgba(40, 208, 148, 1)',
        'rgba(255, 73, 97, 1)',
        'rgba(255, 145, 73, 1)',
        'rgba(30, 159, 242, 1)'
      ],
      components: {
        // Main components
        preview: true,
        opacity: true,
        hue: true,

        // Input / output Options
        interaction: {
          hex: true,
          rgba: true,
          hsla: true,
          hsva: true,
          cmyk: true,
          input: true,
          clear: true,
          save: true
        }
      }
    });
  }

  // monolith
  if (monolithPicker) {
    pickr.create({
      el: monolithPicker,
      theme: 'monolith',
      default: 'rgba(40, 208, 148, 1)',
      swatches: [
        'rgba(102, 108, 232, 1)',
        'rgba(40, 208, 148, 1)',
        'rgba(255, 73, 97, 1)',
        'rgba(255, 145, 73, 1)',
        'rgba(30, 159, 242, 1)'
      ],
      components: {
        // Main components
        preview: true,
        opacity: true,
        hue: true,

        // Input / output Options
        interaction: {
          hex: true,
          rgba: true,
          hsla: true,
          hsva: true,
          cmyk: true,
          input: true,
          clear: true,
          save: true
        }
      }
    });
  }

  // nano
  if (nanoPicker) {
    pickr.create({
      el: nanoPicker,
      theme: 'nano',
      default: 'rgba(255, 73, 97, 1)',
      swatches: [
        'rgba(102, 108, 232, 1)',
        'rgba(40, 208, 148, 1)',
        'rgba(255, 73, 97, 1)',
        'rgba(255, 145, 73, 1)',
        'rgba(30, 159, 242, 1)'
      ],
      components: {
        // Main components
        preview: true,
        opacity: true,
        hue: true,

        // Input / output Options
        interaction: {
          hex: true,
          rgba: true,
          hsla: true,
          hsva: true,
          cmyk: true,
          input: true,
          clear: true,
          save: true
        }
      }
    });
  }
})();

function deleteProgram(task_no) {
	$.ajax({
		url: "/exodia/task/deleteProgram",
		method: "post",
		data:{
			"task_no": task_no
		},
		success: function(data) {
			location.reload();
		},
		error: function(error) {
			console.log("아왜안떠왜왜왜");
		}
	});
}

/**
 * Tagify
 */

$(document).ready(function() {
  var emp_no = $("#empNoBox").val();
  var usersList = [];

  function sendAjaxRequest(emp_no) {
    $.ajax({
      type: "GET",
      url: "/exodia/employee/getAllUser",
      data: {
    	  emp_no: emp_no
      },
      success: function(data) {
 		 usersList = data;
 		 TagifyUserList.settings.whitelist = usersList;
         TagifyUserList.loading(false);
         var originalUser = usersList.filter(function(user) {
        	 return user.emp_no == emp_no;
         });
         
         originalUser.forEach(function(user) {
        	TagifyUserList.addTags([user.empinfo_name]); 
         });
      },
      error: function(xhr, status, error) {
        // 에러 처리를 수행합니다.
      }
    });
  }
  
  sendAjaxRequest(emp_no);
  
  
  // Basic
  //------------------------------------------------------
  const tagifyBasicEl = $('#TagifyBasic')[0];
  const TagifyBasic = new Tagify(tagifyBasicEl);

  // Read only
  //------------------------------------------------------
  const tagifyReadonlyEl = $('#TagifyReadonly')[0];
  const TagifyReadonly = new Tagify(tagifyReadonlyEl);

  // Custom list & inline suggestion
  //------------------------------------------------------
  const TagifyCustomInlineSuggestionEl = $('#TagifyCustomInlineSuggestion')[0];
  const TagifyCustomListSuggestionEl = $('#TagifyCustomListSuggestion')[0];

  const whitelist = [
	  'A# .NET',
	    'A# (Axiom)',
	    'A-0 System',
	    'A+',
	    'A++',
	    'ABAP',
	    'ABC',
	    'ABC ALGOL',
	    'ABSET',
	    'ABSYS',
	    'ACC',
	    'Accent',
	    'Ace DASL',
	    'ACL2',
	    'Avicsoft',
	    'ACT-III',
	    'Action!',
	    'ActionScript',
	    'Ada',
	    'Adenine',
	    'Agda',
	    'Agilent VEE',
	    'Agora',
	    'AIMMS',
	    'Alef',
	    'ALF',
	    'ALGOL 58',
	    'ALGOL 60',
	    'ALGOL 68',
	    'ALGOL W',
	    'Alice',
	    'Alma-0',
	    'AmbientTalk',
	    'Amiga E',
	    'AMOS',
	    'AMPL',
	    'Apex (Salesforce.com)',
	    'APL',
	    'AppleScript',
	    'Arc',
	    'ARexx',
	    'Argus',
	    'AspectJ',
	    'Assembly language',
	    'ATS',
	    'Ateji PX',
	    'AutoHotkey',
	    'Autocoder',
	    'AutoIt',
	    'AutoLISP / Visual LISP',
	    'Averest',
	    'AWK',
	    'Axum',
	    'Active Server Pages',
	    'ASP.NET'
  ];
  
  // 인라인
  let TagifyCustomInlineSuggestion = new Tagify(TagifyCustomInlineSuggestionEl, {
    whitelist: whitelist,
    maxTags: 20,
    dropdown: {
      maxItems: 20,
      classname: 'tags-inline',
      enabled: 0,
      closeOnSelect: false
    }
  });

  // 리스트
  let TagifyCustomListSuggestion = new Tagify(TagifyCustomListSuggestionEl, {
    whitelist: whitelist,
    maxTags: 20,
    dropdown: {
      maxItems: 20,
      classname: '',
      enabled: 0,
      closeOnSelect: false
    }
  });

  // 사용자 리스트 제안
  //------------------------------------------------------
  const TagifyUserListEl = $('#TagifyUserList2')[0];
  
  function tagTemplate(tagData) {
	  return `
	    <tag title="${tagData.title || tagData.empinfo_email}"
	      contenteditable='false'
	      spellcheck='false'
	      tabIndex="-1"
	      class="${this.settings.classNames.tag} ${tagData.class ? tagData.class : ''}"
	      ${this.getAttributes(tagData)}
	    >
	      <x title='' class='tagify__tag__removeBtn' role='button' aria-label='remove tag'></x>
	      <div>
	       
	        <span class='tagify__tag-text'>${tagData.empinfo_name}</span>
	      </div>
	    </tag>
	  `;
  }

  function suggestionItemTemplate(tagData) {
	  return `
	    <div ${this.getAttributes(tagData)}
	      class='tagify__dropdown__item align-items-center ${tagData.class ? tagData.class : ''}'
	      tabindex="0"
	      role="option"
	    >
	    <div class="d-flex">
	      <div class="fw-medium" style="width:150px">${tagData.empinfo_name} </div>
	      <span>${tagData.team_name}</span>
	    </div>
	    </div>
	  `;
  }

  let TagifyUserList = new Tagify(TagifyUserListEl, {
    tagTextProp: 'empinfo_name',
    enforceWhitelist: true,
    maxTags: 1,
    skipInvalid: true,
    dropdown: {
      closeOnSelect: false,
      enabled: 0,
      classname: 'users-list',
      searchKeys: ['empinfo_name', 'empinfo_email']
    },
    templates: {
      tag: tagTemplate,
      dropdownItem: suggestionItemTemplate
    },
    whitelist: usersList
  });

  // 이메일 리스트 제안
  //------------------------------------------------------
  let randomStringsArr = Array.apply(null, Array(100)).map(function () {
	  return (
		      Array.apply(null, Array(~~(Math.random() * 10 + 3)))
		        .map(function () {
		          return String.fromCharCode(Math.random() * (123 - 97) + 97);
		        })
		        .join('') + '@gmail.com'
		    );
  });

  const TagifyEmailListEl = $('#TagifyEmailList')[0];
  const TagifyEmailList = new Tagify(TagifyEmailListEl, {
    pattern: /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/,
    whitelist: randomStringsArr,
    callbacks: {
      invalid: onInvalidTag
    },
    dropdown: {
      position: 'text',
      enabled: 1
    }
  });

  const button = $(TagifyEmailListEl).next(); // "새 태그 추가" 액션 버튼

  $(button).on('click', onAddButtonClick);

  function onAddButtonClick() {
    TagifyEmailList.addEmptyTag();
  }

  function onInvalidTag(e) {
    console.log('invalid', e.detail);
  }
  
  $("#programModify").on("click", function(e) {
	  e.preventDefault();
	  
	  var task_no = $("#taskNoBox").val();
	  var task_name = $("#multicol-email").val();
	  var emp_notes = TagifyUserList.value;
	  var task_url = $("#multicol-password").val();
	  var task_importance = $("#task-priority").val();
	  var task_category = $("#multicol-country").val();
	  var task_detail = $("#detail-category").val();
	  var task_date = $("#flatpickr-range").val();
	  var task_realstart = $("#flatpickr-date").val();
	  var task_realend = $("#flatpickr-disabled-range").val();
	  var task_status = $("#task-progress").val();
	  console.log(emp_no);
	  var data = {
			  task_no : task_no,
			  task_name : task_name,
			  emp_notes : emp_notes,
			  task_url : task_url,
			  task_importance : task_importance,
			  task_category : task_category,
			  task_detail : task_detail,
			  task_date : task_date,
			  task_realstart : task_realstart,
			  task_realend : task_realend,
			  task_status : task_status
	  }
	  
	  $.ajax({
		  url: "/exodia/task/modifyProgram",
		  method: "post",
		  contentType: 'application/json',
		  data: JSON.stringify(data),
		  success: function(data) {
			  location.reload();
		  },
		  error: function(error) {
			  console.log("아왜안떠왜왜왜");
		  }
	  });
  });
  
});

