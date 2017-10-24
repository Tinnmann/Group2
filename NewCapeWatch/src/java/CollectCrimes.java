/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author TINASHE
 */
import java.sql.*;
import java.sql.Connection.*;
import java.sql.DriverManager.*;
import java.sql.SQLException.*;
import java.util.ArrayList;
 
public class CollectCrimes
{
	 //connecting to the crime database to retrieve data from the imported cvs file with all rape crimes
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
<<<<<<< HEAD
	static final String DB_URL ="jdbc:mysql://127.0.0.1:3306/crimedata";
	static final String DB_URL2 ="jdbc:mysql://127.0.0.1:3306/cluster";
	static final String username="tebogo";
	static final String paswd="password";
=======
	static final String DB_URL ="jdbc:mysql://127.0.0.1:3306/capewatchdb";
	static final String DB_URL2 ="jdbc:mysql://127.0.0.1:3306/relateddb";
	static final String username="root";
	static final String pwd="";
>>>>>>> 03130175cd8378a2ff7c7f291b0749420e4d43c0
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
<<<<<<< HEAD
		
		System.out.println("Connecting to the Database");
		con = DriverManager.getConnection(DB_URL,username,paswd);
		
=======
		con = DriverManager.getConnection(DB_URL,username,pwd);
>>>>>>> 03130175cd8378a2ff7c7f291b0749420e4d43c0
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
			
<<<<<<< HEAD
			
			CrimeList.add(crime);
			
=======
			CrimeList.add(crime);
>>>>>>> 03130175cd8378a2ff7c7f291b0749420e4d43c0
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
<<<<<<< HEAD
		Class.forName(JDBC_DRIVER);
		ArrayList<Graph> gr = graphs;
		
		System.out.println("Connecting to the Database");
		connect = DriverManager.getConnection(DB_URL2,username,paswd);
		
		System.out.println("Successfully Connected");
		statement = connect.createStatement();
=======
            Class.forName(JDBC_DRIVER);
            ArrayList<Graph> gr = graphs;
            connect = DriverManager.getConnection(DB_URL2,username,pwd);
            statement = connect.createStatement();
>>>>>>> 03130175cd8378a2ff7c7f291b0749420e4d43c0
		
	    int i =0;
	    Graph graph1;
	    CrimeCase crime;
	    
	    dropTables(statement);
	    
	    while (i < gr.size())
	    {
<<<<<<< HEAD
	    	 Graph cluster = gr.get(i);
	    	 String graphName = "graph"+i;
	    	 String sql = "CREATE TABLE "+graphName+
	                   "( reportID INT(10), " +
	                   " crimeID VARCHAR(10), " + 
	                   " userID VARCHAR(10), " + 
	                   " date VARCHAR(20), " + 
	                   " location VARCHAR(30), " + 
	                   " time VARCHAR(10), " + 
	                   " crimeType VARCHAR(20), " + 
	                   " status VARCHAR(10) ) " ; 
=======
                Graph cluster = gr.get(i);
	    	String graphName = "graph"+i;
	    	String sql = "CREATE TABLE "+graphName+
	                "( reportID INT(10), " +
	                " crimeID VARCHAR(10), " + 
	                " userID VARCHAR(10), " + 
	                " date VARCHAR(20), " + 
	                " location VARCHAR(30), " + 
	                " time VARCHAR(10), " + 
	                " crimeType VARCHAR(20), " + 
	                " status VARCHAR(10) ) " ; 
>>>>>>> 03130175cd8378a2ff7c7f291b0749420e4d43c0
	    	 
	    	 //Assuming that a graph is an arraylist
	    	 
	    	 //For each CrimeCase in the graph;
	    	 	//System.out.println(statement.executeUpdate(sql));
	    	 
<<<<<<< HEAD
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
=======
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
>>>>>>> 03130175cd8378a2ff7c7f291b0749420e4d43c0
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
<<<<<<< HEAD
	    	   	
=======
>>>>>>> 03130175cd8378a2ff7c7f291b0749420e4d43c0
	    	   	i++;
	    }
	    
		//takes an arraylist of HCS graphs
		//For each graph, get the Arraylist of CrimeCases and create tables
		//Save tables on remote database
	}
	
	public static void dropTables(Statement statement){
<<<<<<< HEAD
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
=======
            System.out.println("Started deleting tables ...");
            int i = 0;
//            loop:
		while (true){
                    try{
                        String sql = "DROP TABLE graph"+i;
			statement.executeUpdate(sql);
                    }catch(Exception e){
                        break;
                    }
                    i++;
>>>>>>> 03130175cd8378a2ff7c7f291b0749420e4d43c0
		}
		
		System.out.println("Finished deleting tables ...");
		
	}
}
