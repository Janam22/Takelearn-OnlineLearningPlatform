<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Takelearn.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Page | Takelearn</title>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="keywords" content="footer, address, phone, icons" />
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" />
    <link href="https://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/home.css" />
    <link rel="stylesheet" href="css/header.css" />
    <link rel="stylesheet" href="css/footer.css" />
    <link rel="stylesheet" href="css/style.css" />
    
    <link rel="stylesheet" href="css/owl.carousel.min.css" />
    <link rel="stylesheet" href="css/owl.theme.default.min.css" /> 


</head>
<body>
    
    <form id="form2" runat="server">
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
    
    <br />


    <!-- Body -->
    <fieldset class="contentfieldset">
    <legend style="font-size:18px;">Learn with Us</legend>
        <div class="main">
  <div class="left">
        <p><img src="images/learning.jpg" class="img" /></p>
      </div>
      &nbsp;&nbsp;
            
  <div class="right">
        <p style="text-align:justify;">Takelearn is an online learning platform that takes place over the Internet. It is commonly referred to as “e-
learning” among other terms. However, online learning is just one type of “distance learning” -
the umbrella term for any learning that takes place across distance and not in a traditional
classroom.<br />
            In years past, instructors had to create their “virtual classrooms” from scratch which was difficult
and often led to poor results. Today, an entire industry has emerged to do this for us. Online Learning software is utilized by just about all colleges today. It allow
instructors to design and deliver their courses within a flexible framework that includes a number
of different tools to enable learning and communication to occur.</p>
      </div>
            </div>
    </fieldset>

    <fieldset class="lgnfieldset">
    <legend style="font-size:18px;">Login to Takelearn </legend>
        <div class="fieldset">
            <label for="gmail"><b>Email</b> <asp:RequiredFieldValidator ID="UserName" runat="server" ErrorMessage="Enter Email" ForeColor="Red" ValidationGroup="loginbtn" ControlToValidate="txtEmail"></asp:RequiredFieldValidator></label>
            <asp:TextBox runat="server" ID="txtEmail" placeholder="Enter Email"></asp:TextBox>
            <label for="psw"><b>Password</b><asp:RequiredFieldValidator ID="Password" runat="server" ErrorMessage="Enter Password" ForeColor="Red" ValidationGroup="loginbtn" ControlToValidate="txtpassword"></asp:RequiredFieldValidator></label>
            <asp:TextBox runat="server" ID="txtpassword" TextMode="Password" placeholder="Enter Password"></asp:TextBox>
            <asp:Button runat="server" ID="btn_Login" CssClass="lgnbtn" Text="Login" OnClick="Btn_Login_Click" ValidationGroup="loginbtn" />
                <asp:LinkButton ID="Signup" runat="server" CssClass="loginnowbtn" OnClick="Btn_signup">Don't have an account? Sign Up</asp:LinkButton>
            </div>
    </fieldset>


    <fieldset class="coursefieldset">
        
<style>

.glow{
background-color: #ebf3ff;
  background-size: 300px 100px;
  padding: 35px;
  width: 100%;
}

.glow-on-hover {
  display: block;
  margin-left: auto;
  margin-right: auto;
    width: 270px;
    height: 100px;
    border: none;
    font-size:20px;
    outline: none;
    color: #fff;
    background: dodgerblue;
    cursor: pointer;
    position: relative;
    z-index: 0;
    border-radius: 10px;
}

.glow-on-hover:before {
    content: '';
    background: linear-gradient(45deg, #ff0000, #ff7300, #fffb00, #48ff00, #00ffd5, #002bff, #7a00ff, #ff00c8, #ff0000);
    position: absolute;
    top: -2px;
    left:-2px;
    background-size: 400%;
    z-index: -1;
    filter: blur(5px);
    width: calc(100% + 4px);
    height: calc(100% + 4px);
    animation: glowing 20s linear infinite;
    opacity: 0;
    transition: opacity .3s ease-in-out;
    border-radius: 10px;
}

.glow-on-hover:active {
    color: #000
}

.glow-on-hover:active:after {
    background: transparent;
}

.glow-on-hover:hover:before {
    opacity: 1;
}

.glow-on-hover:after {
    z-index: -1;
    content: '';
    position: absolute;
    width: 100%;
    height: 100%;
    background: dodgerblue;
    left: 0;
    top: 0;
    border-radius: 10px;
}

@keyframes glowing {
    0% { background-position: 0 0; }
    50% { background-position: 400% 0; }
    100% { background-position: 0 0; }
}

</style>

<div class="glow">
<button class="glow-on-hover" onclick="document.location='Courses.aspx'" type="button">View Offered Courses</button> 
</div>




    </fieldset>


    
    <section id="main">
        <div class="container">

                <div class="row" id="after-main">
                <section id="newsletter" class="col-4 col-l-4 col-m-6 col-s-12">

                                    <h3>Send Feedback To Us</h3>
                                    <div class="form-group">
                                    <label for="name"><b>Full Name</b> <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Full name" ForeColor="Red" ValidationGroup="feedback" ControlToValidate="FullName"></asp:RequiredFieldValidator></label>
                                    <asp:TextBox runat="server" ID="FullName" placeholder="Enter Full Name"></asp:TextBox>
                                    <label for="email"><b>Email</b> <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Email" ForeColor="Red" ValidationGroup="feedback" ControlToValidate="Email"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email."  ControlToValidate="Email" ForeColor="Red" ValidationGroup="feedback" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></label>
                                    <asp:TextBox runat="server" ID="Email" placeholder="Enter Email"></asp:TextBox>

                                    <label for="feedback"><b>Feedback/Grievance</b> <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Feedback/Grievance" ForeColor="Red" ValidationGroup="feedback" ControlToValidate="Feedback"></asp:RequiredFieldValidator></label>
                                    <asp:TextBox runat="server" ID="Feedback" placeholder="Enter Feedback/Grievance"></asp:TextBox>
                                        
                                    <asp:Button runat="server" ID="FeedbackG" CssClass="subscribe-btn" OnClick="Btn_Feedback" Text="Send Feedback" ValidationGroup="feedback" />
                                    </div>
                                    
                </section>
                
                <div class="col-1 col-l-1 col-m-1">&nbsp;</div>

                <div class="carousel col-7 col-l-7 col-m-5 col-s-12">
                    <h3>Our Sponsors</h3>
                        <div class="owl-carousel">
                                <div class="item"><img src="images/apu_logo_edit.png" /></div>
                                <div class="item"><img src="images/lbef_logo_edit.png" /></div>
                                <div class="item" style="margin-top:35px;"><img src="images/w3schools_logo_edit.png" /></div>
                                <div class="item" style="margin-top:15px;"><img src="images/stackoverflow_logo_edit.png" /></div>
                                <div class="item"><img src="images/coursera.png" /></div>
                                <div class="item" style="margin-top:25px;"><img src="images/codeacademy.png" /></div>
                                
            
                        </div> <!-- end owl carousel-->

                </div>
                
            </div><!-- end row-->
            </div>
        </section>

        
    </form>
    
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

    
    <script src="js/jquery-3.4.1.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/owl-script.js"></script>

</body>
</html>
