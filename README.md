
<h1>Coin Machine API, code challenge for Mortgage Hippo</h1>

Heroku URL: https://cryptic-gorge-92449.herokuapp.com/

All routes can be tested using Postman; under headers put [key: content-type, value: application/json].

To make a user, put a json user object like

{
  "user":{
    "email": "gary@bit.coin",
	"password": "sharkweek",
	"username": "passenger",
	"role": "admin"
  }
}

in the body .

To get a token, put a json auth object like

{
  "user":{
    "email": "gary@bit.coin",
	"password": "sharkweek",
  }
}

in the body.


<table>
  <thead>
  	<tr>
  	  <th>HTTP Request Type</th>
  	  <th>URL Path</th>
  	  <th>Action</th>
  	  <th>Description</th>
  	</tr>
  </thead>
  <tbody>
  	<tr>
  	  <td>GET</td>
  	  <td>/coins</td>
  	  <td>Index</td>
  	  <td>See all coins</td>
  	</tr>
  </tbody>
</table>
