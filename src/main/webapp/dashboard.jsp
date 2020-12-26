 <!DOCTYPE html>
<html>
<head>
<title>SarbZone</title>
<meta name="viewport" content="width=device-width">
<script src="https://code.jscharting.com/2.9.0/jscharting.js"></script>

</head>
<style>
#top, #middle{
text-align: center;
background-color: black;
}

 #submit {
text-align: center;
font-size: 25px;
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

#welcome{
color: #00b9de;
font-weight: bold;
font-family:  'Courier New', monospace;
font-size: 30px;

}

#rules, #graph{

font-family:  'Courier New', monospace;
}

#rules {
color: black;
background-color: gray;
border-radius: 50px;
font-weight: bold;
}


#graph{
font-weight: bold;
background-color: black;
color: #00b9de;

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

table{
margin:auto;
text-align: center;

}


#showRules, #showGraph{
background-color: #00b9de;
font-family:  'Courier New', monospace;
font-weight: bold;
font-size: 20px;
border-radius:10px;
}


#question{
text-align: center;
width: 70%;
border-radius: 30px;
margin: auto;
padding: 5px;
background-color: gray;
padding: 10px;


}

body{
background-color: black;
}
</style>


<body onload="myFunction(); showGraph();">

<div id="top">

 <img src="logo.png"  width="350" height="150"> 
<br>
<p id="welcome">Welcome ${name }</p>


</div>
<div id="middle">


    <div id="question">
 <img src="ques.png"  width="200" height="25">
 <table>
 <tr><td>
 <form id="yes" action="/response" method="post">
  <input type="hidden"  name="input" value="${passwordYes }" ><br><br>
  <input id="submit" type="submit" value="YES">
</form> </td> <td>   </td><td>   </td><td>   </td><td>   </td><td> 
<td>   </td><td>   </td><td>   </td><td>   </td><td>   </td>  </td><td>   </td><td>   </td><td>   </td><td>   </td>
<td>
<form id="no" action="/response" method="post">
  <input type="hidden" name="input" value="${passwordNo }" ><br><br>
  <input id="submit" type="submit" value="NO">
</form> </td></tr></table></div>

<script>
function myFunction() {
  var x = document.getElementById("rules");
  if (x.style.display === "none") {
	  document.getElementById("showRules").innerHTML="Hide Rules";
    x.style.display = "block";
  } else {
    x.style.display = "none";
    document.getElementById("showRules").innerHTML="Show Rules";

  }
}
  function showGraph() {
	  var x = document.getElementById("chartDiv");
	  if (x.style.display === "none") {
	      document.getElementById("showGraph").innerHTML="Hide Graph";
	    x.style.display = "block";
	  } else {
	    x.style.display = "none";
	    document.getElementById("showGraph").innerHTML="Show Graph";

	  }
}
</script>
<br><br>
<button id="showRules" onclick="myFunction()">Show Rules</button>
<br>
<p id="rules">
<img src="rules.png"  width="100" height="50"> 
<br> 1) You will have only one chance to input your progress daily.<br><br>
2) If you missed one day then your progress percentage will be  (Total%-1%).<br><br>
3) You have to input your progress when you reach the gym and if not you have to tell that you did not go to the GYM today.<br> X-X-X-X</p>
<br>

<button id="showGraph" onclick="showGraph()">Show Graph</button><br>
 <div id="chartDiv" style="width:100%; height:200px; margin:0 auto;"><script>
JSC.Chart('chartDiv', {
   type: 'line',
   series: [
      {
         name:'Paal',
         points: [
            
             
             ${paalData}
             
         ]
      },{
         name:'Binda',
         points: [
            
             
             ${bindaData}
             
             
             
         ]
      }
   ]
});
</script></div>
<br>

<p id="note"><img src="emoji.png"  width="30" height="30">Developed by Sarb<img src="emoji.png"  width="30" height="30"></p>
</div>


</body>
</html> 