<%@ Page Title="Home" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Home</title>
    <style>
        .about {
            width:850px;
	position: relative;
	z-index: 1;
	background: #FFFFFF;
	max-width: 850px;
	
	padding: 45px;
	
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
    float:left;
    margin-left:20px;
   
}
 .contact{
     float:right;
    width:385px;
     margin-right:30px;
     max-width:385px;
     margin-top:50px;
	z-index: 1;
	background: #FFFFFF;
	
	
	padding: 25px;
	
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
 }
* {box-sizing:border-box}
.mySlides {display:none}

/* Slideshow container */
.slideshow-container {
  max-width: 800px;
  position: relative;
  margin: auto;

}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}
div.image{
    float:right;
    width:420px;
   
}
div.gallery {
    margin: 3px;
    border: 3px solid #ccc;
    float: left;
    width: 126px;
    height:126px;
}

div.gallery:hover {
    border: 3px solid #fff;
}

div.gallery img {
    width: 120px;
    height: 120px;
}

</style>

   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="about">
<div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext">1/4</div>
  <img src="Images/family-car-1.jpg" style="width:100% ; height:350px">
  <div class="text">More than a million satisfied customers</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">2 /4</div>
  <img src="Images/2016-chevrolet-impala-skyline.jpeg" style="width:100%; height:350px">
  <div class="text">Always There for You</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 4</div>
  <img src="Images/2015-BMW-i8-Lead-10-most-fuel-efficient-luxury-cars.jpg" style="width:100%;height:350px"">
  <div class="text">A Class Of Its Own</div>
</div>
    
<div class="mySlides fade">
  <div class="numbertext">4 / 4</div>
  <img src="Images/Bugatti-Veyron-2013-Sports-Cars-HD-Wallpaper.jpg" style="width:100%;height:350px"">
  <div class="text">Accelerating the Future</div>
</div>

</div>
    <br />
    <div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span>
</div>
       

   <div style="text-align: justify; line-height:30px;">
        <p>
            After over 50 years in India, CarVanza has grown to be one of India's leading automobile company.
In the 2016 calendar year, CarVanza was the top selling brand for the twelfth year in a row with a market share of 18.2 per cent.</p>
<p>Quality isn't just a result. It's part of everything we do at CarVanza. Starting with hand-selecting the right people to undertake the sketching of a car, right through to materials, the build and the delivery. And it never stops. 
            Because the only way to ensure that you experience quality every time you sit in a CarVanza is to ask ourselves, "How can we make this even better?"
        At CarVanza we ensure that we don't just meet the world's strictest safety standards, we exceed them. You'll find a formidable package of world-class active and passive safety features on board every one of our cars, but our safe thinking started a long time ago. It's so deeply embedded into CarVanza culture that it's central to the everyday thinking of all employees too. You wouldn't 
            expect any less when it comes to the safety of you and your family, so neither do we. We're proud to be overprotective.
        </p>
       
    </div>
         </div>
     <div class="image">
     <div class="gallery">
  <a target="_blank" href="Images/7.jpg">
    <img src="Images/7.jpg" alt="1">
  </a>
</div>

<div class="gallery">
  <a target="_blank" href="Images/8.jpg">
    <img src="Images/8.jpg" alt="2">
  </a>
 
</div>

<div class="gallery">
  <a target="_blank" href="Images/3.jpg">
    <img src="Images/3.jpg" alt="3">
  </a>
 
</div>

<div class="gallery">
  <a target="_blank" href="Images/4.png">
    <img src="Images/4.png" alt="4">
  </a>
 
</div>
     <div class="gallery">
  <a target="_blank" href="Images/5.jpg">
    <img src="Images/5.jpg" alt="5">
  </a>
 
</div>
     <div class="gallery">
  <a target="_blank" href="Images/6.jpg">
    <img src="Images/6.jpg" alt="6">
  </a>
 
</div>
         <div class="gallery">
  <a target="_blank" href="Images/9.jpg">
    <img src="Images/9.jpg" alt="7">
  </a>
 
</div>
         <div class="gallery">
  <a target="_blank" href="Images/10.png">
    <img src="Images/10.png" alt="8">
  </a>
 
</div>
         <div class="gallery">
  <a target="_blank" href="Images/11.jpg">
    <img src="Images/11.jpg" alt="9">
  </a>
 
</div>
                 <div class="gallery">
  <a target="_blank" href="Images/12.jpg">
    <img src="Images/12.jpg" alt="10">
  </a>
 
</div>
                 <div class="gallery">
  <a target="_blank" href="Images/13.jpg">
    <img src="Images/13.jpg" alt="11">
  </a>
 
</div>
                 <div class="gallery">
  <a target="_blank" href="Images/14.jpg">
    <img src="Images/14.jpg" alt="12">
  </a>
 
</div>
 </div> 
    
    <div class="contact">
         <p style="color: #978c8c;
        line-height:20px;
		font-size: 16px;">
           <h3 style="text-align:center"> Contact us :</h3> 
             <img src="Images/if_aiga_mail_bg_134145.png"  height="40px" width="40px"/>  carvanza@gmail.com <br />
             <img src="Images/if_settings-phone_326696%20(1).png" height="40px" width="40px" /> +91 9980612969/+91 9986037081
        </p>
    </div>
<script>
var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    setTimeout(showSlides, 2000); // Change image every 2 seconds
}
</script>
</asp:Content>