package com.mailer.dao.client;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import com.mailer.MainApplication;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.jdbc.Sql;

import com.mailer.dao.ClientDaoImpl;
import com.mailer.entities.Client;
import org.springframework.test.context.junit4.SpringRunner;

@SpringBootTest
@Sql(scripts = {"classpath:/db/insert-client-messages-script.sql"})
class ClientDaoTest {


	
	@Autowired
	private ClientDaoImpl clientDaoImpl;

	@BeforeEach
	void setUp() throws Exception {
	}

	@AfterEach
	void tearDown() throws Exception {
	}

	@Test
	void findAllClientsTest() {
		
		List<Client> result = clientDaoImpl.findAll();
		assertNotNull(result);
		
	}
	

}
