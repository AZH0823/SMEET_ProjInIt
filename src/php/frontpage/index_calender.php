<?php

    include("../conectDB/Connection.php");

    //建立sql語法

    //團隊、訂單日期、

    $sql = "SELECT `AppointmentDate`, `TeamID` FROM Orders";

    $statement = getPDO()->prepare($sql);

    $statement->execute(); //執行上面的

    $data = $statement->fetchAll();//這邊是拿回來的資料

    echo json_encode($data); //更改成json格式
  //取預約日 若當天滿3組則顯示灰色 未滿3則顯示可選擇
?>