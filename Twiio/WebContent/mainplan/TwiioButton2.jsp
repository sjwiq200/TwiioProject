<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>


<style type="text/css">

body {
  background: #fff;
  font-size: 30%;
}

.container {
  padding: 2em;
}

/* GENERAL BUTTON STYLING */
button,
button::after {
  -webkit-transition: all 0.5s;
    -moz-transition: all 0.5s;
  -o-transition: all 0.5s;
    transition: all 0.5s;
}

button {
  background: none;
  border: 1px solid #D73A31;
  border-radius: 5px;
  color: #D73A31;
  display: block;
  font-size: 2em;
  font-weight: bold;
  margin: 1em auto;
  padding: 1em 3em;
  position: relative;
  text-transform: uppercase;
}

.btn-1::after {
  height: 0;
  left: 0;
  top: 0;
  width: 100%;
}

.btn-1:hover:after {
  height: 100%;
}

button::before,
button::after {
  background: #D73A31;
  content: '';
  position: absolute;
  z-index: -1;
}

 
/* BUTTON 1 */


</style>



<body>


<div class="container">
  <button class="btn-1">Button 1</button>
  <button class="btn-2">Button 1</button>
</div>




</body>
</html>