<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Enroll.aspx.cs" Inherits="Takelearn.home.Enroll" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <title>Manage Courses | Takelearn</title>
    <meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <meta name="keywords" content="footer, address, phone, icons" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" />
    <link href="https://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.blockUI.js"></script>

    <link rel="stylesheet" href="../css/footer.css" />
    <link rel="stylesheet" href="../css/header.css" />
    <link rel="stylesheet" href="../css/addstudent.css" />

    <style>
          
        .grid-container {
         display: grid;
         grid-template-columns: 1.4fr 0.6fr;
         grid-gap: 20px;
        }

        @media screen and (max-width: 600px) {
          .grid-container {
           width: 100%;
         display: block;
            }
        }

        .inputtext {
         width: 100%;
         padding: 12px 20px;
         margin: 8px 0;
         display: inline-block;
         border: 1px solid #ccc;
         border-radius: 4px;
         box-sizing: border-box;
        }

        
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

        
        .btn{          
         width: 100%;
         background-color: #4CAF50;
         color: white;
         padding: 7px 10px;
         border: none;
         border-radius: 4px;
         text-decoration: none;
         cursor: pointer;
        }
        
        .btndelete{          
         width: 100%;
         background-color: darkred;
         color: white;
         padding: 7px 10px;
         border: none;
         border-radius: 4px;
         text-decoration: none;
         cursor: pointer;
        }
        
        .btnsearch{          
         width: 100%;
         background-color: #4CAF50;
         color: white;
         padding: 14px 20px;
         border: none;
         border-radius: 4px;
         text-decoration: none;
         cursor: pointer;
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
		<h1>Manage Enrollment</h1>
        <h3 style="color:red;">Please use Delete button to unenroll from the course.</h3>

        <!-- Body -->

        
			<div class="grid-container">
			<div class="grid-child purple">
                
                
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<div id="dvGrid" style="padding: 10px; width: 450px"> 
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" OnRowDataBound="OnRowDataBound"
            DataKeyNames="id" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit" PageSize = "4" AllowPaging ="true" OnPageIndexChanging = "OnPaging"
            OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added."
            Width="450">
            <Columns>

                <asp:TemplateField HeaderText="Enrollment ID" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblenrollid" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="txtenrollid" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Course Category" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblcoursecategory" runat="server" Text='<%# Eval("course_catagory") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        
                 <asp:DropDownList ID="txtcoursecategory" runat="server" CssClass="inputtext" AutoPostBack="true" onselectedindexchanged= "coursecategory_SelectedIndexChanged">
                    <asp:ListItem>Select Course Category</asp:ListItem>
                    <asp:ListItem>Programming</asp:ListItem>
                    <asp:ListItem>Networking</asp:ListItem>
                    <asp:ListItem>Business Administration</asp:ListItem>
                 </asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Course Name" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblcoursename" runat="server" Text='<%# Eval("course_name") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="txtcoursename" CssClass="inputtext" runat="server"></asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Enrollment Date" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblcoursecategory" runat="server" Text='<%# Eval("created_date") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:CommandField ButtonType="Link" ControlStyle-CssClass="btn" ShowEditButton="false" ShowDeleteButton="true"
                    ItemStyle-Width="150" />
            </Columns>
        </asp:GridView>
    </ContentTemplate>
</asp:UpdatePanel>
            </div>
                </div>

          
            
		    <div class="grid-child green">
    <fieldset class="lgnfieldset">
    <legend style="font-size:18px;">Enrollment </legend>
                
        <div class="fieldset">
                <label for="category"><b>Course Category <span style="color: red;">*</span></b><asp:RequiredFieldValidator runat="server" ErrorMessage="Please Select Course Category." ControlToValidate="coursecategory" ForeColor="Red" ClientIDMode="Inherit" ValidationGroup="enroll"></asp:RequiredFieldValidator></label>
                 <asp:DropDownList ID="coursecategory" runat="server" CssClass="inputtext" AutoPostBack="true" onselectedindexchanged= "coursecategory_SelectedIndexChanged">
                    <asp:ListItem>Select Course Category</asp:ListItem>
                    <asp:ListItem>Programming</asp:ListItem>
                    <asp:ListItem>Networking</asp:ListItem>
                    <asp:ListItem>Business Administration</asp:ListItem>
                 </asp:DropDownList>
            
                <label for="course"><b>Course <span style="color: red;">*</span></b><asp:RequiredFieldValidator runat="server" ErrorMessage="Please Select Course. " ControlToValidate="course" ForeColor="Red" ClientIDMode="Inherit" ValidationGroup="enroll"></asp:RequiredFieldValidator></label>
                 <asp:DropDownList ID="course" CssClass="inputtext" runat="server"></asp:DropDownList>

                <br />
                

                <asp:Button runat="server" ID="btn_Signup" CssClass="lgnbtn" Text="Enroll Now" OnClick="Enroll_Now" ValidationGroup="enroll" />
        
    </div>
        </fieldset>
            </div>
                </div>
        <br />
        <hr />
        <br />
        
<asp:GridView ID="GridView1" runat="server" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
    AutoGenerateColumns="false">
            <Columns>
                
                    <asp:BoundField DataField="course_catagory" HeaderText="Course Category"/>
                    <asp:BoundField DataField="course_name" HeaderText="Course Name"/>
                    <asp:BoundField DataField="course_description" HeaderText="Course Description"/>
                    <asp:BoundField DataField="course_duration" HeaderText="Course Duration"/>
                    <asp:BoundField DataField="fullname" HeaderText="Tutor Name"/>
                    <asp:BoundField DataField="email" HeaderText="Tutor Email"/>
                    <asp:BoundField DataField="number" HeaderText="Tutor Number"/>
                    <asp:BoundField DataField="file_name" HeaderText="File Name"/>
                    <asp:BoundField DataField="created_date" HeaderText="Material Created Date"/>

            <asp:TemplateField>
                <ItemTemplate>
                <asp:LinkButton ID="lnkDownload" CssClass="btn" runat="server" Text="Download" OnClick="DownloadFile"
                    CommandArgument='<%# Eval("id") %>'></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>

            </Columns>
        </asp:GridView>

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
