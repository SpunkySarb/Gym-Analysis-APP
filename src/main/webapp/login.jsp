 <!DOCTYPE html>
<html>
<head>
<title>SarbZone</title>
<meta name="viewport" content="width=device-width">
</head>
<style>
#top, #middle{
text-align: center;
background-color: black;
}

#username, #password, #submit {
text-align: center;
font-size: 20px;
font-weight: bold;
border-radius: 10px;
font-family:  'Courier New', monospace;
}

#middle{
height: 500px;;
}

#submit{
background-color: #00b9de;
}

#note{
color: #00b9de;
font-weight: bold;
font-family:  'Courier New', monospace;

}
#error{
color: red;
font-weight: bold;
font-family:  'Courier New', monospace;

}
#note {
  position: relative;
  animation: myfirst 5s linear 2s infinite alternate;
}

@keyframes myfirst {
   0%   { left:0px; top:0px;}
  25%  { left:0px; top:0px;}
  50%  { left:0px; top:20px;}
  75%  { left:0px; top:20px;}
  100% { left:0px; top:0px;}
}
</style>


<body>

<div id="top">

 <img src="logo.png"  width="350" height="150"> 



</div>
<div id="middle">
<br>
<br>
 <img src="login.gif"  width="300" height="100"> 

${error }
<form id="login" action="/dashboard" method="post">
  <input type="text" id="username" name="userName" value="" placeholder="Enter Username"><br><br>
  <input type="password" id="password" name="password" value="" placeholder="Enter Password"><br><br>
  <input id="submit" type="submit" value="LOGIN">
</form> 

<p id="note"><img src="emoji.png"  width="30" height="30">Developed by Sarb<img src="emoji.png"  width="30" height="30"></p>
</div>


</body>
</html> 