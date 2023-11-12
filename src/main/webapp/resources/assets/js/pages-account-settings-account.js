/**
 * Account Settings - Account
 */

'use strict';

document.addEventListener('DOMContentLoaded', function (e) {
  (function () {
	  
    const formAccSettings = document.querySelector('#formAccountSettings'),
      deactivateAcc = document.querySelector('#formAccountDeactivation'),
      deactivateButton = deactivateAcc.querySelector('.deactivate-account');

    // Form validation for Add new record
    if (formAccSettings) {
      const fv = FormValidation.formValidation(formAccSettings, {
        fields: {
          email: {
            validators: {
              notEmpty: {
                message: 'Please enter email'
              }
            }
          },
          phoneNumber: {
            validators: {
              notEmpty: {
                message: 'Please enter phoneNumber'
              }
            }
          }
        },
        plugins: {
          trigger: new FormValidation.plugins.Trigger(),
          bootstrap5: new FormValidation.plugins.Bootstrap5({
            eleValidClass: '',
            rowSelector: '.col-md-6'
          }),
          submitButton: new FormValidation.plugins.SubmitButton(),
          // Submit the form when all fields are valid
          // defaultSubmit: new FormValidation.plugins.DefaultSubmit(),
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

    if (deactivateAcc) {
      const fv = FormValidation.formValidation(deactivateAcc, {
        fields: {
          accountActivation: {
            validators: {
              notEmpty: {
                message: 'Please confirm you want to delete account'
              }
            }
          }
        },
        plugins: {
          trigger: new FormValidation.plugins.Trigger(),
          bootstrap5: new FormValidation.plugins.Bootstrap5({
            eleValidClass: ''
          }),
          submitButton: new FormValidation.plugins.SubmitButton(),
          fieldStatus: new FormValidation.plugins.FieldStatus({
            onStatusChanged: function (areFieldsValid) {
              areFieldsValid
                ? // Enable the submit button
                  // so user has a chance to submit the form again
                  deactivateButton.removeAttribute('disabled')
                : // Disable the submit button
                  deactivateButton.setAttribute('disabled', 'disabled');
            }
          }),
          // Submit the form when all fields are valid
          // defaultSubmit: new FormValidation.plugins.DefaultSubmit(),
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

    // Deactivate account alert
    const accountActivation = document.querySelector('#accountActivation');

    // Alert With Functional Confirm Button
    if (deactivateButton) {
      deactivateButton.onclick = function () {
        if (accountActivation.checked == true) {
          Swal.fire({
            text: 'Are you sure you would like to deactivate your account?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Yes',
            customClass: {
              confirmButton: 'btn btn-primary me-2',
              cancelButton: 'btn btn-label-secondary'
            },
            buttonsStyling: false
          }).then(function (result) {
            if (result.value) {
              Swal.fire({
                icon: 'success',
                title: 'Deleted!',
                text: 'Your file has been deleted.',
                customClass: {
                  confirmButton: 'btn btn-success'
                }
              });
            } else if (result.dismiss === Swal.DismissReason.cancel) {
              Swal.fire({
                title: 'Cancelled',
                text: 'Deactivation Cancelled!!',
                icon: 'error',
                customClass: {
                  confirmButton: 'btn btn-success'
                }
              });
            }
          });
        }
      };
    }

    // CleaveJS validation

    const phoneNumber = document.querySelector('#phoneNumber'),
      zipCode = document.querySelector('#zipCode');
    // Phone Mask
    if (phoneNumber) {
      new Cleave(phoneNumber, {
        phone: true,
        phoneRegionCode: 'US'
      });
    }

    // Pincode
    if (zipCode) {
      new Cleave(zipCode, {
        delimiter: '',
        numeral: true
      });
    }

    // Update/reset user image of account page
    /*let accountUserImage = document.getElementById('uploadedAvatar');
    const fileInput = document.querySelector('.account-file-input'),
      resetFileInput = document.querySelector('.account-image-reset');

    if (accountUserImage) {
      const resetImage = accountUserImage.src;
      fileInput.onchange = () => {
        if (fileInput.files[0]) {
          accountUserImage.src = window.URL.createObjectURL(fileInput.files[0]);
        }
      };
      resetFileInput.onclick = () => {
        fileInput.value = '';
        accountUserImage.src = resetImage;
      };
    }*/
  })();
});

// Select2 (jquery)
$(function () {
  var select2 = $('.select2');
  // For all Select2
  if (select2.length) {
    select2.each(function () {
      var $this = $(this);
      $this.wrap('<div class="position-relative"></div>');
      $this.select2({
        dropdownParent: $this.parent()
      });
    });
  }
});
//이메일, 전화번호 유효성검사
$(document).ready(function() {
    $("#returnBtn").click(function() {
        $("#formAccountSettings")[0].reset(); // 폼을 초기 상태로 되돌립니다.
    });

    $("#saveBtn").click(function() {
    	var isValid = true;
    	var emailInput = $("#email").val();
    	var phoneNo = $("#phoneNumber2").val();
    	
    	const msgEmail = '유효하지 않은 이메일입니다.';
    	if(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/.test(emailInput)) {
    	}else {
    		isValid = false;
    		alert(msgEmail);
    	}
    	
    	if(isValid) {
    		const msgTel = '유효하지 않는 전화번호입니다.';
    		if (/^[0-9]{3}-[0-9]{4}-[0-9]{4}/.test(phoneNo)) {
    		}else {
    			isValid = false;
    			alert(msgTel);
    		}    		
    	}
    	
    	
    	if(isValid) {
    		var formData = new FormData($("#formAccountSettings")[0]);
    		
    		$.ajax({
    			url: '/exodia/employee/userModify', // 귀하의 Java 컨트롤러의 URL로 대체해야 합니다.
    			type: 'POST',
    			data: formData,
    			processData: false,
    			contentType: false,
    			success: function(data) {
    				alert("수정 완료!");
    			},
    			error: function(jqXHR, textStatus, errorThrown) {
    				console.error('AJAX Error: ', textStatus, errorThrown);
    			}
    		});
    	}
    	
    });
    
    $("#formAccountSettings").submit(function(event) {
        event.preventDefault();
    });
    
    //프사변경
    var accountUserImage = $('#uploadedAvatar');
    var fileInput = $('.account-file-input');
    var resetFileInput = $('.account-image-reset');
    
    fileInput.change(function() {
    	if (fileInput[0].files[0]) {
    		var formData = new FormData();
    		formData.append('file', fileInput[0].files[0]);
    		$.ajax({
    			url: '/exodia/employee/profileImgModify', // 귀하의 Java 컨트롤러의 URL로 대체해야 합니다.
    			type: 'POST',
    			data: formData,
    			processData: false,
    			contentType: false,
    			success: function(data) {
    				location.reload();
    			},
    			error: function(jqXHR, textStatus, errorThrown) {
    				console.error('AJAX Error: ', textStatus, errorThrown);
    			}
    		});
    	}
    });
    
    resetFileInput.click(function() {
    	$.ajax({
			url: '/exodia/employee/deleteImg', // 귀하의 Java 컨트롤러의 URL로 대체해야 합니다.
			type: 'POST',
			processData: false,
			contentType: false,
			success: function(data) {
				location.reload();
			},
			error: function(jqXHR, textStatus, errorThrown) {
				console.error('AJAX Error: ', textStatus, errorThrown);
			}
		});
    });
    
});

