$(document).ready(function(){
    
    
    $('#whoAmI').hover(function() {
        // on hover
        $(this).stop(true, true).fadeTo("slow", 1)
        
    }, function() {
        // off hover 
        $(this).stop(true, true).fadeTo("normal", .40)
    });
 
    
    
    $('#whoAmI').click(function() {
        $('#mysteryPanel').toggle();
        return false;
        
    });
    
    
    $('#mysteryPanel > h3').click(function() {
    $('img#silhouette').fadeOut(5000);
    $('img#revealed').delay(3000).fadeIn(1000, function() {
        $('#mysteryPanel > h3').text("Marechal Patrice MacMahon").css('cursor', 'default'); 
    });
  });       
});