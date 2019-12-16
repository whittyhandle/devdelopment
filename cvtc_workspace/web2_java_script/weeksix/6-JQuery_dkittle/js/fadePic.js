/*

    jquery statments have 4 parts: 
        1. jQuery function call 
        2. selector 
        3. jQuery method (function) name
        4. jQuery methods parameters'
        
        ex: jQuery('p').fadeTo(1000, .8); // returns a jQuery object to .fadeTo()
        ex2: $('p').fadeTo(1000, .8) // same as above
        ex3: var stuff = $('p');
        
*/

// check if web page content is finished loading 
$(document).ready(function() {
    
    // code we want to run when page is done loading 
    var soldierPic = $('#pic')
    
    // initially fade out the image out to 15% 
    soldierPic.fadeTo(2000, 0.15);
    
    // on hover fade to full opacity
    // on hover off fade bacl to 15%
    soldierPic.hover(function(){
        // on hover over (mouseover)
        // stop any current animation then fade to full opacity - using chaining
        $(this).stop(true, true).fadeTo("slow", 1);
        
    }, function(){
        // on hover off (mouseout)
        $(this).stop(true, true).fadeTo("normal", 0.15);
            
    });
    
    
    
});