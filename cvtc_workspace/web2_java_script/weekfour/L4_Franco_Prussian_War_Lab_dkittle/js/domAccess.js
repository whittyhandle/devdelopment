var myDOMAccess = {

	init: function() {
		/*eslint-env browser*/
		// Replace an image(image rollover)
		var soldierPic = document.getElementById('pic');
		
		soldierPic.setAttribute('src', 'images/pics/bavLine.png');
		
		// style the navigational list items at the top of page
		//
		// get a node list of the all the <li>'s on the top of top page 
		var navUL = document.getElementById('nav');
		
		// get a node list of references to the <li>'s on the ul#nav
		var navList = navUL.getElementsByTagName('li');
		
		//alert(navList.length)
		
		
		// change some style on each of our <li>'s 
		//
		// do this by stepping through each <li> in our node list one at a time
		for (i = 0 ; i < navList.length; i++) {

			navList[i].style.backgroundColor = 'rgba(118, 98, 60, 0.15)';
			navList[i].style.borderRadius = '6px'; 
			navList[i].style.paddingTop = '4px';
			navList[i].style.position = 'relative';
			navList[i].style.top = '-4px';
			
		}
      
    // Create the following HTML structor and prepend it before
		// div#top in div#wrapper
		//
		//	<div id="loginTab">
		//	<p><a id="loginHook" href="#">Client Login</a></p>
		//	</div>

		// Step 1: create the element object <a> tag
		var loginHook = document.createElement('a');

		// Step 2: add any needed attributes to the tag
		loginHook.id = 'loginHook';
		loginHook.setAttribute('href', '#');
		// could have done loginHook.href = '#';

		// Step 3: add any desired content to the <a> tag
		var loginHookContent = document.createTextNode('Client Login');
		// loginHook.innterHTML = 'Client Login';

		// attach text node as a child of the <a> tag
		loginHook.appendChild(loginHookContent);

		// create a div#loginTab and a <p> element
		var loginTabDiv = document.createElement('div');
		loginTabDiv.id = 'loginTab';

		var pTag = document.createElement('p');


		// now attach the <a> tag as a child of the <p> tag
		pTag.appendChild(loginHook);

		// attach the <p> as a child of div#loginTab
		loginTabDiv.appendChild(pTag);

		// get refernece to both div#wrapper and div#top
		var wrapperDiv = document.getElementById('wrapper');
		var topDiv = document.getElementById('top');

		// now attach div#loginTab to the DOM structure (current web page)
		// by prepending it to the div#top

		wrapperDiv.insertBefore(loginTabDiv, topDiv);


		
	
		// Try these out by uncommenting them, then comment them again
		//alert(document.getElementById("wrapper").getElementsByTagName('div')[0].nodeName);
		//alert(document.getElementById("wrapper").getElementsByTagName('div')[0].id);
		
		// ****************************************************************
		//
		// Lesson3 - project Assignment - Document Access
		//
		// ****************************************************************
		
		
		// ****************************************************************
		//
		// Add 1, 2, 3, and 4 tab button images to left of soldier pic.
		//
		// ****************************************************************
		
		// Create div#imageTabs using the setAttribute() method to set the 'id' attribute
		// - store the reference to div#imageTabs in a variable named imageTabsDiv
		var imageTabsDiv = document.createElement('div');
		imageTabsDiv.setAttribute('id', 'imageTabsDiv');

		
		// Create four images that display the following images from the 
		// images/pics folder: imageTab01.png, imageTab02.png, imageTab03.png,
		// and imageTab04.png.  Store the references to the new image elements
		// in variables named tab01, tab02, tab03, and tab04.
		//
		// Use the shorthand way accessing the attribute
		// as an object property to set the 'src' attribute for each image.
		//
		// Following each image tag, create a <br> tag.

		var tab01 = new Image();
		tab01.src = 'images/pics/imageTab01.png';

		var tab02 = new Image();
		tab02.src = 'images/pics/imageTab02.png';
		
		var tab03 = new Image();
		tab03.src = 'images/pics/imageTab03.png';
		
		var tab04 = new Image();
		tab04.src = 'images/pics/imageTab04.png';

		
		// create a reference to a <br> tag - note that you will need to 
		// consider creating more than one reference here...
    var tab01Br = document.createElement('br');
		var tab02Br = document.createElement('br');
		var tab03Br = document.createElement('br');
    var tab04Br = document.createElement('br');

		
		// append these tab images and br's to div#imageTabs
    imageTabsDiv.append(tab01);
    imageTabsDiv.append(tab01Br);
    imageTabsDiv.append(tab02);
    imageTabsDiv.append(tab02Br);
    imageTabsDiv.append(tab03);
    imageTabsDiv.append(tab03Br);
    imageTabsDiv.append(tab04);
    imageTabsDiv.append(tab04Br);
		
		
		
		// Get a reference to div#primaryPic and name it primaryPic
		var primaryPic = document.getElementById('primaryPic');

		
		// Add div#imageTabs as a child of div#primaryPic
		primaryPic.appendChild(imageTabsDiv);
		
		// Position div#imageTabs as shown in the video using absolute positioning
		// - dynamically alter this element's styles to do this
    imageTabsDiv.style.position = 'absolute';
    imageTabsDiv.style.left = '-26px';
    

		
		
		// ****************************************************************
		//
		// Replace the polaroid image with the images/navPhotos/theArt_polaroidSmall.png
		//
		// ****************************************************************
		
		// In one statement, get a reference to img tag (store in variable named polaroid) 
		// inside div#defaultTab using the getElementsByTagName() method.
		var poloaroid = document.getElementById('defaultTab').getElementsByTagName('img')[0];
		
		// Display the polaroid's tagname in an alert dialog window - hint: use the 
		// nodeName property of the element object to get this.
		//alert(document.getElementById('defaultTab').getElementsByTagName('img')[0].nodeName);
		
		// Replace the current image with the 'theArt_polaroidSmall.png' image using
		// the src property shortcut
		 poloaroid.src = 'images/navPhotos/theArt_polaroidSmall.png';
		
		
		
		// ****************************************************************
		//
		// Change the styles applied to the <p> tags within div#motd as shown
		// in the specs video.
		//
		// The styles you should be changing dynamically through your
		// JavaScript code for each selected <p> tag will be: 
		//		background   (set background image to images/pBackground.png)
		//		color
		//		border-radius
		//		padding
		//		text-shadow
		//
		// Look carefully at the specs video and/or provided screenshot
		// and try to match your style values to create what you see.  Don't
		// worry too much about being 1px off here and there as long as your
		// output is very close to what you see in my output examples.
		//
		// ****************************************************************
		
		// get a reference to div#motd and store in motdDiv
		var motdDiv = document.getElementById('motd');
		
		// get a nodelist of references to the <p> tags within div#motd - store in pList
		var nodeList = motdDiv.getElementsByTagName('p');
		// alert(nodeList.length)

		// step through the p's nodelist and change the forementioned styles on 
		// each p element in div#motd - use a for loop to do this
		for (i = 0; i < nodeList.length; i++){
			nodeList[i].style.backgroundImage = 'url(images/pBackground.png)';
			nodeList[i].style.color = 'white';
			nodeList[i].style.borderRadius = '2px';
			nodeList[i].style.padding = '2px';
			nodeList[i].style.textShadow = '1px 1px black'
		}
		
		
		
		
		
		// ****************************************************************
		//
		// Change the copyright symbol "2012 Jon Cooley" text into copyright symbol 
		// "2012 Yournamehere" where "Yournamehere" should be an email link to 
		// your email address (replace "Yournamehere" with your name :-)
		//
		// ****************************************************************
		
		// store reference to span#copyRight in variable named copyRight
		var copyRight = document.getElementById('copyRight');
		// alert(copyRight.nodeName);

		// Create a new email anchor element with appropriate href attribute placing
		// your name as its text content - store reference to new tag in variable 
		// named emailAddress
		var emailAddress = document.createElement('a');
		emailAddress.setAttribute('href', 'mailto:dkittle@student.cvtc.edu');
		

		// create Name text content inside link (text node) storing reference in emailText
		var emailText = document.createTextNode(' David Kittle')

		// replace span tag's content with just the "'copyright symbol here' 2013 "
		copyRight.innerHTML = '&copy; 2013'

		// place link text content in the <a> tag
		copyRight.appendChild(emailAddress);

		// append email address at end of <span>'s content
		emailAddress.appendChild(emailText);
		
	
	}	// end init() method

};

// run myDOMAccess's init() method after this page's content has
// finished loading - don't forget to put the correct object in the start() method's ()'s below
Core.start(myDOMAccess);