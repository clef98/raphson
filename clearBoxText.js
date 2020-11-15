function clearBoxText(){
	document.getElementById("displayCode2").style = "";
	document.getElementById("displayCode3").style = "";
	document.getElementById("displayCode4").style = "";
	document.getElementById("displayCode5").style = "";
	document.getElementById("displayCode6").style = ""	
	document.getElementById("displayCode7").style = "";
  
	urlClear = '/models/clear.txt'
	jQuery.get(urlClear, function(data) 
		{
		   $(document).ready(function()
			{
			$("#displayCode pre").html(data.replace(/\r\n/g, "<br>"));
			});
		}); 

	jQuery.get(urlClear, function(data) 
	{
	   $(document).ready(function()
		{
		$("#displayCode2 pre").html(data.replace(/\r\n/g, "<br>"));
		});
	});

	jQuery.get(urlClear, function(data) 
	{
	   $(document).ready(function()
		{
		$("#displayCode3 pre").html(data.replace(/\r\n/g, "<br>"));
		});
	});

	jQuery.get(urlClear, function(data) 
	{
	   $(document).ready(function()
		{
		$("#displayCode4 pre").html(data.replace(/\r\n/g, "<br>"));
		});
	});

	jQuery.get(urlClear, function(data) 
	{
	   $(document).ready(function()
		{
		$("#displayCode5 pre").html(data.replace(/\r\n/g, "<br>"));
		});
	});

	jQuery.get(urlClear, function(data) 
	{
	   $(document).ready(function()
		{
		$("#displayCode6 pre").html(data.replace(/\r\n/g, "<br>"));
		});
	});

	jQuery.get(urlClear, function(data) 
	{
	   $(document).ready(function()
		{
		$("#displayCode7 pre").html(data.replace(/\r\n/g, "<br>"));
		});
	});	  

}
