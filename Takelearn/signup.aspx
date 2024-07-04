<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="Takelearn.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up | Takelearn</title>
    
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <meta name="keywords" content="footer, address, phone, icons" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" />
    <link href="https://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/header.css" />
    <link rel="stylesheet" href="css/footer.css" />
    <link rel="stylesheet" href="css/signup.css" />

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
        <a class="links" href="home.aspx">Login</a>
        </div>
        </nav>
    </div>


    <br />


    <!-- Body -->
    <fieldset class="lgnfieldset">
    <legend style="font-size:18px;">Sign Up to Takelearn </legend>
                
    <form id="form2" runat="server" class="fieldset">

                <label for="fullname"><b>Full Name <span style="color: red;">*</span></b><asp:RequiredFieldValidator runat="server" ErrorMessage="Name is mandatory" ControlToValidate="TextBox1" ForeColor="Red" ClientIDMode="Inherit" ValidationGroup="signupbtn"></asp:RequiredFieldValidator></label>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

                <label for="password"><b>Password <span style="color: red;">*</span></b><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Password is mandatory" ControlToValidate="TextBox2" ForeColor="Red" ValidationGroup="signupbtn"></asp:RequiredFieldValidator></label>
                <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>



                <label for="confirmpassword"><b>Confirm Password <span style="color: red;">*</span></b><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="This field is mandatory." ControlToValidate="TextBox3" ForeColor="Red" ValidationGroup="signupbtn"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password did not match." ValidationGroup="signupbtn" ControlToValidate="TextBox3" ForeColor="Red" ControlToCompare="TextBox2"></asp:CompareValidator></label>
        <asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox>




                <label for="number"><b>Number <span style="color: red;">*</span></b><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="Red" ErrorMessage="Number is mandatory." ControlToValidate="Number" ValidationGroup="signupbtn"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Number" ValidationGroup="signupbtn" ErrorMessage="Number should be of 10 digits." ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator></label>
                <asp:TextBox ID="Number" runat="server"></asp:TextBox>


                <br />
                <br />

                <label for="gender"><b>Gender</b><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="Red" ErrorMessage="Please select Gender" ControlToValidate="RadioButtonList1" ValidationGroup="signupbtn"></asp:RequiredFieldValidator></label>
                <asp:RadioButtonList ID="RadioButtonList1" class="checkmark" runat="server">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:RadioButtonList>


                <br />

                <label for="email"><b>Email <span style="color: red;">*</span></b><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Email is mandatory" ControlToValidate="TextBox4" ForeColor="Red" ValidationGroup="signupbtn"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email."  ControlToValidate="TextBox4" ForeColor="Red" ValidationGroup="signupbtn" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></label>
        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                

                <asp:Button runat="server" ID="btn_Signup" CssClass="lgnbtn" Text="Signup" OnClick="Registration_Click" ValidationGroup="signupbtn" />
        
            <asp:Button runat="server" ID="btn_cancel" Text="Cancel" CssClass="sgnbtn" OnClick="Cancel_Click" />
                <asp:LinkButton runat="server" ID="btn_login" CssClass="loginnowbtn" OnClick="Can_Click">Login Now</asp:LinkButton>
    
    </form>
        
    </fieldset>




    
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
