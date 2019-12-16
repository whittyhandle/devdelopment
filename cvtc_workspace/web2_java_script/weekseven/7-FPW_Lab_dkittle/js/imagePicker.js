var ImagePicker = {

	init: function() {
	
		// get reference to <img id="pic">
		imagePic = document.getElementById("pic"); 
		
		// get references to each of the Image tabs
		/*
		var imageTab01 = document.getElementById("imageTab01");
		var imageTab02 = document.getElementById("imageTab02");
		var imageTab03 = document.getElementById("imageTab03");
		var imageTab04 = document.getElementById("imageTab04");
		
		imageTab01.onclick = ImagePicker.imageTabClick;
		imageTab02.onclick = ImagePicker.imageTabClick;
		imageTab03.onclick = ImagePicker.imageTabClick;
		imageTab04.onclick = ImagePicker.imageTabClick;*/
		
		// get reference to <div> containing image tabs
		var imageTabsDiv = document.getElementById("imageTabs");
		
		var imageTabsList = imageTabsDiv.getElementsByTagName("img");
		
		for (var i = 0; i < imageTabsList.length; i++) {
			imageTabsList[i].onclick = ImagePicker.imageTabClick;
		}
		
		// randomly choose a first image to display
		var randomIndex = Math.floor(Math.random() * 4);
		
		//alert("image = " + imageTabsList[randomIndex].getAttribute("longdesc"));
		imagePic.src = imageTabsList[randomIndex].getAttribute("longdesc");
	
	},
	
	
	imageTabClick: function(event) {
	
		//alert("image tab " + event.target.id + " was clicked *** " + event.target.nodeType + " *** " + event.target.nodeName + " *** " + event.target.longdesc);
		
		//var imgPath = event.target.getAttribute("longdesc");   // or you can use this rather event.target
		var imgPath = this.getAttribute("longdesc");
		//alert("image path = " + imgPath);
		
		imagePic.setAttribute("src", imgPath);
		//imagePic.src = imgPath;
	
	}

};

Core.start(ImagePicker);