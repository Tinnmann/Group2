/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Random;
import java.util.concurrent.ForkJoinPool;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author TINASHE
 */
public class DriverClass extends HttpServlet {

	private static int cutoff = 140;
	
	private static double[][] distancesArr = new double[][]{
                                {0,1,-1,-1,-1,-1,-1,-1,-1,-1,1,1},
                                {1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,1},
                                {-1,1,0,1,-1,-1,-1,-1,-1,-1,1,1},
                                {-1,-1,1,0,1,1,-1,-1,-1,1,-1,-1},
                                {-1,-1,-1,1,0,1,-1,-1,-1,-1,-1,-1},
                                {-1,-1,-1,1,1,0,1,-1,-1,-1,-1,-1},
                                {-1,-1,-1,-1,-1,1,0,1,1,1,-1,-1},
                                {-1,-1,-1,-1,-1,-1,1,0,1,1,-1,-1},
                                {-1,-1,-1,-1,-1,-1,1,1,0,1,-1,-1},
                                {-1,-1,-1,1,-1,-1,1,1,1,0,1,-1},
                                {1,-1,1,-1,-1,-1,-1,-1,-1,1,0,1},
                                {1,1,1,-1,-1,-1,-1,-1,-1,-1,1,0}
                                

                                            };
	public static ArrayList<int[]> edges = new ArrayList<int[]>();
	
	public static ArrayList<Graph> disconnectedGraphs = new ArrayList<Graph>();
	
	public static int singletons = 0;
	
	private final static ForkJoinPool fjPool1 = new ForkJoinPool();
	
	/* to be used for subgraph */
	private static Graph clonedGraph = new Graph();
	
	/* To be used for creating statistics */
	private static Stats statistics;
        
        /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
                                     throws ServletException, IOException{
        response.setContentType("text/html");
        PrintWriter writer = response.getWriter();
            try {
                process(response);
            } catch (SQLException ex) {
                Logger.getLogger(DriverClass.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(DriverClass.class.getName()).log(Level.SEVERE, null, ex);
            }
    }
	
	public static void process(HttpServletResponse response) throws SQLException, ClassNotFoundException, FileNotFoundException, IOException {
		
		System.out.println("Array Dimensions "+distancesArr.length+"x"+distancesArr[0].length);
		
		ArrayList<ArrayList<Double>> distances = new ArrayList<ArrayList<Double>>();
		
		ArrayList<CrimeCase> testcrimes = new ArrayList<CrimeCase>();
		
		for (int i=0;i<distancesArr.length;i++){
			CrimeCase crime = new CrimeCase(i+1);
			testcrimes.add(crime);
			
			ArrayList<Double> node = new ArrayList<Double>();
			
			for (int j=0;j<distancesArr.length;j++){
				node.add(distancesArr[i][j]);
			}
			
			distances.add(node);
		}
		
		Graph testgraph = new Graph(testcrimes,distances);
		
		for (int i=0;i<distances.size();i++){
			for (int j=i;j<distances.size();j++){
				
				if (distances.get(i).get(j) > 0){
					edges.add(new int[]{i,j});
				}
			}
		}
		
		testgraph.edges = edges;
		System.out.print(testgraph.edges);
		clonedGraph = cloneGraph(testgraph);
		//MINCUT(testgraph);
		
		//HCS(testgraph,new CutGraph(),false);
		
		
		Gps.getData();
		
		Graph graph = Gps.getGraph();
		
		clonedGraph = cloneGraph(graph);
		
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		long startTime = System.currentTimeMillis();
		
		HCS(graph,new CutGraph(),false);
		
		
		for (int i=0;i<disconnectedGraphs.size();i++){
			System.out.println("\n############### Disconnected "+i+"###############");
			printGraph(disconnectedGraphs.get(i));
		}
		
		long endTime   = System.currentTimeMillis();
		long totalTime = endTime - startTime;
		System.out.println("\n *** TIME TO RUN *** ");
		System.out.println(totalTime);
		
		System.out.println("Saving clusters ... ");
		
		CollectCrimes.saveGraph(disconnectedGraphs);
		
		statistics = new Stats(disconnectedGraphs,clonedGraph.getCrimeCases());
		
		System.out.println("\nCreating statistics .... "+clonedGraph.getCrimeCases().size());
		statistics.createStatistics();
                
                response.sendRedirect("hotspots.html");
		//MINCUT(graph);
		//System.out.println(" dists size "+graph.getDistances().size());
		//printDistances(graph.getDistances());
	
	}

	public static void HCS(Graph graph,CutGraph superNodes,boolean cut){
		
		if (!cut){
			superNodes = MINCUT(graph);
		}
		
		ArrayList<Graph> subgraphs = new ArrayList<Graph>();
		
		for (int i=0;i<superNodes.getSubGraph().size();i++){
			subgraphs.add( createGraph(superNodes.getSubGraph().get(i), clonedGraph));
		}
		
		/* Iterate the subgraphs finding connectivity */
		for (int i=0;i<subgraphs.size();i++){
			
			/* get its size and clone it */  
			int size = subgraphs.get(i).getCrimeCases().size();
			Graph subgraph = cloneGraph(subgraphs.get(i));
			
			/* search for mincut*/
			CutGraph cutGraph = MINCUT(subgraphs.get(i));
			double mincut = cutGraph.getMinCut();
			
			
			if (mincut == 1 || mincut> size/2.0){
				disconnectedGraphs.add(subgraph);
			}else{
				HCS(subgraph,cutGraph,true);
			}	
		}
	}        
        
	public static CutGraph MINCUT (Graph graph){
		
		//CutGraph cutGraph = KARGER(graph,graph.getDistances().size());
		Karger karger = new Karger (graph,graph.getDistances().size());
		
		//fjPool1.invoke(karger);
		
		//CutGraph cutGraph = karger.join();
		
		CutGraph cutGraph = KARGER(graph,graph.getDistances().size());
		
		//System.out.println(" ############### MinCut ###############");
		//printGraph(cutGraph);
		
		return cutGraph;
	}
        
	public static Graph createGraph(CrimeCase superNode,Graph graph ){
		Graph newGraph = new Graph();
		
		ArrayList<CrimeCase> newCrimes = superNode.MasterNode;
		
		ArrayList<ArrayList<Double>> distances = graph.getDistances();
		
		ArrayList<ArrayList<Double>> newDistances = new ArrayList<ArrayList<Double>>();
		
		/* make new distances 2d arraylist */
		for (int i=0;i<newCrimes.size();i++){
			
			ArrayList<Double> crime = new ArrayList<Double>();
			newDistances.add(crime);
			
			/* get id from the list and put in distances */
			for (int j=0;j<newCrimes.size();j++){
				/* id's start from 1 so subtract 1 */
				double value = distances.get( newCrimes.get(i).id - 1).get(newCrimes.get(j).id - 1) ;
				newDistances.get(i).add(j,value);
			}
			
		}
		
		/* make new edges */
		ArrayList<int[]> newEdges = new ArrayList<int[]>();
		
		/* redo the edges */
		for (int i=0;i<newDistances.size();i++){
			for (int j=i;j<newDistances.size();j++){
				
				if (newDistances.get(i).get(j) > 0){
					newEdges.add(new int[]{i,j});
				}
			}
		}
		
		newGraph = new Graph(newCrimes,newDistances);
		newGraph.edges = newEdges;
		
		return newGraph;
	}        

	public static CutGraph KARGER(Graph graph,int graphSize){
		
		/* has the super nodes of minimum cut up to a certain point in the tree */
		CutGraph cutGraph = new CutGraph();
		
		Random rand = new Random();
		int size = graph.edges.size();
		
		int superNodesNum = graph.getDistances().size();
		
		if (superNodesNum < Math.ceil(graphSize/(Math.sqrt(2.0))) ){
			
			//System.out.println(" \n ^^^^^^^^^^ split ^^^^^^^^^^ "+graphSize+" "+superNodesNum);
			
			Graph cloned1 = cloneGraph (graph);
			Graph cloned2 = cloneGraph (graph);
			
			CutGraph cutGraph1 = KARGER (cloned1,cloned1.getDistances().size());
			CutGraph cutGraph2 = KARGER (cloned2,cloned2.getDistances().size());
			

			/* The values to be returned */
			if (cutGraph1.getMinCut() < cutGraph2.getMinCut()){
				cutGraph = cutGraph1;
			}else{
				cutGraph = cutGraph2;
			}
		}else if (size>1){
			
			ArrayList<CrimeCase> crimes = graph.getCrimeCases();
			
			//System.out.println(" edges size "+size);
			/* Not inclusive */
			int randomNum = rand.nextInt( size - 1 );
			
			/* change it so that we are not left with singletons */
			if (graph.getCrimeCases().size() < cutoff ){
				randomNum = group(graph);
			}
			
			int[] edge = graph.edges.get(randomNum);
			
			
			ArrayList<ArrayList<Double> > distances = graph.getDistances();
			
			int joined = edge[1];
			int kept = edge[0];
			
			int joinedId = crimes.get(edge[1]).id;
			int keptId = crimes.get(edge[0]).id;
			
			//System.out.println(" joinedId "+joinedId+" "+crimes.get(joined).MasterNode.size()+" keptId "+keptId+" "
					//+crimes.get(kept).MasterNode.size());
			
			/* the first node in the edge is kept the other discarded */
			CrimeCase keptNode = graph.getCrimeCases().get(edge[0]);
			keptNode.MasterNode.addAll( graph.getCrimeCases().get(edge[1]).MasterNode );
			
			 graph.getCrimeCases().set(edge[0], keptNode);
			
			
			//System.out.println(" dists "+graph.getDistances().size()+" joined "+joined+" kept "+kept+" edges "+graph.edges.size());
			
			
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
			
			//System.out.println(" dist is "+distances.size()+" "+distances.get(0).size());
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
			
			//if (graph.getCrimeNodes().size() > 2){
			if (graph.edges.size() > 1){
				return KARGER(graph,graphSize);
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
			
			newcrime.date = oldcrime.date;
			newcrime.time = oldcrime.time ;
			newcrime.reportID = oldcrime.reportID;
			newcrime.crimeID = oldcrime.crimeID;
			newcrime.userID = oldcrime.userID;
			newcrime.crimeType = oldcrime.crimeType;
			newcrime.status = oldcrime.status;
			newcrime.location = oldcrime.location;
			newcrime.connected = oldcrime.connected;
			
			ArrayList<CrimeCase> supernode = new ArrayList<CrimeCase>();
			
			for (int j=0;j<oldcrime.MasterNode.size();j++){
				CrimeCase ccase = new CrimeCase(oldcrime.MasterNode.get(j).id);
				
				ccase.reportID = oldcrime.MasterNode.get(j).reportID;
				ccase.crimeID = oldcrime.MasterNode.get(j).crimeID ;
				ccase.userID = oldcrime.MasterNode.get(j).userID;
				ccase.date = oldcrime.MasterNode.get(j).date;
				ccase.location = oldcrime.MasterNode.get(j).location;
				ccase.time = oldcrime.MasterNode.get(j).time;
				ccase.crimeType = oldcrime.MasterNode.get(j).crimeType;
				ccase.status = oldcrime.MasterNode.get(j).status;
				ccase.connected = oldcrime.MasterNode.get(j).connected;
				
				supernode.add(ccase);
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
					String.format("%0$17s",", Date :"+crimes.get(i).date)+
					String.format("%0$14s",", Time :"+crimes.get(i).time)) );
		}
	}
        
	public static void printGraph(CutGraph graph){
		
		ArrayList<CrimeCase> crimes = graph.getSubGraph();
		System.out.println("Mincut is "+graph.getMinCut());
		for (int i=0;i<crimes.size();i++){
			
			System.out.println("*********** graph "+i+" ************");
			ArrayList<CrimeCase> master = crimes.get(i).MasterNode;
			
			for (int j=0;j<master.size();j++){
				System.out.println("graph "+i+": "+master.get(j).id);
			}
		}
		
	} 


}