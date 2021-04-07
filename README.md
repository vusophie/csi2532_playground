## Laboratoire 8
Soumission au laboratoire 8.

### E1. Configurer PHPAPP
![Ex1](https://github.com/vusophie/csi2532_playground/blob/lab08/Ex1.png)

### E2. Créer un client
Schéma :
``` 
CREATE TABLE clients (
  name VARCHAR(100), 
  token VARCHAR(100) UNIQUE,
  data JSONB)
); 
```
### E3. Créer un API
index.php
```
<?php

$dbconn = pg_connect("host=localhost user=postgres port=5432 dbname=phpapp password=Marilechat1!");
$result = pg_query($dbconn, "SELECT migration, migrated_at FROM schema_migrations");
$data = pg_fetch_all($result);
?>

<style>
.table-container {
  margin: 20px;
}
table {
  width: 100%;
}
table tr th {
  text-align: left;
  background-color: #D9E2EC;
}

</style>

<div class="table-container">
  <table>
    <tr>
      <th>migration</th>
      <th>migrated_at</th>
    </tr>
    <?php foreach ($data as $row) {?>
      <tr>
        <td><?php echo $row["migration"] ?></td>
        <td><?php echo $row["migrated_at"] ?></td>
      </tr>
    <?php } ?>
  </table>
</div>
api.php
```
api.php
```
<?php
	
foreach (getallheaders() as $name => $value) {
    echo "$name: $value <br>";
}
```
![server_conn](https://github.com/vusophie/csi2532_playground/blob/lab08/server_conn.png)
![curl_success](https://github.com/vusophie/csi2532_playground/blob/lab08/curl_success.png)
![getallheaders_success](https://github.com/vusophie/csi2532_playground/blob/lab08/getallheaders_success.png)

