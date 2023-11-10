/**
 * app-ecommerce-product-list
 */

'use strict';

// Datatable (jquery)
$(function () {
	
  let borderColor, bodyBg, headingColor;
  var empNo = $("#now_emp_no").val();

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
  var sharedNoticeNo = null;
  
  var dt_product_table = $('.datatables-products'),
    productAdd = "noticeAdd";
  
  //DataTable
  if (dt_product_table.length) {
	  console.log("메인페이지 최신 공지사항 목록");
    var dt_products = dt_product_table.DataTable({
    	ajax: {
            url: 'noticeListJson2',
            type : "POST",
            dataSrc: ''
        }, // JSON file to add data
      columns: [
        // columns according to JSON
    	  { data: "notice_no" },
          { data: 'notice_title' },
          { data: 'empinfo_name' },
          { data: 'notice_createdat' }
      ],
      columnDefs: [
        {
          // For Responsive
          className: 'control',
          searchable: false,
          orderable: false,
          responsivePriority: 2,
          "targets": 0, // 첫 번째 열 (0부터 시작)에 행 번호를 표시
          "data": null,
          "render": function ( data, type, row, meta ) {
              return meta.row + 1; // 행 번호를 표시
          }
        },
        
        /*{
        	//notice no
        	targets: 1,
        	render: function (data, type, full, meta) {
        		
        		 // return "<span class='text-truncate d-flex align-items-center'>" + sharedNoticeNo + '</span>';
        	}
        },*/
        {
        	  //notice title
        	  targets: 1,
        	  responsivePriority: 1,
        	  render: function (data, type, full, meta) {
        		  var $title = full['notice_title'];
        		  sharedNoticeNo = full['notice_no'];
        		    // Create a text output for Product name
        		    var $row_output =
        		      '<div class="d-flex justify-content-start align-items-center product-name">' +
        		      '<div class="d-flex flex-column">' +
        		      '<h6 class="text-body text-nowrap mb-0">' +
        		      '<a href="noticeDetail?notice_no=' + sharedNoticeNo + '" style="text-decoration: none; color: black;">' + $title + '</a>' +
        		      '</h6>' +
        		      '</div>' +
        		      '</div>';
        		    return $row_output;
        	  }
        	},
        {
          // writer

          targets: 2,
          responsivePriority: 5,
          render: function (data, type, full, meta) {
        	  var $writerName = full['empinfo_name']; //writer 필드에서 글쓴이 이름을 가져옴
        	    return "<span class='text-truncate d-flex align-items-center'>" + $writerName + '</span>';
          }
        },
        {
        	//date
        	targets: 3,
        	render: function (data, type, full, meta) {
        		var $date = full['notice_createdat']; //date 필드에서 날짜 정보를 가져옴
        	    return '<span class="text-truncate d-flex align-items-center">' + $date + '</span>';
        	}
        }
      ],
      order: [0, 'desc'], //set any columns order asc/desc
      dom:
        '<"card-header1 d-flex border-top rounded-0 flex-wrap py-md-0 pr-3"' +
        '<"me-5 ms-n2 pe-5"f>' +
        '<"d-flex justify-content-start justify-content-md-end align-items-baseline"<"dt-action-buttons d-flex align-items-start align-items-md-center justify-content-sm-center mb-3 mb-sm-0"lB>>' +
        '>t' +
        '<"row mx-2"' +
        '<"col-sm-12 col-md-6"i>' +
        '<"col-sm-12 col-md-6"p>' +
        '>',
      // For responsive popup

      initComplete: function () {
        // Adding status filter once table initialized
        this.api()
          .columns(-2)
          .every(function () {
            var column = this;
            var select = $(
              '<select id="ProductStatus" class="form-select text-capitalize"><option value="">Status</option></select>'
            )
              .appendTo('.product_status')
              .on('change', function () {
                var val = $.fn.dataTable.util.escapeRegex($(this).val());
                column.search(val ? '^' + val + '$' : '', true, false).draw();
              });

            column
              .data()
              .unique()
              .sort();
          });
        // Adding category filter once table initialized
        this.api()
          .columns(3)
          .every(function () {
            var column = this;
            var select =
            column
              .data()
              .unique()
              .sort();
          });
        // Adding stock filter once table initialized
        this.api()
          .columns(4)
      }
    });
    $('.dataTables_length').addClass('mt-0 mt-md-3 me-3');
    // To remove default btn-secondary in export buttons
    $('.dt-buttons > .btn-group > button').removeClass('btn-secondary');
  }

  // Delete Record
  $('.datatables-products tbody').on('click', '.delete-record', function () {
    dt_products.row($(this).parents('tr')).remove().draw();
  });

  // Filter form control to default size
  // ? setTimeout used for multilingual table initialization
  setTimeout(() => {
    $('.dataTables_filter .form-control').removeClass('form-control-sm');
    $('.dataTables_length .form-select').removeClass('form-select-sm');
  }, 300);
  
  
  $('.pagination').addClass('d-none');
  $('#noticeTable_info').addClass('d-none');
  $('.card-header1').addClass('d-none');
  
  
  
  
});