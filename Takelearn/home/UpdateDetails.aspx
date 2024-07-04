<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateDetails.aspx.cs" Inherits="Takelearn.home.StudentDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Details | Takelearn</title>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <meta name="keywords" content="footer, address, phone, icons" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" />
    <link href="https://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css" />

    <link rel="stylesheet" href="../css/signup.css" />
    <link rel="stylesheet" href="../css/footer.css" />
    <link rel="stylesheet" href="../css/header.css" />

    <style>
        
        .inputtext {
         width: 100%;
         padding: 12px 20px;
         margin: 8px 0;
         display: inline-block;
         border: 1px solid #ccc;
         border-radius: 4px;
         box-sizing: border-box;
        }
    </style>
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
            <asp:LinkButton ID="btnLogout" CssClass="links" OnClick="btnLogout_Click" runat="server">Logout</asp:LinkButton>
        </div>
        </nav>
    </div>


        <br /><br />
		<h1>Update Details</h1>
        <br />
            <!-- Body -->
    <fieldset class="lgnfieldset">
    <legend style="font-size:18px;">Update Details on Takelearn </legend>
        <div class="fieldset">  
            <!--
                <label for="id"><b>ID</b></label>
                <asp:Label ID="txtid" runat="server" Text="ID"></asp:Label>
            -->
                <label for="fullname"><b>Full Name <span style="color: red;">*</span></b><asp:RequiredFieldValidator runat="server" ErrorMessage="Name is mandatory" ControlToValidate="txtfullname" ForeColor="Red" ClientIDMode="Inherit" ValidationGroup="signupbtn"></asp:RequiredFieldValidator></label>
                <asp:TextBox ID="txtfullname" runat="server"></asp:TextBox>

                <label for="number"><b>Number <span style="color: red;">*</span></b><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="Red" ErrorMessage="Number is mandatory." ControlToValidate="txtnumber" ValidationGroup="signupbtn"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtnumber" ValidationGroup="signupbtn" ForeColor="Red" ErrorMessage="Number should be of 10 digits." ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator></label>
                <asp:TextBox ID="txtnumber" runat="server"></asp:TextBox>


                <br />
                <br />

                <label for="gender"><b>Gender</b><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="Red" ErrorMessage="Please select Gender" ControlToValidate="DropDownList1" ValidationGroup="signupbtn"></asp:RequiredFieldValidator></label>
                <asp:RadioButtonList ID="DropDownList1" class="inputtext" runat="server">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:RadioButtonList>

                <br />

                <label for="email"><b>Email <span style="color: red;">*</span></b><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Email is mandatory" ControlToValidate="txtemail" ForeColor="Red" ValidationGroup="signupbtn"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email."  ControlToValidate="txtemail" ForeColor="Red" ValidationGroup="signupbtn" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></label>
                <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
                

                <asp:Button runat="server" ID="btn_Signup" CssClass="lgnbtn" Text="Update Details" OnClick="Update_Click" PostBackUrl="UpdateDetails.aspx" ValidationGroup="signupbtn" />
        
            <asp:Button runat="server" ID="btn_cancel" Text="Cancel" CssClass="sgnbtn" PostBackUrl="Dashboard.aspx" />
    
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
