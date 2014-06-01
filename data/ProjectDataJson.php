<?php

include '../config.php';

$projectid = isset($_GET['project_id']) ? mysql_real_escape_string($_GET['project_id']) :  "";
	if(!empty($projectid) && is_numeric($projectid)){
            $extrastring = " where project_id='$projectid' ";
    }
    else {
    	$extrastring = "";
    }

$qur = mysql_query("SELECT * FROM `project`".$extrastring);
$result =array();
while($r = mysql_fetch_array($qur)){
    extract($r);
    $result[] = array("project_id" => $project_id, "project_name" => $project_name, "project_desc" => $project_desc); 
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
