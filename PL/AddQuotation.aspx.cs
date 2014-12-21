using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Helper;
using BAL;

public partial class AddQuotation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Quotation q = new Quotation();
        q.Crn = Convert.ToInt32(TextBox1.Text);
        q.VehicleType = TextBox2.Text;
        q.Brand = TextBox3.Text;
        q.Model = TextBox4.Text;
        q.ChassissNo = TextBox5.Text;
        q.EngineNo = Convert.ToInt32(TextBox6.Text);
        q.Price = Convert.ToDouble(TextBox7.Text);

        BALInsurance bq = new BALInsurance();
        int i = bq.Insert(q);
        if (i > 0)
        {
            Label8.Text = "Success";
        }
        else
        {
            Label8.Text = "Failure";
        }
    }
}