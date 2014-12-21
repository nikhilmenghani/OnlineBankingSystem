using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Helper;
using BAL;

public partial class RenewQuotation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        InsuranceApplication ia = new InsuranceApplication();
        ia.Crn = Convert.ToInt32(TextBox1.Text);
        ia.Qid = Convert.ToInt32(TextBox2.Text);

        BALInsurance bi = new BALInsurance();
        int i = bi.Renew(ia);
        if (i > 0)
        {
            Label3.Text = "Renewal Success";
        }
        else
        {
            Label3.Text = "Renewal Failure";
        }
    }
}