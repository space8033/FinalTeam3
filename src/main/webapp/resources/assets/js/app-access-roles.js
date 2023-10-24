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

  var userView = 'app-user-view-account.html';

  // Users List datatable
  if (dtUserTable.length) {
    dtUserTable.DataTable({
      ajax: assetsPath + 'json/user-list.json', // JSON file to add data
      columns: [
        // columns according to JSON
    	{ data: '' },
    	{ data: 'full_name' },
        { data: 'role' },
        { data: 'current_plan' },
        { data: 'billing' },
        { data: 'status' }
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
            var $name = full['full_name'];
            // Creates full output for row
            var $row_output =
              '<div class="d-flex justify-content-left align-items-center">' +
              '<div class="d-flex flex-column">' +
              '<a href="' +
              userView +
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
            var $role = full['role'];
            return "<span class='text-truncate d-flex align-items-center'>" + $role + '</span>';
          }
        },
        {
          // Plans
          targets: 3,
          render: function (data, type, full, meta) {
            var $plan = full['current_plan'];

            return '<span class="fw-medium">' + $plan + '</span>';
          }
        },
        
        {
          // Actions
          targets: 5,
          title: '상태',
          searchable: false,
          orderable: false,
          render: function (data, type, full, meta) {
            return '<a href="' + userView + '" class="btn btn-sm btn-icon"><i class="bx bx-show-alt"></i></a>';
          }
        }
      ],
      order: [[1, 'desc']],
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

(function () {
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
