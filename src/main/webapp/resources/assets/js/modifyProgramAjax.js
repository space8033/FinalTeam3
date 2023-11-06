/**
 * Tagify
 */

$(document).ready(function() {
  var emp_no = $("#empNoBox").val();
  var usersList = [];
  var now = $("#nowEmpNo").val();
  console.log(now);
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

