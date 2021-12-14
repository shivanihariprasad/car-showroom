using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

public partial class Account : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
        WebConfigurationManager.ConnectionStrings["Connect"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {


        if (Session["EmailID"] == null)
        { Response.Redirect("DEfault.aspx"); }
        else
        {
            HyperLink login = (HyperLink)Master.FindControl("login");
            login.Text = "My Accounts";
            login.NavigateUrl = "Account.aspx";
            HyperLink reg = (HyperLink)Master.FindControl("register");
            reg.Visible = false;
            HyperLink home = (HyperLink)Master.FindControl("home");
            home.NavigateUrl = "CHome.aspx";

            BindGrid();
            BindGridView();
        }

    }
    protected void BindGrid()
    {
        string email = Session["EmailID"].ToString().Trim();
        con.Open();
        SqlCommand cmd = new SqlCommand("Select FName,LName,EmailID,Address,DOB from Customer where EmailID='" + email + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                FName.Text = dr["FName"].ToString();
                LName.Text = dr["LName"].ToString();
                Email.Text = dr["EmailID"].ToString();
                Address.Text = dr["Address"].ToString();
                string dateOf = dr["DOB"].ToString().Trim();
                if (dateOf == "01-01-1945 00:00:00")
                {
                    Dob.Text = "--";
                }
                else
                { Dob.Text = dateOf.Substring(0, 10); }
            }
        }
        con.Close();
    }


    private void BindGridView()
    {
        con.Open();
        string email = Session["EmailID"].ToString();
        SqlCommand cmd4 = new SqlCommand("Select * from Customer where EmailID='"+email+"'", con);
        int cid = Convert.ToInt32(cmd4.ExecuteScalar());
        //SqlCommand cmd5 = new SqlCommand("Select OrderStatus from Orders  where OrderID='" +  + "'", con);
        int stat = Convert.ToInt32(cmd4.ExecuteScalar());
        using (SqlCommand cmd = new SqlCommand("Select OrderID,Model,Date,OrderStatus,Image from Vehicle Inner Join Orders on Orders.VehicleID=Vehicle.VehicleID where CustomerID='"+cid+"'"))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = con;
                sda.SelectCommand = cmd;
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    orderDetails.DataSource = dt;
                    orderDetails.DataBind();
                    con.Close();
                }
            }
        }
    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        GridViewRow row = (GridViewRow)btn.NamingContainer;
        Label id = row.FindControl("OID") as Label;
        Session["Oid"] = id.Text;
        con.Open();
        SqlCommand cmd5 = new SqlCommand("Select OrderStatus from Orders  where OrderID='" +int.Parse(id.Text)+ "'", con);
        int status = Convert.ToInt32(cmd5.ExecuteScalar());
        if (status == 1)
        {
            Response.Redirect("OrderSummary.aspx");

        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Your order is yet to be accpted by our employees');", true);
        }
        con.Close();
    }
}
