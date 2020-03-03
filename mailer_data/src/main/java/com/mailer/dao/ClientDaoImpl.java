package com.mailer.dao;

import java.util.List;
import java.util.logging.Logger;

import javax.persistence.EntityManager;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.mailer.entities.Client;

@Repository
@Transactional
public class ClientDaoImpl implements ClientDao {

	Logger logger = Logger.getLogger(getClass().getName());

	@Autowired
	private EntityManager entityManager;
	
	@Override
	public List<Client> findAll() {
		
		logger.info("Fetching list of clients from the database");
		
		Session currentSession = entityManager.unwrap(Session.class);
		
		Query<Client> theQuery = 
					currentSession.createQuery("from Client", Client.class);
		
		List<Client> result = theQuery.getResultList();
		
		logger.info("Query successful returning results");
		
		return result;
	}

}
