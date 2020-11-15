function clearBoxText(){
  document.getElementById("displayCode2").style = "";
	document.getElementById("displayCode3").style = "";
	document.getElementById("displayCode4").style = "";
	document.getElementById("displayCode5").style = "";
  document.getElementById("displayCode6").style = ""	
  document.getElementById("displayCode7").style = "";
  
									jQuery.get(urlNNex4, function(data) 
										{
										   $(document).ready(function()
					       						{
						 					$("#displayCode pre").html(data.replace(/\r\n/g, "<br>"));
						       					});
										}); 
										
										jQuery.get(urlNNCost, function(data) 
										{
										   $(document).ready(function()
					       						{
						 					$("#displayCode2 pre").html(data.replace(/\r\n/g, "<br>"));
						       					});
										});
										
										jQuery.get(urlNNfmincg, function(data) 
										{
										   $(document).ready(function()
					       						{
						 					$("#displayCode3 pre").html(data.replace(/\r\n/g, "<br>"));
						       					});
										});
								
										jQuery.get(urlNNpredict, function(data) 
										{
										   $(document).ready(function()
					       						{
						 					$("#displayCode4 pre").html(data.replace(/\r\n/g, "<br>"));
						       					});
										});
										
										jQuery.get(urlNNRandWeights, function(data) 
										{
										   $(document).ready(function()
					       						{
						 					$("#displayCode5 pre").html(data.replace(/\r\n/g, "<br>"));
						       					});
										});
											
										jQuery.get(urlNNSigmoidGradient, function(data) 
										{
										   $(document).ready(function()
					       						{
						 					$("#displayCode6 pre").html(data.replace(/\r\n/g, "<br>"));
						       					});
										});
						
										jQuery.get(urlNNSigmoid, function(data) 
										{
										   $(document).ready(function()
					       						{
						 					$("#displayCode7 pre").html(data.replace(/\r\n/g, "<br>"));
						       					});
										});	  

}
