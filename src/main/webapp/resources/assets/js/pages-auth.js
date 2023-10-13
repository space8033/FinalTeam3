/**
 *  Pages Authentication
 */

'use strict';
const formAuthentication = document.querySelector('#formAuthentication');

document.addEventListener('DOMContentLoaded', function (e) {
  (function () {
    // Form validation for Add new record
    if (formAuthentication) {
      const fv = FormValidation.formValidation(formAuthentication, {
        fields: {
          username: {
            validators: {
              notEmpty: {
                message: '아이디 비었다. 써넣거라'
              },
              stringLength: {
                min: 6,
                message: '6자 넘어야 한다.'
              }
            }
          },
          email: {
            validators: {
              notEmpty: {
                message: '이메일 써넣거라.'
              },
              emailAddress: {
                message: '유효한 이메일을 써넣거라.'
              }
            }
          },
          'email-username': {
            validators: {
              notEmpty: {
                message: '아이디나 이메일을 써넣거라'
              },
              stringLength: {
                min: 6,
                message: '6자가 넘어야한다.'
              }
            }
          },
          password: {
            validators: {
              notEmpty: {
                message: '비번을 써넣거라'
              },
              stringLength: {
                min: 6,
                message: '비번은 6자가 넘어야한다.'
              }
            }
          },
          'confirm-password': {
            validators: {
              notEmpty: {
                message: '비번 틀렸다 확인해라'
              },
              identical: {
                compare: function () {
                  return formAuthentication.querySelector('[name="password"]').value;
                },
                message: '비밀번호가 같지 않다.'
              },
              stringLength: {
                min: 6,
                message: '비번이 6자가 넘지 않는다.'
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
