package com.project.voting.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.project.voting.bean.AadharBean;
import com.project.voting.bean.CandiBean;
import com.project.voting.bean.VoterBean;
import com.project.voting.connection.DBUtil;

public class DAOClass {
	
//	Return Voter	
			public AadharBean getVoter(String adno){
				AadharBean a = new AadharBean();
				String sql = "select * from aadhar where adno=?";
				try{
					Connection conn = DBUtil.ConnectDB();
					PreparedStatement pst = (PreparedStatement)conn.prepareStatement(sql);
					pst.setString(1,adno);
					ResultSet rs = pst.executeQuery();
					if(rs.next()){						
						a.setAdno(rs.getString(1));
						a.setName(rs.getString(2));
						a.setDob(rs.getString(3));
						a.setAge(rs.getString(4));
						a.setState(rs.getString(5));
						a.setCity(rs.getString(6));
						a.setArea(rs.getString(7));
						a.setPincode(rs.getString(8));
						a.setEmail(rs.getString(9));
						a.setPhno(rs.getString(10));
						return a;
						}
					else{
						return null;
					}
				}catch(Exception e){
					e.printStackTrace();
					return null;
				}
				
		    }
		
			// Insert Voter to Database
			public boolean RegisterVoter(AadharBean a,String code,String username,String password){
					String sql = "insert into voter value(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
					int x=0;
					try{
						Connection conn = DBUtil.ConnectDB();
						PreparedStatement pst = conn.prepareStatement(sql);
						pst.setString(1,a.getAdno());
						pst.setString(2,a.getName());
						pst.setString(3,a.getAge());
						pst.setString(4,a.getState());
						pst.setString(5,a.getCity());
						pst.setString(6,a.getArea());
						pst.setString(7,a.getDob());
						pst.setString(8,a.getPhno());
						pst.setString(9,a.getEmail());
						pst.setString(10,a.getPincode());
						pst.setString(11,username);
						pst.setString(12,password);
						pst.setString(13,code);
						pst.setInt(14,0);
						{
							if(Integer.parseInt(a.getAge())>=18)
								x = pst.executeUpdate();
						}
						
					}catch(Exception e){
						e.printStackTrace();
					}
					if(x>0){
						return true;
					}
					else{
						return false;
					}
			}
			
			// Sends Email to the Voter After Registration
			public boolean SendEmail(String email,String user,String pass,String code){

		        try{
		            final String fromEmail = "onlinevotingportal.BVP@gmail.com"; 
		            final String password = "project123"; 
		            final String toEmail = email; 

		          
		            Properties props = new Properties();
		            props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
		            props.put("mail.smtp.port", "587"); //TLS Port
		            props.put("mail.smtp.auth", "true"); //enable authentication
		            props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS

		                Authenticator auth = new Authenticator() {
		                protected PasswordAuthentication getPasswordAuthentication() {
		                    return new PasswordAuthentication(fromEmail, password);
		                }
		            };
		            Session session = Session.getInstance(props, auth);

		            MimeMessage message = new MimeMessage(session);
		            message.setFrom(new InternetAddress(fromEmail));
		            message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
		            message.setSubject("Login Verification | Online Voting System");
		            message.setText("Uername:"+user+" Password: "+pass+" Unique Key "+code);
		            Transport.send(message);    
		            return true;
		        }catch(Exception ex){
		            System.out.println("Mail fail");     
		            return false;
		        }
		    }
			
			// Generate Code for Registration
			public String getCode(String adno){
				String sql = "select * from aadhar where adno=?";
				String s2="";
				String first="";
				try{			
					Connection conn = DBUtil.ConnectDB();
					PreparedStatement pst = (PreparedStatement)conn.prepareStatement(sql);
					pst.setString(1,adno);
					ResultSet rs = pst.executeQuery();
					if(rs.next()){
						first = rs.getString(1);
						String second = rs.getString(2);				
						s2 = second.substring(0,2);			
					}
				}catch(Exception e){
					e.printStackTrace();
				}				
				String s5=first+s2;
				return s5;				
			}
			
			// Login for Voter as well as Admin
			public int Login(String username,String password,String code){
					
					String sql = "select * from admin where username=? and password=? and code=?";
					try{
						Connection conn = DBUtil.ConnectDB();
						PreparedStatement pst = conn.prepareStatement(sql);
						pst.setString(1,username);
						pst.setString(2,password);
						pst.setString(3,code);
						ResultSet rs = pst.executeQuery();
						if(rs.next()){
								
								return 2;								
						}
						else{
							
							String sql1 = "select * from voter where username=? and password=? and code=?";
							try{
								PreparedStatement pst1 = conn.prepareStatement(sql1);
								pst1.setString(1,username);
								pst1.setString(2,password);
								pst1.setString(3,code);
								ResultSet rs1 = pst1.executeQuery();
								if(rs1.next()){
									
									return 1;
								}
								else{
									return 0;
								}
							}catch(Exception e){
								
								e.printStackTrace();
								return 0;
							}
						}
					}catch(Exception e){
						e.printStackTrace();
						
						return 0;
					}
			}
			
			//Register Candidate to Database
			
			public boolean RegisterCandi(CandiBean a){
				String sql = "insert into candi values(?,?,?,?,?,?,?)";
				int x=0;
				try{
					Connection conn = DBUtil.ConnectDB();
					PreparedStatement pst = conn.prepareStatement(sql);
					pst.setString(1,a.getCandiAdno());
					pst.setString(2,a.getCandiName());
					pst.setString(3,a.getCandiAge());
					pst.setString(4,a.getCandiParty());
					pst.setString(5,a.getCandiVoterArea());
					pst.setString(6,a.getCandiVotingPin());
					pst.setInt(7,0);
					x = pst.executeUpdate();
				}catch(Exception e){
					e.printStackTrace();
				}
				if(x>0){
					return true;
				}
				else{
					return false;
				}
			}
			
			
			
			// Add aadhar details to the database
			
			public boolean addAadhar(AadharBean a){
				String sql = "insert into aadhar values(?,?,?,?,?,?,?,?,?,?)";
				int x=0;
				try{
					Connection conn = DBUtil.ConnectDB();
					PreparedStatement pst = conn.prepareStatement(sql);
					pst.setString(1,a.getAdno());
					pst.setString(2,a.getName());
					pst.setString(3,a.getDob());
					pst.setString(4,a.getAge());
					pst.setString(5,a.getState());
					pst.setString(6,a.getCity());
					pst.setString(7,a.getArea());
					pst.setString(8,a.getPincode());
					pst.setString(9,a.getEmail());
					pst.setString(10,a.getPhno());
					x = pst.executeUpdate();
				}catch(Exception e){
					e.printStackTrace();
				}
				if(x>0){
					return true;
				}
				else{
					return false;
				}
			}
			
			// Get Voter Details
			
			public VoterBean getVoter(String user,String pass){
				String sql = "select * from voter where username=? and password=?";
				VoterBean v = new VoterBean();
				try{
					Connection conn = DBUtil.ConnectDB();
					PreparedStatement pst = conn.prepareStatement(sql);
					pst.setString(1,user);
					pst.setString(2,pass);
					ResultSet rs = pst.executeQuery();
					if(rs.next()){
						v.setVoterAdno(rs.getString(1));
						v.setVoterName(rs.getString(2));
						v.setVoterAge(rs.getString(3));
						v.setVoterState(rs.getString(4));
						v.setVoterCity(rs.getString(5));
						v.setVoterArea(rs.getString(6));
						v.setVoterDob(rs.getString(7));
						v.setVoterPhno(rs.getString(8));
						v.setVoterEmail(rs.getString(9));
						v.setVoterPin(rs.getString(10));
						v.setUsername(rs.getString(11));
						v.setPassword(rs.getString(12));
						v.setCode(rs.getString(13));
						v.setVoterIsVoted(rs.getInt(14));					
					}
				}catch(Exception e){
					e.printStackTrace();
				}
				return v;
			}
			
		// Add Candidate Detils
			
			public AadharBean addCandi(String adno){
				String sql = "select * from aadhar where adno=?";
				AadharBean a = new AadharBean();
				try{
					Connection conn = DBUtil.ConnectDB();
					PreparedStatement pst = conn.prepareStatement(sql);
					pst.setString(1,adno);
					ResultSet rs = pst.executeQuery();
					if(rs.next()){
							a.setAdno(rs.getString(1));
							a.setName(rs.getString(2));
							a.setDob(rs.getString(3));
							a.setAge(rs.getString(4));
							a.setState(rs.getString(5));
							a.setCity(rs.getString(6));
							a.setArea(rs.getString(7));
							a.setPincode(rs.getString(8));
							a.setEmail(rs.getString(9));
							a.setPhno(rs.getString(10));
					}					
				}catch(Exception e){
					e.printStackTrace();
				}
				return a;
			}
			
			// To Display List of Candidates
			
			public ArrayList<CandiBean> getCandi(String areacode){
					String sql = "select * from candi where CandiVotingPin=?";
					ArrayList<CandiBean> arr = new ArrayList<CandiBean>();
					try{
						Connection conn = DBUtil.ConnectDB();
						PreparedStatement pst = conn.prepareStatement(sql);
						pst.setString(1,areacode);
						ResultSet rs = pst.executeQuery();
						while(rs.next()){
							CandiBean c = new CandiBean();
							c.setCandiAdno(rs.getString(1));
							c.setCandiName(rs.getString(2));
							c.setCandiAge(rs.getString(3));
							c.setCandiParty(rs.getString(4));
							c.setCandiVoterArea(rs.getString(5));
							c.setCandiVotingPin(rs.getString(6));
							c.setCandiVoteCount(rs.getInt(7));
							arr.add(c);
						}
					}catch(Exception e){
						e.printStackTrace();
					}
					return arr;
			}
			// Get the stored value of the Vote Count
			
			public int getvote(String adno){
				String sql = "select * from candi where CandiAdno="+adno+"";
				int vote=0;
				try{
					Connection conn =  DBUtil.ConnectDB();
					PreparedStatement pst =  conn.prepareStatement(sql);
					ResultSet rs = pst.executeQuery();
					if(rs.next()){
						vote = rs.getInt(7);
					}
				}catch(Exception e){
					e.printStackTrace();
				}
				System.out.println(vote);
				return vote;
			}
			
			// Calculation of Votes
			
			public boolean CalcVote(String adno,String v_adno){
				String sql = "update candi set CandiVoteCount=? where CandiAdno="+adno+"";
				System.out.println(v_adno);
				int x =0;
				
				try{
					Connection conn  = DBUtil.ConnectDB();
					PreparedStatement pst = conn.prepareStatement(sql);
					pst.setInt(1,getvote(adno)+1);					
					x = pst.executeUpdate();
					
				}catch(Exception e){
					e.printStackTrace();
				}
				if(x>0){
					System.out.println("here");
					String sql1 = "update voter set IsVoted=? where VoterAdno="+v_adno+"";
					int x1 = 0;
					try{
						Connection conn1  = DBUtil.ConnectDB();
						PreparedStatement pst1 = conn1.prepareStatement(sql1);
						pst1.setString(1,"1");
						x1 = pst1.executeUpdate();
						System.out.println("here1");
					}catch(Exception e){
						e.printStackTrace();
					}
					if(x1>0){
						return true;
					}
					else{
						return false;
					}
				}
				else{
					return false;
				}				
			}
			
			// Check Results based on Pincode of the area.
			
			public ArrayList<CandiBean> CheckResult(String pin){
					String sql = "select max(CandiVoteCount) from candi where CandiVotingPin=?";
					
					ArrayList<CandiBean> arr = new ArrayList<CandiBean>();
					int count = 0;
					try{
						Connection conn = DBUtil.ConnectDB();
						PreparedStatement pst = conn.prepareStatement(sql);
						pst.setString(1, pin);
						ResultSet rs = pst.executeQuery();
						
						
						if(rs.next()){
							
							count = rs.getInt(1);
							String sql1 = "select * from candi where CandiVoteCount = ? and CandiVotingPin=?";
								
								System.out.println(count);
								PreparedStatement pst1 = conn.prepareStatement(sql1);
								pst1.setInt(1, count);
								pst1.setString(2, pin);
								ResultSet rs1 = pst1.executeQuery();
								
								while(rs1.next()){
									CandiBean c = new CandiBean();
									c.setCandiAdno(rs1.getString(1));
									c.setCandiName(rs1.getString(2));
									c.setCandiAge(rs1.getString(3));
									c.setCandiParty(rs1.getString(4));
									c.setCandiVoterArea(rs1.getString(5));
									c.setCandiVotingPin(rs1.getString(6));
									c.setCandiVoteCount(rs1.getInt(7));
									arr.add(c);
								}
						}
					}catch(Exception e){
						e.printStackTrace();
					}
					return arr;
			}
			
			// Updates Publish Table
			public int publish(){
				String sql = "update publish set IsPublish=?";
				int x=0;
				try{
					Connection conn = DBUtil.ConnectDB();
					PreparedStatement pst=conn.prepareStatement(sql);
					pst.setInt(1,1);
					x=pst.executeUpdate();							
				}catch(Exception e){
					e.printStackTrace();
				}
				if(x>0){
					return x;
				}
				else{
					return 0;
				}
			}
			// Check Publish Status
			
			public int returnPublish(){
				String sql = "select * from publish";
				int val=0;
				try{
					Connection conn = DBUtil.ConnectDB();
					PreparedStatement pst = conn.prepareStatement(sql);
					ResultSet rs = pst.executeQuery();
					if(rs.next()){
						val = rs.getInt(1);
					}
				}catch(Exception e){
					e.printStackTrace();
				}
				return val;
			}
}


















