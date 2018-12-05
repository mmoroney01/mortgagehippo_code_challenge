
<h1>Coin Machine API</h1>

Heroku URL: https://cryptic-gorge-92449.herokuapp.com/

While I could not test routes in browser without disabling user authentication, all routes can be tested using Postman. Precede each path with the Heroku URL, or to test locally run rails s in your command line and precede each path with localhost:3000. In either case, under headers for each route put [key: content-type, value: application/json].

<h3>User Creation</h3>

To make a user, put a json user object like

{
  "user":{
    "email": "gary@bit.coin",
	"password": "sharkweek",
	"username": "passenger",
	"role": "admin"
  }
}

in the body of POST /users/create.

<h3>Token Generation</h3>

To get a token, put a json auth object like

{
  "user":{
    "email": "gary@bit.coin",
	"password": "sharkweek"
  }
}

in the body of POST /user_token.

<h3>Authorization</h3>

To log in, under headers put [key: authorization, value: Bearer #{token}] of GET /auth. These headers will be needed for any action that is forbidden to users without tokens.

<h3>Using Coins</h3>

To use coin routes, put json coin objects like

{
  "coin":{
    "name": "railscoin",
    "value": "500"
  }
}

in the body of the coin route.

<h3>Using Transactions</h3>

To to use transaction routes, put json transaction objects like

{
  "transaction":{
    "coin_id": "1",
    "user_id": "1",
    "deposit": true,
    "withdrawal": false
  }
}

in the body of the transaction route. 

<h1>RESTful Routes</h1>

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
      <td>GET</td>
      <td>/users</td>
      <td>Index</td>
      <td>Informs you that you are logged in</td>
    </tr>
    <tr>
      <td>GET</td>
      <td>/users/transactions</td>
      <td>Transactions</td>
      <td>See all transactions associated with a user</td>
    </tr>
    <tr>
      <td>POST</td>
      <td>/users</td>
      <td>Create</td>
      <td>Create a user. Will send a welcome email if created successfully.</td>
    </tr>
    <tr>
      <td>PUT</td>
      <td>/user/:id</td>
      <td>Update</td>
      <td>Update a user</td>
    </tr>
    <tr>
      <td>DELETE</td>
      <td>/user/:id</td>
      <td>Destroy</td>
      <td>Destroy a user</td>
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
  	  <td>GET</td>
  	  <td>/transactions</td>
  	  <td>Index</td>
  	  <td>See all transactions. Includes both deposits and withdrawals.</td>
  	</tr>
  	<tr>
  	  <td>POST</td>
  	  <td>/transactions</td>
  	  <td>Create</td>
  	  <td>Create a transaction. Will send email alert if it is a withdrawal and there are four or fewer coins of the type you are withdrawing.</td>
  	</tr>
  </tbody>
</table>
