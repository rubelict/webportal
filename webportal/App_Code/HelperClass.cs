using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace webportal.App_Code
{
    public class HelperClass
    {
        #region set--SqlConnection
        //############################################
        private SqlTransaction dbTransaction = null;
        string cn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con;
        //############################################
        #endregion

        public DataSet GetDataSetInfo(string strQuery, string strDataSetName)
        {
            try
            {
                con = new SqlConnection(cn);
                con.Open();
                DataSet oDS = new DataSet();
                SqlDataAdapter odaData = new SqlDataAdapter(new SqlCommand(strQuery, con));
                odaData.Fill(oDS, strDataSetName);
                return oDS;
            }
            catch (Exception ex)
            {
                return null;
            }
            finally
            {
                con.Close();
                con.Dispose();
                SqlConnection.ClearPool(con);
                con = null;
            }
        }


    }
}