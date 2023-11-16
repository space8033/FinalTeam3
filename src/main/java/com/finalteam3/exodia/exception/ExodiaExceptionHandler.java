package com.finalteam3.exodia.exception;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

@Component
/*@ControllerAdvice*/
public class ExodiaExceptionHandler {
	@ExceptionHandler(NullPointerException.class)
	public String handleNullPointerException() {
		return "500error";
	}
	
	@ExceptionHandler(ClassCastException.class)
	public String handleClassCastException() {
		return "500error";
	}
	@ExceptionHandler
	@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
	public String handleOtherException(Exception e) {
		return "500error";
	}
	
	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String handle404(NoHandlerFoundException e) {
		return "404error";
	}
}
