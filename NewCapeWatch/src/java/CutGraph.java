import java.util.ArrayList;


public class CutGraph {
	
	private double mincut;
	
	private ArrayList<CrimeCase> subgraph = new ArrayList<CrimeCase>();
	
	public CutGraph(ArrayList<CrimeCase> masternodes,double mincut){
		this.mincut = mincut;
		this.subgraph = masternodes;
	}
	
	public CutGraph(){
		
	}
	
	public double getMinCut(){
		return mincut;
	}
	
	
	public ArrayList<CrimeCase> getSubGraph(){
		return subgraph;
	}

}
