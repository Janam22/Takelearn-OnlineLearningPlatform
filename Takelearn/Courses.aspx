<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="Takelearn.Courses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <title>Courses | Takelearn</title>
    
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <meta name="keywords" content="footer, address, phone, icons" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" />
    <link href="https://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/header.css" />
    <link rel="stylesheet" href="css/footer.css" />
    <link rel="stylesheet" href="css/signup.css" />
    <link rel="stylesheet" href="css/style.css" />

    <style>        
        table
        {
            border: 1px solid #ccc;
            border-collapse: collapse;
            background-color: #fff;
        }
        
        table th
        {   
            background-color: dodgerblue;
            color: white;
            font-weight: bold;
            min-width:120px;
        }
        table th, table td
        {
            text-align: left;
            padding: 8px;
            border: 1px solid #ccc;
        }
        table, table table td
        {
            border: 0px solid #ccc;
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
        <a class="links" href="home.aspx">Login</a>
        </div>
        </nav>
    </div>


    <br />

    
    <form id="form2" runat="server">
    <!-- Body -->
                <h1>Programming Courses</h1>
        <asp:GridView ID="GridView1" runat="server" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
    AutoGenerateColumns="false" EmptyDataText="No records has been added.">
            <Columns>
                
                    <asp:BoundField DataField="course_name" HeaderText="Course Name"/>
                    <asp:BoundField DataField="course_description" HeaderText="Course Description"/>
                    <asp:BoundField DataField="course_duration" HeaderText="Course Duration"/>
                    <asp:BoundField DataField="fullname" HeaderText="Tutor"/>

            </Columns>
        </asp:GridView>
        
        <asp:Button runat="server" ID="Button2" CssClass="subscribe-btn" OnClick="EnrollProgramming" Text="Enroll Now" />
    
                <h1>Networking Courses</h1>
        
        <asp:GridView ID="GridView2" runat="server" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
    AutoGenerateColumns="false" EmptyDataText="Networking Courses are not available at this moment.">
            <Columns>
                
                    <asp:BoundField DataField="course_name" HeaderText="Course Name"/>
                    <asp:BoundField DataField="course_description" HeaderText="Course Description"/>
                    <asp:BoundField DataField="course_duration" HeaderText="Course Duration"/>
                    <asp:BoundField DataField="fullname" HeaderText="Tutor"/>

            </Columns>
        </asp:GridView>
        
        <asp:Button runat="server" ID="FeedbackG" CssClass="subscribe-btn" OnClick="EnrollNetworking" Text="Enroll Now" />

                <h1>Business Administration Courses</h1>
        
        <asp:GridView ID="GridView3" runat="server" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
    AutoGenerateColumns="false" EmptyDataText="Business Administration courses are not vailable at this moment.">
            <Columns>
                
                    <asp:BoundField DataField="course_name" HeaderText="Course Name"/>
                    <asp:BoundField DataField="course_description" HeaderText="Course Description"/>
                    <asp:BoundField DataField="course_duration" HeaderText="Course Duration"/>
                    <asp:BoundField DataField="fullname" HeaderText="Tutor"/>

            </Columns>
        </asp:GridView>
        
        <asp:Button runat="server" ID="Button1" CssClass="subscribe-btn" OnClick="EnrollBusiness" Text="Enroll Now" />
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
</body>
</html>
