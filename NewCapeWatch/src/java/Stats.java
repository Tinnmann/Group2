/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author TINASHE
 */
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;


public class Stats {
	
	private  ArrayList<Graph> clusters;
	private  ArrayList<CrimeCase> graph;
	
	//the key in outer map is the type of statistic
	//the key in inner map is the suburb with the crimes and int is number of crimes
	private  HashMap<String,HashMap<String,ArrayList<CrimeCase> > > graphStatistics = 
			new HashMap<String,HashMap<String,ArrayList<CrimeCase> > >() ;
	
	//the key is the location and the list contains the clusters in that location
//	private  HashMap<String,ArrayList<Cluster>> clusterStatistics = new HashMap<String,ArrayList<Cluster>>() ;
	
	public Stats(ArrayList<Graph> clusters,ArrayList<CrimeCase> graph){
		this.clusters = clusters;
		this.graph = graph;
	}
	
	public  void createStatistics() throws FileNotFoundException{
		//create a HashMap with the type of statistic in the map
		//graphStatistics is hashmap with key of a location which had crimes in them
		
		//can have crimes which has all the crimes in a location (graph iteration)
		//can have Night,Noon,Evening,Morning for the times (graph iteration)
		//can have Monday - Sunday for the days             (graph iteration)
		
		//can create cluster statistics which shows each location with clusters present in it
		
//		createClusterStatistics();
		
		createGraphStatistics();
		
		System.out.println("GRAPH STATS\n");
		
		printGraphStatistics(graphStatistics);
		
		System.out.println("CLUSTER STATS\n");
		
//		printClusterStatistics(clusterStatistics);
	}
	
//	public void createClusterStatistics(){
//		
//		for (int i=0;i<clusters.size();i++){
//			
//			Cluster cluster = new Cluster(clusters.get(i).getCrimeNodes(),"gang"+i);
//			
//			//all the locations the cluster is working on
//			HashMap<String,ArrayList<CrimeNode>> crimesCommitted = cluster.createStatistics();
//			
//			//iterate the locations putting the cluster in those
//			for ( String key : crimesCommitted.keySet() ) {
//			    //System.out.println( key );
//			    if (clusterStatistics.containsKey(key)){
//			    	clusterStatistics.get(key).add(cluster);
//			    }else{
//			    	ArrayList<Cluster> loc = new ArrayList<Cluster>();
//			    	loc.add(cluster);
//			    	clusterStatistics.put(key, loc);
//			    }
//			}
//			
//		}
//		
//	}
	
	public  void createGraphStatistics(){
		//graphStatistics.put("location", new HashMap<String,ArrayList<CrimeNode> >());
		
		for (int i=0;i<graph.size();i++){
			
			CrimeCase crime = graph.get(i);
			
			//put in the locations
			if (graphStatistics.containsKey(crime.location)){
				
				graphStatistics.get(crime.location).get("crimes").add(crime);
				
				//add the crime to graphStatistics
				putCrimeNode(crime);
				
			}else{
				HashMap<String,ArrayList<CrimeCase>> stats = new HashMap<String,ArrayList<CrimeCase>>();
				
				stats.put("crimes", new ArrayList<CrimeCase>() );
				
				stats.put("morning", new ArrayList<CrimeCase>() );
				stats.put("noon", new ArrayList<CrimeCase>() );
				stats.put("evening", new ArrayList<CrimeCase>() );
				stats.put("night", new ArrayList<CrimeCase>() );
				
				stats.put("Sunday", new ArrayList<CrimeCase>() );
				stats.put("Monday", new ArrayList<CrimeCase>() );
				stats.put("Tuesday", new ArrayList<CrimeCase>() );
				stats.put("Wednesday", new ArrayList<CrimeCase>() );
				stats.put("Thursday", new ArrayList<CrimeCase>() );
				stats.put("Friday", new ArrayList<CrimeCase>() );
				stats.put("Saturday", new ArrayList<CrimeCase>() );
				
				graphStatistics.put(crime.location, stats);
				
				//add to the crimes type
				graphStatistics.get(crime.location).get("crimes").add(crime);
				
				//add the crime to graphStatistics
				putCrimeNode(crime);
			 }
			
		}
		
	}
	
	public  void putCrimeNode(CrimeCase crime){
		
		//add the times array
		if (crime.time.equals("morning"))
			graphStatistics.get(crime.location).get("morning").add(crime);
		else if (crime.time.equals("noon"))
			graphStatistics.get(crime.location).get("noon").add(crime);
		else if (crime.time.equals("evening"))
			graphStatistics.get(crime.location).get("evening").add(crime);
		else if (crime.time.equals("night"))
			graphStatistics.get(crime.location).get("night").add(crime);
		
		//add the days array
		if (crime.date.equals("Sunday"))
			graphStatistics.get(crime.location).get("Sunday").add(crime);
		else if (crime.date.equals("Monday"))
			graphStatistics.get(crime.location).get("Monday").add(crime);
		else if (crime.date.equals("Tuesday"))
			graphStatistics.get(crime.location).get("Tuesday").add(crime);
		else if (crime.date.equals("Wednesday"))
			graphStatistics.get(crime.location).get("Wednesday").add(crime);
		else if (crime.date.equals("Thursday"))
			graphStatistics.get(crime.location).get("Thursday").add(crime);
		else if (crime.date.equals("Friday"))
			graphStatistics.get(crime.location).get("Friday").add(crime);
		else if (crime.date.equals("Saturday"))
			graphStatistics.get(crime.location).get("Saturday").add(crime);
		
	}
	
//	public void printClusterStatistics(HashMap<String,ArrayList<Cluster>> stats) throws FileNotFoundException{
//		
//		//make a string with variables e.g. var locs = {Rosebank : {gang1 :'100%'} };
//		//for the javascript
//		String script = "{";
//		
//		//iterate the locations putting the cluster in those
//		for ( String location : clusterStatistics.keySet() ) {
//		    //System.out.println( "\n******** "+location+" ********\n" );
//		    
//		    //get total crimes committed in a location
//		    int crimeNo = getTotalCrimes(stats,location);
//		    
//		    ArrayList<Cluster> type = clusterStatistics.get(location);
//		    
//		    script = script +""+location.replaceAll("[^a-zA-Z]", "")+" : { ";
//		    
//		    for (int i=0;i<type.size();i++) {
//		    	
//		    	String html = type.get(i).getHTML();
//		    	
//		    	int locNo = type.get(i).getLocCrimes(location).size();
//		    	
//		    	//get percentage of crimes done by gang in this location
//		    	double perc = ( (double)locNo/crimeNo )*100;
//		    	
//		    	//System.out.println( "-- "+type.get(i).clusterName+"\n");
//		    	
//		    	script = script+""+type.get(i).clusterName+" : {perc: '"+(int)perc+"',html:'"+html+"'},";
//		    	//printCrimes(type.get(i).getCrimes());
//		    }
//		    
//		    script = script.substring(0, script.length() -1);
//		    script = script + "},";
//		    
//		    //System.out.println(script);
//		}
//		
//		script = script.substring(0, script.length() -1);
//	    script = script + "}";
//	    
//	    System.out.println(script);
//	    
//            //C:\Users\Tinnman\Desktop\Capstone-final\build\web\js
//	    PrintWriter out = new PrintWriter("C:/Users/Tinnman/Desktop/Capstone-final/build/web/js/ClusterStatistics.txt");
//	    out.println(script);
//	    out.close();
//		
//	}
	
//	public int getTotalCrimes(HashMap<String,ArrayList<Cluster>> stats,String loc){
//		int total = 0;
//		
//		ArrayList<Cluster> clusters = stats.get(loc);
//		
//		for (int i=0;i<clusters.size();i++){
//			total = total + clusters.get(i).getLocCrimes(loc).size();
//		}
//		
//		return total;
//	}
	
	public  void printGraphStatistics(HashMap<String,HashMap<String,ArrayList<CrimeCase> > > stats) throws FileNotFoundException{
		//make a string with variables e.g. 
		//var locationStatistics = {Rosebank : {morning : 5,..,night:5,sunday:5,..,saturday:5} };
		//var crimes=300; var morning=10;..; var night=30; var sunday=30;..; saturday=20;
		
		int crimes=0;
		
		int morning=0,noon = 0,evening=0,night=0;
		
		int sunday=0,monday=0,tuesday=0,wednesday=0,thursday=0,friday=0,saturday=0;
		
		String script = "{";
		//iterate the locations putting the cluster in those
		for ( String location : graphStatistics.keySet() ) {
		    //System.out.println( "\n******** "+location+" ********\n" );
		    HashMap<String,ArrayList<CrimeCase>> type = graphStatistics.get(location);
		    
		    script = script +""+location.replaceAll("[^a-zA-Z]", "")+" : { ";
		    
		    for ( String stat : type.keySet() ) {
		    	//System.out.println( "-- "+stat+": "+type.get(stat).size() );
		    	script = script+""+stat+" : "+type.get(stat).size()+",";
		    	
		    	//add the statistics to the running total
		    	switch (stat){
		    		case "morning":
		    			morning += type.get(stat).size();
		    			break;
		    		case "noon":
		    			noon += type.get(stat).size();
		    			break;
		    		case "evening":
		    			evening += type.get(stat).size();
		    			break;
		    		case "night":
		    			night += type.get(stat).size();
		    			break;
		    		case "Sunday":
		    			sunday += type.get(stat).size();
		    			break;
		    		case "Monday":
		    			monday += type.get(stat).size();
		    			break;
		    		case "Tuesday":
		    			tuesday += type.get(stat).size();
		    			break;
		    		case "Wednesday":
		    			wednesday += type.get(stat).size();
		    			break;
		    		case "Thursday":
		    			thursday += type.get(stat).size();
		    			break;
		    		case "Friday":
		    			friday += type.get(stat).size();
		    			break;
		    		case "Saturday":
		    			saturday += type.get(stat).size();
		    			break;
		    		case "crimes":
		    			crimes += type.get(stat).size();
		    			break;
		    		default:
		    			break;
		    		
		    	}
		    			
		    }
		    
		    script = script.substring(0, script.length() -1);
		    script = script + "},";
		    
		    //System.out.println(script);
		}
		
		script = script.substring(0, script.length() -1);
	    script = script + "}";
	    
	    String totals = "crimes="+crimes+"\n"+"morning="+morning+"\n"+"noon="+noon+"\n"+
				"evening="+evening+"\n"+"night="+night+"\n"+"sunday="+sunday+"\n"+
				"monday="+monday+"\n"+"tuesday="+tuesday+"\n"+"wednesday="+wednesday+"\n"+
				"thursday="+thursday+"\n"+"friday="+friday+"\n"+"saturday="+saturday+"\n";

	    System.out.println(script);
	    System.out.println(totals);
	    
	    PrintWriter out = new PrintWriter("C:/Users/TINASHE/Desktop/Group2/NewCapeWatch/build/web/js/GraphStatistics.txt");
	    out.println(script);
	    out.close();
	    
	    out = new PrintWriter("C:/Users/Tinnman/Desktop/Group2/NewCapeWatch/build/web/js/GraphTotals.txt");
	    out.println(totals);
	    out.close();
	    
	}
	
	public static void printCrimes(ArrayList<CrimeCase> crimes){
		
		HashMap<String,String> locations = Gps.getLocations();
		
		for (int i=0;i<crimes.size();i++){
			System.out.println((i+1)+
					String.format("%0$5s", ". ID: "+crimes.get(i).id)+
					String.format("%0$25s", ", Location: "+crimes.get(i).location)+
					String.format("%0$17s",", Distance :"+locations.get(crimes.get(i).location)+
					String.format("%0$17s",", Day :"+crimes.get(i).date)+
					String.format("%0$14s",", Time :"+crimes.get(i).time)) );
		}
	}

}

