/**
 * App Calendar Events
 */

'use strict';

let date = new Date();
let nextDay = new Date(new Date().getTime() + 24 * 60 * 60 * 1000);
// prettier-ignore
let nextMonth = date.getMonth() === 11 ? new Date(date.getFullYear() + 1, 0, 1) : new Date(date.getFullYear(), date.getMonth() + 1, 1);
// prettier-ignore
let prevMonth = date.getMonth() === 11 ? new Date(date.getFullYear() - 1, 0, 1) : new Date(date.getFullYear(), date.getMonth() - 1, 1);

let events = [
	  {
	    id: 2,
	    url: '',
	    title: 'Meeting With Client',
	    start: new Date(date.getFullYear(), date.getMonth() + 1, -11),
	    end: new Date(date.getFullYear(), date.getMonth() + 1, -10),
	    allDay: true,
	    extendedProps: {
	      calendar: 'Business'
	    }
	  }
	];
