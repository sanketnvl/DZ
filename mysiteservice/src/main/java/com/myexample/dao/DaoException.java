package com.myexample.dao;

public class DaoException extends Exception{


	private static final long serialVersionUID = 6267208270130769840L;

		public DaoException()
		{
		}

		public DaoException(String message)
		{
			super(message);
		}

		public DaoException(Throwable cause)
		{
			super(cause);
		}

		public DaoException(String message, Throwable cause)
		{
			super(message, cause);
		}

		public DaoException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace)
		{
			super(message, cause, enableSuppression, writableStackTrace);
		}

}