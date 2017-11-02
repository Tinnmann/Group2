/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author TINASHE
 */

import java.util.*;

public class Gps {
    private static HashMap<String, String> mapCoord = new HashMap<>();
    private static ArrayList<int[]> edgeConnectivity = new ArrayList<int[]>();
    private static ArrayList<CrimeCase> c = new ArrayList<CrimeCase>();
    private static Graph graph = new Graph();    
    public static void getData(){
        mapCoord.put("Athlone","-33.96526 18.501795");
        mapCoord.put("Belhar","-33.943634 18.6235");
        mapCoord.put("Bellville","-33.894269 18.629438");
        mapCoord.put("Bellville South","-33.922112 18.645026");
        mapCoord.put("Bishop Lavis","-33.94789 18.57897");
        mapCoord.put("Bothasig","-33.85966 18.54038");
        mapCoord.put("Brackenfell","-33.878675 18.694762");
        mapCoord.put("Camps Bay","-33.951298 18.383098");
        mapCoord.put("Cape Town Central","-33.924269 18.418703");
        mapCoord.put("Claremont","-33.98600 18.47212");
        mapCoord.put("Delft","-33.96144 18.64725");
        mapCoord.put("Dieprivier","-34.03423 18.46470");
        mapCoord.put("Durbanville", "-33.825941 18.653191");
        mapCoord.put("Elsies River","-33.93571 18.58357");
        mapCoord.put("Fish Hoek","-34.13409 18.41870");
        mapCoord.put("Goodwood","-33.91167 18.55225");
        mapCoord.put("Grassy Park","-34.06339 18.51070");
        mapCoord.put("Gugulethu","-33.98207 18.57971");
        mapCoord.put("Harare","-34.05829 18.67249");
        mapCoord.put("Hout Bay","-34.02087 18.36826");
        mapCoord.put("Kensington","-33.910505 18.507731");
        mapCoord.put("Khayelitsha","-34.037444 18.676945");
        mapCoord.put("Kirstenhof","-34.069448 18.454311");
        mapCoord.put("Kleinvlei","-33.987274 18.714064");
        mapCoord.put("Kraaifontein","-33.853419 18.718518");
        mapCoord.put("Kuils Rivier","-33.941385 18.70664");
        mapCoord.put("Langa","-33.938945 18.52973");
        mapCoord.put("Lansdowne","-33.98567 18.500311");
        mapCoord.put("Lingelethu-West","-34.041414 18.660111");
        mapCoord.put("Macassar","-34.047738 18.748217");
        mapCoord.put("Maitland","-33.920618 18.503279");
        mapCoord.put("Manenberg","-33.983866 18.555222");
        mapCoord.put("Mfuleni","-34.006485 18.685853");
        mapCoord.put("Milnerton","-33.865968 18.534443");
        mapCoord.put("Mitchells Plain","-34.048595 18.605687");
        mapCoord.put("Mowbray",	"-33.950033 18.495859");
        mapCoord.put("Muizenberg","-34.089885 18.495859");
        mapCoord.put("Nyanga","-33.995381 18.584906");
        mapCoord.put("Ocean View","-34.14954 18.353431");
        mapCoord.put("Parow","-33.906792 18.580811");
        mapCoord.put("Philippi","-34.034498 18.55819");
        mapCoord.put("Pinelands","-33.937426 18.507731");
        mapCoord.put("Ravensmead","-33.922659 18.602719");
        mapCoord.put("Rondebosch","-33.965788 18.48102");
        mapCoord.put("Sea Point","-33.916949 18.387549");
        mapCoord.put("Simons Town","-34.193765 18.435665");
        mapCoord.put("Somerset West","-34.07569 18.843266");
        mapCoord.put("Steenberg","-34.07364 18.470633");
        mapCoord.put("Stellenbosch","-33.932104 18.860152");
        mapCoord.put("Strand","-34.11232 18.849207");
        mapCoord.put("Strandfontein","-34.077876 18.573032");
        mapCoord.put("Table View","-33.827537 18.494799");
        mapCoord.put("Woodstock","-33.924158 18.454311");
        mapCoord.put("Wynberg","-34.00845 18.46618");
        
        CollectCrimes crimeData = new CollectCrimes();
        crimeData.createGraph();
        graph = crimeData.getGraph();
        c = crimeData.getCrimeCases();  
        graph = new Graph(c,calcDistances());
        graph.edges = edgeConnectivity;
    }
    

    
    public static HashMap<String,String> getLocations(){
        return mapCoord;
    }
    
    public static Graph getGraph(){
    	return graph;
    }    
    
    public static ArrayList<ArrayList<Double>> calcDistances()
    {
        ArrayList<double[]> weights = new ArrayList<>();   //arraylist of arrays of weights to be used
        ArrayList<String[]> crimes = new ArrayList<>();    //arraylist of the crimes' useful attributes
        String numbers = "";

        double dist = 0;
        
        int size = c.size();
        
        ArrayList<ArrayList<Double> > edges = new ArrayList<ArrayList<Double> >();
        String date = "";
        String time = "";
        String location = "";
		
        for(CrimeCase entry:c)
        {
            date = entry.date;
            time = entry.time;
            int hours = Integer.parseInt(time.substring(0,time.indexOf(":")));
                if(hours>=0 && hours <12){
                    time="morning";
                }
		else if (hours>=12 && hours<16){
                    time="noon";
                    
                }
		else if (hours>=16 && hours<21){
                    time="evening";
                }
		else if (hours>=21 && hours<24){
                    time="night";
                }
            location = entry.location;

            crimes.add(new String[]{date,time,location});
            time = "";
            date = "";
            location = "";
        }
        System.out.println(crimes.size());
        for(String[] item:crimes)
        {
            System.out.println(item[0]+" "+item[1]+ " "+item[2]);
            numbers = mapCoord.get(item[2]); 
            String[] coords = numbers.split(" ");//get coordinates from hashmap
            double c1 = Double.parseDouble(coords[0]);
            double c2 = Double.parseDouble(coords[1]);
            double weightedVars[] = new double[4];
            weightedVars[0] = c1;            //lattitude
            weightedVars[1] = c2;            //longitude
            
            switch(item[1])                            
            {
                case "morning":                           //weighted times
                    weightedVars[2]= 0;
                    weightedVars[3]= 25;
                    break;
                case "noon":
                    weightedVars[2]= 25;
                    weightedVars[3]= 0;
                    break;
                case "evening":
                    weightedVars[2]= 0;
                    weightedVars[3]= -25;
                    break;
                case "night":
                    weightedVars[2]= -25;
                    weightedVars[3]= 0;
                    break;
            }
            weights.add(weightedVars);    
        }
       
        double diff=0;
        int count=0;
        double totRow=0;
        double meanRow=0;
        double stdv=0;
        double sd=0;
        
        /******************Standardiztion of all critical attributes**************/
          for(count =0;count<4;count++)
          {
              for(int i=0;i<weights.size();i++)
              {
                  totRow+=weights.get(i)[count];          //sum of attribute weights.get(i)[count] for all crimes
              }
              meanRow=totRow/weights.size();              //mean of attribute weights.get(i)[count] for all crimes
              for(int j=0;j<weights.size();j++)
              {
                  diff+=Math.pow((weights.get(j)[count] - meanRow),2);
              }
              stdv=Math.sqrt(diff/(weights.size()-1));   //standard deviation of the attribute
              for(int k=0;k<weights.size();k++)
              {
                  sd=(weights.get(k)[count]-meanRow)/stdv; //standardized value of the attribute
                  
                  if (count == 0 || count == 1)
                      sd = sd*100;                      //the coordinate attributes are the most important
                                                        //hence multiplied by 100
                  weights.get(k)[count]=sd;
              }
              totRow=0;                                //reset counters
              diff=0;
          }
          
          
          double dif=0;
          double diffSqre=0;
          double diffTot = 0;
          double answer = 0;
          double sum=0;
          
          for(int l=0;l<weights.size();l++)
          {
        	  ArrayList<Double> node = new ArrayList<Double>();
          	  edges.add(node);
          	  
              for(int m=0;m<weights.size();m++)
              {
                  for(count=0;count<4;count++)
                  {
                      dif= weights.get(l)[count] - weights.get(m)[count];//Calculate distance between
                      diffSqre = Math.pow(dif, 2);                        //crime nodes
                      diffTot+=diffSqre;
                  }
                  answer = Math.sqrt(diffTot);
                  System.out.println(answer);
                  if(0.0<answer && answer>58)               //set cut-off to determine connectivity
                {
                	
                     edges.get(l).add(m, -1.0);
                    
                    edgeConnectivity.add(new int[]{l,m});
                }else{ 
                
                	if (answer ==0){
                		edges.get(l).add(m, 0.0);
                	}
                	else{
                		edges.get(l).add(m, 1.0);
                	}
                }
                  diffTot=0;
              }
          }
        
        return edges;
    }    
}
