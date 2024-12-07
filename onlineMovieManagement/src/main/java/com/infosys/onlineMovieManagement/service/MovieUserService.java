package com.infosys.onlineMovieManagement.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.infosys.onlineMovieManagement.bean.MovieUser;
import com.infosys.onlineMovieManagement.dao.MovieUserRepository;

@Service
public class MovieUserService implements UserDetailsService {

	@Autowired
	private MovieUserRepository repository;
	
	private String role;
	public void save(MovieUser movieUser) {
		repository.save(movieUser);
	}
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException
	{
		MovieUser movieUser = repository.findById(username).get();
		role=movieUser.getRole();
		return movieUser;
	}
	
	
	public List<MovieUser> getAllCustomers() {
        return repository.findAll().stream()
                .filter(user -> "CUSTOMER".equalsIgnoreCase(user.getRole()))
                .collect(Collectors.toList());
    }
	
	public String getRole() {
		return role;
	}
}
