$(window).on('load', ()=>{
	setTimeout("closeLoadingWithMask()", 500);
});
 
function closeLoadingWithMask() {
    $('#mask').fadeOut(600);
    $('#mask').empty();
}
