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
    QuotationData qd = new QuotationData();
    BALInsurance bi = new BALInsurance();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!Page.IsPostBack)
        {
            if (rbTwoWheeler.Checked)
            {
                qd.VehicleType = "two wheeler";
            }
            else
            {
                qd.VehicleType = "four wheeler";
            }
            PopupBrands(sender, e);
        }

    }

    protected void PopupModels(object sender, EventArgs e)
    {
        QuotationData qd = new QuotationData();
        qd.Brand = ddlBrand.SelectedItem.Text;
        List<QuotationData> list = bi.getModels(qd);
        ddlModel.Items.Clear();
        ddlModel.Items.Add(new ListItem("Select Model","0"));
        foreach (var item in list)
        {
            ddlModel.Items.Add(new ListItem(item.Model, item.QDid.ToString()));
        }
    }

    protected void DisplayPrice(object sender, EventArgs e)
    {
        QuotationData qd = new QuotationData();
        if (rbTwoWheeler.Checked)
        {
            qd.VehicleType = "two wheeler";
        }
        else
        {
            qd.VehicleType = "four wheeler";
        }
        qd.Brand = ddlBrand.SelectedItem.Text;
        qd.Model = ddlModel.SelectedItem.Text;
        Label4.Text = bi.getPrice(qd).ToString();
    }

    protected void updateVehicleType(object sender, EventArgs e)
    {
        if (rbTwoWheeler.Checked)
        {
            qd.VehicleType = "two wheeler";
        }
        else
        {
            qd.VehicleType = "four wheeler";
        }
        PopupBrands(sender, e);
        PopupModels(sender, e);
    }

    protected void PopupBrands(object sender, EventArgs e)
    {
        ddlBrand.Items.Clear();
        ddlBrand.Items.Add(new ListItem("Select Brand", "0"));
        List<QuotationData> list = bi.getbrand(qd);
        foreach (var item in list)
        {
            ddlBrand.Items.Add(new ListItem(item.Brand, item.QDid.ToString()));
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Quotation q = new Quotation();
        if (rbTwoWheeler.Checked)
        {
            q.VehicleType = "two wheeler";
        }
        else
        {
            q.VehicleType = "four wheeler";
        }
        q.Brand = ddlBrand.SelectedItem.Text;
        q.Model = ddlModel.SelectedItem.Text;
        q.Price = Convert.ToDouble(Label4.Text);
        Quotation q1 = bi.Insert(q);
        Label6.Text = q1.Qid.ToString();
        Label7.Text = q1.Premium.ToString();
        Label8.Text = q1.Cover.ToString();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("ApplyQuotation.aspx");
    }
}