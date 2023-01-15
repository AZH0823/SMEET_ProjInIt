<?php
    include ('../conectDB/Connection.php');
    // $AppointmentDate = $_POST["AppointmentDate"];
    // $Name = $_POST["Name"];
    // $Count = $_POST["Count"];
    // $Scheduled = $_POST["Scheduled"];
    // $Address = $_POST["Address"];
    // $TotalPrice = $_POST["TotalPrice"];
    // $notes = $_POST["notes"];
    // $point = $_POST["point"];
    // $MemberID = htmlentities( $_POST["MemberID"]);
    // $TeamID =$_POST["TeamID"];

    
    $AppointmentDate = $_POST["AppointmentDate"];
    $Name = $_POST["Name"];
    $Count = $_POST["Count"];
    $Scheduled = $_POST["Scheduled"];
    $Address = $_POST["Address"];
    $SetID = $_POST["SetID"];
    $TotalPrice = $_POST["TotalPrice"];
    $notes = $_POST["notes"];
    $point = $_POST["point"];
    $MemberID = htmlentities( $_POST["MemberID"]);
    $TeamID = $_POST["TeamID"];
    
    $detailDishies = $_POST["detailDishies"];
    echo $AppointmentDate."<br>";
    echo $Name."<br>";
    echo $Count."<br>";
    echo $Scheduled."<br>";
    echo $Address."<br>";
    echo $TotalPrice."<br>";
    echo $point."<br>";
    echo $TotalPrice."<br>";
    echo $MemberID."<br>";
    echo $TeamID."<br>";

    // 確認當天廚師是否有班表
    $SecltTeamOrders ="
    SELECT T.ID FROM Orders O
    right join Teams T
    on O.TeamID = T.ID and  O.AppointmentDate = :AppointmentDate
    where O.AppointmentDate is null";

    $SecltTeamOrders = getPDO()->prepare($SecltTeamOrders);
    $SecltTeamOrders->bindValue(':AppointmentDate', $AppointmentDate); 
  
    $result = $SecltTeamOrders -> execute();
    $result = $SecltTeamOrders->fetchAll();
    
    echo $AppointmentDate."<br>";
    $orderBool = false;
    foreach($result as $index => $row){
        $IDValue=$row["ID"];
        if($IDValue == $TeamID){
            $orderBool = true;
        }
       
    }

    if($orderBool){
        // echo "可預約";
        // 建立訂單總覽
        $insertOrders = "INSERT INTO `Orders`
            ( `AppointmentDate`,`Name`, `Count`, `Condition`, `Scheduled`, `Address`,
            `SetID`,`TotalPrice`, `notes`, `point`, `MemberID`, `TeamID`)  
        VALUES 
            (:AppointmentDate,:Name,:Count,'訂單成立已付款',:Scheduled,:Address
            ,:SetID,:TotalPrice,:notes,:point,:MemberID,:TeamID)";
            // 將include Connection Fuction 給引出

            $insertOrders = getPDO()->prepare($insertOrders);
            $insertOrders->bindValue(':AppointmentDate', $AppointmentDate); 
            $insertOrders->bindValue(':Name', $Name); 
            $insertOrders->bindValue(':Count', $Count); 
            $insertOrders->bindValue(':Scheduled', $Scheduled); 
            $insertOrders->bindValue(':Address', $Address); 
            $insertOrders->bindValue(':SetID', $SetID); 
            $insertOrders->bindValue(':TotalPrice', $TotalPrice); 
            $insertOrders->bindValue(':notes', $notes); 
            $insertOrders->bindValue(':point', $point); 
            $insertOrders->bindValue(':MemberID', $MemberID); 
            $insertOrders->bindValue(':TeamID', $TeamID); 
            $result = $insertOrders -> execute();


            // echo "結果為: ".$result;
            if($result)
            {   
                // 扣除會員點數


                // 搜尋訂單ID
                // echo "Success 請新增明細"."<br>";
                $getOrdersID = "
                    select Orders.ID from Member
                    join Orders
                    on Member.ID = Orders.MemberID
                    where Orders.MemberID = :MemberID
                    ORDER BY Orders.ID desc
                    LIMIT 1";

                $getOrdersID = getPDO()->prepare($getOrdersID);
                $getOrdersID->bindValue(':MemberID', $MemberID); 
                $getOrdersID -> execute();
                $OrderID = $getOrdersID->fetch();

                // 得到訂單編號
                $OrderID = $OrderID['ID'];
                
                // 建立訂單明細
                // 單品
                // 服務
                // 套餐
                foreach($detailDishies as $index => $row){
                
                    $qty=$row["qty"];
                    $price=$row["price"];
                    $DishID=$row["id"];

                    // echo $OrderID."<br>".$qty."<br>".$price."<br>".$DishID."<br>";

                    $insertDetailorder = "
                    INSERT INTO `OrdersDetail` 
                        (`OrderID`, `qty`, `price`, `DishID`) 
                        VALUES (:OrderID, :qty, :price, :DishID)";

                    $insertDetailorder = getPDO()->prepare($insertDetailorder);
                    
                    $insertDetailorder->bindValue(':OrderID', $OrderID); 
                    $insertDetailorder->bindValue(':qty', $qty); 
                    $insertDetailorder->bindValue(':price', $price); 
                    $insertDetailorder->bindValue(':DishID', $DishID); 
                    
                    $insertDetailorder -> execute();
                    
                }
                echo $OrderID;
            }else{
                echo "orderBulidFail";
            }
    }else{
        echo "sameOrder";
    }
   
   
    

    
        
        
//     $SearhDishSql = "INSERT INTO `Orders`
// 	( `AppointmentDate`, `Name`, `Count`, `Condition`, `Scheduled`, `Address`, `Date`,
// 	 `TotalPrice`, `notes`, `point`, `MemberID`, `TeamID`)  
// VALUES 
//     ('2022-12-26','test',6,'訂單成立未付款','午餐','100台北市中正區同安街48巷1號',curdate()
//     ,12800,'不吃辣',20,1,1)";
//     // 將include Connection Fuction 給引出
//     $Searhstatement = getPDO()->prepare($SearhDishSql);
//     $Searhstatement -> execute();
?>