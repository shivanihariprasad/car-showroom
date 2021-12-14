using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;


public partial class Register : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
      WebConfigurationManager.ConnectionStrings["Connect"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        HyperLink log = (HyperLink)Master.FindControl("logout");
        log.Visible = false;
    }
    protected void Register_Button(object sender, EventArgs e)
    {
        int status;

        con.Open();
        SqlCommand cmd1 = new SqlCommand("select * from Customer  where EmailID='" + Email.Text.ToString().Trim() + "'", con);
        int count = Convert.ToInt32(cmd1.ExecuteScalar());
        if (count != 0)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Email ID already exists.')", true);
            Email.Text = "";
        }
        else
        {
            SqlCommand cmd = new SqlCommand("Insert into Customer Values(@fname,@lname,@email,@address,@gender,@password,@dob,1)", con);
            cmd.Parameters.AddWithValue("fname", FirstName.Text.ToString().Trim());
            cmd.Parameters.AddWithValue("lname", LastName.Text.ToString().Trim());
            cmd.Parameters.AddWithValue("email", Email.Text.ToString().Trim());
            cmd.Parameters.AddWithValue("address", Address.Text.ToString().Trim());
            cmd.Parameters.AddWithValue("gender", RadioButtonList1.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("password", Password.Text.ToString().Trim());
            cmd.Parameters.AddWithValue("dob", Dob.Text.Trim());
            status = cmd.ExecuteNonQuery();

            if (status == 1)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Account Created Successfully , You will be redirected to login page');window.location='Login.aspx'", true);
                //Response.Redirect("Login.aspx");

            }
            else
            {

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Account couldnot be created , try again later.')", true);
            }
        }
    }
    }


    
