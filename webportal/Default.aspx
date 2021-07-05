<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Pages/MainMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="webportal.Default" %>
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
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home111111</a></div>
  </div>
     <div class="container-fluid">
   	<div class="quick-actions_homepage">
    <ul class="quick-actions">
          <li> <a href="#"> <i class="icon-dashboard"></i> My Dashboard </a> </li>
          <li> <a href="#"> <i class="icon-shopping-bag"></i> Shopping Cart</a> </li>
          <li> <a href="#"> <i class="icon-web"></i> Web Marketing </a> </li>
          <li> <a href="#"> <i class="icon-people"></i> Manage Users </a> </li>
          <li> <a href="#"> <i class="icon-calendar"></i> Manage Events </a> </li>
        </ul>
   </div>
   

         <div class="row-fluid">
      <div class="span4">
      <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-th"></i> </span>
            <h5>Real Time Data : ACI</h5>
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
                <tr>
                  <td class="ofgn">1</td>
                  <td class="ofgn">100</td>
                  <td class="ofgn">242.3</td>
                  <td class="ofrd"> 270</td>
                  <td class="ofrd">500</td>
                  <td class="ofrd">1</td>
                </tr>
                <tr>
                  <td class="ofgn">1</td>
                  <td class="ofgn">100</td>
                  <td class="ofgn">242.3</td>
                  <td class="ofrd"> 270</td>
                  <td class="ofrd">500</td>
                  <td class="ofrd">1</td>
                </tr>
                  <tr>
                  <td class="ofgn">1</td>
                  <td class="ofgn">100</td>
                 <td class="ofgn">242.3</td>
                  <td class="ofrd"> 270</td>
                  <td class="ofrd">500</td>
                  <td class="ofrd">1</td>
                </tr>
                  <tr>
                  <td class="ofgn">1</td>
                  <td class="ofgn">100</td>
                  <td class="ofgn">242.3</td>
                  <td class="ofrd"> 270</td>
                  <td class="ofrd">500</td>
                  <td class="ofrd">1</td>
                </tr>
                  <tr>
                  <td class="ofgn">1</td>
                  <td class="ofgn">100</td>
                   <td class="ofgn">242.3</td>
                  <td class="ofrd"> 270</td>
                  <td class="ofrd">500</td>
                  <td class="ofrd">1</td>
                </tr>
                  <tr>
                  <td class="ofgn">1</td>
                  <td class="ofgn">100</td>
                 <td class="ofgn">242.3</td>
                  <td class="ofrd"> 270</td>
                  <td class="ofrd">500</td>
                  <td class="ofrd">1</td>
                </tr>
                  <tr>
                  <td class="ofgn">1</td>
                  <td class="ofgn">100</td>
                  <td class="ofgn">242.3</td>
                  <td class="ofrd"> 270</td>
                  <td class="ofrd">500</td>
                  <td class="ofrd">1</td>
                </tr>
                  <tr>
                  <td class="ofgn">1</td>
                  <td class="ofgn">100</td>
                  <td class="ofgn">242.3</td>
                  <td class="ofrd"> 270</td>
                  <td class="ofrd">500</td>
                  <td class="ofrd">1</td>
                </tr>
                  <tr>
                  <td class="ofgn">1</td>
                  <td class="ofgn">100</td>
                  <td class="ofgn">242.3/td>
                  <td class="ofrd"> 270</td>
                  <td class="ofrd">500</td>
                  <td class="ofrd">1</td>
                </tr>
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
                      <td style="width: 35%">
                          <div>Trade Type</div>
                      </td>
                      <td style="text-align: center">
                          <button class="btn btn-success">BUY</button>
                          <button class="btn btn-danger">SELL</button>

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
                                  <input onkeypress="return isNumberInt(event)" id="txtQt" class="form-control" style="font-size: Large; font-weight: bold; width: 90px; float: left;">
                              </div>
                              <div id="dvbOr" style="float: left; padding: 0px 7px">OR</div>
                              <div>
                                  <input onkeypress="return isNumberInt(event)" id="txtinvstAmnt" class="form-control" style="font-size: large; width: 100px; color: blue; float: left;" placeholder="Taka">
                              </div>
                          </div>

                      </td>
                  </tr>
                  <tr>
                      <td>Rate</td>
                      <td>
                          <div class="d-flex justify-content-between align-items-center">
                              <div>
                                  <input id="txtRate"
                                      class="form-control" style="font-size: Large; font-weight: bold; width: 90px; float: left;">
                              </div>
                              <div id="divchkbox" style="padding: 0px 7px; float: left;">
                                  <input type="checkbox" class="form-check-input" id="chkMarket">
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
        <td colspan="3" style="text-align:center"><button id="btnBS" class="btn btn-lg waves-effect waves-light btn-success">SUBMIT</button></td>
      </tr>
   
   
              </tbody>
          </table>
          </div>
          <%--<div class="widget-title" style="background-color:#5D2479 !important"> 
            <h5>Trade</h5>
          </div>
          <div class="card-footer py-1 text-center">
                        <button id="btnBS" class="btn btn-lg waves-effect waves-light btn-success">SUBMIT</button>
                    </div>--%>

        </div>
      </div>
    </div>
    
    
  </div>
</asp:Content>
