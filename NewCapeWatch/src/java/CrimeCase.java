/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author TINASHE
 */
import java.util.ArrayList;
import java.util.Arrays;


public class CrimeCase {
	
	public int id;
	public int reportID;
	public String crimeID;
	public String userID;
	public String date;
	public String location;
	public String time;
	public String crimeType;
	public String status;
	
	
	public int connected =0;
	
	public ArrayList<CrimeCase> MasterNode = new ArrayList<CrimeCase>(Arrays.asList(this));
	
	public CrimeCase(int id){
		this.id = id;
	}
	
	public int getId()
	{
		return id;
	}
	

}

