/*$(init)

function init() {
	//"checkBoxSelectAll" 클래스를 가진 요소가 클릭되었을 때 checkAll 함수를 호출하여 체크 박스 전체 선택 동작을 수행하도록 설정
	$(".checkBoxSelectAll").click(checkAll);
	$(".checkBoxSelectAll").click(allcheckCount);
	cart();
}

function cart() {	
				
	$.ajax({
		url: "/notice/noticeList",
		method: "GET",
		success: function(data) {			
				tableCount(data.length);		
				let html = "";
				var crt_qty_from_data = 1; // DB로부터 가져온 crt_qty 값을 담을 곳
			  data.forEach((item,index) => {
				  html += '<tr>';
				  html += '  <td>1</td>';
				  html += '  <td>';
				  html += '  	<div class="d-flex align-items-center">';
				  html += '			<img';
				  html += '  			src="../../assets/img/icons/brands/chrome.png"';
				  html += '  			alt="Chrome';
				  html += '				height="24"';
				  html += '  			class="me-2" />';
				  html += '  		<span>Chrome</span>';
				  html += '		</div>';
				  html += '  </td>';
				  html += '  <td>8.92k</td>';
				  html += '  <td>';
				  html += '		<div class="d-flex justify-content-between align-items-center gap-3">';
				  html += '  		<div class="progress w-100" style="height: 10px">';
				  html += '  			<div';	
				  html += '  				class="progress-bar bg-success"';
				  html += '  				role="progressbar"';
				  html += '  				style="width: 84.75%"';
				  html += '  				aria-valuenow="84.75"';
				  html += '  				aria-valuemin="0"';
				  html += '					aria-valuemax="100"></div>';		  				  
				  html += '				</div>';
				  
				  
				  
				  html += '</select>';
				  html += '<span></span>';
				  html += '  		</div>';
				  html += '  	</div>';
				  html += '  	<div class="badge-list">';
				  html += '			<div class="badge-item option-benefit">';
				  html += '				<span class="promo-cash-benefit ">';
				  html += '					<em class="promo-cash-benefit__text">최대' + (item.prd_price * 0.01).toLocaleString('ko-KR') + '원 적립</em>';
				  html += '				</span>';		
				  html += '			</div>';
				  html += '  	</div>';
				  html += '  </td>';
				  html += '  <td>';
				  html += '		<a href="deleteCart?prd_no=' + item.prd_no + '&us_no=' + item.us_no + '" class="btn btn-primary">삭제</a>';
				  html += '  </td>';
				  html += '  <td>';
				  html += '  	<div class="cart-product-price" id="cart-product-price">' + (item.prd_price*crt_qty_from_data).toLocaleString('ko-KR') + '</div>';
				  html += '  </td>';
				  html += '</tr>';	
				  //배송비 값 받기
				  totalShippingFee = parseFloat(item.prd_ship_fee);
			  });	//forEach 끝
		},	//success 끝
		error: function(error) {
			console.log("에러났다:"+error.name);
			console.log("에러났다:"+error.stack);
		}	// ERROR 끝
	});	// AJAX 끝
}
*/