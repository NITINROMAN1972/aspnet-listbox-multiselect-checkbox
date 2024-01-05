using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Drop_Down_DropDown : System.Web.UI.Page
{
    string connectionString = ConfigurationManager.ConnectionStrings["Ginie"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind_Data_For_Checkbox();
        }
    }

    public void Bind_Data_For_Checkbox()
    {
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            con.Open();
            string sql = "select UserRole, RoleName, HomePage from UserRoles867";
            SqlCommand cmd = new SqlCommand(sql, con);

            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            ad.Fill(dt);
            con.Close();

            ddlRole.DataSource = dt;
            ddlRole.DataTextField = "RoleName";
            //ddlRole.DataValueField = "UserRoleID";
            ddlRole.DataBind();
            ddlRole.Items.Insert(0, new ListItem("Select Values", "0"));

            ListItem selectValuesItem = ddlRole.Items.FindByValue("0");
            if (selectValuesItem != null)
            {
                selectValuesItem.Selected = true;
            }
        }
    }

    protected void ddlRole_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selectedValues = string.Empty;

        if (ddlRole.SelectedValue == "0")
        {
            // Clear all selections
            //ddlRole.ClearSelection();
            //return;
        }

        foreach (ListItem li in ddlRole.Items)
        {
            if (li.Selected == true)
            {
                selectedValues += li.Text + ",";
            }
        }

        Response.Write(selectedValues.ToString());


        // Clear all selections
        //ddlRole.ClearSelection();
        // Trigger an immediate postback
        //ScriptManager.RegisterStartupScript(this, GetType(), "Postback", "__doPostBack('" + ddlRole.UniqueID + "', '');", true);
    }
}