using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Helper;
using BAL;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Customer c = new Customer();
        c.id = Convert.ToInt32(TextBox1.Text);
        c.name = TextBox2.Text;
        c.age = TextBox3.Text;
        BALCustomer bc = new BALCustomer();
        int i = bc.insertCustomer(c);

        if (i > 0)
        {
            Label1.Text = "Success";
        }
        else
        {
            Label1.Text = "Failure";
        }
    }
}