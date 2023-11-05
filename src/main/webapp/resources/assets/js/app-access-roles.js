/**
 * App user list
 */

'use strict';



// Datatable (jquery)
$(function () {
  var dtUserTable = $('.datatables-users'),
    statusObj = {
      1: { title: 'Pending', class: 'bg-label-warning' },
      2: { title: 'Active', class: 'bg-label-success' },
      3: { title: 'Inactive', class: 'bg-label-secondary' }
    };

  // Users List datatable
  if (dtUserTable.length) {
    dtUserTable.DataTable({
      ajax: {
          url: '/exodia/task/getPrograms',
          type : "GET",
          dataSrc: ''
      }, // JSON file to add data
      columns: [
        // columns according to JSON
    	{ data: 'task_no' },
    	{ data: 'team_name' },
    	{ data: 'task_name' },
        { data: 'empinfo_name' },
        { data: 'task_date' },
        { data: 'task_progress' }
      ],
      columnDefs: [
        {
          // For Responsive
          className: 'control',
          orderable: false,
          searchable: false,
          responsivePriority: 2,
          targets: 0,
          render: function (data, type, full, meta) {
            return '';
          }
        },
        {
          // User full name and email
          targets: 2,
          responsivePriority: 4,
          render: function (data, type, full, meta) {
            var $name = full['task_name'];
            var $no = full['task_no'];
            // Creates full output for row
            var $row_output =
              '<div class="d-flex justify-content-left align-items-center">' +
              '<div class="d-flex flex-column">' +
              '<a href="javascript:getModifyDetail(' + $no + ')"' +
              '" class="text-body text-truncate"><span class="fw-medium">' +
              $name +
              '</span></a>' +
              '</div>' +
              '</div>';
            return $row_output;
          }
        },
        {
          // User Role
          targets: 1,
          render: function (data, type, full, meta) {
            var $role = full['team_name'];
            return "<span class='text-truncate d-flex align-items-center'>" + $role + '</span>';
          }
        },
        {
          // Plans
          targets: 3,
          render: function (data, type, full, meta) {
            var $plan = full['empinfo_name'];

            return '<span class="fw-medium">' + $plan + '</span>';
          }
        },
	    {
	    	// Plans
	    	targets: 4,
	    	render: function (data, type, full, meta) {
	    		var $period = full['task_date'];
	    		
	    		return '<span class="fw-medium">' + $period + '</span>';
	    	}
	    },
        
        {
          // Actions
          targets: 5,
          title: '상태',
          orderable: false,
          render: function (data, type, full, meta) {
        	var $status = full['task_progress']
            
        	return '<span class="fw-medium">' + $status + '</span>';
          }
        }
      ],
      order: [[1, 'asc']],
      dom:
    	  '<"card-header d-flex flex-wrap py-0"' +
          '<"me-5 ms-n2 pe-5"f>' +
          '<"d-flex justify-content-start justify-content-md-end align-items-baseline"<"dt-action-buttons d-flex align-items-start align-items-md-center justify-content-sm-center mb-3 mb-sm-0 gap-3"lB>>' +
          '>t' +
          '<"row mx-2"' +
          '<"col-sm-12 col-md-6"i>' +
          '<"col-sm-12 col-md-6"p>' +
          '>',
      language: {
        sLengthMenu: '페이지당_MENU_개씩 보기',
        search: '검색',
        searchPlaceholder: '검색',
        pagenate: {
        	next: '다음',
        	previous: '이전'
        },
        info: '현재 _START_ - _END_ / _TOTAL_건'
      },
      // For responsive popup
      buttons: [
          {
            text: '<i class="bx bx-plus me-0 me-sm-1"></i>프로그램 등록',
            className: 'add-new btn btn-primary ms-2',
            attr: {
              'data-bs-toggle': 'offcanvas',
              'data-bs-target': '#offcanvasEcommerceCategoryList'
            }
          }
      ],
      responsive: {
        details: {
          display: $.fn.dataTable.Responsive.display.modal({
            header: function (row) {
              var data = row.data();
              return 'Details of ' + data['full_name'];
            }
          }),
          type: 'column',
          renderer: function (api, rowIdx, columns) {
            var data = $.map(columns, function (col, i) {
              return col.title !== '' // ? Do not show row in modal popup if title is blank (for check box)
                ? '<tr data-dt-row="' +
                    col.rowIndex +
                    '" data-dt-column="' +
                    col.columnIndex +
                    '">' +
                    '<td>' +
                    col.title +
                    ':' +
                    '</td> ' +
                    '<td>' +
                    col.data +
                    '</td>' +
                    '</tr>'
                : '';
            }).join('');

            return data ? $('<table class="table"/><tbody />').append(data) : false;
          }
        }
      },
      lengthChange: false,
      initComplete: function () {
        // Adding role filter once table initialized
        this.api()
          .columns(2)
          .every(function () {
            var column = this;
            var select = $(
              '<select id="UserRole" class="form-select text-capitalize"><option value=""> Select Role </option></select>'
            )
              .appendTo('.user_role')
              .on('change', function () {
                var val = $.fn.dataTable.util.escapeRegex($(this).val());
                column.search(val ? '^' + val + '$' : '', true, false).draw();
              });

            column
              .data()
              .unique()
              .sort()
              .each(function (d, j) {
                select.append('<option value="' + d + '" class="text-capitalize">' + d + '</option>');
              });
          });
      }
    });
  }

  // Filter form control to default size
  // ? setTimeout used for multilingual table initialization
  setTimeout(() => {
    $('.dataTables_filter .form-control').removeClass('form-control-sm');
    $('.dataTables_length .form-select').removeClass('form-select-sm');
  }, 300);
});

//For form validation
(function () {
const eCommerceCategoryListForm = document.getElementById('eCommerceCategoryListForm');

//Add New customer Form Validation
const fv = FormValidation.formValidation(eCommerceCategoryListForm, {
  fields: {
    categoryTitle: {
      validators: {
        notEmpty: {
          message: 'Please enter category title'
        }
      }
    },
    slug: {
      validators: {
        notEmpty: {
          message: 'Please enter slug'
        }
      }
    }
  },
  plugins: {
    trigger: new FormValidation.plugins.Trigger(),
    bootstrap5: new FormValidation.plugins.Bootstrap5({
      // Use this for enabling/changing valid/invalid class
      eleValidClass: 'is-valid',
      rowSelector: function (field, ele) {
        // field is the field name & ele is the field element
        return '.mb-3';
      }
    }),
    submitButton: new FormValidation.plugins.SubmitButton(),
    // Submit the form when all fields are valid
    // defaultSubmit: new FormValidation.plugins.DefaultSubmit(),
    autoFocus: new FormValidation.plugins.AutoFocus()
  }
});
})();

/*(function () {
  // On edit role click, update text
  var roleEditList = document.querySelectorAll('.role-edit-modal'),
    roleAdd = document.querySelector('.add-new-role'),
    roleTitle = document.querySelector('.role-title');

  roleAdd.onclick = function () {
    roleTitle.innerHTML = 'Add New Role'; // reset text
  };
  if (roleEditList) {
    roleEditList.forEach(function (roleEditEl) {
      roleEditEl.onclick = function () {
        roleTitle.innerHTML = 'Edit Role'; // reset text
      };
    });
  }
})();
*/



/**
 * Tagify
 */

$(document).ready(function() {
  var usersList = [];

  function sendAjaxRequest() {
    $.ajax({
      type: "GET",
      url: "/exodia/employee/getAllUser", // 여기에 컨트롤러의 엔드포인트를 삽입하세요
      success: function(data) {
 		 usersList = data;
 		 TagifyUserList.settings.whitelist = usersList;
         TagifyUserList.loading(false);
         
      },
      error: function(xhr, status, error) {
        // 에러 처리를 수행합니다.
      }
    });
  }

  sendAjaxRequest();
  
  
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
  const TagifyUserListEl = $('#TagifyUserList')[0];

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
  
  
  $(".data-submit").on('click', function(e) {
	  e.preventDefault();
	  
	  var task_name = $('#multicol-program').val();
	  var emp_notes = TagifyUserList.value;
	  var task_url = $('#multicol-task').val();
	  var task_importance = $('#task-priority-plus').val();
	  var task_category = $('#multicol-category').val();
	  var task_detail = $('#detail-category2').val();
	  var task_date = $('#bs-rangepicker-week-num').val();
	  var task_status = $('#task-progress2').val();

	  var data = {
			  task_name: task_name,
			  emp_notes: emp_notes,
			  task_url: task_url,
			  task_importance : task_importance,
			  task_category: task_category,
			  task_detail: task_detail,
			  task_date: task_date,
			  task_status: task_status
	  }
	  
	  console.log(JSON.stringify(data));
	  $.ajax({
		  type: 'POST',
		  url: '/exodia/task/registerProgram',
		  contentType: 'application/json',
		  data: JSON.stringify(data),
		  success: function(response) {
			  location.reload();
		  },
		  error: function(error) {
			  console.log(error);
		  }
	  });
  });
});

function getModifyDetail(task_no) {
	$.ajax({
		url: "/exodia/task/getProgramDetail",
		method: "get",
		data:{
			"task_no": task_no
		},
		success: function(programModifiy) {
			$("#programModifyContainer").html(programModifiy);
		},
		error: function(error) {
			console.log("아왜안떠왜왜왜");
		}
	});
}
