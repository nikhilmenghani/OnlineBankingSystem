using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Helper;
using BAL;

public partial class ApplyQuotation : System.Web.UI.Page
{
    BALInsurance bal = new BALInsurance();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        InsuranceApplication ia = new InsuranceApplication();
        ia.Qid = Convert.ToInt32(TextBox1.Text);
        ia.ChassissNo = TextBox2.Text;
        ia.EngineNo = Convert.ToInt32(TextBox3.Text);
        bal.Apply(ia);
    }
}