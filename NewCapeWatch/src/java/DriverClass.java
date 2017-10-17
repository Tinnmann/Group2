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
		
		clonedGraph = cloneGraph(testgraph);
		//MINCUT(testgraph);
		
		//HCS(testgraph,new CutGraph(),false);
		
		
		Gps.process();
		
		Graph graph = Gps.getGraph();
		
		clonedGraph = cloneGraph(graph);
		
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		long startTime = System.currentTimeMillis();
		
//		HCS(graph,new CutGraph(),false);
		
		
		for (int i=0;i<disconnectedGraphs.size();i++){
			System.out.println("\n############### Disconnected "+i+"###############");
//			printGraph(disconnectedGraphs.get(i));
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

	public static Graph cloneGraph(Graph graph){
		Graph clone = new Graph ();
		
		ArrayList<ArrayList<Double>> distances = graph.getDistances();
		
		ArrayList<ArrayList<Double>> newDistances = new ArrayList<ArrayList<Double>>();
		
		ArrayList<int[]> edges = graph.edges;
		
		ArrayList<int[]> newEdges = new ArrayList<int[]>();
		
		ArrayList<CrimeCase> crimeNodes = graph.getCrimeCases();
		
		ArrayList<CrimeCase> newCrimeNodes = new ArrayList<CrimeCase>();
		
		
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
		
		for (int i=0;i<crimeNodes.size();i++){
			
			CrimeCase oldcrime = crimeNodes.get(i);
			
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
			newCrimeNodes.add(newcrime);
		}
		
		clone = new Graph (newCrimeNodes,newDistances);
		clone.edges = newEdges;
		
		return clone;
	}        
}