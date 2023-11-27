/**
 * Tagify
 */
$(document).ready(function() {
  var emp_no = $("#empNoBox").val();
  var usersList = [];
  var now = $("#nowEmpNo").val();
  console.log(now);
  function sendAjaxRequest() {
    $.ajax({
      type: "GET",
      url: "/exodia/employee/getAllEmpInfo",

      success: function(data) {
 		 usersList = data;
 		 console.log(usersList);
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
	      <span>${tagData.empinfo_email}</span>
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
  
  $("#registerButton").on("click", function(e) {
	  e.preventDefault();
	  
	  var project_name = $("#fullname").val();
	  var project_outline = $("#address").val();
	  var emp_notes = TagifyUserList.value;
	  var team_name = $("#TagifyBasic").val();
	  var project_client = $("#pnumber").val();
	  var project_period = $("#flatpickr-range").val();
	  
	  var data = {
			  project_name : project_name,
			  project_outline : project_outline,
			  emp_notes : emp_notes,
			  team_name : team_name,
			  project_client : project_client,
			  project_period : project_period
	  }
	  console.log(data);
	  $.ajax({
		  url: "/exodia/project/addProject",
		  method: "post",
		  contentType: 'application/json',
		  data: JSON.stringify(data),
		  success: function(data) {
			  window.location.href = "/exodia/project/projectList";
		  },
		  error: function(error) {
			  alert("모든 항목을 입력해주세요!");
		  }
	  });
  });
  
});

