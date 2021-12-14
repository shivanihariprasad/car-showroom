

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

public partial class ModifyCars : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
        WebConfigurationManager.ConnectionStrings["Connect"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["AEmailID"] == null)
            { Response.Redirect("Default.aspx"); }
            else
            {
                HyperLink login = (HyperLink)Master.FindControl("login");
                login.Text = "Home";
                login.NavigateUrl = "AddCars.aspx";
                // login.NavigateUrl = "Account.aspx";
                HyperLink reg = (HyperLink)Master.FindControl("register");
                reg.Visible = false;
                HyperLink home = (HyperLink)Master.FindControl("home");
                home.NavigateUrl = "AddCars.aspx";
                BindGrid();

            }
        }



    }
    private void BindGrid()
    {
        con.Open();
        string email = Session["AEmailID"].ToString();
        SqlCommand cmd4 = new SqlCommand("Select AgencyID from Agency where AEmailID='" + email + "'", con);
        int aid = Convert.ToInt32(cmd4.ExecuteScalar());
        using (SqlCommand cmd = new SqlCommand("SELECT VehicleID, Model, Color,Price,Quantity,Image, FuelType,Transmission , VehicleType,Status FROM Vehicle where VehicleID in (Select VehicleID from AddCars Where AgencyID='" + aid + "')"))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = con;
                sda.SelectCommand = cmd;
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    modifycars.DataSource = dt;
                    modifycars.DataBind();
                    con.Close();
                }
            }
        }
    }
    protected void modifycars_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int id = Convert.ToInt32(modifycars.DataKeys[e.RowIndex].Value);
        // find updated values for update
        TextBox clr = (TextBox)modifycars.Rows[e.RowIndex].FindControl("txtColor");
        TextBox prc = (TextBox)modifycars.Rows[e.RowIndex].FindControl("txtPrice");
        TextBox qty = (TextBox)modifycars.Rows[e.RowIndex].FindControl("txtQuantity");
        DropDownList ft = (DropDownList)modifycars.Rows[e.RowIndex].FindControl("DropDownList2");
        //DropDownList vt = (DropDownList)modifycars.Rows[e.RowIndex].FindControl("DropDownList1");
        DropDownList tr = (DropDownList)modifycars.Rows[e.RowIndex].FindControl("DropDownList3");
        //TextBox city = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txt_City");

        SqlCommand cmd = new SqlCommand("Update Vehicle Set Color='" + clr.Text + "', Price='" + float.Parse(prc.Text) + "' , Quantity='" + int.Parse(qty.Text) + "', FuelType='" + ft.SelectedValue.ToString() + "', Transmission='" + tr.SelectedValue.ToString() + "' Where VehicleID='" + id + "'", con);
        //cmd.Parameters.AddWithValue("@color",clr.Text);
        //cmd.Parameters.AddWithValue("@price",float.Parse(prc.Text));
        //cmd.Parameters.AddWithValue("@fuel", ft.SelectedValue.ToString());
        //cmd.Parameters.AddWithValue("@trans", tr.SelectedValue.ToString());
        // cmd.Parameters.AddWithValue("@vid", id);
        con.Open();
        int status = cmd.ExecuteNonQuery();
        con.Close();

        modifycars.EditIndex = -1;
        BindGrid();
    }

    //protected void modifycars_RowDeleting(object sender, GridViewDeleteEventArgs e)
    //{
    //    int vehicleid = Convert.ToInt32(modifycars.DataKeys[e.RowIndex].Values[0]);
    //    // string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;


    //    using (SqlCommand cmd = new SqlCommand("Update Vehicle Set Status=1 where VehicleID='@VehicleId'"))
    //    {
    //        cmd.Parameters.AddWithValue("@VehicleIId", vehicleid);
    //        cmd.Connection = con;
    //        con.Open();
    //        cmd.ExecuteNonQuery();
    //        con.Close();
    //    }

    //    this.BindGrid();
    //}

    protected void btnstatus_Click(object sender, EventArgs e)
    {
        Button clickedbutton = (Button)sender; //get clicked button
        GridViewRow row = (GridViewRow)clickedbutton.NamingContainer; //get the row where the button clicked
        int ind = row.RowIndex;
        string id = modifycars.DataKeys[ind].Value.ToString();
        Button btstatus = row.FindControl("btnstatus") as Button;
        string status = btstatus.Text;
        int newstat = 0;
        if (status == "Activate")
        {
            status = "Deactivate";
            newstat = 1;
        }
        else if (status == "Deactivate")
        {
            status = "Activate";
            newstat = 0;
        }
        // update record
        SqlCommand cmd = new SqlCommand("update Vehicle set Status='" + newstat + "'where VehicleID=" + id, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        BindGrid();
    }
    protected void modifycars_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        modifycars.PageIndex = e.NewPageIndex;
        //Bind data to the GridView control.
        BindGrid();
    }

    protected void modifycars_RowEditing(object sender, GridViewEditEventArgs e)
    {
        //Set the edit index.
        modifycars.EditIndex = e.NewEditIndex;
        //Bind data to the GridView control.
        BindGrid();
    }


    protected void modifycars_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        modifycars.EditIndex = -1;
        BindGrid();
    }

    protected void modifycars_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        //Button clickedbutton = (Button)sender; //get clicked button
        //GridViewRow row = (GridViewRow)clickedbutton.NamingContainer; //get the row where the button clicked
        //int id = GridView1.DataKeys[e.NewSelectedIndex].Value.ToString();
        int ind = e.NewSelectedIndex;
        int id = Convert.ToInt32(modifycars.DataKeys[ind].Value.ToString());
        Button btstatus = modifycars.Rows[e.NewSelectedIndex].FindControl("btnstatus") as Button;
        string status = btstatus.Text;
        int newstat = 0;
        if (status == "Active")
        {
            status = "Inactive";
            newstat = 0;
        }
        if (status == "Inactive")
        {
            status = "Active";
            newstat = 1;
        }
        // update record
        SqlCommand cmd = new SqlCommand("update Vehicle set Status='" + newstat + "'where VehicleID='" + id + "'", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        BindGrid();
    }
}