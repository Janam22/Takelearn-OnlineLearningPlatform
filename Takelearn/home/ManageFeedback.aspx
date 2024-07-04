<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageFeedback.aspx.cs" Inherits="Takelearn.home.ManageFeedback" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Students on My Course | Takelearn</title>
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
        
        .inputtext {
         width: 100%;
         padding: 12px 20px;
         margin: 8px 0;
         display: inline-block;
         border: 1px solid #ccc;
         border-radius: 4px;
         box-sizing: border-box;
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
            <asp:LinkButton ID="btnEnroll" CssClass="links" PostBackUrl="Enroll.aspx" runat="server">Enroll</asp:LinkButton>
            <asp:LinkButton ID="btnFeedback" CssClass="links" PostBackUrl="ManageFeedback.aspx" runat="server">Manage Feedback</asp:LinkButton>
            <asp:LinkButton ID="btnProfile" CssClass="links" PostBackUrl="UpdateDetails.aspx" runat="server">Manage Profile</asp:LinkButton>
            <asp:LinkButton ID="btnChangePassword" CssClass="links" PostBackUrl="UpdatePassword.aspx" runat="server">Change Password</asp:LinkButton>
            <asp:LinkButton ID="btnlog" CssClass="links" OnClick="btnLogout_Click" runat="server">Logout</asp:LinkButton>
        </div>
        </nav>
    </div>


        <br /><br />
		<h1>Feedbacks to Takelearn</h1>

        
        <!-- Body -->
        
    <table>  
    <tr>  
        <td style="border:none;width:400px;"> <asp:TextBox ID="txtsearch" CssClass="inputtext" placeholder="Search with feedbacks..." runat="server"></asp:TextBox> </td>  
        <td style="border:none;"><asp:Button ID="Button1" runat="server" CssClass="btnsearch" Text="Search" onclick="Button1_Click" /> </td>  
          
    </tr>  
    </table>
        
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<div id="dvGrid" style="padding: 10px; width: 450px"> 
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" OnRowDataBound="OnRowDataBound"
            DataKeyNames="id" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit" PageSize = "4" AllowPaging ="true" OnPageIndexChanging = "OnPaging"
            OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" EmptyDataText="No Feedbacks has been came yet."
            Width="450">
            <Columns>
                
                <asp:TemplateField Visible="false" HeaderText="Student ID" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblfeedbackid" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Full Name" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblfullname" runat="server" Text='<%# Eval("fullname") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Email" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblemail" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Feedback" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblfeedback" runat="server" Text='<%# Eval("feedback") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Feedback Date" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblfeedbackdate" runat="server" Text='<%# Eval("created_date") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="User Type" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblusertype" runat="server" Text='<%# Eval("usertype") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:CommandField ButtonType="Link" ControlStyle-CssClass="btn" ShowEditButton="false" ShowDeleteButton="true"
                    ItemStyle-Width="150" />
            </Columns>
        </asp:GridView>
    </ContentTemplate>
</asp:UpdatePanel>
    </div>
        
<asp:Label ID="lblTotal" runat="server" />
			
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

