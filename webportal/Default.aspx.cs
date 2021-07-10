using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webportal
{
    public partial class Default : System.Web.UI.Page
    {
        HelperClass objhelper = new HelperClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCompany();
                //LoadOrderHistory();
                // Loadrealtimetable();
                ltlTableBody.Text = "No data Found";


            }
               
        }
        private void LoadCompany()
        {
            try
            {
              
                string strSql = "Select Distinct Symbol FROM SS";
                DataSet oDs = GetDataSetInfo(strSql, "SS");
                ddlcompany.DataSource = oDs;
                ddlcompany.DataValueField = "Symbol";
                ddlcompany.DataTextField = "Symbol";
                ddlcompany.DataBind();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public DataSet GetDataSetInfo(string strQuery, string strDataSetName)
        {
            string cn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con;
            con = new SqlConnection(cn);
            try
            {
              
               
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

       
        protected void btnSaveDpt_Click(object sender, EventArgs e)
        {
            try
            {
                string type;
                if (chkMarket.Checked)
                {
                    type = "Market";
                }
                else
                {
                    type = "Limit";
                }
                string side = ddlTrdType.Text;
                string symbol = ddlcompany.SelectedValue;


                string qty = txtQty.Text;
                string rte = txtRate.Text;
               string user = txtUserid.Text;
                string order = "";
                if (type == "Limit")
                    order = "http://119.18.148.6:8080/newOrder/limit/user=" + user + "/symbol=" + symbol + "/side=" + side + "/quantity=" + qty + "/price=" + rte;
                else if (type == "Market")
                    order = "http://119.18.148.6:8080/newOrder/market/user=" + user + "/symbol=" + symbol + "/side=" + side + "/quantity=" + qty;
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(order);
                // // Dim request As HttpWebRequest = CType(WebRequest.Create("http://192.168.100.70:8080/newOrder/limit/user=kaiser/symbol=GP/side=1/quantity=2/price=300"), HttpWebRequest)
                lbl.Text = order;
                request.Method = "GET";
                request.ContentType = "application/x-www-form-urlencoded";
                WebResponse responseD = request.GetResponse();
                string responseData = new StreamReader(responseD.GetResponseStream()).ReadToEnd();
                string strResponse = "Bad Request:400";
                strResponse = responseData.ToString();
                object json = JsonConvert.DeserializeObject<object>(strResponse);


                lbljason.Text = json.ToString();

                //dynamic stuff = JsonConvert.DeserializeObject("{ 'Name': 'Jon Smith', 'Address': { 'City': 'New York', 'State': 'NY' }, 'Age': 42 }");
                dynamic stuff = JsonConvert.DeserializeObject(json.ToString());

               // string name = stuff.Name;
                string address = stuff.Data.orderStatus;

                 // Response.Write(name);

                // var jsonResult = json("Data");
                DataTable dataTable = new DataTable();
                dataTable.Columns.AddRange(new DataColumn[5] { 
                    new DataColumn("ClientOrderID", typeof(string)), new DataColumn("OrderStatus", typeof(string)), new DataColumn("Price", typeof(string)), new DataColumn("OrderQnty", typeof(string)), new DataColumn("Type", typeof(string)) });
                    dataTable.Rows.Add(stuff.Data.ClientOrderID, stuff.Data.OrderStatus, stuff.Data.Price, stuff.Data.orderQnty, stuff.Data.side);
                // dataTable.Rows.Add(json("Data")("clientOrderID").ToString(), json("Data")("orderStatus").ToString(), json("Data")("price").ToString(), json("Data")("orderQnty").ToString(), json("Data")("lastfillprice").ToString(), json("Data")("filledqty"), json("Data")("side").ToString(), json("Data")("symbol").ToString());
               
                
                
                if (dataTable.Rows.Count > 0)
                {
                    GridView1.DataSource = dataTable;
                    GridView1.DataBind();
                }

                ltlOrderHistory.Text = OrderHistory();
            }
            catch (Exception ex)
            {
                lbl.Text = ex.Message;
            }
        }

        class Marketdata
        {
            public string clientOrderID { get; set; }   
            public string orderQnty { get; set; }
        }

        private void LoadOrderHistory()
        {
            try
            {

                ServicePointManager.Expect100Continue = true;
                ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
                //string json2 = (new WebClient()).DownloadString("https://raw.githubusercontent.com/aspsnippets/test/master/Customers.json");
                string json2 = (new WebClient()).DownloadString("http://119.18.148.6:8080/orderHistory/user=hi").ToString();
                //var deletedItem = json2.splice(1, 1);
                //console.log(data.result);

                string  order = "http://119.18.148.6:8080/orderHistory/user=hi";
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(order);
                request.Method = "GET";
                request.ContentType = "application/x-www-form-urlencoded";
                WebResponse responseD = request.GetResponse();
                string responseData = new StreamReader(responseD.GetResponseStream()).ReadToEnd();

                string bv = responseData.ToString().Replace("\\\\\\", "").Replace("\\", "");
                string nn = bv.Replace(@"\", " ");
                string strResponse = "Bad Request:400";
               // strResponse = responseData.ToString();
                strResponse = responseData.Replace("\\", "").ToString();
               // string test = strResponse.Replace("\\", "");
               // object json = JsonConvert.DeserializeObject<object>(test);
                object json = JsonConvert.DeserializeObject<object>(strResponse);
                dynamic stuff = JsonConvert.DeserializeObject(json.ToString());
            }
            catch (Exception)
            {
                throw;
            }
        }
       

        protected void ddlcompany_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ltlTableBody.Text = Loadrealtimetable();
                lblRealTimeTitle.Text = ": " + ddlcompany.SelectedValue;

                ltlLatestTrades.Text = LoadLatestTrade();
                lblLatestTrade.Text = ": " + ddlcompany.SelectedValue;
            }
            catch (Exception)
            {
                throw;
            }
        }
        public string Loadrealtimetable()
        {
            string M;
            M = "";
            try
            {
                string symbol = ddlcompany.SelectedValue;
                string json2 = (new WebClient()).DownloadString("http://119.18.148.6:8081/marketData/symbol=" + symbol + "").ToString();
                if (json2 == "[]")
                {
                    M = "No Value Found";
                }
                else
                {
                    dynamic stuff = JsonConvert.DeserializeObject(json2.ToString());
                    foreach (var item in stuff)
                    {
                        M += "<tr>";
                        M += "<td class='ofgn'>" + item.B_Ord + "</td>";
                        M += "<td class='ofgn'>" + item.B_Qt + "</td>";
                        M += "<td class='ofgn'>" + item.B_Rate + "</td>";
                        M += "<td class='ofrd'> " + item.S_Rate + "</td>";
                        M += "<td class='ofrd'>" + item.S_Qt + "</td>";
                        M += "<td class='ofrd'>" + item.S_Ord + "</td>";
                        M += "</tr>";
                    }
                }

                return M;
            }
            catch (Exception)
            {
                throw;
            }
        }
        public string LoadLatestTrade()
        {
            string M;
            M = "";
            try
            {
                string symbol = ddlcompany.SelectedValue;
                string json2 = (new WebClient()).DownloadString("http://119.18.148.6:8081/latestTrades/symbol=" + symbol + "").ToString();
                if (json2 == "[]")
                {
                    M = "No Value Found";
                }
                else
                {
                    dynamic stuff = JsonConvert.DeserializeObject(json2.ToString());

                    foreach (var item in stuff)
                    {
                        M += "<tr>";
                        M += "<td class='ofgn'>" + item.Time + "</td>";
                        M += "<td class='ofgn'>" + item.Price + "</td>";
                        M += "<td class='ofgn'>" + item.Volume + "</td>";
                        M += "</tr>";
                    }
                }

                return M;
            }
            catch (Exception)
            {
                throw;
            }
        }
        public string OrderHistory()
        {
            string M;
            M = "";
            try
            {
                string userid = txtUserid.Text;
                string json = (new WebClient()).DownloadString("http://119.18.148.6:8080/orderHistory/user=" + userid + "").ToString();
                if (json == "[]")
                {
                    M = "No Value Found";
                }
                else
                {
                    dynamic stuff = JsonConvert.DeserializeObject(json.ToString());

                    foreach (var item in stuff)
                    {
                        M += "<tr>";
                        M += "<td>" + item.Symbol + "</td>";
                        M += "<td>" + item.OrderStatus + "</td>";
                        M += "<td>" + item.Side + "</td>";
                        M += "<td>" + item.OrderType + "</td>";
                        M += "<td>" + item.Quantity + "</td>";
                        M += "<td>" + item.Price + "</td>";
                        M += "</tr>";
                    }
                }

                return M;
            }
            catch (Exception)
            {
                throw;
            }
        }


    }
}