using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

public partial class DeleteCustomer : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
          WebConfigurationManager.ConnectionStrings["Connect"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if ((Session["AdEmailID"] == null))
            { Response.Redirect("Default.aspx"); }
            else
            {
                HyperLink login = (HyperLink)Master.FindControl("login");
                //login.Text = "Modify Cars";
                login.Visible = false;
                // login.NavigateUrl = "Account.aspx";
                HyperLink reg = (HyperLink)Master.FindControl("register");
                reg.Visible = false;
                HyperLink home = (HyperLink)Master.FindControl("home");
                home.NavigateUrl = "AdminHome.aspx";
                BindGrid();

            }  
        }
    }
    private void BindGrid()
    {
        con.Open();
        //string email = Session["AEmailID"].ToString();
        //SqlCommand cmd4 = new SqlCommand("Select * from Employee  + "'", con);
        //int aid = Convert.ToInt32(cmd4.ExecuteScalar());
        using (SqlCommand cmd = new SqlCommand("Select * from Customer"))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = con;
                sda.SelectCommand = cmd;
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    deleteUser.DataSource = dt;
                    deleteUser.DataBind();
                    con.Close();
                }
            }
        }
    }



    protected void btnstatus_Click(object sender, EventArgs e)
    {
        Button clickedbutton = (Button)sender; //get clicked button
        GridViewRow row = (GridViewRow)clickedbutton.NamingContainer; //get the row where the button clicked
        int ind = row.RowIndex;
        string id = deleteUser.DataKeys[ind].Value.ToString();
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
        SqlCommand cmd = new SqlCommand("update Customer set Status='" + newstat + "'where CustomerID=" + id, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        BindGrid();
    }
    protected void deleteUser_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        deleteUser.PageIndex = e.NewPageIndex;
        //Bind data to the GridView control.
        BindGrid();
    }

    protected void deleteUser_RowEditing(object sender, GridViewEditEventArgs e)
    {
        //Set the edit index.
        deleteUser.EditIndex = e.NewEditIndex;
        //Bind data to the GridView control.
        BindGrid();
    }


    protected void deleteUser_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        deleteUser.EditIndex = -1;
        BindGrid();
    }

}
    



