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

public class Graph {

	private ArrayList<CrimeCase> crimeCases = new ArrayList<CrimeCase>();
	
	public ArrayList<int[]> edges = new ArrayList<int[]>();
	
	private ArrayList<ArrayList<Double> > distances = new ArrayList<ArrayList<Double> >(); ;
	
	public Graph(ArrayList<CrimeCase> crimeCases,ArrayList<ArrayList<Double> > distances){
		
		this.crimeCases = crimeCases;
		this.distances = distances;
		
	}
	
	public Graph(){
		
	}
	
	public ArrayList<CrimeCase> getCrimeCases(){
		return crimeCases;
	}
	
	public ArrayList<ArrayList<Double> > getDistances(){
		return distances;
	}
}

