package com.mailer.dao;

import java.util.List;

import com.mailer.entities.Client;

public interface ClientDao {

	public List<Client> findAll();
}
