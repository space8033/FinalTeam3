/**
 * Tagify
 */

$(document).ready(function() {
  var usersList = [];
  
  $('#selectpickerIcons').on('change', function() {
    var author = $(this).val();
    var teamname = $('#selectpickerLiveSearch').val();
    
    sendAjaxRequest(author, teamname);
  });

  $('#selectpickerLiveSearch').on('change', function() {
    var author = $('#selectpickerIcons').val();
    var teamname = $(this).val();
    
    sendAjaxRequest(author, teamname);
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
    	 console.log(data);
 		 usersList = data;
 		 
 		 TagifyUserList.settings.whitelist = usersList;
         TagifyUserList.loading(false);
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

/*  const usersList = [
	    {
	      value: 1,
	      name: 'Justinian Hattersley',
	      avatar: 'https://i.pravatar.cc/80?img=1',
	      email: 'jhattersley0@ucsd.edu'
	    },
	    {
	      value: 2,
	      name: 'Antons Esson',
	      avatar: 'https://i.pravatar.cc/80?img=2',
	      email: 'aesson1@ning.com'
	    },
	    {
	      value: 3,
	      name: 'Ardeen Batisse',
	      avatar: 'https://i.pravatar.cc/80?img=3',
	      email: 'abatisse2@nih.gov'
	    },
	    {
	      value: 4,
	      name: 'Graeme Yellowley',
	      avatar: 'https://i.pravatar.cc/80?img=4',
	      email: 'gyellowley3@behance.net'
	    },
	    {
	      value: 5,
	      name: 'Dido Wilford',
	      avatar: 'https://i.pravatar.cc/80?img=5',
	      email: 'dwilford4@jugem.jp'
	    },
	    {
	      value: 6,
	      name: 'Celesta Orwin',
	      avatar: 'https://i.pravatar.cc/80?img=6',
	      email: 'corwin5@meetup.com'
	    },
	    {
	      value: 7,
	      name: 'Sally Main',
	      avatar: 'https://i.pravatar.cc/80?img=7',
	      email: 'smain6@techcrunch.com'
	    },
	    {
	      value: 8,
	      name: 'Grethel Haysman',
	      avatar: 'https://i.pravatar.cc/80?img=8',
	      email: 'ghaysman7@mashable.com'
	    },
	    {
	      value: 9,
	      name: 'Marvin Mandrake',
	      avatar: 'https://i.pravatar.cc/80?img=9',
	      email: 'mmandrake8@sourceforge.net'
	    },
	    {
	      value: 10,
	      name: 'Corrie Tidey',
	      avatar: 'https://i.pravatar.cc/80?img=10',
	      email: 'ctidey9@youtube.com'
	    }
  ];*/

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

  //TagifyUserList.on('dropdown:show dropdown:updated', onDropdownShow);
  //TagifyUserList.on('dropdown:select', onSelectSuggestion);

  //let addAllSuggestionsEl;

/*  function onDropdownShow(e) {
	  let dropdownContentEl = e.detail.tagify.DOM.dropdown.content;

	    if (TagifyUserList.suggestedListItems.length > 1) {
	      addAllSuggestionsEl = getAddAllSuggestionsEl();

	      // insert "addAllSuggestionsEl" as the first element in the suggestions list
	      //dropdownContentEl.insertBefore(addAllSuggestionsEl, dropdownContentEl.firstChild);
	    }
  }*/

/*  function onSelectSuggestion(e) {
	  if (e.detail.elm == addAllSuggestionsEl) TagifyUserList.dropdown.selectAll.call(TagifyUserList);
  }*/

/*  function getAddAllSuggestionsEl() {
	  return TagifyUserList.parseTemplate('dropdownItem', [
	      {
	        class: 'addAll',
	        name: '전체 추가',
	        email:
	          TagifyUserList.settings.whitelist.reduce(function (remainingSuggestions, item) {
	            return TagifyUserList.isTagDuplicate(item.value) ? remainingSuggestions : remainingSuggestions + 1;
	          }, 0) + ' Members'
	      }
	    ]);
  }*/

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
});
