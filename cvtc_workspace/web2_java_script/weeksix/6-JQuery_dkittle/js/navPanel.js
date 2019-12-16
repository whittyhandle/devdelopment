$(function(){
   
    // hide any existing text and polaroid .tabDesc div's
    // (div.tabDesc)
    //$('.tabDesc').hide(); // sets style style="display" none" in these tages
    
    //$('.tabDesc:first').show();
    
    // on hover - change text and image to corespond to navigation link subject link
    $('ul#nav > li').hover(function() {
        
        // hover over 
        $('.tabDesc').hide(); // hide all visable dic.tabDesc's
        
        // get value of id attribte of the link hovered over and append "Tab"
        var activeTab = $(this).find('a').attr('id') + "Tab";
        
        // show the correct tabDiv that corrisponds to the mouse over link
        $('#' + activeTab).stop(true, true).fadeIn('slow');
        
        
    }, function() {
        
        // hover off
        $('.tabDesc').hide();
        $('.tabDesc:first').stop(true, true).fadeIn(4000);
        
    });
    
    
    
});
                  