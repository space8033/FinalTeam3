/**
 *  Pages Authentication
 */

'use strict';
const formAuthentication = document.querySelector('#formAuthentication');

$(document).ready(function() {
    var rememberMeCheckbox = $('#remember-me');
    var emailInput = $('#email');
    var loginButton = $('#btnLogin');

    // 페이지가 로드될 때 로컬 스토리지에서 아이디를 가져와서 입력란에 설정합니다.
    if (localStorage.checkbox && localStorage.checkbox !== "") {
        rememberMeCheckbox.prop('checked', true);
        emailInput.val(localStorage.username);
    } else {
        rememberMeCheckbox.prop('checked', false);
        emailInput.val("");
    }

    // 로그인 버튼을 클릭할 때 로컬 스토리지에 값을 저장합니다.
    loginButton.click(function() {
        if (rememberMeCheckbox.is(":checked") && emailInput.val() !== "") {
            localStorage.username = emailInput.val();
            localStorage.checkbox = rememberMeCheckbox.val();
        } else {
            localStorage.username = "";
            localStorage.checkbox = "";
        }
    });
});

function submitForm() {
	console.log("나도 가쟈!");
	document.getElementById('myForm').submit();
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
