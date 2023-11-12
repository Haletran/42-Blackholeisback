const url = "https://api.intra.42.fr/v2/users/bapasqui/cursus_users";

const options = {
	headers: {
		    Authorization: "Bearer 82d4e7f4d3f00c577edb8facbfe91f02bd99fe627701ea71cbf6e10f10082c19"
		  }
};

fetch(url, options)
    .then(res => res.json())
    	.then((data) => {
		
		var test = data[0];	
		console.log(test.blackholed_at);	
		
		//const  daysLeftDiv = document.createElement("div");
		//daysLeftDiv.innerText = test.blackholed_at;
        //daysLeftDiv.style.fontSize = "0.7em";
		//daysLeftDiv.style.fontWeight = "400";
		//daysLeftDiv.style.animation = "0.42s ease 0s 1 normal none running fadeIn";
		//document.getElementById("pace-system-container").appendChild(daysLeftDiv);
});
