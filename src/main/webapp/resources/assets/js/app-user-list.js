/**
 * Page User List
 */

'use strict';

// Datatable (jquery)
$(function () {
  let borderColor, bodyBg, headingColor;
  let empNow = $("#empNow").val();
  if (isDarkStyle) {
    borderColor = config.colors_dark.borderColor;
    bodyBg = config.colors_dark.bodyBg;
    headingColor = config.colors_dark.headingColor;
  } else {
    borderColor = config.colors.borderColor;
    bodyBg = config.colors.bodyBg;
    headingColor = config.colors.headingColor;
  }

  // Variable declaration for table
  var dt_user_table = $('.datatables-users'),
    select2 = $('.select2'),
    userView = 'app-user-view-account.html',
    statusObj = {
      1: { title: 'away', class: 'bg-label-warning' },
      2: { title: 'online', class: 'bg-label-success' },
      3: { title: 'offline', class: 'bg-label-secondary' }
    };

  if (select2.length) {
    var $this = select2;
    $this.wrap('<div class="position-relative"></div>').select2({
      placeholder: 'Select Country',
      dropdownParent: $this.parent()
    });
  }

  // Users datatable
  if (dt_user_table.length) {
    var dt_user = dt_user_table.DataTable({
      ajax: {
          url: '/exodia/employee/projectEmp',
          type : "POST",
          dataSrc: ''
      },
      columns: [
        // columns according to JSON
        { data: '' },
        { data: 'emp_no' },
        { data: 'empinfo_name' },
        { data: 'role_category' },
        { data: 'team_name' },
        { data: 'empinfo_position' },
        { data: 'emp_status' }
      ],
      columnDefs: [
        {
          // For Responsive
          className: 'control',
          searchable: false,
          orderable: false,
          responsivePriority: 2,
          targets: 0,
          render: function (data, type, full, meta) {
            return '';
          }
        },
        {
          // User full name and email
          targets: 1,
          responsivePriority: 4,
          render: function (data, type, full, meta) {
            var $name = full['empinfo_name'],
            	$image = full['avatar'],
            	$email = full['empinfo_email'];
            if ($image) {
	          // For Avatar image
	          var $output =
	            '<img src="data:MIME;base64, ' + $image + '" alt="Avatar" class="rounded-circle">';
	        } else {
	            // For Avatar badge
	          var stateNum = full['emp_no'] % 7;
	          var states = ['success', 'primary', 'warning', 'danger', 'info', 'dark', 'secondary'];
	          var $state = states[stateNum],
	          $name = full['empinfo_name'],
	          $initials = $name.slice(-2);
	          $output = '<span class="avatar-initial rounded-circle bg-label-' + $state + '">' + $initials + '</span>';
	        }
            // Creates full output for row
            var $row_output =
                '<div class="d-flex justify-content-start align-items-center user-name">' +
                '<div class="avatar-wrapper">' +
                '<div class="avatar avatar-sm me-3">' +
                $output +
                '</div>' +
                '</div>' +
                '<div class="d-flex flex-column">' +
                '<span class="fw-medium">' +
                $name +
                '</span>' +
                '<small class="text-muted">' +
                $email +
                '</small>' +
                '</div>' +
                '</div>';
              return $row_output;

          }
        },
        {
          // User Role
          targets: 2,
          render: function (data, type, full, meta) {
            var $role = full['role_category'];
            var roleBadgeObj = {
                    PM:
                      '<span class="badge badge-center rounded-pill bg-label-warning w-px-30 h-px-30 me-2"><i class="bx bx-crown bx-xs" ></i></span>',
                    팀원:
                      '<span class="badge badge-center rounded-pill bg-label-success w-px-30 h-px-30 me-2"><i class="bx bx-group bx-sm"></i></span>',
                    팀장:
                      '<span class="badge badge-center rounded-pill bg-label-primary w-px-30 h-px-30 me-2"><i class="bx bx-user bx-sm"></i></span>',
                    Admin:
                      '<span class="badge badge-center rounded-pill bg-label-secondary w-px-30 h-px-30 me-2"><i class="bx bx-mobile-alt bx-xs"></i></span>'
                  };
                  return "<span class='text-truncate d-flex align-items-center'>" + roleBadgeObj[$role] + $role + '</span>';
          }
        },
        {
          // Plans
          targets: 3,
          render: function (data, type, full, meta) {
            var $plan = full['team_name'];

            return '<span class="fw-medium">' + $plan + '</span>';
          }
        },
        {
          // User Status
          targets: 4,
          render: function (data, type, full, meta) {
            var $position = full['empinfo_position'];

            return '<span class="fw-medium">' + $position + '</span>';
          }
        },
        {
        	// User Status
        	targets: 5,
        	render: function (data, type, full, meta) {
        		var $status = full['emp_status'];
        		
        		return '<span class="badge ' + statusObj[$status].class + '">' + statusObj[$status].title + '</span>';
        	}
        },
        {
          // Actions
          targets: 6,
          searchable: false,
          orderable: false,
          render: function (data, type, full, meta) {
        	var $no = full['emp_no'];
        	var $name = full['empinfo_name'];
        	
        	if(empNow == 0 || empNow == 1) {
        		return (
        				'<div class="d-inline-block text-nowrap">' +
        				'<button class="btn btn-sm btn-icon" onclick="javascript:noteEmployee(' + $no + ')"><i class="bx bx-paper-plane"></i></button>' +
        				'<button class="btn btn-sm btn-icon" onclick="javascript:initPassword(\'' + $name + '\', \'' + $no + '\')"><i class="bx bx-reset"></i></button>' +
        				'<button class="btn btn-sm btn-icon delete-record" onclick="javascript:deleteEmployee(' + $no + ')"><i class="bx bx-trash"></i></button>' +
        				'</div>'
        		);
        	}else {
        		return (
        				'<div class="d-inline-block text-nowrap">' +
        				'<button class="btn btn-sm btn-icon" onclick="javascript:noteEmployee(' + $no + ')"><i class="bx bx-paper-plane"></i></button>' +
        				'</div>'
        		);
        	}
          }
        }
      ],
      order: [[2, 'desc']],
      dom:
        '<"row mx-2"' +
        '<"col-md-2"<"me-3"l>>' +
        '<"col-md-10"<"dt-action-buttons text-xl-end text-lg-start text-md-end text-start d-flex align-items-center justify-content-end flex-md-row flex-column mb-3 mb-md-0"fB>>' +
        '>t' +
        '<"row mx-2"' +
        '<"col-sm-12 col-md-6"i>' +
        '<"col-sm-12 col-md-6"p>' +
        '>',
      language: {
        sLengthMenu: '_MENU_',
        search: '',
        searchPlaceholder: 'Search..'
      },
      // Buttons with Dropdown
      
        
      
      // For responsive popup
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
      }
      /*initComplete: function () {
        // Adding role filter once table initialized
        this.api()
          .columns(3)
          .every(function () {
            var column = this;
            var select = $(
              '<select id="UserRole" class="form-select text-capitalize"><option value=""> 권한별 검색 필터 </option></select>'
            )
              .appendTo('.user_role')
              .on('change', function () {
                var val = $.fn.dataTable.util.escapeRegex($(this).val());
                console.log(val);
                console.log(val ? '^' + val + '$' : '');
                column.search(val ? '^' + val + '$' : '', true, false).draw();
              });

            column
              .data()
              .unique()
              .sort()
              .each(function (d, j) {
                select.append('<option value="'+ d +'">' + d + '</option>');
              });
          });
        // Adding plan filter once table initialized
        this.api()
          .columns(4)
          .every(function () {
            var column = this;
            var select = $(
              '<select id="UserPlan" class="form-select text-capitalize"><option value=""> 팀별 검색 필터 </option></select>'
            )
              .appendTo('.user_plan')
              .on('change', function () {
                var val = $.fn.dataTable.util.escapeRegex($(this).val());
                column.search(val ? '^' + val + '$' : '', true, false).draw();
              });

            column
              .data()
              .unique()
              .sort()
              .each(function (d, j) {
                select.append('<option value="'+ d +'">' + d + '</option>');
              });
          });
        // Adding status filter once table initialized
        this.api()
          .columns(6)
          .every(function () {
            var column = this;
            var select = $(
              '<select id="FilterTransaction" class="form-select text-capitalize"><option value=""> 상태별 검색 필터 </option></select>'
            )
              .appendTo('.user_status')
              .on('change', function () {
                var val = $.fn.dataTable.util.escapeRegex($(this).val());
                column.search(val ? '^' + val + '$' : '', true, false).draw();
              });

            column
              .data()
              .unique()
              .sort()
              .each(function (d, j) {
                select.append(
                  '<option value="'+
                    statusObj[d].title +
                    '" class="text-capitalize">' +
                    statusObj[d].title +
                    '</option>'
                );
              });
          });
      }*/
    });
    // To remove default btn-secondary in export buttons
  }

  // Delete Record
/*  $('.datatables-users tbody').on('click', '.delete-record', function () {
    dt_user.row($(this).parents('tr')).remove().draw();
  });*/

  // Filter form control to default size
  // ? setTimeout used for multilingual table initialization
  setTimeout(() => {
    $('.dataTables_filter .form-control').removeClass('form-control-sm');
    $('.dataTables_length .form-select').removeClass('form-select-sm');
  }, 300);
});

// Validation & Phone mask
(function () {
  const phoneMaskList = document.querySelectorAll('.phone-mask'),
    addNewUserForm = document.getElementById('addNewUserForm');

  // Phone Number
  if (phoneMaskList) {
    phoneMaskList.forEach(function (phoneMask) {
      new Cleave(phoneMask, {
        phone: true,
        phoneRegionCode: 'US'
      });
    });
  }
  // Add New User Form Validation
  const fv = FormValidation.formValidation(addNewUserForm, {
    fields: {
      userFullname: {
        validators: {
          notEmpty: {
            message: 'Please enter fullname '
          }
        }
      },
      userEmail: {
        validators: {
          notEmpty: {
            message: 'Please enter your email'
          },
          emailAddress: {
            message: 'The value is not a valid email address'
          }
        }
      }
    },
    plugins: {
      trigger: new FormValidation.plugins.Trigger(),
      bootstrap5: new FormValidation.plugins.Bootstrap5({
        // Use this for enabling/changing valid/invalid class
        eleValidClass: '',
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

function deleteEmployee(emp_no) {
	if(confirm('정말로 삭제하시겠습니까?')) {
		$.ajax({
			type: 'post',
			url: '/exodia/employee/deleteEmp', 
			data: {emp_no : emp_no}, 
			success: function(data) {
				alert('삭제가 완료되었습니다');
				location.reload();
			}
		});		
	}else {
		alert('삭제가 취소되었습니다.');
	}
}

function initPassword(empinfo_name, emp_no) {
	if(confirm(empinfo_name + '의 비밀번호를 초기화하시겠습니까?')) {
		$.ajax({
			type: 'post',
			url: '/exodia/employee/initEmpPassword', 
			data: {emp_no : emp_no}, 
			success: function(data) {
				alert(empinfo_name + '의 비밀번호가 초기화되었습니다.');
				location.reload();
			}
		});		
	}else {
		alert('비밀번호 초기화가 취소되었습니다.');
	}
}

function noteEmployee(emp_no) {
	
	window.location.href = '/exodia/note?emp_no=' + emp_no;
	
}
