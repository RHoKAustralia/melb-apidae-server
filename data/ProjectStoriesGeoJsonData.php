<?php

include '../config.php';

$qur = mysql_query("select story_name, latitude, longitude from `project_story`");
$result =array();
while($r = mysql_fetch_array($qur)){
    extract($r);
    $result[] = array("story_name" => $story_name, "latitude" => $latitude, "longitude" => $longitude); 
}

    
if (!empty($result)) {
		$json = array("status" => 1, "info" => $result);
}else{
   $json = array("status" => 0, "msg" => "User ID not define");
}
@mysql_close($conn);

/* Output header */
header('Content-type: application/json');
if ($_GET['callback']) {
        print $_GET['callback']."(";
    }
echo json_encode($json);
    if ($_GET['callback']) {
        print ")";
    }
exit;
