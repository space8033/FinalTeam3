$(document).ready(function () {
	
    $.ajax({
    	url: '/exodia/notice/noticeList',
        type: 'GET',
        success: function (data) {
            console.log(data); // JSON 데이터
            productAdd = "noticeAdd";

            // DataTable
            $('#noticeTable').DataTable({
                data: data,
                columns: [
                    { data: "notice_no" },
                    { data: 'notice_title' },
                    { data: 'empinfo_no_writer' },
                    { data: 'notice_createdat' }
                ],
                columnDefs: [
                    // 여기에 columnDefs 내용 추가
                	{
                        // For Responsive
                        className: 'control',
                        searchable: false,
                        orderable: false,
                        responsivePriority: 2,
                        targets: 0
                      },
                      
                      {
                      	//notice no
                      	targets: 1,
                      	render: function (data, type, full, meta) {
                      		sharedNoticeNo = full['notice_no'];
                      		  return "<span class='text-truncate d-flex align-items-center'>" + sharedNoticeNo + '</span>';
                      	}
                      },
                      {
                      	  //notice title
                      	  targets: 2,
                      	  responsivePriority: 1,
                      	  render: function (data, type, full, meta) {
                      		  var $title = full['notice_title'];

                      		    // Create a text output for Product name
                      		    var $row_output =
                      		      '<div class="d-flex justify-content-start align-items-center product-name">' +
                      		      '<div class="d-flex flex-column">' +
                      		      '<h6 class="text-body text-nowrap mb-0">' +
                      		      '<a href="noticeDetail.jsp?no=' + sharedNoticeNo + '">' + $title + '</a>' +
                      		      '</h6>' +
                      		      '</div>' +
                      		      '</div>';
                      		    return $row_output;
                      	  }
                      },
                      {
                        // writer

                        targets: 3,
                        responsivePriority: 5,
                        render: function (data, type, full, meta) {
                      	  var $writerName = full['empinfo_no_writer']; //writer 필드에서 글쓴이 이름을 가져옴
                      	    return "<span class='text-truncate d-flex align-items-center'>" + $writerName + '</span>';
                        }
                      },
                      {
                      	// date
                      	targets: 4,
                      	render: function (data, type, full, meta) {
                      		var $date = full['notice_createdat']; //date 필드에서 날짜 정보를 가져옴
                      	    return '<span class="text-truncate d-flex align-items-center">' + $date + '</span>';
                      	}
                      }
                ],
                // 나머지 DataTables 설정도 추가해야 함
                order: [2, 'asc'], //set any columns order asc/desc
                dom:
                  '<"card-header d-flex border-top rounded-0 flex-wrap py-md-0"' +
                  '<"me-5 ms-n2 pe-5"f>' +
                  '<"d-flex justify-content-start justify-content-md-end align-items-baseline"<"dt-action-buttons d-flex align-items-start align-items-md-center justify-content-sm-center mb-3 mb-sm-0"lB>>' +
                  '>t' +
                  '<"row mx-2"' +
                  '<"col-sm-12 col-md-6"i>' +
                  '<"col-sm-12 col-md-6"p>' +
                  '>',
                lengthMenu: [10, 20, 50, 70, 100], //for length of menu
                language: {
                  sLengthMenu: '_MENU_',
                  search: '',
                  searchPlaceholder: '검색',
                  info: 'Displaying _START_ to _END_ of _TOTAL_ entries'
                },
                // Buttons with Dropdown
                buttons: [
                  {
                    text: '<i class="bx bx-plus me-0 me-sm-1"></i><span class="d-none d-sm-inline-block">공지사항 등록</span>',
                    className: 'add-new btn btn-primary',
                    action: function () {
                      window.location.href = productAdd;
                    }
                  }
                ],
                // For responsive popup
                responsive: {
                  details: {
                    display: $.fn.dataTable.Responsive.display.modal({
                      header: function (row) {
                        var data = row.data();
                        return 'Details of ' + data['product_name'];
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

                   
                    });      
                }
              });
            $("#noticeTable").html();
        },
        error: function (error) {
            console.log("에러 발생: " + error);
            console.log(error.status);
            console.log(error.statusText);
        }
    });
});
/*//'use strict';

// Datatable (jquery)
$(function () {
	var sharedNoticeNo = null;
	productAdd = "noticeAdd";

  //datatable
  console.log("if바로 바깥쪽 위");

    console.log("if위쪽");
    if (dt_product_table.length) {
    	console.log("if안쪽");
    $('#noticeTable').DataTable({
      "ajax": {
        "url": "/notice/noticeList",
        "dataSrc": ''
      },
      columns: [
        { "data": 'notice_no' },
        { "data": 'notice_title' },
        { "data": 'empinfo_no_writer' },
        { "data": 'notice_createdat' },
      ],
      columnDefs: [
        {
          // For Responsive
          className: 'control',
          searchable: false,
          orderable: false,
          responsivePriority: 2,
          targets: 0
        },
        
        {
        	//notice no
        	targets: 1,
        	render: function (data, type, full, meta) {
        		sharedNoticeNo = full['notice_no'];
        		  return "<span class='text-truncate d-flex align-items-center'>" + sharedNoticeNo + '</span>';
        	}
        },
        {
        	  //notice title
        	  targets: 2,
        	  responsivePriority: 1,
        	  render: function (data, type, full, meta) {
        		  var $title = full['notice_title'];

        		    // Create a text output for Product name
        		    var $row_output =
        		      '<div class="d-flex justify-content-start align-items-center product-name">' +
        		      '<div class="d-flex flex-column">' +
        		      '<h6 class="text-body text-nowrap mb-0">' +
        		      '<a href="noticeDetail.jsp?no=' + sharedNoticeNo + '">' + $title + '</a>' +
        		      '</h6>' +
        		      '</div>' +
        		      '</div>';
        		    return $row_output;
        	  }
        },
        {
          // writer

          targets: 3,
          responsivePriority: 5,
          render: function (data, type, full, meta) {
        	  var $writerName = full['empinfo_no_writer']; //writer 필드에서 글쓴이 이름을 가져옴
        	    return "<span class='text-truncate d-flex align-items-center'>" + $writerName + '</span>';
          }
        },
        {
        	// date
        	targets: 4,
        	render: function (data, type, full, meta) {
        		var $date = full['notice_createdat']; //date 필드에서 날짜 정보를 가져옴
        	    return '<span class="text-truncate d-flex align-items-center">' + $date + '</span>';
        	}
        } 
      ],
      order: [2, 'asc'], //set any columns order asc/desc
      dom:
        '<"card-header d-flex border-top rounded-0 flex-wrap py-md-0"' +
        '<"me-5 ms-n2 pe-5"f>' +
        '<"d-flex justify-content-start justify-content-md-end align-items-baseline"<"dt-action-buttons d-flex align-items-start align-items-md-center justify-content-sm-center mb-3 mb-sm-0"lB>>' +
        '>t' +
        '<"row mx-2"' +
        '<"col-sm-12 col-md-6"i>' +
        '<"col-sm-12 col-md-6"p>' +
        '>',
      lengthMenu: [10, 20, 50, 70, 100], //for length of menu
      language: {
        sLengthMenu: '_MENU_',
        search: '',
        searchPlaceholder: '검색',
        info: 'Displaying _START_ to _END_ of _TOTAL_ entries'
      },
      // Buttons with Dropdown
      buttons: [
        {
          text: '<i class="bx bx-plus me-0 me-sm-1"></i><span class="d-none d-sm-inline-block">공지사항 등록</span>',
          className: 'add-new btn btn-primary',
          action: function () {
            window.location.href = productAdd;
          }
        }
      ],
      // For responsive popup
      responsive: {
        details: {
          display: $.fn.dataTable.Responsive.display.modal({
            header: function (row) {
              var data = row.data();
              return 'Details of ' + data['product_name'];
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
              .sort()
              .each(function (d, j) {
                select.append('<option value="' + statusObj[d].title + '">' + statusObj[d].title + '</option>');
              });
          });      
      }
    });
    $('.dataTables_length').addClass('mt-0 mt-md-3 me-3'); 
  console.log("if끝나고 바깥");

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
}
});*/