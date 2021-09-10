
const tl2 = gsap.timeline({ defaults: {ease: "power1.out"}})
const fixed = document.querySelector('.fixed');
const popup = document.querySelector('.popup');


tl2.to(".text", {y:"0%", duration:1.5, stagger: 0.4});
tl2.to(".slider", {y:"-100%", duration:1.5, delay : 0.5});
tl2.to(".intro", {y:"-100%", duration:1}, "-=1" );
tl2.fromTo(".fixed", {opacity:"0"}, {opacity:1, duration:1});


   
/// FIXED SCROLL EFFECT ///

$(window).on("scroll", function() {
    if($(window).scrollTop() > 250) {
        $(".fixed").addClass("active");
    } else {
        //remove the background property so it comes transparent again 
       $(".fixed").removeClass("active");
    }
});



//// POPUP ////

$(document).ready(function(){
    setTimeout(function(){
       $(".popup").show();
     }, 8000);
 });

 var span = document.getElementsByClassName("close")[0];
 var span2 = document.getElementsByClassName("close2")[0];
 
 span.onclick = function() {
    popup.style.display = "none";
  }
  


  
  