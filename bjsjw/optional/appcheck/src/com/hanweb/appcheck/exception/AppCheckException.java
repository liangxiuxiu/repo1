package com.hanweb.appcheck.exception;

public class AppCheckException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public AppCheckException(String arg0){
		super(arg0);
	}
	
	public AppCheckException(){
		super();
	}
	
	public AppCheckException(String arg0, Throwable arg1){
		super(arg0, arg1);
	}
	
	public AppCheckException(Throwable cause) {
		super(cause);
	}
}
