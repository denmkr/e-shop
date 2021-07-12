package ru.dm.shop.service.impl;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import ru.dm.shop.domain.UserDetail;
import ru.dm.shop.entity.User;
import ru.dm.shop.repository.UserRepository;
import ru.dm.shop.repository.UserRoleRepository;

import javax.annotation.Resource;

@Service
public class CustomUserDetailsService implements UserDetailsService {

	@Resource
	public UserRepository userRepository;
	@Resource
	public UserRoleRepository userRoleRepository;
	
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		return this.getUser(username);
	}

	public UserDetail getUser(String email) throws UsernameNotFoundException {
		User user = userRepository.findByEmail(email);

		if (user == null) {
			throw new UsernameNotFoundException(email + " not found");
		}

		UserDetail userDetail = new UserDetail(user, userRoleRepository.findByUserId(user.getId()).getAuthority());
		return userDetail;
	}

}

