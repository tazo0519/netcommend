package tody.common.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("userAuthDAO")
public class UserAuthDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public CustomUserDetails getUserById(String email) {
        return sqlSession.selectOne("user.selectUserById", email);
    }

}
