package com.issuetracker.utill;

import com.issuetracker.bean.SendEmail;

public class EmailThread implements Runnable {
	
	public String email,message;
	
	public void send(String mail,String msg)
	{
		email = mail;
		message = msg;
	}
	
	@Override
	public void run() {
		// TODO Auto-generated method stub
		SendEmail mail = new SendEmail();

		mail.sendmail(email, message);

	}

}
