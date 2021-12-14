using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

public partial class EmployeeAccount : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(
        WebConfigurationManager.ConnectionStrings["Connect"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {


        if (Session["EEmailID"] == null)
        { Response.Redirect("DEfault.aspx"); }
        else
        {
            HyperLink login = (HyperLink)Master.FindControl("login");
            login.Text = "My Accounts";
            login.NavigateUrl = "EmployeeAccount.aspx";
            HyperLink reg = (HyperLink)Master.FindControl("register");
            reg.Visible = false;
            HyperLink home = (HyperLink)Master.FindControl("home");
            home.NavigateUrl = "EHome.aspx";

            BindGrid();
        }

    }
    protected void BindGrid()
    {
        string email = Session["EEmailID"].ToString().Trim();
        con.Open();
        SqlCommand cmd = new SqlCommand("Select Name,EEmailID,EAddress,EDOB,DOJ,BasicSalary,Incentive,GrossSalary from Employee where EEmailID='" + email + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                Name.Text = dr["Name"].ToString();
                Email.Text = dr["EEmailID"].ToString();
                Address.Text = dr["EAddress"].ToString();
                string dateOf = dr["EDOB"].ToString().Trim();
                if (dateOf == "01-01-1900 00:00:00")
                {
                    Dob.Text = "--";
                }
                else
                { Dob.Text = dateOf.Substring(0, 10); }
                string dateOfJoin = dr["DOJ"].ToString().Trim();
                if (dateOfJoin == "01-01-1900 00:00:00")
                {
                    Doj.Text = "--";
                }
                else
                { Doj.Text = dateOfJoin.Substring(0, 10); }
                BSalary.Text = "₹ " + dr["BasicSalary"].ToString();
                Incentive.Text = "₹ " + dr["Incentive"].ToString();
                GSalary.Text = "₹ " + dr["GrossSalary"].ToString();

            }
        }
        con.Close();
    }

}