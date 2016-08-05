package chat;


public class Chatter
{
	private String name = null;
	private long loginTime = -1;
	private long enteredInRoomAt = -1;
	
	public Chatter(String name, long loginTime)
	{
		this.name = name;		
		this.loginTime = loginTime;
	}	
	

	public String getName()
	{
		return name;
	}



	public long getLoginTime()
	{
		return loginTime;
	}
	


	public void setEnteredInRoomAt( long enteredAt)
	{
		this.enteredInRoomAt = enteredAt;
	}

	public long getEnteredInRoomAt()
	{
		return enteredInRoomAt;
	}

}