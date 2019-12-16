$(document).ready(function() {
    
    // get a refernece to the container for the forms
    // note: preceding a variable with $ is convention 
    var $loginPanel = $('#loginForm_wrap');
    
    // hode the login forms panel
    $loginPanel.hide();
    // same as setting display: none in css or 
    // $loginPanel.css('display', 'none');
    
    
    // set up clickability of our login button and toggle slidding of login forms panel
    $('a#loginHook').click(function() {
        
        // toggle the login form panel open/closed based on current state
        $loginPanel.slideToggle();
        
        // prevent links default action 
        return false;
        
        
    });
    
});