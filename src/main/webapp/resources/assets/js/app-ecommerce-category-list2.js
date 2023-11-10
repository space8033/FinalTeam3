/**
 * App eCommerce Category List
 */

'use strict';

// Comment editor

const commentEditor = document.querySelector('.comment-editor');



// Datatable (jquery)

$(function () {
  let borderColor, bodyBg, headingColor;

  if (isDarkStyle) {
    borderColor = config.colors_dark.borderColor;
    bodyBg = config.colors_dark.bodyBg;
    headingColor = config.colors_dark.headingColor;
  } else {
    borderColor = config.colors.borderColor;
    bodyBg = config.colors.bodyBg;
    headingColor = config.colors.headingColor;
  }

  var empinfo_no = $("#empinfoNo").val();
  // Variable declaration for category list table
  var dt_category_list_table = $('.datatables-category-list');

  //select2 for dropdowns in offcanvas

  var select2 = $('.select2');
  if (select2.length) {
    select2.each(function () {
      var $this = $(this);
      $this.wrap('<div class="position-relative"></div>').select2({
        dropdownParent: $this.parent(),
        placeholder: $this.data('placeholder') //for dynamic placeholder
      });
    });
  }

  // Customers List Datatable
  
  if (dt_category_list_table.length) {
    var dt_category = dt_category_list_table.DataTable({
      ajax: {
    	  url: '/exodia/project/projectList',
    	  data: {
    		  empinfo_no : empinfo_no
    	  },
    	  type: 'post',
    	  dataSrc: ''// JSON file to add data
      },
      columns: [
        // columns according to JSON
        { data: '' },
        { data: 'project_name' },
        { data: 'project_memberCount' },
        { data: 'project_period' },
        { data: 'project_client' }
      ],
      columnDefs: [
        {
          // For Responsive
          className: 'control',
          searchable: false,
          orderable: false,
          responsivePriority: 1,
          targets: 0,
          render: function (data, type, full, meta) {
            return '';
          }
        },
        {
          // Categories and Category Detail
          targets: 1,
          responsivePriority: 2,
          render: function (data, type, full, meta) {
            var $name = full['project_name'];
            var $row_output =
              '<div class="d-flex align-items-center">' +
              '<div class="d-flex flex-column justify-content-center">' +
              '<a class="text-body text-wrap fw-medium" href="#">' +
              $name +
              '</a>' +
              '</div>' +
              '</div>';
            return $row_output;
          }
        },
        {
          // Total products
          targets: 2,
          responsivePriority: 3,
          render: function (data, type, full, meta) {
            var $total_products = full['project_memberCount'];
            return '<div class="text-sm-start">' + $total_products + '</div>';
          }
        },
        {
          // Total Earnings
          targets: 3,
          orderable: false,
          render: function (data, type, full, meta) {
            var $total_earnings = full['project_period'];
            return "<div class='fw-medium text-sm-start'>" + $total_earnings + '</div';
          }
        },
        {
        	// Total Earnings
        	targets: 4,
        	orderable: false,
        	render: function (data, type, full, meta) {
        		var $client = full['project_client'];
        		return "<div class='fw-medium text-sm-start'>" + $client + '</div';
        	}
        }
      ],
      order: [2, 'desc'], //set any columns order asc/desc
      dom:
        '<"card-header d-flex flex-wrap py-0"' +
        '<"me-5 ms-n2 pe-5"f>' +
        '<"d-flex justify-content-start justify-content-md-end align-items-baseline"<"dt-action-buttons d-flex align-items-start align-items-md-center justify-content-sm-center mb-3 mb-sm-0 gap-3"lB>>' +
        '>t' +
        '<"row mx-2"' +
        '<"col-sm-12 col-md-6"i>' +
        '<"col-sm-12 col-md-6"p>' +
        '>',
      lengthMenu: [7, 10, 20, 50, 70, 100], //for length of menu
      language: {
        sLengthMenu: '_MENU_',
        search: '',
        searchPlaceholder: '프로젝트 검색'
      },
     
      // For responsive popup
      responsive: {
        details: {
          display: $.fn.dataTable.Responsive.display.modal({
            header: function (row) {
              var data = row.data();
              return 'Details of ' + data['categories'];
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
                    '<td> ' +
                    col.title +
                    ':' +
                    '</td> ' +
                    '<td class="ps-0">' +
                    col.data +
                    '</td>' +
                    '</tr>'
                : '';
            }).join('');

            return data ? $('<table class="table"/><tbody />').append(data) : false;
          }
        }
      }
    });
    $('.dataTables_length').addClass('mt-0 mt-md-3');
    $('.dt-action-buttons').addClass('pt-0');
  }

  // Delete Record
  $('.datatables-category-list tbody').on('click', '.delete-record', function () {
    dt_category.row($(this).parents('tr')).remove().draw();
  });

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