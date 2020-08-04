<?php
//API Key
$header = array(
    "TRN-Api-Key:13f04252-afbb-44f1-a380-21c08889133a"
);
 
//user情報取得
$ch = curl_init();
curl_setopt($ch,CURLOPT_URL,"https://public-api.tracker.gg/v2/apex/standard/profile/psn/victinitoon");
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
 
$response = curl_exec($ch);
$profile = json_decode($response, true);

$tk = ($profile['data']['segments'][0]['stats']['kills']['value']);
$td = ($profile["data"]["segments"][0]["stats"]["damage"]["value"]);

curl_close($ch);
?>
