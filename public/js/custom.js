$(document).on('keypress',function(event){
    if(event.key === '/') {
        $("#search-by").focus();
        event.preventDefault();
    }
    if(event.key === 'Enter') {
        console.log(this);
    }
 });
