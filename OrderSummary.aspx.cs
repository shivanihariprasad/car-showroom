using System;

using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

public partial class OrderSummary : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
             WebConfigurationManager.ConnectionStrings["Connect"].ConnectionString);
    SqlConnection con1 = new SqlConnection(
            WebConfigurationManager.ConnectionStrings["Connect"].ConnectionString);
    SqlConnection con2 = new SqlConnection(
            WebConfigurationManager.ConnectionStrings["Connect"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["EmailID"] == null)
            { Response.Redirect("Default.aspx"); }
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

            }
        }

    }

    protected void BindGrid()
    {
        float prc;
        //int vid = int.Parse(Session["Vid"].ToString());
        string email = Session["EmailID"].ToString().Trim();
        int oid = int.Parse(Session["Oid"].ToString());
        con.Open();
        SqlCommand cmd5 = new SqlCommand("Select VehicleID from Orders where OrderID='" + oid + "'", con);
        int vid = Convert.ToInt32(cmd5.ExecuteScalar());
        SqlCommand cmd = new SqlCommand("Select *from Vehicle where VehicleID='" + vid + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {

                CarName.Text = dr["Model"].ToString();
                Price.Text = "₹"+ dr["Price"].ToString();
                Color.Text = dr["Color"].ToString();
                Fuel.Text = dr["FuelType"].ToString();
                Transmission.Text = dr["Transmission"].ToString();
                Category.Text = dr["VehicleType"].ToString();
                byte[] bytes = (byte[])dr["Image"];
                string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                Image.ImageUrl = "data:image/png;base64," + base64String;
                //Image.ImageUrl= "data:image / png; base64,"+Convert.ToBase64String((byte[])dr["Image"]);
                //Description.Text = dr["Description"].ToString();

            }



        }
        con.Close();
        ////string email = Session["EmailID"].ToString().Trim();
        con2.Open();
        SqlCommand cmd2 = new SqlCommand("Select * from Customer where EmailID='" + email + "'", con2);
        SqlDataReader dr2 = cmd2.ExecuteReader();
        if (dr2.HasRows)
        {
            while (dr2.Read())
            {
                fName.Text = dr2["FName"].ToString();
                fName2.Text = dr2["FName"].ToString();
                LName.Text = dr2["LName"].ToString();
                Address.Text = dr2["Address"].ToString();
                CustomerID.Text = dr2["CustomerID"].ToString();

            }

        }
        con2.Close();
        con1.Open();
        int id = int.Parse(CustomerID.Text);
        SqlCommand cmd3 = new SqlCommand("Select * from Orders where VehicleID='" + vid + "' and  CustomerID='" + id + "'", con1);
        SqlDataReader dr3 = cmd3.ExecuteReader();
        if (dr3.HasRows)
        {
            while (dr3.Read())
            {
                OrderNo.Text = dr3["OrderID"].ToString();
                OrderNo2.Text = dr3["OrderID"].ToString();

            }

        }
        con1.Close();


        prc = float.Parse(Price.Text.TrimStart('₹'));
        Insurance.Text = " ₹" + Convert.ToString(.1 * prc);
        RTO.Text = " ₹" + Convert.ToString(.28 * prc);
        onRoad.Text = " ₹" + Convert.ToString((float)((float)(.1 * prc + .28*prc) + prc + 10000));
    }
}
