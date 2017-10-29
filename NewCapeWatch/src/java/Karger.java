import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;
import java.util.concurrent.ForkJoinPool;
import java.util.concurrent.RecursiveAction;
import java.util.concurrent.RecursiveTask;

public class Karger extends RecursiveTask<CutGraph> {
	private Graph graph;
	private int graphSize;
	
	public Karger(Graph graph,int graphSize){
		this.graph = graph;
		this.graphSize = graphSize;
	}
	
	@Override
	protected CutGraph compute(){
		
		/* has the super nodes of minimum cut up to a certain point in the tree */
		CutGraph cutGraph = new CutGraph();
		
		Random rand = new Random();
		int size = graph.edges.size();
		
		int superNodesNum = graph.getDistances().size();
		
		if (superNodesNum < Math.ceil(graphSize/(Math.sqrt(2.0))) ){
			
			System.out.println(" \n ^^^^^^^^^^ split ^^^^^^^^^^ "+graphSize+" "+superNodesNum);
			
			Graph cloned1 = cloneGraph (graph);
			Graph cloned2 = cloneGraph (graph);
			
			Karger karger1 = new Karger (cloned1,cloned1.getDistances().size());
			Karger karger2 = new Karger (cloned2,cloned2.getDistances().size());
			
			karger1.fork();
			
			CutGraph cutGraph2 = karger2.compute();
			CutGraph cutGraph1 = karger1.join();

			/* The values to be returned */
			if (cutGraph1.getMinCut() < cutGraph2.getMinCut()){
				cutGraph = cutGraph1;
			}else{
				cutGraph = cutGraph2;
			}
		}else if (size>1){
			
			ArrayList<CrimeCase> crimes = graph.getCrimeCases();
			
			System.out.println(" edges size "+size);
			/* Not inclusive */
			int randomNum = rand.nextInt( size - 1 );
			
			/* change it so that we are not left with singletons */
			if (graph.getCrimeCases().size() < 150 ){
				randomNum = group(graph);
			}
			
			int[] edge = graph.edges.get(randomNum);
			
			
			ArrayList<ArrayList<Double> > distances = graph.getDistances();
			
			int joined = edge[1];
			int kept = edge[0];
			
			int joinedId = crimes.get(edge[1]).id;
			int keptId = crimes.get(edge[0]).id;
			
			System.out.println(" joinedId "+joinedId+" "+crimes.get(joined).MasterNode.size()+" keptId "+keptId+" "
					+crimes.get(kept).MasterNode.size());
			
			/* the first node in the edge is kept the other discarded */
			CrimeCase keptNode = graph.getCrimeCases().get(edge[0]);
			keptNode.MasterNode.addAll( graph.getCrimeCases().get(edge[1]).MasterNode );
			
			 graph.getCrimeCases().set(edge[0], keptNode);
			
			
			System.out.println(" dists "+graph.getDistances().size()+" joined "+joined+" kept "+kept+" edges "+graph.edges.size());
			
			
			for (int i=0;i<distances.size();i++){
				
				/* set an edge from kept node to neighbor of removed */
				if (i != kept && distances.get(joined).get(i) >0){
					/* check if from i to kept there is a connection */
					double edgeCount = distances.get(joined).get(i);
					if (distances.get(i).get(kept) > 0)
						edgeCount = distances.get(joined).get(i) + distances.get(i).get(kept);
					
					distances.get(i).set(kept, edgeCount);
					distances.get(kept).set(i, edgeCount);
				}
				
			}
			
			for (int i=0;i<distances.size();i++){
						
				/* Then remove the item */
				distances.get(i).remove(joined);	
				//System.out.println(" len of arrinner "+distances.get(i).size());
				
			}
			
			
			/* then remove the row */
			distances.remove(joined);
			
			System.out.println(" dist is "+distances.size()+" "+distances.get(0).size());
			//printDistances(distances);
			
			ArrayList<int[]> newEdges = new ArrayList<int[]>();
			
			/* redo the edges */
			for (int i=0;i<distances.size();i++){
				for (int j=i;j<distances.size();j++){
					
					if (distances.get(i).get(j) > 0){
						newEdges.add(new int[]{i,j});
					}
				}
			}
			
			/* replace the edge */
			graph.edges = newEdges;
			
			graph.getCrimeCases().remove(joined);
			
			//if (graph.getCrimeCases().size() > 2){
			if (graph.edges.size() > 1){
				
				Karger karger = new Karger (graph,graphSize);
				return karger.compute();
				
			}else{
				
				//printGraph(graph);
				
				double mincut = 1;
				
				for (int i=0;i<graph.getDistances().size();i++){
					if (graph.getDistances().get(i).get(0) >0){
						mincut = graph.getDistances().get(i).get(0);
					}
				}
				
				cutGraph = new CutGraph(graph.getCrimeCases(),mincut);
			}
		 
		}else{
			double mincut = 1;
			
			for (int i=0;i<graph.getDistances().size();i++){
				if (graph.getDistances().get(i).get(0) >0){
					mincut = graph.getDistances().get(i).get(0);
				}
			}
			
			cutGraph = new CutGraph(graph.getCrimeCases(),mincut);
		}
		
		return cutGraph;
		
	}
	
	public static Graph cloneGraph(Graph graph){
		Graph clone = new Graph ();
		
		ArrayList<ArrayList<Double>> distances = graph.getDistances();
		
		ArrayList<ArrayList<Double>> newDistances = new ArrayList<ArrayList<Double>>();
		
		ArrayList<int[]> edges = graph.edges;
		
		ArrayList<int[]> newEdges = new ArrayList<int[]>();
		
		ArrayList<CrimeCase> crimeCases = graph.getCrimeCases();
		
		ArrayList<CrimeCase> newCrimeCases = new ArrayList<CrimeCase>();
		
		
		for (int i=0;i<distances.size();i++){
			ArrayList<Double> nodes = new ArrayList<Double>();
			
			for (int j=0;j<distances.size();j++){
				nodes.add(distances.get(i).get(j));
			}
			newDistances.add(nodes);
		}
		
		for (int i=0;i<edges.size();i++){
			int[] edge = new int[]{edges.get(i)[0],edges.get(i)[1]};
			newEdges.add(edge);
		}
		
		for (int i=0;i<crimeCases.size();i++){
			
			CrimeCase oldcrime = crimeCases.get(i);
			
			CrimeCase newcrime = new CrimeCase(oldcrime.id);
			
			newcrime.reportID = oldcrime.reportID;
			newcrime.crimeID = oldcrime.crimeID ;
			newcrime.userID = oldcrime.userID;
			newcrime.date = oldcrime.date;
			newcrime.location = oldcrime.location;
			newcrime.time = oldcrime.time;
			newcrime.crimeType = oldcrime.crimeType;
			newcrime.status = oldcrime.status;
			newcrime.connected = oldcrime.connected;
			
			ArrayList<CrimeCase> supernode = new ArrayList<CrimeCase>();
			
			for (int j=0;j<oldcrime.MasterNode.size();j++){
				CrimeCase node = new CrimeCase(oldcrime.MasterNode.get(j).id);
				
				node.reportID = oldcrime.MasterNode.get(j).reportID;
				node.crimeID = oldcrime.MasterNode.get(j).crimeID ;
				node.userID = oldcrime.MasterNode.get(j).userID;
				node.date = oldcrime.MasterNode.get(j).date;
				node.location = oldcrime.MasterNode.get(j).location;
				node.time = oldcrime.MasterNode.get(j).time;
				node.crimeType = oldcrime.MasterNode.get(j).crimeType;
				node.status = oldcrime.MasterNode.get(j).status;
				node.connected = oldcrime.MasterNode.get(j).connected;
				
				supernode.add(node);
			}
			
			newcrime.MasterNode = supernode;
			newCrimeCases.add(newcrime);
		}
		
		clone = new Graph (newCrimeCases,newDistances);
		clone.edges = newEdges;
		
		return clone;
	}
	
	public static void printGraph(Graph graph){
		
		ArrayList<CrimeCase> crimes = graph.getCrimeCases();
		HashMap<String,String> locations = Gps.getLocations();
		
		for (int i=0;i<crimes.size();i++){
			System.out.println((i+1)+
					String.format("%0$5s", ". ID: "+crimes.get(i).id)+
					String.format("%0$25s", ", Location: "+crimes.get(i).location)+
					String.format("%0$17s",", Distance :"+locations.get(crimes.get(i).location)+
					String.format("%0$17s",", Day :"+crimes.get(i).reportID)+
					String.format("%0$14s",", Time :"+crimes.get(i).crimeID)) );
		}
	}
	
	public static void printDistances(ArrayList<ArrayList<Double>> dist){
		System.out.println("");
		for (int i=0;i<dist.size();i++){
			String row = "";
			for (int j=0;j<dist.size();j++)
				row = row +" "+ dist.get(i).get(j);
			System.out.println(row);
		}
		System.out.println("");
	}
	
	public static int group(Graph graph){
		int edge = 0;
		int sum = 0;
		
		/* take an edge with lowest sums */
		for (int i=0;i<graph.edges.size();i++){
			CrimeCase crime1 = graph.getCrimeCases().get(graph.edges.get(i)[0]);
			CrimeCase crime2 = graph.getCrimeCases().get(graph.edges.get(i)[1]);
			
			int sum1= crime1.MasterNode.size() + crime2.MasterNode.size();
			if (sum == 0){
				sum = sum1;
			}else if(sum1 <sum){
				edge = i;
				sum = sum1;
			}
		}
		
		return edge;
	}

}
