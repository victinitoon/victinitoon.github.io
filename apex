
<?php
	{
		//API Key
		$header = array(
		    "TRN-Api-Key:入手したAPI Key"
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
		$ts4w = ($profile["data"]["segments"][0]["stats"]["season4Wins"]["value"]);
		 
		curl_close($ch);
	}
 
	{
		// JSON化したスプレッドシートを読み込む
		$data = "JSON化したスプレッドシートのURL";
		$json = file_get_contents($data);
		$json_decode = json_decode($json);
 
		// JSONデータ内の『entry』部分を複数取得して、postsに格納
		$posts = $json_decode->feed->entry;
 
		foreach ($posts as $post) {
		    $ytk[] = $post->{'gsx$kills'}->{'$t'};
		}
		foreach ($posts as $post) {
		    $ytd[] = $post->{'gsx$damage'}->{'$t'};
		}
		foreach ($posts as $post) {
		    $ytw[] = $post->{'gsx$s4win'}->{'$t'};
		}
		$i=0;
		$todaykills = $tk - $ytk[$i];
		$todaydamage = $td - $ytd[$i];
		$todaywins = $ts4w - $ytw[$i];
	}
?>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja" lang="ja">
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<title>Apex Stats</title>
</head>
<body>
    <header>
    </header>
    <main>
        <div class="apex_stats">
            <h1>Apex Stats</h1>
    <?php
        //出力
        echo '<p><span class="title">Season 4 Wins : </span><span class="value">';
        echo number_format($ts4w);
        echo "</span></p>";
 
        echo '<p><span class="title">Today&#39;s CHAMPION : </span><span class="value">';
        echo number_format($todaywins);
        echo "</span></p>";
 
        echo '<p><span class="title">Total Kills : </span><span class="value">';
        echo number_format($tk);
        echo "</span></p>";
 
        echo '<p><span class="title">Today&#39;s Kills : </span><span class="value">';
        echo number_format($todaykills);
        echo "</span></p>";
 
        echo '<p><span class="title">Total Damage : </span><span class="value">';
        echo number_format($td);
        echo "</span></p>";
 
        echo '<p><span class="title">Today&#39;s Damage : </span><span class="value">';
        echo number_format($todaydamage);
        echo "</span></p>";
 
 
    ?>
        </div>
        <footer>
        </footer>
    </main>
</body>
</html>
