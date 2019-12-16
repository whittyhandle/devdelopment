function stuff() {
		alert('DOM Access has begun')
}

var myDOMAccess = {

	// Create an init Method of our myDOMAccess custom object
	init: function (){
		// get a reference to div#quoteToday
		var quoteToday = document.getElementById('quoteToday');

		// dynamically change some styles of div#quoteToday on the fly
		quoteToday.style.backgroundColor = 'rgba(200, 200, 200, 0.5)';
		quoteToday.style.color = 'navy';
		quoteToday.style.borderLeft = '1px solid #76623c';
		quoteToday.style.borderTopLeftRadius = '10px';

		// get elementsByTagName('h4') will return a nodelist of references to the h4's we find
		var myH4 = quoteToday.getElementsByTagName('h4');

		// myH4[0] is a refernce to an element object (the <h4> we found above)
		myH4[0].style.fontFamily = 'Arial';
		myH4[0].style.background = 'rgba(160, 160, 160, 0.5)';


		// Replace an image(image rollover)
		var soldierPic = document.getElementById('pic');

		soldierPic.setAttribute('src', 'images/pics/bavLine.png');
		// shortcut
		// soldierPic.src = 'images/pics/bavLine.png';

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

		// change french histoian text to an email link
		var historian = document.getElementById('historian');

		// create a new email anchor element (tag) with appropriate href attribute placing
		// "mailto:"
		//
		// <a href="mailto:mhoward@oxford.edu">Michael Howard</a>
		var emailAddress = document.createElement('a');
		emailAddress.setAttribute('href', 'mailto:mhoward@oxford.edu');

		// create links text content
		var emailText = document.createTextNode('Michael Howard');


		// replace out span tag's content with just the text "- "
		historian.innerHTML = '- ';

		// place the links text content in the <a> tag
		emailAddress.appendChild(emailText);

		// append email address link (emailAddress) at the end of span#historian content
		historian.appendChild(emailAddress);

		// change the text color of the links text
		emailAddress.style.color = '#524b31';

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



	}
};


// Run myDOMAccess.init() when the web page's content has finished loading
Core.start(myDOMAccess);
