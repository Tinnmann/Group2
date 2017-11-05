import java.util.ArrayList;
import java.util.HashMap;


public class Cluster {
	
	private ArrayList<CrimeCase> crimes;
	public String clusterName;
	
	//create html to be shown in browser for cluster
	private String html = "<tr class=\"topRow\"><td><h1>Date</h1></td><td><h1>Time</h1></td>" +
			"<td><h1>CrimeType</h1></td>" +
			"<td><h1>Location</h1></td></tr>";
	
	//is a list of all the locations this group committed crimes in and the numbers
	//key is the location and the list crimes committed in there
	private HashMap<String,ArrayList<CrimeCase>> crimesCommitted = new HashMap<String,ArrayList<CrimeCase>>() ;
	
	public Cluster(ArrayList<CrimeCase> crimes,String clusterName){
		this.crimes = crimes;
		this.clusterName = clusterName;
	}
	
	public HashMap<String,ArrayList<CrimeCase>> createStatistics(){
		
		for (int i=0;i<crimes.size();i++){
			CrimeCase crime = crimes.get(i);
			
			String location = crime.location;
			if (crimesCommitted.containsKey(location)){ //check if the location is already represented
				crimesCommitted.get(location).add(crimes.get(i));
			}else{
				ArrayList<CrimeCase> loc = new ArrayList<CrimeCase>();
				loc.add(crimes.get(i));
				crimesCommitted.put(location,loc);
			}
			
			html = html+"<tr class=\"cluster-"+location.replaceAll("[^a-zA-Z]", "")+"\"><td><h1>"+crime.date+"</h1></td><td><h1>"+
					crime.time+"</h1></td>" +
					"<td><h1>"+crime.crimeType+"</h1></td>"+"<td><h1>"+
					crime.location+"</h1></td></tr>";
			
		}
		
		html = "<table class=\"location-cluster\" id=\"cluster-name\"><tr class=\"gang-name\"><td><h1>"+clusterName+"</h1><td>" +
				"</tr>"+html+"</table>";
		
		return crimesCommitted;
	}
	
	public String getHTML(){
		return html;
	}
	
	public ArrayList<CrimeCase> getCrimes(){
		return crimes;
	}
	
	public int getTotalCrimes(){
		return crimes.size();
	}
	
	public ArrayList<CrimeCase> getLocCrimes(String location){
		return crimesCommitted.get(location);
	}

}
