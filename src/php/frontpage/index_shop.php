<?php

    include("../conectDB/Connection.php");// FIXME 连结修正
    //---------------------------------------------------


    //建立SQL語法
    $sql = "SELECT d.ID, `Type`, d.Name,`Price`, `IMG`, `shopPoint`, `Introduction`, `Condition`, `ProductType`
    FROM Dish d
    join DishsType dt
    on d.`type` = dt.ID 
    where ProductType = '商城冷凍'
    limit 8";
   
    //執行
    $statement = getPDO()->prepare($sql); 
    $statement->execute();
    $data = $statement->fetchAll();

    $arr = [];

    foreach($data as $newData){
        $arr[] = array(
            'ID'=>$newData['ID'],
            'Name'=> $newData['Name'],
            'Price'=> $newData['Price'],
            'IMG'=> $newData['IMG'],
        );
    }
    
    //回傳json
    echo json_encode($arr);

    
?>