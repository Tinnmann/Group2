/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author TINASHE
 */
import forgotPassword.util.Setup;
import java.sql.*;
import java.sql.Connection.*;
import java.sql.DriverManager.*;
import java.sql.SQLException.*;
import java.util.ArrayList;
 
public class CollectCrimes
{
	 //connecting to the crime database to retrieve data from the imported cvs file with all rape crimes
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL ="jdbc:mysql://127.0.0.1:3306/capewatchdb";
	static final String DB_URL2 ="jdbc:mysql://127.0.0.1:3306/newrelateddb";
	static final String username = Setup.DB_USERNAME;
	static final String pwd = Setup.DB_PASSWORD;
	static final String table = "table1";
	static final int columNo = 12;
	static Statement stat = null;
	static Connection con =null;
	String sql = "";
	static ResultSet crimes =null;
	public static Graph graph;
	public static ArrayList<CrimeCase> CrimeList;
	public static ArrayList<CrimeCase> GraphCrimes =null;
	static Statement statement = null;
	static Connection connect =null;
	static String sQl ;
	static ResultSet graphTable;
    
	public void createGraph()
	{
	
	try{
            //creating Graphs of all the crime cases and storing each graph into the database
		Class.forName(JDBC_DRIVER);
		con = DriverManager.getConnection(DB_URL,username,pwd);
		System.out.println("Successfully Connected");
		stat = con.createStatement();
		String sqlQuery = "SELECT * FROM crime_case";
		System.out.println(stat.executeQuery(sqlQuery));
		
		crimes =stat.executeQuery(sqlQuery);
		int CrimeNodeID = 0;
		
		 CrimeList = new ArrayList<>();
		
		
		while (crimes.next())
		{
			CrimeNodeID ++;
			CrimeCase crime = new CrimeCase(CrimeNodeID);
			
			//Database attributes which are the attributes that each crime case has 
			crime.reportID = crimes.getInt("reportID");
			crime.crimeID = crimes.getString ("crimeID");
			crime.userID = crimes.getString ("userID");
			crime.date = crimes.getString ("date");
			crime.location = crimes.getString ("location");
			crime.time= crimes.getString ("time");
			crime.crimeType = crimes.getString ("crimeType");
			crime.status = crimes.getString ("status");
			
			CrimeList.add(crime);
		 }
		
		graph = new Graph(CrimeList, null);
		
	   }
	   catch(Exception e){System.out.println(e);}

	}
	//this method returns the arraylist of crimecases to be used to make graphs 
	public ArrayList<CrimeCase> getCrimeCases()
	{
		return CrimeList;
	}
	
        //this method returns the graph we created above
	public Graph getGraph()
	{
		return graph;
	}
	//this method saves the created graphs into the database 
	public static void saveGraph(ArrayList<Graph> graphs) throws SQLException, ClassNotFoundException
	{ 
            Class.forName(JDBC_DRIVER);
            ArrayList<Graph> gr = graphs;
            connect = DriverManager.getConnection(DB_URL2,username,pwd);
            statement = connect.createStatement();
		
	    int i =0;
	    Graph graph1;
	    CrimeCase crime;
	    
	    dropTables(statement);
	    
	    while (i < gr.size())
	    {
                Graph cluster = gr.get(i);
	    	String graphName = "graph"+i;
	    	String sql = "CREATE TABLE "+graphName+
	                "( reportID INT(10), " +
	                " crimeID VARCHAR(10), " + 
	                " userID VARCHAR(10), " + 
	                " date VARCHAR(20), " + 
	                " location VARCHAR(30), " + 
	                " time VARCHAR(10), " + 
	                " crimeType VARCHAR(100), " + 
	                " status VARCHAR(10) ) " ; 
	    	 
	    	 //Assuming that a graph is an arraylist
	    	 
	    	 //For each CrimeCase in the graph;
	    	 	//System.out.println(statement.executeUpdate(sql));
	    	 
	    	statement.executeUpdate(sql);
	    	 	
	    	ArrayList<CrimeCase> ClusterCrimes = cluster.getCrimeCases();
	    	   	
	    	sQl = "SELECT * FROM "+graphName;
	    	   	
                //System.out.println(statement.executeQuery(sQl));
	    	statement.executeQuery(sQl);
	    	    
	    	graphTable =statement.executeQuery(sQl);
	    	   	
	    	   	for (int j=0; j< ClusterCrimes.size(); j++)
	    	   	{
                            CrimeCase crime1 = ClusterCrimes.get(j);
		    	   	
		    	    String data = "INSERT INTO "+graphName+"( reportID ,crimeID ,userID," +
                                    " date , location ,time ," +
                                    "crimeType ,status ) VALUES ( '"+crime1.reportID+"', '"+
                                           crime1.crimeID+"', '"+
			                   crime1.userID+"', '"+ 
			                   crime1.date+"', '"+ 
			                   crime1.location+"', '"+ 
			                   crime1.time+"', '"+ 
			                   crime1.crimeType+"', '"+ 
			                   crime1.status+"' )"; 
		    	    //System.out.println(data);
		    	    
		    	    //System.out.println(statement.executeUpdate(data));
		    	    statement.executeUpdate(data);
	    	   	}
	    	   	i++;
	    }
	    
		//takes an arraylist of HCS graphs
		//For each graph, get the Arraylist of CrimeCases and create tables
		//Save tables on remote database
	}
	
	public static void dropTables(Statement statement){
            System.out.println("Started deleting tables ...");
            int i = 0;
            loop:
		while (true){
                    try{
                        String sql = "DROP TABLE graph"+i;
			statement.executeUpdate(sql);
                    }catch(Exception e){
                        break loop;
                    }
                    i++;
		}
		
		System.out.println("Finished deleting tables ...");
		
	}
}
