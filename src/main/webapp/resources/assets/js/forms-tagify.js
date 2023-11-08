/**
 * Tagify
 */

$(document).ready(function() {
  var usersList = [];
  
  $('#selectpickerIcons').on('change', function() {
    var author = $(this).val();
    var teamname = $('#selectpickerLiveSearch').val();
    
    sendAjaxRequest(author, teamname);
    TagifyUserList.removeAllTags();
  });

  $('#selectpickerLiveSearch').on('change', function() {
    var author = $('#selectpickerIcons').val();
    var teamname = $(this).val();
    
    sendAjaxRequest(author, teamname);
    TagifyUserList.removeAllTags();
    
    $.ajax({
        type: "GET",
        url: "/exodia/employee/getTeamDuty", // DB에서 값을 받아오는 엔드포인트 설정
        data: {
          teamname: teamname
        },
        success: function(data) {
          // 받아온 데이터를 기반으로 값을 업데이트
          $("#TypeaheadBasic").val(data); // 예시로 받아온 데이터 중 일부 사용
        },
        error: function(xhr, status, error) {
        	$("#TypeaheadBasic").val(xhr.responseText);
        }
      });
  });

  function sendAjaxRequest(author, teamname) {
    $.ajax({
      type: "GET",
      url: "/exodia/employee/getFilteredUser", // 여기에 컨트롤러의 엔드포인트를 삽입하세요
      data: {
        author: author,
        teamname: teamname
      },
      success: function(data) {
 		 usersList = data;
 		 TagifyUserList.settings.whitelist = usersList;
         TagifyUserList.loading(false);
         
         var filteredUsers = usersList.filter(function(user) {
	         return user.team_name === teamname;
	     });
	
	     // TagifyUserList에 추가
	     filteredUsers.forEach(function(user) {
	       TagifyUserList.addTags([user.name]);
	     });
      },
      error: function(xhr, status, error) {
        // 에러 처리를 수행합니다.
      }
    });
  }
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
    maxTags: 10,
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
    maxTags: 10,
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
	    <tag title="${tagData.title || tagData.email}"
	      contenteditable='false'
	      spellcheck='false'
	      tabIndex="-1"
	      class="${this.settings.classNames.tag} ${tagData.class ? tagData.class : ''}"
	      ${this.getAttributes(tagData)}
	    >
	      <x title='' class='tagify__tag__removeBtn' role='button' aria-label='remove tag'></x>
	      <div>
	       
	        <span class='tagify__tag-text'>${tagData.name}</span>
	      </div>
	    </tag>
	  `;
/*	  return `
	    <tag title="${tagData.title || tagData.email}"
	      contenteditable='false'
	      spellcheck='false'
	      tabIndex="-1"
	      class="${this.settings.classNames.tag} ${tagData.class ? tagData.class : ''}"
	      ${this.getAttributes(tagData)}
	    >
	      <x title='' class='tagify__tag__removeBtn' role='button' aria-label='remove tag'></x>
	      <div>
	        <div class='tagify__tag__avatar-wrap'>
	          <img onerror="this.style.visibility='hidden'" src="${tagData.avatar}">
	        </div>
	        <span class='tagify__tag-text'>${tagData.name}</span>
	      </div>
	    </tag>
	  `;*/
  }

  function suggestionItemTemplate(tagData) {
	  return `
	    <div ${this.getAttributes(tagData)}
	      class='tagify__dropdown__item align-items-center ${tagData.class ? tagData.class : ''}'
	      tabindex="0"
	      role="option"
	    >
	      ${
	        tagData.avatar
	          ? `<div class='tagify__dropdown__item__avatar-wrap'>
	          <img onerror="this.style.visibility='hidden'" src="${tagData.avatar}">
	        </div>`
	          : ''
	      }
	      <div class="fw-medium">${tagData.name}</div>
	      <span>${tagData.email}</span>
	    </div>
	  `;
  }

  let TagifyUserList = new Tagify(TagifyUserListEl, {
    tagTextProp: 'name',
    enforceWhitelist: true,
    skipInvalid: true,
    dropdown: {
      closeOnSelect: false,
      enabled: 0,
      classname: 'users-list',
      searchKeys: ['name', 'email']
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
  
  $("#managementSaveButton").on('click', function() {
	  var selected_role_category = $('#selectpickerIcons').val();
	  var selected_team_name = $('#selectpickerLiveSearch').val();
	  var typed_team_duty = $('#TypeaheadBasic').val();
	  var selected_userList = TagifyUserList.value;

	  var data = {
			  selected_role_category: selected_role_category,
			  selected_team_name: selected_team_name,
			  typed_team_duty: typed_team_duty,
			  selected_userList : selected_userList
	  }
	  
	  $.ajax({
		  type: 'POST',
		  url: '/exodia/employee/saveEmpManagement',
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

function deleteTeam(team_name) {
	if(confirm('정말로 삭제하시겠습니까?')) {
		$.ajax({
			url: "/exodia/employee/deleteTeam",
			method: "post",
			data:{
				"team_name": team_name
			},
			success: function(data) {
				alert('삭제가 완료되었습니다');
				location.reload();
			},
			error: function(error) {
				console.log("아왜");
			}
		});		
	}else {
		alert('삭제가 취소되었습니다.');
	}
}