<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>


<!-- ////////////////////////////////bttn.min.css 등록하기 ///////////////////////////////////////// -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bttn.css/0.2.4/bttn.min.css">
<style type="text/css">

/*  .bttn-simple{margin:0;padding:0;border-color:transparent;background:transparent;font-weight:400;cursor:pointer;position:relative;font-size:20px;font-family:inherit;padding:5px 12px;overflow:hidden;border-width:0;border-radius:4px;background:hsla(0,0%,100%,.4) ;color:#fff;-webkit-transition:all .3s cubic-bezier(.02,.01,.47,1);transition:all .3s cubic-bezier(.02,.01,.47,1)}
 .bttn-simple:focus,.bttn-simple:hover{opacity:.55}
 .bttn-warning{background:#feab3a} */
 
 
/* .bttn-danger{border-color:#08708A;
				background:#08708A;
				color: #f4f4f4
				} */
				
.bttn-success{border-color:#08708A;background: #f4f4f4}
.bttn-royal{background:#bd2df5}
 
/* .bttn-xs{padding:3px 8px;font-size:12px;font-family:inherit}
.bttn-md{font-size:20px;font-family:inherit;padding:5px 12px}
.bttn-sm{padding:4px 10px;font-size:16px;font-family:inherit}
.bttn-lg{padding:8px 15px;font-size:24px;font-family:inherit}
 */
/* 
.bttn-danger{background:#fff;color:#fff}

.bttn-warning:before{background:#fff}
.bttn-fill
.bttn-danger{background:#ff5964;color:#fff}
.bttn-fill
.bttn-danger:focus,
.bttn-fill
.bttn-danger:hover{color:#fff}
.bttn-fill
.bttn-danger:before{background:#fff} 

.bttn-warning:hover{background:#feab3a;color:#fff}
.bttn-warning:before{background:#f89001}
.bttn-warning:after{background:#feab3a}
 */
 
/*
 .bttn-warning:hover{color:#fff}

.bttn-primary:before{background:#006de3} */


body {
  background: #2ecc71;
  font-size: 62.5%;
}

.container {
  padding: 2em;
}

/* GENERAL BUTTON STYLING */
button,
button::after {
  -webkit-transition: all 0.3s;
    -moz-transition: all 0.3s;
  -o-transition: all 0.3s;
    transition: all 0.3s;
}

button {
  background: none;
  border: 3px solid #fff;
  border-radius: 5px;
  color: #fff;
  display: block;
  font-size: 1.6em;
  font-weight: bold;
  margin: 1em auto;
  padding: 2em 6em;
  position: relative;
  text-transform: uppercase;
}

button::before,
button::after {
  background: #fff;
  content: '';
  position: absolute;
  z-index: -1;
}

button:hover {
  color: #2ecc71;
}

/* BUTTON 1 */
.btn-1::after {
  height: 0;
  left: 0;
  top: 0;
  width: 100%;
}

.btn-1:hover:after {
  height: 100%;
}

/* BUTTON 2 */
.btn-2::after {
  height: 100%;
  left: 0;
  top: 0;
  width: 0;
}

.btn-2:hover:after {
  width: 100%;
}

/* BUTTON 3 */
.btn-3::after {
  height: 0;
  left: 50%;
  top: 50%;
  width: 0;
}

.btn-3:hover:after {
  height: 100%;
  left: 0;
  top: 0;
  width: 100%;
}

/* BUTTON 4 */
.btn-4::before {
  height: 100%;
  left: 0;
  top: 0;
  width: 100%;
}

.btn-4::after {
  background: #2ecc71;
  height: 100%;
  left: 0;
  top: 0;
  width: 100%;
}

.btn-4:hover:after {
  height: 0;
  left: 50%;
  top: 50%;
  width: 0;
}

/* BUTTON 5 */
.btn-5 {
  overflow: hidden;
}

.btn-5::after {
  /*background-color: #f00;*/
  height: 100%;
  left: -35%;
  top: 0;
  transform: skew(50deg);
  transition-duration: 0.6s;
  transform-origin: top left;
  width: 0;
}

.btn-5:hover:after {
  height: 100%;
  width: 135%;
}


</style>



<!-- ///////////////////////////////////색깔 종류//////////////////////////// 
		bttn-default
		bttn-primary
		bttn-warning
		bttn-success
		bttn-danger
		bttn-royal
		
-->

<!-- ///////////////////////////////////버튼 모양 종류 !!! //////////////////////////// 
bttn-simple
bttn-bordered
bttn-minimal
bttn-stretch
bttn-jelly
bttn-gradient
bttn-fill
bttn-material-circle
bttn-material-flat
bttn-pill
bttn-float
bttn-unite
bttn-slant (Beta)
-->

<body>


<div class="container">
  <button class="btn-1">Button 1</button>
  <button class="btn-2">Button 2</button>
  <button class="btn-3">Button 3</button>
  <button class="btn-4">Button 4</button>
  <button class="btn-5">Button 5</button>
</div>


<div class="xs">
<button class="bttn-simple bttn-xs bttn-danger">extraSmall</button>
<button class="bttn-bordered bttn-xs bttn-danger">extraSmall</button>
<button class="bttn-minimal bttn-xs bttn-danger">extraSmall</button>
<button class="bttn-stretch bttn-xs bttn-danger">extraSmall</button>
<button class="bttn-jelly bttn-xs bttn-danger">extraSmall</button>

<div>&nbsp;</div>
<div>&nbsp;</div>

<button class="bttn-gradient bttn-xs bttn-danger">extraSmall</button>
<button class="bttn-fill bttn-xs bttn-danger">extraSmall</button>
<button class="bttn-material-circle bttn-xs bttn-danger">extraSmall</button>
<button class="bttn-material-flat bttn-xs bttn-danger">extraSmall</button>
<button class="bttn-pill bttn-xs bttn-danger">extraSmall</button>

<div>&nbsp;</div>
<div>&nbsp;</div>


<button class="bttn-float bttn-xs bttn-danger">extraSmall</button>
<button class="bttn-unite bttn-xs bttn-danger">extraSmall</button>
<button class="bttn-slant bttn-xs bttn-danger">extraSmall</button>
</div>


<div>&nbsp;</div>
<div>&nbsp;</div>


<div class="sm">
  <button class="bttn-simple bttn-sm bttn-danger">Small</button>
  <button class="bttn-bordered bttn-sm bttn-danger">Small</button>
  <button class="bttn-minimal bttn-sm bttn-danger">Small</button>
  <button class="bttn-stretch bttn-sm bttn-danger">Small</button>
  <button class="bttn-jelly bttn-sm bttn-danger">Small</button>
<div>&nbsp;</div>
<div>&nbsp;</div>
  <button class="bttn-gradient bttn-sm bttn-danger">Small</button>
  <button class="bttn-fill bttn-sm bttn-danger">Small</button>
  <button class="bttn-material-circle bttn-sm bttn-danger">Small</button>
  <button class="bttn-material-flat bttn-sm bttn-danger">Small</button>
  <button class="bttn-pill bttn-sm bttn-danger">Small</button>
<div>&nbsp;</div>
<div>&nbsp;</div>
  <button class="bttn-float bttn-sm bttn-danger">Small</button>
  <button class="bttn-unite bttn-sm bttn-danger">Small</button>
  <button class="bttn-slant bttn-sm bttn-danger">Small</button>
</div>

<div>&nbsp;</div>
<div>&nbsp;</div>

<div class="md">
  <button class="bttn-simple bttn-md bttn-danger">medium</button>
  <button class="bttn-bordered bttn-md bttn-danger">medium</button>
  <button class="bttn-minimal bttn-md bttn-danger">medium</button>
  <button class="bttn-stretch bttn-md bttn-danger">medium</button>
  <button class="bttn-jelly bttn-md bttn-danger">medium</button>
<div>&nbsp;</div>
<div>&nbsp;</div>
  <button class="bttn-gradient bttn-md bttn-danger">medium</button>
  <button class="bttn-fill bttn-md bttn-danger">medium</button>
  <button class="bttn-material-circle bttn-md bttn-danger">medium</button>
  <button class="bttn-material-flat bttn-md bttn-danger">medium</button>
  <button class="bttn-pill bttn-md bttn-danger">medium</button>
<div>&nbsp;</div>
<div>&nbsp;</div>
  <button class="bttn-float bttn-md bttn-danger">medium</button>
  <button class="bttn-unite bttn-md bttn-danger">medium</button>
  <button class="bttn-slant bttn-md bttn-danger">medium</button>
</div>

<div>&nbsp;</div>
<div>&nbsp;</div>


<div class="lg">
  <button class="bttn-simple bttn-lg bttn-danger">large</button>
  <button class="bttn-bordered bttn-lg bttn-danger">large</button>
  <button class="bttn-minimal bttn-lg bttn-danger">large</button>
  <button class="bttn-stretch bttn-lg bttn-danger">large</button>
  <button class="bttn-jelly bttn-lg bttn-danger">large</button>
<div>&nbsp;</div>
<div>&nbsp;</div>
  <button class="bttn-gradient bttn-lg bttn-danger">large</button>
  <button class="bttn-fill bttn-lg bttn-danger">large</button>
  <button class="bttn-material-circle bttn-lg bttn-danger">large</button>
  <button class="bttn-material-flat bttn-lg bttn-danger">large</button>
  <button class="bttn-pill bttn-lg bttn-danger">large</button>
<div>&nbsp;</div>
<div>&nbsp;</div>
  <button class="bttn-float bttn-lg bttn-danger">large</button>
  <button class="bttn-unite bttn-lg bttn-danger">large</button>
  <button class="bttn-slant bttn-lg bttn-danger">large</button>
</div>


<div>&nbsp;</div>
<div>&nbsp;</div>



<div class="color">
  <button class="bttn-simple bttn-lg bttn-default">large</button>
  <button class="bttn-simple bttn-lg bttn-danger">large</button>
  <button class="bttn-simple bttn-lg bttn-warning">large</button>
  <button class="bttn-simple bttn-lg bttn-success">large</button>
  <button class="bttn-simple bttn-lg bttn-danger bttn-no-outline">large</button>
<div>&nbsp;</div>
<div>&nbsp;</div>
  <button class="bttn-simple bttn-lg bttn-success  bttn-block">large</button>
</div>




</body>
</html>