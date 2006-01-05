package gov.nih.nci.logging.api.logger.hibernate;

/**
 * <!-- LICENSE_TEXT_START -->
 * 
 * <!-- LICENSE_TEXT_END -->
 */

import org.hibernate.*;
import org.hibernate.type.Type;
import gov.nih.nci.logging.api.logger.util.ThreadVariable;
import gov.nih.nci.logging.api.user.UserInfo;
import java.util.*;
import java.io.*;

/**
 * @author Ekagra Software Technologes Limited ('Ekagra')
 * 
 * 
 * This class intercepts all the related events when the client application
 * performs the persistence such as save, udpate and delete. Also it generate
 * the audit information about the states of the entity object in different
 * stages.
 * 
 */
public class ObjectStateInterceptor extends EmptyInterceptor
{
	private static ObjectStateLogger logger = ObjectStateLogger.getInstance();

	private String operation = null;

	/**
	 * This method gets called before an object is saved.
	 */

	public boolean onSave(Object entity, Serializable id, Object[] state, String[] propertyNames, Type[] types) throws CallbackException
	{
		operation = "insert";
		logger.logMessage(entity, id, state, null, propertyNames, types, operation);
		return true;
	}

	/**
	 * 
	 * This method gets Called before an object is saved
	 */
	public void onDelete(Object entity, Serializable id, Object[] state, String[] propertyNames, Type[] types) throws CallbackException
	{
		operation = "delete";
		logger.logMessage(entity, id, state, null, propertyNames, types, operation);
	}

	/* (non-Javadoc)
	 * @see org.hibernate.Interceptor#onFlushDirty(java.lang.Object, java.io.Serializable, java.lang.Object[], java.lang.Object[], java.lang.String[], org.hibernate.type.Type[])
	 */
	public boolean onFlushDirty(Object entity, Serializable id, Object[] currentState, Object[] previousState, String[] propertyNames, Type[] types) throws CallbackException
	{
		operation = "update";
		logger.logMessage(entity, id, currentState, previousState, propertyNames, types, operation);
		return false;
	}

	/* (non-Javadoc)
	 * @see org.hibernate.Interceptor#postFlush(java.util.Iterator)
	 */
	public void postFlush(Iterator iterator) throws CallbackException
	{		

	}


	/*
	 * (non-Javadoc)
	 * 
	 * @see org.hibernate.Interceptor#afterTransactionCompletion(org.hibernate.Transaction)
	 */
	public void afterTransactionCompletion(Transaction arg0)
	{		
		UserInfo user = (UserInfo) ThreadVariable.get();
		if (arg0.wasCommitted() && user.getTransactionLogs()!= null )
		{
			for (Iterator it = user.getTransactionLogs().iterator(); it.hasNext();)
			{
				System.out.println("-- start to write the msgs to database for user: " + user.getUsername());
				logger.log(it.next().toString());
				// remove this msg from the Buffer
				it.remove();
			}
		}

		else
		{
			// clear the logs Buffer
			clearTransactionLogs();
		}
		user.setIsIntransaction(false);
		// set back the local thread variable
		ThreadVariable.set(user);

	}


	
	/* (non-Javadoc)
	 * @see org.hibernate.Interceptor#afterTransactionBegin(org.hibernate.Transaction)
	 */
	public void afterTransactionBegin(Transaction tx)
	{

		UserInfo user = (UserInfo) ThreadVariable.get();
		user = (UserInfo) ThreadVariable.get();
		user.setIsIntransaction(true);
		ThreadVariable.set(user);
	}

	
	/**
	 * 
	 */
	private void clearTransactionLogs()
	{
		UserInfo user = (UserInfo) ThreadVariable.get();
		if (user.getTransactionLogs()!= null){
		user.getTransactionLogs().clear();
		ThreadVariable.set(user);
		}
	}

}
