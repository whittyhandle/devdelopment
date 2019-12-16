var ImgRollOver = {
    
    init: function() {
        
        // create a global property of our imagerollover object named i
        ImgRollOver.i = 0;
        
        //Define an array called pics to hold my image  files name
        pics = new Array("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12");
        
        // same as ... 
        // pics = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"];
        
        // create a captios array 
        captions = new Array("Split Rock Lighthouse", "Superior Trail",
        "Beach Rock", "Breakers", "AmericInn Beach", "Suft Spray", "Superior Red Rock",
        "Superior Sunset", "Gooseberry Falls", "Cascades", "The Temperance",
        "Fall Trail Colors");
        
        // get a reference to the first Image on the page 
        northShoreImage = document.getElementById("northShorePic");
        
        // get a node list of references to our <p> tags that have 
        // a class of "picCaption"
        picCaptions = Core.getElementsByClass("picCaption");
        
        // set up a mousesover event handler and a mouse even handler
        // for this image - old way
        //
        // element.event = eventHandlerFunctionName; 
        
        // northShoreImage.onmouseover = ImgRollOver.overHandler;
        // northShoreImage.onmouseout = ImgRollOver.outHandler;
        
        // use the newer event listener way using the Core.eventlistener method.
        // northShoreImage.addEventListener("mouseover", ImageRoller.overHandler); 
        // 
        // instead use the addeventListener from core.js '
        Core.addEventListener(northShoreImage, "mouseover", ImgRollOver.overHandler);
        Core.addEventListener(northShoreImage, "mouseout", ImgRollOver.outHandler);
        
        // Get a reference to the second image on the webpage
        ImgRollOver.northShoreAutoImage = document.getElementById("northShoreAutoPic");
        
        // call a function (method) to get het automated rollover 
        // (slideshow) for our NorthShore image going 
        ImgRollOver.slideShow();
        
    }, 
    
    overHandler: function(e) {

    var randomIndex = ImgRollOver.randRange(1, pics.length);        
    // preform the image rollover
    // northShoreImage.src = "images/northShore/pic" + pics[randomIndex] + ".jpg";
    this.src = "images/northShore/pic" + pics[randomIndex] + ".jpg";
    // change the captions  to corrispond with the image 
    picCaptions[0].innerHTML = captions[randomIndex];
  },

  outHandler: function(e) {

    // northShoreImage.src = "images/northShore/pic1.jpg";
    this.src = "images/northShore/pic1.jpg";
    picCaptions[0].innerHTML = captions[0];
  },
  
    slideShow: function() {
    // do the image rollover 
    ImgRollOver.northShoreAutoImage.src = "images/northShore/pic" + pics[ImgRollOver.i] + ".jpg";
    // get the proper captions for this image 
    picCaptions[1].innerHTML = captions[ImgRollOver.i];
    
    // same is if else statement below
    ImgRollOver.i = (++ImgRollOver.i) % pics.length;

    /*
    if (ImgRollOver.i < pics.length - 1) {
      ImgRollOver.i++;
    } else {
      ImgRollOver.i = 0;
    }
    */
    // Keep calling the slideshow() method every 3 seconds for the 
    // lifetime of this webpage 
    setTimeout(ImgRollOver.slideShow, 3000);
  },
    
    
 randRange: function(low, high) {

    return Math.floor(Math.random() * (high - low) + low);
  }
       
}

// don't run our java script code until the webpage has 
// finished loadoing 
Core.start(ImgRollOver); 