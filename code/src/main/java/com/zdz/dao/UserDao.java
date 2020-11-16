package com.zdz.dao;

import com.zdz.domain.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("userDao")
public interface UserDao {

    @Insert("insert into user(username,password,email,phoneNo,realName,age,sex,address,registerDate) " +
            "values(#{username},#{password},#{email},#{phoneNo},#{realName},#{age},#{sex},#{address},#{registerDate})")
    public void addUser(User user);

    @Select("select * from user where username like #{username} and password = #{password}")
    public List<User> findUsers(User user);

    @Select("select * from user where username like #{username}")
    public List<User> findUser(String username);


}
