/**
 *  Pages Authentication
 */

'use strict';
const formAuthentication = document.querySelector('#formAuthentication');

$(document).ready(function() {
	var idList = $("#idList").val();
	if(idList == "join-success" || idList == "") {
		console.log("없음");
	}else {
		showDuplicateList(idList);		
	}
});

function submitForm() {
	if(confirm('엑셀 등록을 하시겠습니까?')) {
		document.getElementById('myForm').submit();		
	}
}

document.addEventListener('DOMContentLoaded', function (e) {
	(function () {
    // Form validation for Add new record
    if (formAuthentication) {
      const fv = FormValidation.formValidation(formAuthentication, {
        fields: {
          username: {
            validators: {
              notEmpty: {
                message: '아이디를 입력하세요'
              },
              stringLength: {
                min: 6,
                message: '아이디는 6자 이상입니다.'
              }
            }
          },
          email: {
            validators: {
              notEmpty: {
                message: '이메일을 입력하세요'
              },
              emailAddress: {
                message: '유효하지 않은 이메일 주소입니다.'
              }
            }
          },
          'email-username': {
            validators: {
              notEmpty: {
                message: '아이디 혹은 이메일을 입력하세요'
              },
              stringLength: {
                min: 6,
                message: '6글자 이상 입력하세요'
              }
            }
          },
          password: {
            validators: {
              notEmpty: {
                message: '비밀번호를 입력해주세요'
              },
              stringLength: {
                min: 6,
                message: '비밀번호는 6글자 이상입니다.'
              }
            }
          },
          'confirm-password': {
            validators: {
              notEmpty: {
                message: '비밀번호 확인을 입력해주세요.'
              },
              identical: {
                compare: function () {
                  return formAuthentication.querySelector('[name="password"]').value;
                },
                message: '비밀번호와 비밀번호 확인이 다릅니다.'
              },
              stringLength: {
                min: 6,
                message: '비밀번호 확인은 6글자 이상입니다.'
              }
            }
          },
          terms: {
            validators: {
              notEmpty: {
                message: 'Please agree terms & conditions'
              }
            }
          }
        },
        plugins: {
          trigger: new FormValidation.plugins.Trigger(),
          bootstrap5: new FormValidation.plugins.Bootstrap5({
            eleValidClass: '',
            rowSelector: '.mb-3'
          }),
          submitButton: new FormValidation.plugins.SubmitButton(),

          defaultSubmit: new FormValidation.plugins.DefaultSubmit(),
          autoFocus: new FormValidation.plugins.AutoFocus()
        },
        init: instance => {
          instance.on('plugins.message.placed', function (e) {
            if (e.element.parentElement.classList.contains('input-group')) {
              e.element.parentElement.insertAdjacentElement('afterend', e.messageElement);
            }
          });
        }
      });
    }


    //  Two Steps Verification
    const numeralMask = document.querySelectorAll('.numeral-mask');

    // Verification masking
    if (numeralMask.length) {
      numeralMask.forEach(e => {
        new Cleave(e, {
          numeral: true
        });
      });
    }
  })();
});

function showDuplicateList(idList) {
	alert("중복된 아이디입니다!" + idList);
}
