<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="Takelearn.contact" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact | Takelearn</title>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <meta name="keywords" content="footer, address, phone, icons" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" />
    <link href="https://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/header.css" />
    <link rel="stylesheet" href="css/footer.css" />
    <link rel="stylesheet" href="css/contact.css" />
</head>
<body>

    
    <!-- Header -->
    <div>
        <nav>
        <a class="links logo" href="home.aspx">Takelearn</a>
        <div class="rightSection">
        <a class="selected links" href="home.aspx">Home</a>
        <a class="links" href="Courses.aspx">Courses</a>
        <a class="links" href="contact.aspx">Contact Us</a>
        <a class="links" href="about.aspx">About Us</a>
        <a class="links" href="signup.aspx">Signup</a>
        </div>
        </nav>
    </div>


    <!-- Body -->

	
    <section id="main">
        <div class="container">
            
            <div class="row" id="introduction">
                    <h1>Contact Us</h1>
            </div>
                
                <div class="location">
					<i class="fa fa-map-marker"></i>
					  <span style="font-size:20px;font-weight:bold;">Locate Us in Map</span>
                </div>

            <div class="main-content">
                    
                <iframe src="https://maps.google.com/maps?width=100%25&amp;height=600&amp;hl=en&amp;q=27.7056312,85.33307666689453+(Takelearn)&amp;t=&amp;z=14&amp;ie=UTF8&amp;iwloc=B&amp;output=embed" width="600" height="450" frameborder="0" style="border:0;"></iframe>

                <div class="address" style="margin-top: 30px;">
                    <address>Location: Maitidevi, Kathmandu (Opposite To Maitidevi Temple)</address>
                    <address>Contact No: +977-9866077949, +977-9813074888</address>
                    <address>Email: support@takelearn.com</address>


                </div>
                
            </div>
           
        </div> 
    </section>
    <!-- main section end-->

	
    
		<!-- Footer -->

		<footer class="footer-distributed">

			<div class="footer-left">
				<h3>Takelearn</h3>

				<p class="footer-links">
					<a href="home.aspx">Home</a>
					|
					<a href="about.aspx">About Us</a>
					|
					<a href="contact.aspx">Contact Us</a>
				</p>

				<p class="footer-company-name">© 2022 Janam Pandey</p>
			</div>

			<div class="footer-center">
				<div>
					<i class="fa fa-map-marker"></i>
					  <p><span>Maitidevi, Kathmandu</span>
						Bagmati Province, Nepal</p>
				</div>

				<div>
					<i class="fa fa-phone"></i>
					<p>+977-9866077949</p>
				</div>
				<div>
					<i class="fa fa-envelope"></i>
					<p><a href="mailto:support@takelearn.com">support@takelearn.com</a></p>
				</div>
			</div>
			<div class="footer-right">
				<p class="footer-company-about">
					<span>About Us</span>
					Takelearn team comprises of highly experienced lecturers from LBEF College, Nepal. They have certified knowledge and several years of experience in the field of Programming.</p>
				<div class="footer-icons">
					<a href="#"><i class="fa fa-facebook"></i></a>
					<a href="#"><i class="fa fa-twitter"></i></a>
					<a href="#"><i class="fa fa-instagram"></i></a>
					<a href="#"><i class="fa fa-linkedin"></i></a>
					<a href="#"><i class="fa fa-youtube"></i></a>
				</div>
			</div>
		</footer>


</body>
</html>
