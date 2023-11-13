/**
 * App Calendar
 */

/**
 * ! If both start and end dates are same Full calendar will nullify the end date value.
 * ! Full calendar will end the event on a day before at 12:00:00AM thus, event won't extend to the end date.
 * ! We are getting events from a separate file named app-calendar-events.js. You can add or remove events from there.
 *
 **/

let direction = 'ltr';

if (isRtl) {
  direction = 'rtl';
}

document.addEventListener('DOMContentLoaded', function () {
	var eventForm = document.getElementById('eventForm');

    eventForm.addEventListener('submit', function(event) {
        // 폼의 submit 동작 막기
        event.preventDefault();

        // 추가적인 로직 수행 가능
        // 예: 유효성 검사, AJAX 요청 등
    });
	let events;
	//let events;
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/exodia/teamCalendarList', true);
	xhr.onload = function () {
	    if (xhr.status >= 200 && xhr.status < 300) {
	        events = JSON.parse(xhr.responseText);
	        console.log(events);
	        (function () {
	            const calendarEl = document.getElementById('calendar'), //document 객체를 사용하여 HTML 문서에서 ID가 'calendar'인 요소를 찾아서 calendarEl 변수에 할당, 웹 페이지에서 캘린더를 표시하는 부분
	              appCalendarSidebar = document.querySelector('.app-calendar-sidebar'),
	              addEventSidebar = document.getElementById('addEventSidebar'),
	              appOverlay = document.querySelector('.app-overlay'),
	              calendarsColor = {
	                Business: 'primary',
	                Holiday: 'success',
	                Personal: 'danger',
	                Family: 'warning',
	                ETC: 'info'
	              },
	              offcanvasTitle = document.querySelector('.offcanvas-title'),
	              btnToggleSidebar = document.querySelector('.btn-toggle-sidebar'),
	              btnSubmit = document.querySelector('#calendarsubmit'),
	              btnDeleteEvent = document.querySelector('.btn-delete-event'),
	              btnCancel = document.querySelector('.btn-cancel'),
	              eventTitle = document.querySelector('#eventTitle'),
	              eventStartDate = document.querySelector('#eventStartDate'),
	              eventEndDate = document.querySelector('#eventEndDate'),
	              //eventUrl = document.querySelector('#eventURL'),
	              eventLabel = $('#eventLabel'), // 분류 : 업무, 개인일정, 휴가 등  ! Using jquery vars due to select2 jQuery dependency
	              eventGuests = $('#eventGuests'), // ! Using jquery vars due to select2 jQuery dependency
	              //eventLocation = document.querySelector('#eventLocation'),
	              eventDescription = document.querySelector('#eventDescription'),
	              allDaySwitch = document.querySelector('.allDay-switch'),
	              selectAll = document.querySelector('.select-all'),
	              filterInput = [].slice.call(document.querySelectorAll('.input-filter')),
	              inlineCalendar = document.querySelector('.inline-calendar');

	            let eventToUpdate,
	              currentEvents = events, // 캘린더 이벤트를 관리하고 업데이트 Assign app-calendar-events.js file events (assume events from API) to currentEvents (browser store/object) to manage and update calender events
	              isFormValid = false,
	              inlineCalInstance;
	            // Init event Offcanvas 캘린더 클릭시 오른쪽 사이드 바 이벤트
	            const bsAddEventSidebar = new bootstrap.Offcanvas(addEventSidebar);

	            //! TODO: Update Event label and guest code to JS once select removes jQuery dependency
	            // Event Label (select2)
	            if (eventLabel.length) {
	              function renderBadges(option) {
	                if (!option.id) {
	                  return option.text;
	                }
	                var $badge =
	                  "<span class='badge badge-dot bg-" + $(option.element).data('label') + " me-2'> " + '</span>' + option.text;

	                return $badge;
	              }
	              eventLabel.wrap('<div class="position-relative"></div>').select2({
	                placeholder: 'Select value',
	                dropdownParent: eventLabel.parent(),
	                templateResult: renderBadges,
	                templateSelection: renderBadges,
	                minimumResultsForSearch: -1,
	                escapeMarkup: function (es) {
	                  return es;
	                }
	              });
	            }

	            // Event Guests (select2)
	            if (eventGuests.length) {
	              function renderGuestAvatar(option) {
	                if (!option.id) {
	                  return option.text;
	                }
	                var $avatar =
	                  "<div class='d-flex flex-wrap align-items-center'>" +
	                  "<div class='avatar avatar-xs me-2'>" +
	                  "<img src='" +
	                  assetsPath +
	                  'img/avatars/' +
	                  $(option.element).data('avatar') +
	                  "' alt='avatar' class='rounded-circle' />" +
	                  '</div>' +
	                  option.text +
	                  '</div>';

	                return $avatar;
	              }
	              eventGuests.wrap('<div class="position-relative"></div>').select2({
	                placeholder: 'Select value',
	                dropdownParent: eventGuests.parent(),
	                closeOnSelect: false,
	                templateResult: renderGuestAvatar,
	                templateSelection: renderGuestAvatar,
	                escapeMarkup: function (es) {
	                  return es;
	                }
	              });
	            }

	            // Event start (flatpicker)
	            if (eventStartDate) {
	              var start = eventStartDate.flatpickr({
	                enableTime: true,
	                altFormat: 'Y-m-dTH:i:S',
	                onReady: function (selectedDates, dateStr, instance) {
	                  if (instance.isMobile) {
	                    instance.mobileInput.setAttribute('step', null);
	                  }
	                }
	              });
	            }

	            // Event end (flatpicker)
	            if (eventEndDate) {
	              var end = eventEndDate.flatpickr({
	                enableTime: true,
	                altFormat: 'Y-m-dTH:i:S',
	                onReady: function (selectedDates, dateStr, instance) {
	                  if (instance.isMobile) {
	                    instance.mobileInput.setAttribute('step', null);
	                  }
	                }
	              });
	            }

	            // Inline sidebar calendar (flatpicker)
	            if (inlineCalendar) {
	              inlineCalInstance = inlineCalendar.flatpickr({
	                monthSelectorType: 'static',
	                inline: true
	              });
	            }

	            // Filter events by calender
	            function selectedCalendars() {
	              let selected = [],
	                filterInputChecked = [].slice.call(document.querySelectorAll('.input-filter:checked'));

	              filterInputChecked.forEach(item => {
	                selected.push(item.getAttribute('data-value'));
	              });

	              return selected;
	            }

	            // --------------------------------------------------------------------------------------------------
	            // AXIOS: fetchEvents
	            // * This will be called by fullCalendar to fetch events. Also this can be used to refetch events.
	            // --------------------------------------------------------------------------------------------------
	            
	            function fetchEvents(info, successCallback) {
	              let calendars = selectedCalendars();
	              // We are reading event object from app-calendar-events.js file directly by including that file above app-calendar file.
	              // You should make an API call, look into above commented API call for reference
	              let selectedEvents = currentEvents.filter(function (event) {
	                  return calendars.includes(event.extendedProps.calendar.toLowerCase());
	              });
	               if (selectedEvents.length > 0) {
	            	   successCallback(selectedEvents);
	               }
	            }

	            // Init FullCalendar
	            // ------------------------------------------------
	            let calendar = new Calendar(calendarEl, {
	              initialView: 'dayGridMonth',
	              events: fetchEvents,
	              plugins: [dayGridPlugin, interactionPlugin, listPlugin, timegridPlugin],
	              editable: true,
	              dragScroll: true,
	              dayMaxEvents: 2,
	              eventResizableFromStart: true,
	              headerToolbar: {
	                start: 'sidebarToggle, prev,next, title',
	                end: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
	              },
	              direction: direction,
	              initialDate: new Date(),
	              navLinks: true, // can click day/week names to navigate views
	              eventClassNames: function ({ event: calendarEvent }) {
	                const colorName = calendarsColor[calendarEvent._def.extendedProps.calendar];
	                // Background Color
	                return ['fc-event-' + colorName];
	              },
	              dateClick: function (info) {
	                let date = moment(info.date).format('YYYY-MM-DD');
	                resetValues();

	                // For new event set offcanvas title text: Add Event
	                if (offcanvasTitle) {
	                  offcanvasTitle.innerHTML = '일정 추가';
	                }
	                btnSubmit.textContent = '추가';
	                btnSubmit.classList.remove('btn-update-event');
	                btnSubmit.classList.add('btn-add-event');
	                btnDeleteEvent.classList.add('d-none');
	                eventStartDate.value = date;
	                eventEndDate.value = date;
	              },
	              eventClick: function (info) {
	                eventClick(info);
	              },
	              datesSet: function () {
	                modifyToggler();
	              },
	              viewDidMount: function () {
	                modifyToggler();
	              }
	            });

	            // Render calendar
	            calendar.render();
	            // Modify sidebar toggler
	            modifyToggler();

	            const eventForm = document.getElementById('eventForm');
	            const fv = FormValidation.formValidation(eventForm, {
	              fields: {
	                eventTitle: {
	                  validators: {
	                    notEmpty: {
	                      message: 'Please enter event title '
	                    }
	                  }
	                },
	                eventStartDate: {
	                  validators: {
	                    notEmpty: {
	                      message: 'Please enter start date '
	                    }
	                  }
	                },
	                eventEndDate: {
	                  validators: {
	                    notEmpty: {
	                      message: 'Please enter end date '
	                    }
	                  }
	                }
	              },
	              plugins: {
	                trigger: new FormValidation.plugins.Trigger(),
	                bootstrap5: new FormValidation.plugins.Bootstrap5({
	                  // Use this for enabling/changing valid/invalid class
	                  eleValidClass: '',
	                  rowSelector: function (field, ele) {
	                    // field is the field name & ele is the field element
	                    return '.mb-3';
	                  }
	                }),
	                submitButton: new FormValidation.plugins.SubmitButton(),
	                // Submit the form when all fields are valid
	                // defaultSubmit: new FormValidation.plugins.DefaultSubmit(),
	                autoFocus: new FormValidation.plugins.AutoFocus()
	              }
	            })
	              .on('core.form.valid', function () {
	                // Jump to the next step when all fields in the current step are valid
	                isFormValid = true;
	              })
	              .on('core.form.invalid', function () {
	                // if fields are invalid
	                isFormValid = false;
	              });

	            // Sidebar Toggle Btn
	            if (btnToggleSidebar) {
	              btnToggleSidebar.addEventListener('click', e => {
	                btnCancel.classList.remove('d-none');
	              });
	            }

	            // Add Event
	            // ------------------------------------------------
	            function addEvent(eventData) {
	              // ? Add new event data to current events object and refetch it to display on calender
	              // ? You can write below code to AJAX call success response
	        	// AJAX 호출을 통해 서버에서 새 이벤트 데이터를 가져옴
	            	
	              currentEvents.push(eventData);
	              calendar.refetchEvents();
	              

	              // ? To add event directly to calender (won't update currentEvents object)
	              // calendar.addEvent(eventData);
	            }

	            // Update Event
	            // ------------------------------------------------
	            function updateEvent(eventData) {
	              // ? Update existing event data to current events object and refetch it to display on calender
	              // ? You can write below code to AJAX call success response
	              eventData.id = parseInt(eventData.id);
	              currentEvents[currentEvents.findIndex(el => el.id === eventData.id)] = eventData; // Update event by id
	              calendar.refetchEvents();
	              removeEvent();

	              // ? To update event directly to calender (won't update currentEvents object)
	              // let propsToUpdate = ['id', 'title', 'url'];
	              // let extendedPropsToUpdate = ['calendar', 'guests', 'location', 'description'];

	              // updateEventInCalendar(eventData, propsToUpdate, extendedPropsToUpdate);
	            }

	            // Remove Event
	            // ------------------------------------------------

	            function removeEvent(eventId) {
	              // ? Delete existing event data to current events object and refetch it to display on calender
	              // ? You can write below code to AJAX call success response
	              currentEvents = currentEvents.filter(function (event) {
	                return event.id != eventId;
	              });
	              calendar.refetchEvents();

	              // ? To delete event directly to calender (won't update currentEvents object)
	              // removeEventInCalendar(eventId);
	            }

	            // (Update Event In Calendar (UI Only)
	            // ------------------------------------------------
	            const updateEventInCalendar = (updatedEventData, propsToUpdate, extendedPropsToUpdate) => {
	              const existingEvent = calendar.getEventById(updatedEventData.id);

	              // --- Set event properties except date related ----- //
	              // ? Docs: https://fullcalendar.io/docs/Event-setProp
	              // dateRelatedProps => ['start', 'end', 'allDay']
	              // eslint-disable-next-line no-plusplus
	              for (var index = 0; index < propsToUpdate.length; index++) {
	                var propName = propsToUpdate[index];
	                existingEvent.setProp(propName, updatedEventData[propName]);
	              }

	              // --- Set date related props ----- //
	              // ? Docs: https://fullcalendar.io/docs/Event-setDates
	              existingEvent.setDates(updatedEventData.start, updatedEventData.end, {
	                allDay: updatedEventData.allDay
	              });

	              // --- Set event's extendedProps ----- //
	              // ? Docs: https://fullcalendar.io/docs/Event-setExtendedProp
	              // eslint-disable-next-line no-plusplus
	              for (var index = 0; index < extendedPropsToUpdate.length; index++) {
	                var propName = extendedPropsToUpdate[index];
	                existingEvent.setExtendedProp(propName, updatedEventData.extendedProps[propName]);
	              }
	              
	             
	            };

	            // Remove Event In Calendar (UI Only)
	            // ------------------------------------------------
	            function removeEventInCalendar(eventId) {
	              calendar.getEventById(eventId).remove();
	            }

	            // Add new event
	            // ------------------------------------------------
	            btnSubmit.addEventListener('click', e => {
	              if (btnSubmit.classList.contains('btn-add-event')) {
	                if (isFormValid) {
	                	var eventData = {
                	        task_name: document.querySelector('input[name=eventTitle]').value,
                	        task_content: document.querySelector('#eventDescription').value,
                	        task_type: document.querySelector('#eventLabel').value,
                	        task_startdate: document.querySelector('input[name=eventStartDate]').value,
                	        task_enddate: document.querySelector('input[name=eventEndDate]').value
                	    };

                	    var xhr = new XMLHttpRequest();
                	    
                	    xhr.open('POST', '/exodia/calendar', true);
                	    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

                	    xhr.onreadystatechange = function() {
                	        if (xhr.readyState === 4) {
                	            if (xhr.status === 200) {
                	                console.log("나는 병신이다");
                	                location.reload();
                	            } else {
                	                console.error("에러 발생: " + xhr.status);
                	            }
                	        }
                	    };
                	    
                	    var data = 'task_name=' + encodeURIComponent(eventData.task_name) +
                	               '&task_content=' + encodeURIComponent(eventData.task_content) +
                	               '&task_type=' + encodeURIComponent(eventData.task_type) +
                	               '&task_startdate=' + encodeURIComponent(eventData.task_startdate) +
                	               '&task_enddate=' + encodeURIComponent(eventData.task_enddate);
                	    
                	    xhr.send(data);
	                }
	              } else {
	                // Update event
	                // ------------------------------------------------
	                if (isFormValid) {
	                	var task_no = eventToUpdate.extendedProps.task_no;

	                    var eventData = {
	                        task_no: task_no,
	                        task_name: document.querySelector('input[name=eventTitle]').value,
	                        task_content: document.querySelector('#eventDescription').value,
	                        task_type: document.querySelector('#eventLabel').value,
	                        task_startdate: document.querySelector('input[name=eventStartDate]').value,
	                        task_enddate: document.querySelector('input[name=eventEndDate]').value
	                    };

	                    var xhr = new XMLHttpRequest();
	                    
	                    xhr.open('POST', '/exodia/modifyCalendar', true);
	                    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

	                    xhr.onreadystatechange = function() {
	                        if (xhr.readyState === 4) {
	                            if (xhr.status === 200) {
	                                console.log("나는 병신이다");
	                                location.reload();
	                            } else {
	                                console.error("에러 발생: " + xhr.status);
	                            }
	                        }
	                    };
	                    
	                    var data = 'task_no=' + encodeURIComponent(eventData.task_no) +
	                               '&task_name=' + encodeURIComponent(eventData.task_name) +
	                               '&task_content=' + encodeURIComponent(eventData.task_content) +
	                               '&task_type=' + encodeURIComponent(eventData.task_type) +
	                               '&task_startdate=' + encodeURIComponent(eventData.task_startdate) +
	                               '&task_enddate=' + encodeURIComponent(eventData.task_enddate);
	                    
	                    xhr.send(data);
	                	
	                }
	              }
	            });

	            // Call removeEvent function
	            btnDeleteEvent.addEventListener('click', e => {
	              removeEvent(parseInt(eventToUpdate.id));

	            	    var taskNo = eventToUpdate.extendedProps.task_no;
	            	    var xhr = new XMLHttpRequest();
	            	    
	            	    xhr.open('POST', '/exodia/deleteCalendar', true);
	            	    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	            	    
	            	    xhr.onreadystatechange = function() {
	            	        if (xhr.readyState === 4) {
	            	            if (xhr.status === 200) {
	            	                console.log("나는 빈대다");
	            	                //location.reload();
	            	            } else {
	            	                console.error("에러 발생: " + xhr.status);
	            	            }
	            	        }
	            	    };
	            	    
	            	    var data = 'task_no=' + encodeURIComponent(taskNo);
	            	    xhr.send(data);

	              bsAddEventSidebar.hide();
	            });

	            // Reset event form inputs values
	            // ------------------------------------------------
	            function resetValues() {
	              eventEndDate.value = '';
	              //eventUrl.value = '';
	              eventStartDate.value = '';
	              eventTitle.value = '';
	              //eventLocation.value = '';
	              allDaySwitch.checked = false;
	              eventGuests.val('').trigger('change');
	              eventDescription.value = '';
	            }

	            // When modal hides reset input values
	            addEventSidebar.addEventListener('hidden.bs.offcanvas', function () {
	              resetValues();
	            });

	            // Hide left sidebar if the right sidebar is open
	            btnToggleSidebar.addEventListener('click', e => {
	              if (offcanvasTitle) {
	                offcanvasTitle.innerHTML = 'Add Event';
	              }
	              btnSubmit.innerHTML = 'Add';
	              btnSubmit.classList.remove('btn-update-event');
	              btnSubmit.classList.add('btn-add-event');
	              btnDeleteEvent.classList.add('d-none');
	              appCalendarSidebar.classList.remove('show');
	              appOverlay.classList.remove('show');
	            });

	            // Calender filter functionality
	            // ------------------------------------------------
	            if (selectAll) {
	              selectAll.addEventListener('click', e => {
	                if (e.currentTarget.checked) {
	                  document.querySelectorAll('.input-filter').forEach(c => (c.checked = 1));
	                } else {
	                  document.querySelectorAll('.input-filter').forEach(c => (c.checked = 0));
	                }
	                calendar.refetchEvents();
	              });
	            }

	            if (filterInput) {
	              filterInput.forEach(item => {
	                item.addEventListener('click', () => {
	                  document.querySelectorAll('.input-filter:checked').length < document.querySelectorAll('.input-filter').length
	                    ? (selectAll.checked = false)
	                    : (selectAll.checked = true);
	                  calendar.refetchEvents();
	                });
	              });
	            }

	            // Jump to date on sidebar(inline) calendar change
	            inlineCalInstance.config.onChange.push(function (date) {
	              calendar.changeView(calendar.view.type, moment(date[0]).format('YYYY-MM-DD'));
	              modifyToggler();
	              appCalendarSidebar.classList.remove('show');
	              appOverlay.classList.remove('show');
	            });
	          })();
	    } else {
	        console.log('Request failed with status ' + xhr.status);
	    }
	};
	xhr.onerror = function () {
	    console.log('Request failed');
	};
	xhr.send();
  
});




