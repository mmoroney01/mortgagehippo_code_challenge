
<h1>Coin Machine API</h1>

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

in the body OF ROUTE??.

To get a token, put a json auth object like

{
  "user":{
    "email": "gary@bit.coin",
	"password": "sharkweek"
  }
}

in the body OF ROUTE??.

To log in, under headers put [key: authorization, value: Bearer #{token}] OF ROUTE??




<h1>Routes</h1>

Routing for Users:

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
      <th>GET</th>
      <th>/users</th>
      <th>Index</th>
      <th>Informs that you are logged in</th>
    </tr>
    <tr>
      <th>GET</th>
      <th>/users/transactions</th>
      <th>Transactions</th>
      <th>See all transactions associated with a user</th>
    </tr>
    <tr>
      <th>POST</th>
      <th>/users</th>
      <th>Create</th>
      <th>Create a user. Will send a welcome email if created successfully.</th>
    </tr>
    <tr>
      <th>PUT</th>
      <th>/user/:id</th>
      <th>Update</th>
      <th>Update a user</th>
    </tr>
    <tr>
      <th>DELETE</th>
      <th>/user/:id</th>
      <th>Destroy</th>
      <th>Destroy a user</th>
    </tr>
  </tbody>
</table>

Routing for Coins:

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
  	<tr>
  	  <td>GET</td>
  	  <td>/coins/:id</td>
  	  <td>Show</td>
  	  <td>See one coin</td>
  	</tr>
  	<tr>
  	  <td>GET</td>
  	  <td>/coins/total_value</td>
  	  <td>total_value</td>
  	  <td>See total value of all coins</td>
  	</tr>
  	<tr>
  	  <td>POST</td>
  	  <td>/coins</td>
  	  <td>Create</td>
  	  <td>Create a coin</td>
  	</tr>
  	<tr>
  	  <td>PUT</td>
  	  <td>/coins/:id</td>
  	  <td>Update</td>
  	  <td>Update a coin</td>
  	</tr>
  	<tr>
  	  <td>DELETE</td>
  	  <td>/coins/:id</td>
  	  <td>Destroy</td>
  	  <td>Destroy a coin</td>
  	</tr>
  </tbody>
</table>

Routing for Transactions:

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
  	  <th>GET</th>
  	  <th>/transactions</th>
  	  <th>Index</th>
  	  <th>See all transactions, both deposits/withdrawals</th>
  	</tr>
  	<tr>
  	  <th>POST</th>
  	  <th>/transactions</th>
  	  <th>Create</th>
  	  <th>Create a transaction. Will send email alert if it is a withdrawal and there are four or fewer coins of the type you are withdrawing.</th>
  	</tr>
  </tbody>
</table>
