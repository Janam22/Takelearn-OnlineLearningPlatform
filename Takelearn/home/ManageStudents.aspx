<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageStudents.aspx.cs" Inherits="Takelearn.home.ManageStudents" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Students | Takelearn</title>
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
		<h1>Manage Student</h1>


        <!-- Body -->
			<div class="grid-container">
			<div class="grid-child purple">
              
    <table>  
    <tr>  
        <td style="border:none;width:400px;"> <asp:TextBox ID="txtsearch" CssClass="inputtext" placeholder="Search with name..." runat="server"></asp:TextBox> </td>  
        <td style="border:none;"><asp:Button ID="Button1" runat="server" CssClass="btnsearch" Text="Search" onclick="Button1_Click" /> </td>  
          
    </tr>  
    </table>
                
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<div id="dvGrid" style="padding: 10px; width: 450px">  
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowDataBound="OnRowDataBound"
            DataKeyNames="id" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit" PageSize = "10" AllowPaging ="true" OnPageIndexChanging = "OnPaging"
            OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added."
            Width="450">
            <Columns>

                <asp:TemplateField HeaderText="User ID" Visible="false" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lbluserid" runat="server" Visible="false" Text='<%# Eval("id") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="txtuserid" runat="server" Visible="false" Text='<%# Eval("id") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Full Name" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblfullname" runat="server" Text='<%# Eval("fullname") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtfullname" CssClass="inputtext" runat="server" Text='<%# Eval("fullname") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Number" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblnumber" runat="server" Text='<%# Eval("number") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtnumber" CssClass="inputtext" runat="server" Text='<%# Eval("number") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Gender" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblgender" runat="server" Text='<%# Eval("gender") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="txtgender" CssClass="inputtext" SelectedValue='<%# Eval("gender") %>' runat="server">
                            <asp:ListItem Value="Male">Male</asp:ListItem> 
                            <asp:ListItem Value="Female">Female</asp:ListItem> 
                        </asp:DropDownList>
                       
                    </EditItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Email" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblemail" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtemail" CssClass="inputtext" runat="server" Text='<%# Eval("email") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Role" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblrole" runat="server" Text='<%# Eval("designation") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="txtrole" runat="server" Text='<%# Eval("designation") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Registered Date" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblfullname" runat="server" Text='<%# Eval("created_date") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:CommandField ButtonType="Link" ControlStyle-CssClass="btn" ShowEditButton="true" ShowDeleteButton="true"
                    ItemStyle-Width="150" />
            </Columns>
        </asp:GridView>
    </ContentTemplate>
</asp:UpdatePanel>
                
</div>
                
<asp:Label ID="lblTotal" runat="server" />
			</div>
<script type="text/javascript">
    $(function () {
        BlockUI("dvGrid");
        $.blockUI.defaults.css = {};
    });
    function BlockUI(elementID) {
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_beginRequest(function () {
            $("#" + elementID).block({
                message: '<div align = "center">' + '<img src="../images/loadingAnim.gif"/></div>',
                css: {},
                overlayCSS: { backgroundColor: '#000000', opacity: 0.6, border: '3px solid #63B2EB' }
            });
        });
        prm.add_endRequest(function () {
            $("#" + elementID).unblock();
        });
    };
</script>

    

		    <div class="grid-child green">
                
    <fieldset class="lgnfieldset">
    <legend style="font-size:18px;">Add Student </legend>
                
        <div class="fieldset">
                <label for="fullname"><b>Full Name <span style="color: red;">*</span></b><asp:RequiredFieldValidator runat="server" ErrorMessage="Name is mandatory" ControlToValidate="TextBox1" ForeColor="Red" ClientIDMode="Inherit" ValidationGroup="signupbtn"></asp:RequiredFieldValidator></label>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

                <label for="password"><b>Password <span style="color: red;">*</span></b><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Password is mandatory" ControlToValidate="TextBox2" ForeColor="Red" ValidationGroup="signupbtn"></asp:RequiredFieldValidator></label>
                <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>



                <label for="confirmpassword"><b>Confirm Password <span style="color: red;">*</span></b><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="This field is mandatory." ControlToValidate="TextBox3" ForeColor="Red" ValidationGroup="signupbtn"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password did not match." ValidationGroup="signupbtn" ControlToValidate="TextBox3" ForeColor="Red" ControlToCompare="TextBox2"></asp:CompareValidator></label>
        <asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox>




                <label for="number"><b>Number <span style="color: red;">*</span></b><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="Red" ErrorMessage="Number is mandatory." ControlToValidate="Number" ValidationGroup="signupbtn"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ForeColor="Red" ControlToValidate="Number" ValidationGroup="signupbtn" ErrorMessage="Number should be of 10 digits." ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator></label>
                <asp:TextBox ID="Number" runat="server"></asp:TextBox>


                <br />
                <br />

                <label for="gender"><b>Gender <span style="color: red;">*</span></b><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="Red" ErrorMessage="Please select Gender" ControlToValidate="DropDownList2" ValidationGroup="signupbtn"></asp:RequiredFieldValidator></label>
                <asp:RadioButtonList ID="DropDownList2" CssClass="inputtext" runat="server">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:RadioButtonList>


                <br />

                <label for="email"><b>Email <span style="color: red;">*</span></b><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Email is mandatory" ControlToValidate="TextBox4" ForeColor="Red" ValidationGroup="signupbtn"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email."  ControlToValidate="TextBox4" ForeColor="Red" ValidationGroup="signupbtn" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></label>
        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                

                <asp:Button runat="server" ID="btn_Signup" CssClass="lgnbtn" Text="Add Student" OnClick="Registration_Click" ValidationGroup="signupbtn" />
        
            <asp:Button runat="server" ID="btn_cancel" Text="Cancel" CssClass="sgnbtn" PostBackUrl="Dashboard.aspx" />
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
