using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.ComponentModel.DataAnnotations;
using System.Data.OleDb;
using System.Text;

namespace Takelearn
{
    public partial class Signup : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Registration_Click(object sender, EventArgs e)
        {

            try
            {
                //validate input
                if (TextBox2.Text.Length < 6)
                {
                    Response.Write("<script>alert('Password must be at least 6 characters long.')</script>");
                }
                else
                {
                    try
                    {
                        //create instane of middle layer business object
                        Users user = new Users();

                        //set email property, so it  can be used as a parameter for the query
                        user.Email = TextBox4.Text;

                        //check if the email exists
                        if (user.emailaddressExists())
                        {
                            //already exists so output error
                            Response.Write("<script>alert('EmailAddress already exists, please enter another one')</script>");
                        }
                        else
                        {
                            //INSERT NEW USER...   

                            //set properties, so it can be used as a parameter for the query
                            user.Fullname = TextBox1.Text;
                            user.Password = TextBox2.Text;
                            user.Number = Number.Text;
                            user.Email = TextBox4.Text;
                            user.Gender = RadioButtonList1.SelectedValue;
                            user.Designation = "Student";

                            //attempt to add a User and test if it is successful
                            if (user.Adduser())
                            {
                                //redirect user to login page
                                Response.Redirect("~/home.aspx");
                            }
                        }
                    }
                    catch
                    {
                        //exception thrown so display error
                        Response.Write("<script>alert('Database connection error - failed to insert record.')</script>");
                    }

                }
            }
            catch
            {
                //exception thrown so display error
                Response.Write("<script>alert('Database connection error - failed to insert record.')</script>");
            }

        }


        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("home.aspx");
        }

        protected void Can_Click(object sender, EventArgs e)
        {
            Response.Redirect("home.aspx");
        }
    }

}