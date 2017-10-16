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
    private static ArrayList<CrimeCase> c = new ArrayList<CrimeCase>();
    private static Graph graph = new Graph();    
    public static void process(){
        mapCoord.put("Athlone","-33.96526 18.501795");
        mapCoord.put("Belhar"," -33.943634 18.6235");
        mapCoord.put("Bellville","-33.894269 18.629438");
        mapCoord.put("Bellville South",	"-33.922112 18.645026");
        mapCoord.put("Bishop Lavis","-33.94789 18.57897");
        mapCoord.put("Bothasig","-33.85966 18.54038");
        mapCoord.put("Brackenfell"," -33.878675	18.694762");
        mapCoord.put("Camps Bay","-33.951298 18.383098");
        mapCoord.put("Cape Town Central","-33.924269 18.418703");
        mapCoord.put("Claremont","-33.98600 18.47212");
        mapCoord.put("Delft","-33.96144 18.64725");
        mapCoord.put("Dieprivier","-34.03423 18.46470");
        mapCoord.put("Durbanville", "-33.825941	18.653191");
        mapCoord.put("Elsies River","-33.93571 18.58357");
        mapCoord.put("Fish Hoek","-34.13409 18.41870");
        mapCoord.put("Goodwood","-33.91167 18.55225");
        mapCoord.put("Grassy Park","-34.06339 18.51070");
        mapCoord.put("Gugulethu","-33.98207 18.57971");
        mapCoord.put("Harare","-34.05829 18.67249");
        mapCoord.put("Hout Bay","-34.02087 18.36826");
        mapCoord.put("Kensington","-33.910505 18.507731");
        mapCoord.put("Khayelitsha","-34.037444 18.676945");
        mapCoord.put("Kirstenhof", "-34.069448 18.454311");
        mapCoord.put("Kleinvlei","-33.987274 18.714064");
        mapCoord.put("Kraaifontein","-33.853419	18.718518");
        mapCoord.put("Kuils Rivier","-33.941385 18.70664");
        mapCoord.put("Langa","-33.938945 18.52973");
        mapCoord.put("Lansdowne","-33.98567 18.500311");
        mapCoord.put("Lingelethu-West", "-34.041414 18.660111");
        mapCoord.put("Macassar","-34.047738 18.748217");
        mapCoord.put("Maitland","-33.920618 18.503279");
        mapCoord.put("Manenberg","-33.983866 18.555222");
        mapCoord.put("Mfuleni","-34.006485 18.685853");
        mapCoord.put("Milnerton","-33.865968 18.534443");
        mapCoord.put("Mitchells Plain",	"-34.048595 18.605687");
        mapCoord.put("Mowbray",	"-33.950033 18.495859");
        mapCoord.put("Muizenberg","-34.089885 18.495859");
        mapCoord.put("Nyanga",	"-33.995381 18.584906");
        mapCoord.put("Ocean View","-34.14954 18.353431");
        mapCoord.put("Parow","-33.906792 18.580811");
        mapCoord.put("Philippi","-34.034498 18.55819");
        mapCoord.put("Pinelands","-33.937426 18.507731");
        mapCoord.put("Ravensmead","-33.922659 18.602719");
        mapCoord.put("Rondebosch","-33.965788 18.48102");
        mapCoord.put("Sea Point","-33.916949 18.387549");
        mapCoord.put("Simon’s Town","-34.193765 18.435665");
        mapCoord.put("Somerset West","-34.07569	18.843266");
        mapCoord.put("Steenberg","-34.07364 18.470633");
        mapCoord.put("Stellenbosch","-33.932104 18.860152");
        mapCoord.put("Strand","-34.11232 18.849207");
        mapCoord.put("Strandfontein","-34.077876 18.573032");
        mapCoord.put("Table View","-33.827537 18.494799");
        mapCoord.put("Woodstock","-33.924158 18.454311");
        mapCoord.put("Wynberg","-34.00845 18.46618");
        
        CollectCrimes crimeData = new CollectCrimes();
        crimeData.createGraph();
        graph = crimeData.getGraph();
        c = crimeData.getCrimeCases();          
    }
    

    
    public static HashMap<String,String> getLocations(){
        return mapCoord;
    }
    
    public static Graph getGraph(){
    	return graph;
    }    
}
