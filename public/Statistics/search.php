<?php

$link = mysqli_connect("shareddb1c.hosting.stackcp.net", "statistics-32301843", "MEzdpFu4SwjQ", "statistics-32301843");


 $query1 ="SELECT Precinct, `Murder`,`Sexual Offences`, `Attempted murder`, `Assault with the intent to inflict grievous bodily harm`, `Common assault`, `Common robbery`, `Robbery with aggravating circumstances`, `Arson`, `Malicious damage to property`, `Burglary at non-residential premises`, `Burglary at residential premises`, `Theft of motor vehicle and motorcycle`, `Theft out of or from motor vehicle`, `Stock-theft`, `Illegal possession of firearms and ammunition`, `Drug-related crime`, `Driving under the influence of alcohol or drugs`, `Sexual offences as result of police action`, `Carjacking`, `Truck hijacking`, `Robbery at residential premises`, `Robbery at non-residential premises` FROM StatCrimes  WHERE Precinct = 'Mowbray'";
                            
 $result = mysqli_query($link, $query1)  or die('Query fail: ' . mysqli_error());
                            
                        
$data = array();
while($row = mysqli_fetch_assoc($result)) { 
                                
$data[]= $row;
                               
}
print json_encode($data);
                            
                            
                        
                            
                            

?>