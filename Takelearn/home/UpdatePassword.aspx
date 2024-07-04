<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdatePassword.aspx.cs" Inherits="Takelearn.home.UpdatePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Change Password | Takelearn</title>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
	
    <meta name="keywords" content="footer, address, phone, icons" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" />
    <link href="https://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="../css/signup.css" />
    <link rel="stylesheet" href="../css/footer.css" />
    <link rel="stylesheet" href="../css/header.css" />
</head>
<body>
    
    <form id="form2" runat="server">
	    <!-- Header -->
    <div>
        <nav>
            <asp:LinkButton ID="btnHome" CssClass="links" PostBackUrl="Dashboard.aspx" runat="server">Takelearn</asp:LinkButton>
        <asp:Image ID="Image1" style="border-radius:50%" Height="50" Width="50" src="../images/login.jpg" runat="server" /><asp:Label ID="welcome" CssClass="links" runat="server"></asp:Label>
        <div class="rightSection">
            <asp:LinkButton ID="btnCourse" CssClass="links" PostBackUrl="ManageCourse.aspx" runat="server">Manage Course</asp:LinkButton>
            <asp:LinkButton ID="btnTutor" CssClass="links" PostBackUrl="ManageTutor.aspx" runat="server">Manage Tutor</asp:LinkButton>
            <asp:LinkButton ID="btnStudent" CssClass="links" PostBackUrl="ManageStudents.aspx" runat="server">Manage Student</asp:LinkButton>
            <asp:LinkButton ID="btnstudentonmycourse" CssClass="links" PostBackUrl="StudentsOnMyCourse.aspx" runat="server">Students on My Course</asp:LinkButton>
            <asp:LinkButton ID="btnEnroll" CssClass="links" PostBackUrl="Enroll.aspx" runat="server">Enroll and Manage</asp:LinkButton>
            <asp:LinkButton ID="btnFeedback" CssClass="links" PostBackUrl="ManageFeedback.aspx" runat="server">Manage Feedback</asp:LinkButton>
            <asp:LinkButton ID="btnProfile" CssClass="links" PostBackUrl="UpdateDetails.aspx" runat="server">Manage Profile</asp:LinkButton>
            <asp:LinkButton ID="btnChangePassword" CssClass="links" PostBackUrl="UpdatePassword.aspx" runat="server">Change Password</asp:LinkButton>
            <asp:LinkButton ID="btnlog" CssClass="links" OnClick="btnLogout_Click" runat="server">Logout</asp:LinkButton>
        </div>
        </nav>
    </div>


        <br /><br />
		<h1>Change Password</h1>
    
            <!-- Body -->
    <fieldset class="lgnfieldset">
    <legend style="font-size:18px;">Change Password</legend>
     
    <div class="fieldset">
     <asp:Label ID="lblCurrentPassword" runat="server" 
        Text="Current Password:"><b>Current Password<span style="color: red;">*</span><asp:Label ID="message" runat="server"></asp:Label></b> <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Password is mandatory" ControlToValidate="txtCurrentPassword" ForeColor="Red" ValidationGroup="btnUpdatePassword"></asp:RequiredFieldValidator></asp:Label>
    <asp:TextBox ID="txtCurrentPassword" runat="server" 
        TextMode="Password"></asp:TextBox>
        
    <asp:Label ID="lblNewPassword" runat="server" 
        Text="New Password"><b>New Password <span style="color: red;">*</span></b><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password is mandatory" ControlToValidate="txtNewPassword" ForeColor="Red" ValidationGroup="btnUpdatePassword"></asp:RequiredFieldValidator></asp:Label>
    <asp:TextBox ID="txtNewPassword" runat="server" 
        TextMode="Password"></asp:TextBox>
    
    
    <asp:Label ID="lblConfirmPassword" runat="server" 
            Text="Confirm Password:"><b>Confirm Password <span style="color: red;">*</span></b><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="This field is mandatory." ControlToValidate="txtConfirmPassword" ForeColor="Red" ValidationGroup="btnUpdatePassword"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password did not match." ValidationGroup="btnUpdatePassword" ControlToValidate="txtConfirmPassword" ForeColor="Red" ControlToCompare="txtNewPassword"></asp:CompareValidator></asp:Label>
    <asp:TextBox ID="txtConfirmPassword" runat="server" 
            TextMode="Password"></asp:TextBox>
        
        
                     <asp:Button runat="server" CssClass="lgnbtn" ID="btnUpdatePassword" PostBackUrl="UpdatePassword.aspx"
                        onclick="btnUpdatePassword_Click" 
                        Text="Change Password" ValidationGroup="btnUpdatePassword" />
        
     <asp:Button ID="btnDashboard" CssClass="sgnbtn" runat="server" PostBackUrl="~/home/Dashboard.aspx" 
        Text="Cancel" />
        </div>
        
    </fieldset>

    
    </form>
		<!-- Footer -->

		<footer class="footer-distributed">

			<div class="footer-left">
				<h3>Takelearn</h3>

				<p class="footer-links">
					<a href="Dashboard.aspx">Dashboard</a>
					|
					<a href="UpdatePassword.aspx">Change Password</a>
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
