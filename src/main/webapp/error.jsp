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

 #logout {
text-align: center;
font-size: 20px;
font-weight: bold;
border-radius: 10px;
font-family:  'Courier New', monospace;
}

#middle{
height: 500px;;
}

#logout{
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
 <img src="once.png"  width="300" height="150"> 
<br>
<br>
<a href="login"><button id="logout">LOGOUT</button></a>


<p id="note"><img src="emoji.png"  width="30" height="30">Developed by Sarb<img src="emoji.png"  width="30" height="30"></p>
</div>


</body>
</html> 