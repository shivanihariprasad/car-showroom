using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
public partial class AddEmloyee : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
      WebConfigurationManager.ConnectionStrings["Connect"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdEmailID"] == null)
        { Response.Redirect("Default.aspx"); }
        else
        {
            HyperLink login = (HyperLink)Master.FindControl("login");
            login.Visible = false;
            //login.NavigateUrl = "Account.aspx";
            HyperLink reg = (HyperLink)Master.FindControl("register");
            reg.Visible = false;
            HyperLink home = (HyperLink)Master.FindControl("home");
            home.NavigateUrl = "AdminHome.aspx";


        }
    }
    protected void Add_Employee(object sender, EventArgs e)
        {
            int status;
            String email = Email.Text.ToString().Trim();
            con.Open();
            SqlCommand cmd1 = new SqlCommand("select * from Employee where EEmailId='" + email + "'", con);
            int count = Convert.ToInt32(cmd1.ExecuteScalar());
            if (count != 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Email ID already exists.')", true);
                Email.Text = "";
            }
            else
            {
                SqlCommand cmd = new SqlCommand("Insert into Employee Values(@name,@email,@password,@address,@dob,@doj,@basesal,0,@basesal,1)", con);
                cmd.Parameters.AddWithValue("name", EmployeeName.Text.ToString().Trim());
                cmd.Parameters.AddWithValue("email", Email.Text.ToString().Trim());
                cmd.Parameters.AddWithValue("password", Password.Text.ToString().Trim());
                cmd.Parameters.AddWithValue("address", Address.Text.ToString().Trim());
                cmd.Parameters.AddWithValue("dob", Dob.Text.Trim());
                cmd.Parameters.AddWithValue("doj", Doj.Text.Trim());

                cmd.Parameters.AddWithValue("baseSal", int.Parse(Salary.Text.Trim()));

                status = cmd.ExecuteNonQuery();

                if (status == 1)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Account Created Successful');window.location='AdminHome.aspx'", true);
                    //Response.Redirect("Login.aspx");

                }
                else
                {

                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Account couldnot be created , try again later.')", true);
                }
            }

        }

    protected void Cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminHome.aspx");
    }
}