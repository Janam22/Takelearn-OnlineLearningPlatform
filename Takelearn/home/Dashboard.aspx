<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Takelearn.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard | Takelearn</title>
    	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <meta name="keywords" content="footer, address, phone, icons" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" />
    <link href="https://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css" />

    <link rel="stylesheet" href="../css/footer.css" />
    <link rel="stylesheet" href="../css/header.css" />
    <link rel="stylesheet" href="../css/style.css" />

    <style>
        .btn-group:after {
         content: "";
         clear: both;
         display: table;
        }
        .btn-group button {
         background-color: #04AA6D; /* Green background */
         border: 1px solid green; /* Green border */
         color: white; /* White text */
         padding: 10px 24px; /* Some padding */
         cursor: pointer; /* Pointer/hand icon */
         float: left; /* Float the buttons side by side */
        }

        .grid-container {
         display: grid;
         grid-template-columns: 1fr 1fr;
         grid-gap: 20px;
        }

        @media screen and (max-width: 600px) {
          .grid-container {
           width: 100%;
         display: block;
            }
        }

        table {
         border-collapse: collapse;
         border-spacing: 0;
         width: 100%;
         border: 1px solid #ddd;
        }

        th, td {
         text-align: left;
         padding: 8px;
        }

        tr:nth-child(even){background-color: #f2f2f2}

        .button {
         display: inline-block;
         border-radius: 4px;
         background-color: dodgerblue;
         border: none;
         color: #FFFFFF;
         text-align: center;
         font-size: 20px;
         padding: 15px;
         width: 200px;
         float:right;
         cursor: pointer;
         margin: 2px;
        }

        .button:hover {
         background-color: rgb(214, 238, 77);
         color: rgb(42, 10, 94);
        }

    </style>
</head>
<body>
    
    <form id="form1" runat="server">
        	    <!-- Header -->
    <div>
        <nav>
            <asp:LinkButton ID="btnHome" CssClass="links" PostBackUrl="Dashboard.aspx" runat="server">Takelearn</asp:LinkButton>
        <asp:Label ID="welcome" CssClass="links" runat="server"></asp:Label><asp:Image ID="Image1" style="border-radius:50%" Height="50" Width="50" src="../images/login.jpg" runat="server" />
        <div class="rightSection">
            <asp:LinkButton ID="btnCourse" CssClass="links" PostBackUrl="ManageCourse.aspx" runat="server">Manage Course</asp:LinkButton>
            <asp:LinkButton ID="btnTutor" CssClass="links" PostBackUrl="ManageTutor.aspx" runat="server">Manage Tutor</asp:LinkButton>
            <asp:LinkButton ID="btnstudentonmycourse" CssClass="links" PostBackUrl="StudentsOnMyCourse.aspx" runat="server">Students on My Course</asp:LinkButton>
            <asp:LinkButton ID="btnStudent" CssClass="links" PostBackUrl="ManageStudents.aspx" runat="server">Manage Student</asp:LinkButton>
            <asp:LinkButton ID="btnEnroll" CssClass="links" PostBackUrl="Enroll.aspx" runat="server">Enroll and Manage</asp:LinkButton>
            <asp:LinkButton ID="btnFeedback" CssClass="links" PostBackUrl="ManageFeedback.aspx" runat="server">Manage Feedback</asp:LinkButton>
            <asp:LinkButton ID="btnProfile" CssClass="links" PostBackUrl="UpdateDetails.aspx" runat="server">Manage Profile</asp:LinkButton>
            <asp:LinkButton ID="btnChangePassword" CssClass="links" PostBackUrl="UpdatePassword.aspx" runat="server">Change Password</asp:LinkButton>
            <asp:LinkButton ID="btnlog" CssClass="links" OnClick="btnLogout_Click" runat="server">Logout</asp:LinkButton>
        </div>
        </nav>
    </div>


        <br /><br />

    <!-- Body -->

        
        
        <h1><asp:Label ID="lblUserAccount" runat="server" Font-Bold="True" 
            Font-Size="Larger"></asp:Label></h1>

        <div class="grid-container">
        <div class="grid-child purple">
       
            <fieldset class="lgnfieldset">
                
<asp:Label ID="personalinfo" runat="server">
            <legend style="font-size:18px;">Personal Information </legend>
                
            <div style="overflow-x:auto;">
            <table>

            <tr>  
            <td><b>Full Name : </b></td>  
            <td> <asp:Label ID="lbl_fullname" runat="server" Font-Bold="True"></asp:Label><br /></td>  
            </tr>  
            <tr>  
            <td><b>Number : </b></td>  
            <td> <asp:Label ID="lbl_number" runat="server" Font-Bold="True"></asp:Label><br /></td>  
            </tr>  
            <tr>  
            <td><b>Email : </b></td>  
            <td><asp:Label ID="lbl_email" runat="server" Font-Bold="True"></asp:Label><br /></td>  
            </tr>  
            <tr>  
            <td><b>Gender : </b></td>  
            <td><asp:Label ID="lbl_gender" runat="server" Font-Bold="True"></asp:Label><br /></td>  
            </tr>  
        
            <tr>  
            <td><b>Role : </b></td>  
            <td><asp:Label ID="lbl_designation" runat="server" Font-Bold="True"></asp:Label><br /></td>  
            </tr>  
            </table>  
            </div>
                  </asp:Label>

<asp:Label ID="studentfeedback" runat="server">
    
            <legend style="font-size:18px;">Send Feedback To Us </legend>
                                    <div class="form-group">
                                    <label for="feedback"><b>Feedback/Grievance</b> <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Feedback/Grievance" ForeColor="Red" ValidationGroup="feedback" ControlToValidate="Feedback"></asp:RequiredFieldValidator></label>
                                    <asp:TextBox runat="server" ID="Feedback" placeholder="Enter Feedback/Grievance"></asp:TextBox>

                                    <asp:Button runat="server" ID="FeedbackG" CssClass="subscribe-btn" OnClick="Btn_Feedback" Text="Send Feedback" ValidationGroup="feedback" />
                                    </div>
    </asp:Label>
            
        </fieldset>

    </div>

    <div class="grid-child green">
        
    <fieldset class="lgnfieldset">
    <legend style="font-size:18px;">Quick Information </legend>
        
            <div style="overflow-x:auto;">
            <table>

            <asp:Label ID="sttotalenrolledcourses" runat="server" Font-Bold="True">
            <tr>  
            <td><b>Total Enrolled Courses : </b></td>  
            <td> <asp:Label ID="enrolledcourses" runat="server" Font-Bold="True"></asp:Label><br /></td>  
            </tr>  
            </asp:Label>
                
            <asp:Label ID="stcoursescatagory" runat="server" Font-Bold="True">
            <tr>  
            <td><b>Total Course Categories Offered: </b></td>  
            <td> <asp:Label ID="coursescatagory" Text="3 Categories" runat="server" Font-Bold="True"></asp:Label><br /></td>  
            </tr>  
            </asp:Label>
                
            <asp:Label ID="sttotalcourses" runat="server" Font-Bold="True">
            <tr>  
            <td><b>Total Courses Offered : </b></td>  
            <td><asp:Label ID="courses" runat="server" Font-Bold="True"></asp:Label><br /></td>  
            </tr>  
            </asp:Label>
                
            <asp:Label ID="sttotaltutors" runat="server" Font-Bold="True">
            <tr>  
            <td><b>Total Tutors : </b></td>  
            <td><asp:Label ID="tutors" runat="server" Font-Bold="True"></asp:Label><br /></td>  
            </tr>  
            </asp:Label>


                
            <asp:Label ID="tutotalstudents" runat="server" Font-Bold="True">
            <tr>  
            <td><b>Total Students: </b></td>  
            <td> <asp:Label ID="totalstudents" runat="server" Font-Bold="True"></asp:Label><br /></td>  
            </tr>  
            </asp:Label>
                
            <asp:Label ID="tutotalenrolledstudents" runat="server" Font-Bold="True">
            <tr>  
            <td><b>Total Enrolled Students : </b></td>  
            <td><asp:Label ID="totalenrolledstudents" runat="server" Font-Bold="True"></asp:Label><br /></td>  
            </tr>  
            </asp:Label>
                
            <asp:Label ID="tutotalenrolledonmycourse" runat="server" Font-Bold="True">
            <tr>  
            <td><b>Total Students Enrolled on my Course : </b></td>  
            <td><asp:Label ID="studentsonmycourse" runat="server" Font-Bold="True"></asp:Label><br /></td>  
            </tr>  
            </asp:Label>
                
            <asp:Label ID="tumytotalcourses" runat="server" Font-Bold="True">
            <tr>  
            <td><b>My Total Courses : </b></td>  
            <td><asp:Label ID="mytotalcourses" runat="server" Font-Bold="True"></asp:Label><br /></td>  
            </tr>  
            </asp:Label>
        


            </table>  
            </div>
    </fieldset>
    </div>
  
</div>
        

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
