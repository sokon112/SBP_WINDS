package com.spring.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.config.RootConfig;
import com.spring.config.SecurityConfig;

import lombok.extern.log4j.Log4j2;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {RootConfig.class,SecurityConfig.class})
@Log4j2
public class MemberTest {
	
	@Autowired
	private PasswordEncoder encoder;
	@Autowired
	private DataSource ds;
	
	// 유저 정보 입력
	@Test
	public void test() {
		log.info("Member Info Dummy Data");
		
		String sql="insert into User_TAB(id,password,name,telNum,email,deptNum) values(?,?,?,?,?,?)";
		
		for(int i=1;i<21;i++) {
			try(Connection con = ds.getConnection();
					PreparedStatement pstmt = con.prepareStatement(sql)) {
				
				if(i<10) {
					pstmt.setString(2, encoder.encode("pw00"+i)); //password
					pstmt.setString(4, "02-123-000"+i); //telNum
					pstmt.setString(5, "sbpwinds0"+i+"@sbp.com"); //email
				}else {
					pstmt.setString(2, encoder.encode("pw0"+i)); //password	
					pstmt.setString(4, "02-123-00"+i); //telNum	
					pstmt.setString(5, "sbpwinds"+i+"@sbp.com"); //email			
				}
				
				if(i < 2) {
					pstmt.setString(1, "1003000"+i);  //id
					pstmt.setString(3, "ADMINISTRATOR-"+i); //name
				}else if(i < 7) {
					pstmt.setString(1, "1508000"+i);  //id
					pstmt.setString(3, "MANAGER-"+(i-1)); //name
				}else if(i < 10) {
					pstmt.setString(1, "1703000"+i);  //id
					pstmt.setString(3, "EMPLOYEE-"+(i-6)); //name
				}else if(i < 15) {
					pstmt.setString(1, "190800"+i);  //id
					pstmt.setString(3, "EMPLOYEE-"+(i-6)); //name
				}else {
					pstmt.setString(1, "210300"+i);  //id
					pstmt.setString(3, "EMPLOYEE-"+(i-6)); //name
				}
				
				switch(i) {
				case 1:
					pstmt.setInt(6,1000);
					break;
				case 2: case 7: case 11: 
					pstmt.setInt(6,1001);
					break;
				case 3: case 8: case 14: case 17: 
					pstmt.setInt(6,1002);
					break;
				case 4: case 12: case 18: case 19: case 20:
					pstmt.setInt(6,1003);
					break;
				case 5: case 9: case 15: 
					pstmt.setInt(6,1004);
					break;
				case 6: case 10: case 13: case 16:
					pstmt.setInt(6,1005);
					break;				
				}
				
				
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	// 권한부여
//		@Test
//		public void testAuth() {
//			log.info("Member Authority Dummy Data");
//			
//			String sql="insert into AUTH_TAB(id,authority) values(?,?)";
//			
//			for(int i=1;i<21;i++) {
//				try(Connection con = ds.getConnection();
//						PreparedStatement pstmt = con.prepareStatement(sql)) {
//	
//					if(i < 2) {
//						pstmt.setString(1, "1003000"+i);  //id
//						pstmt.setString(2, "ad"); //authority
//					}else if(i < 7) {
//						pstmt.setString(1, "1508000"+i);  //id
//						pstmt.setString(2, "mg"); //authority
//					}else if(i < 10) {
//						pstmt.setString(1, "1703000"+i);  //id
//						pstmt.setString(2, "emp"); //authority
//					}else if(i < 15) {
//						pstmt.setString(1, "190800"+i);  //id
//						pstmt.setString(2, "emp"); //authority
//					}else {
//						pstmt.setString(1, "210300"+i);  //id
//						pstmt.setString(2, "emp"); //authority
//					}
//					pstmt.executeUpdate();
//					
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//			}
//		}		
	
	
}









