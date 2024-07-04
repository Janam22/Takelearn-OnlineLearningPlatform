<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="Takelearn.about" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About Us</title>
	
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <meta name="keywords" content="footer, address, phone, icons" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" />
    <link href="https://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/header.css" />
    <link rel="stylesheet" href="css/footer.css" />
    <link rel="stylesheet" href="css/about.css" />
    
    <style>
        
        .lecturer_profile {
            height: 400px;
        }

        .lecturer_profile img{
            height: 200px !important;
            width: 200px !important;
            border-radius: 50%;
            
        }
    </style>
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
                    <h2>About Us</h2>
                    <p>Takelearn team comprises of highly experienced lecturers from LBEF College, Nepal. They have certified knowledge and several years of experience in the field of Programming. We provide quality and Job based Education.</p>
            </div>

            <div class="profiles" style="margin-top: 40px; padding: 20px 0;">
                <h2>Takelearn Team</h2>

                <div class="main-content" >
                
                        <div class="col-4 col-l-4 col-m-6 col-s-12 column">
                            <div class="box lecturer_profile" title="Jasbir Singh Makkar">
        
                                    <img src="images/jasbir.jpg" alt="Jasbir Singh Makkar" />
                                    <h4>Jasbir Singh Makkar </h4>
                                    <p>College Lecturer at Lord Buddha Education Foundation (LBEF). He teaches Programming at LBEF. He has 10 years of experience as a C# Developer.</p>
                                    
                            </div>
                            
                        </div>

                                                <div class="col-4 col-l-4 col-m-6 col-s-12 column">
                            <div class="box lecturer_profile" title="Jyotir Moy Chatterjee">
        
                                    <img src="images/jyotir.png" alt="Jyotir Moy Chatterjee" />
                                    <h4>Jyotir Moy Chatterjee</h4>
                                    <p>College Lecturer at Lord Buddha Education Foundation (LBEF). He teaches Fundamentals of Programming at LBEF. He has 10 year of experience as a Python Developer.</p>
                                    
                            </div>
                            
                        </div>

                                                <div class="col-4 col-l-4 col-m-6 col-s-12 column">
                            <div class="box lecturer_profile" title="Janam Pandey">
        
                                    <img src="images/janam.png" alt="Janam Pandey" />
                                    <h4>Janam Pandey</h4>
                                    <p>College Lecturer at Lord Buddha Education Foundation (LBEF). He teaches Fundamentals of Programming at LBEF. He has 2 year of experience as a PHP Developer.</p>
                                    
                            </div>
                            
                        </div>

                                                <div class="col-4 col-l-4 col-m-6 col-s-12 column">
                            <div class="box lecturer_profile" title="Purnima Oli">
        
                                    <img src="images/purnima.jpg" alt="Purnima Oli" />
                                    <h4>Purnima Oli</h4>
                                    <p>College Lecturer at Lord Buddha Education Foundation (LBEF). She teaches Fundamentals of Programming at LBEF. She has 2 year of experience as a C Programmer.</p>
                                    
                            </div>
                            
                        </div>
                        
                        <div class="col-4 col-l-4 col-m-6 col-s-12 column">
                            <div class="box lecturer_profile" title="Dipak Nyaupane">
        
                                    <img src="images/dipak.jpg" alt="Dipak Nyaupane" />
                                    <h4>Dipak Nyaupane</h4>
                                    <p>College Lecturer at Lord Buddha Education Foundation (LBEF). He teaches Fundamentals of Programming at LBEF. He has 2 year of experience as a Java Developer.</p>
                                    
        
                            </div>
                            
                        </div>
         
                        <div class="col-4 col-l-4 col-m-6 col-s-12 column">
                            <div class="box lecturer_profile" title="Kushal Bhattarai">
        
                                    <img src="images/kushal.jpg" alt="Kushal Bhattarai" />
                                    <h4>Kushal Bhattarai</h4>
                                    <p>College Lecturer at Lord Buddha Education Foundation (LBEF). He teaches Fundamentals of MySQL at LBEF. He has 2 years of experience as a MySQL tutor.</p>    
        
                            </div>             
                        </div>
                             
                    </div> <!-- end main-content-->
            </div>

           
        </div> <!-- end main container-->
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
