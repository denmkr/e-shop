package ru.dm.shop.domain;

import java.util.Collection;
import java.util.HashSet;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import ru.dm.shop.entity.User;

public class UserDetail implements UserDetails {
	private static final long serialVersionUID = 8266525488057072269L;
	private User user;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	private Collection<GrantedAuthority> authorities;

	public UserDetail(User user, String roles) {
		super();

		this.user = user;
		this.setRoles(roles);
	}

	public void setRoles(String roles) {
		this.authorities = new HashSet<GrantedAuthority>();
		for (final String role : roles.split(",")) {
			if (role != null && !"".equals(role.trim())) {
				GrantedAuthority grandAuthority = new GrantedAuthority() {
					private static final long serialVersionUID = 3958183417696804555L;

					public String getAuthority() {
						return role.trim();
					}
				};
				this.authorities.add(grandAuthority);
			}
		}
	}

	public String getPassword() {
		return user.getPassword();
	}

	public String getUsername() {
		return user.getEmail();
	}

	public Collection<? extends GrantedAuthority> getAuthorities() {
		return this.authorities;
	}

	public boolean isAccountNonExpired() {
		return true;
	}

	public boolean isAccountNonLocked() {
		return true;
	}

	public boolean isCredentialsNonExpired() {
		return true;
	}

	public boolean isEnabled() {
		return true;
	}


}
