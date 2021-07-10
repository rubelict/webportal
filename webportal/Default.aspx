<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Pages/MainMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="webportal.Default" EnableViewState="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .widget-title{
            background-color:#33b5e5;
        }
        .ofgn{
            background-color:#A3FFA3
        }
        .ofrd{
            background-color:#FFCFCF
        }
    </style>
  
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" runat="server">
    <div id="content-header">
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Web Portal 2021</a></div>
  </div>
     <div class="container-fluid">
   	
   
         
         <div class="row-fluid">
              <div id="Content">  
    </div> 
             <div class="span3">
		
             </div>

             <div class="span6">
                   <asp:Label ID="lbl" runat="server" Text=""></asp:Label>
                   <asp:Label ID="lbljason" runat="server" Text=""></asp:Label>
               <div class="form-horizontal" >
                                    <div class="control-group">
                                        <label class="control-label">Select</label>
                                        <div class="controls">
              
                                            <asp:DropDownList ID="ddlcompany" AutoPostBack="True" runat="server" OnSelectedIndexChanged="ddlcompany_SelectedIndexChanged"></asp:DropDownList>
                                        </div>
                                    </div>
                                    
                                </div>
                
              </div>
             </div>
         <div class="row-fluid">
      <div class="span4">
      <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-th"></i> </span>
            <h5>Real Time Data  <asp:Label ID="lblRealTimeTitle" runat="server" Text=""></asp:Label></h5>
          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered">
              <thead>
                <tr>
                  <th>B_Ord</th>
                  <th>B_Qt</th>
                    
                  <th>B_Rate</th>
                  <th>S_Rate</th>
                  <th>S_Qt</th>
                  <th>S_Ord</th>
                </tr>
              </thead>
              <tbody>
                  <asp:Literal ID="ltlTableBody" runat="server"></asp:Literal>
             
              </tbody>
            </table>
              <table class="table hidescrip" style="color: black;">
                            <tbody><tr>
                                <td>Last Trade Price</td>
                                <td id="ofLTP" class="text-right pr-2 border-right">259.1</td>
                                <td class="pl-2">Last Trade Qty</td>
                                <td id="ofQt" class="text-right">0</td>
                            </tr>
                            <tr>
                                <td>Total Volume</td>
                                <td id="ofVol" class="text-right pr-2 border-right">0</td>
                                <td class="pl-2">Total Value</td>
                                <td id="ofValue" class="text-right">0</td>
                            </tr>
                            <tr>
                                <td>Total Trade</td>
                                <td id="ofTrade" class="text-right pr-2 border-right">0</td>
                                <td class="pl-2">Last Trade Time</td>
                                <td id="ofTime" class="text-right"></td>
                            </tr>
                            <tr>
                                <td>Day's Low</td>
                                <td id="ofLow" class="text-right pr-2 border-right">0.0</td>
                                <td class="pl-2">Day's High</td>
                                <td id="ofHigh" class="text-right">0.0</td>
                            </tr>
                            <tr>
                                <td>YCP</td>
                                <td id="ofYCP" class="text-right pr-2 border-right">260.7</td>
                                <td class="pl-2">Circuit</td>
                                <td id="ofUpC" class="text-right">0 &nbsp;-&nbsp; 0</td>
                            </tr>
                            
                            

                        </tbody></table>
          </div>
        </div>
      </div>
       <div class="span4">
      <div class="widget-box">
          <div class="widget-title" style="background-color:#5D2479 !important"> 
            <h5>Trade</h5>
          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered table-striped">

              <tbody>
                  <tr>
                      <td>User Id</td>
                      <td>
                          
                            <asp:TextBox ID="txtUserid" class="form-control"  runat="server"></asp:TextBox> 
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 35%">
                          <div>Trade Type</div>
                      </td>
                      <td style="text-align: center">
                         
                           <asp:DropDownList ID="ddlTrdType" class="form-control" runat="server">
                            <asp:ListItem Value="1">Buy</asp:ListItem>
                            <asp:ListItem Value="2">Sell</asp:ListItem>
                        </asp:DropDownList>

                      </td>

                  </tr>
                  <tr>
                      <td id="fndorstk">Available Fund</td>
                      <td>
                          <input type="text" readonly="readonly" id="txtFund" class="form-control" style="font-weight: bold;">
                      </td>
                  </tr>

                  <tr>
                      <td>Quantity</td>
                      <td>
                          <div class="d-flex justify-content-between align-items-center">
                              <div>
                                  <asp:TextBox ID="txtQty" class="form-control" runat="server" style=" width: 90px; float: left;" type="number" ></asp:TextBox>
                              
                              </div>
                              <div id="dvbOr" style="float: left; padding: 0px 7px">OR</div>
                              <div>
                                  <input  readonly="readonly" id="txtinvstAmnt" class="form-control" style="width: 100px; color: blue; float: left;" placeholder="Taka">
                              </div>
                          </div>

                      </td>
                  </tr>
                  <tr>
                      <td>Rate</td>
                      <td>
                          <div class="d-flex justify-content-between align-items-center">
                              <div>
                                  <asp:TextBox ID="txtRate" type="number" class="form-control" style="font-size: Large; font-weight: bold; width: 90px; float: left;" runat="server"></asp:TextBox> 
                              </div>
                              <div id="divchkbox" style="padding: 0px 7px; float: left;">
                                  <asp:checkbox runat="server" ID="chkMarket" onclick="ShowHideDiv(this)"></asp:checkbox>

                              </div>
                              <p>Market Price</p>
                          </div>
                      </td>
                  </tr>
                  <tr>
                      <td>Total Value</td>
                      <td>
                          <input type="text" readonly="readonly" id="txtTotal" class="form-control" style="font-weight: bold;">
                      </td>
                  </tr>
                 
      
                
      <tr>
        <td colspan="3" style="text-align:center">
           <%-- <button id="btnBS" class="btn btn-lg waves-effect waves-light btn-success">SUBMIT</button>--%>
             <asp:Button ID="btnSubmit" OnClick="btnSaveDpt_Click" class="btn btn-lg waves-effect waves-light btn-success" runat="server" Text="Submit" />

        </td>
      </tr>
   
   
              </tbody>
          </table>
          </div>
        </div>
      </div>
                 <div class="span4">
      <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-th"></i> </span>
            <h5>Real Time </h5>
          </div>
          <div class="widget-content nopadding">
              <asp:GridView ID="GridView1" runat="server" >
                                    
                    </asp:GridView>

          </div>
        </div>
      </div>
    </div>
         <div class="row-fluid">
             <div class="span4">
      <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-th"></i> </span>
            <h5>Latest Trade  <asp:Label ID="lblLatestTrade" runat="server" Text=""></asp:Label></h5>
          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered">
              <thead>
                <tr>
                  <th>Time</th>
                  <th>Price</th>
                  <th>Volume</th>
                </tr>
              </thead>
              <tbody>
                  <asp:Literal ID="ltlLatestTrades" runat="server"></asp:Literal>
             
              </tbody>
            </table>
          
          </div>
        </div>
      </div>

              <div class="span6">
      <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-th"></i> </span>
            <h5>Order History </h5>
          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered">
              <thead>
                <tr>
                   <th>Symbol</th>
                  <th>Order Status</th>
                  <th>Side</th>
                  <th>Order Type</th>
                   <th>Quanity</th>
                   <th>Price</th>
                </tr>
              </thead>
              <tbody>
                  <asp:Literal ID="ltlOrderHistory" runat="server"></asp:Literal>
             
              </tbody>
            </table>
          
          </div>
        </div>
      </div>
               </div>
         

        
  </div>

      <script type="text/javascript">

          function ShowHideDiv(chkMarket) {
              var id = "<%: txtRate.ClientID %>";
              id = "#" + id;

              if (chkMarket.checked) {
                      $(id).val("");
                      $(id).attr("disabled", "disabled");
                  }
                  else {
                      $(id).removeAttr("disabled");
                      $(id).focus();
                  }
              /*});*/
          }

        <%--$(function () {
            var id = "<%: txtRate.ClientID %>";
            id = "#" + id;
            $("#chkMarket").change(function () {
                if (this.checked) {
                    $(id).val("");
                    $(id).attr("disabled", "disabled");
                }
                else{
                    $(id).removeAttr("disabled");
                    $(id).focus();
                }
            });
        });--%>
      </script>
   
</asp:Content>
