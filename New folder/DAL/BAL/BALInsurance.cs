using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Helper;
using DAL;


namespace BAL
{
    public class BALInsurance
    {
        DALInsurance dal = new DALInsurance();

        public Quotation Insert(Quotation q)
        {
            return dal.Insert(q);
        }
        
        public List<QuotationData> getbrand(QuotationData qd)
        { 
            return dal.getBrandNames(qd);
        }

        public List<QuotationData> getModels(QuotationData qd)
        {
            return dal.getModelNames(qd);
        }

        public double getPrice(QuotationData qd)
        {
            return dal.getPrice(qd);
        }

        public int Apply(InsuranceApplication ia)
        {
            return dal.Apply(ia);
        }
    }
}
