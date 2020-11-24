package tody.common.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private UserAuthDAO userAuthDAO;

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {

		CustomUserDetails user = userAuthDAO.getUserById(email);
		System.out.println("CustomUserDetailService에서 email = " + user);
		try {
			
			if (user == null) {
				throw new UsernameNotFoundException(email);
			}
			return user;
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
		
	}

}
