<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="EventDetail.aspx.cs" Inherits="BollardsACCWebsite.Pages.EventDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

         <div id="page-wrapper">
			<div class="header"> 
				<ol class="breadcrumb">
					<li><a href="#">Home</a></li>
				</ol> 									
			</div>
			
            <div id="page-inner">
                <div class="row">
                    <div class="col-xs-10 col-sm-10 col-md-9">
						<div class="card">
								<div class="card red">
									<div class="card-content white-text">
										<span class="card-title">Event detail</span>
									</div>
								</div>
							</div>
                            <div class="card-content">

                           <asp:Panel ID="pnlError" runat="server" >
                                <div>
                                    <h4><asp:Label runat="server" ID="lblError"  /></h4>
                                </div>
                            </asp:Panel>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                    <asp:Label runat="server" ID="lblStartDate" AssociatedControlID="tbStartDate" Text="Start date" />
                                    <asp:TextBox runat="server" ID="tbStartDate" ClientIDMode="Static" CssClass="form-control"  Enabled="false"/>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="lblChampionship" runat="server" AssociatedControlID="ddlChampionship" Text="Championship" />
                                    <asp:DropDownList runat="server" ID="ddlChampionship" CssClass="form-control" Enabled="false" />
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" ID="lblTrack" AssociatedControlID="ddlTrack" Text="Track" />
                                    <asp:DropDownList runat="server" ID="ddlTrack" CssClass="form-control" Enabled="false" />
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="form-group">
                                    <asp:Label runat="server" ID="lblEndDate" AssociatedControlID="tbEndDate" Text="End date"/>
                                    <asp:TextBox runat="server" ID="tbEndDate" CssClass="form-control" ClientIDMode="Static" Enabled="false" />
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" ID="lblServer" AssociatedControlID="ddlServer" Text="Server" />
                                    <asp:DropDownList runat="server" ID="ddlServer" CssClass="form-control" Enabled="false" />
                                </div>   
                                <div class="form-group">
                                    <asp:CheckBox runat="server" ID="cbBookingOnly" Enabled="false" />
                                    <asp:Label runat="server" ID="lblIsBookingOnky" AssociatedControlID="cBBookingOnly" Text="Is booking only" />                                    
                                </div>
                            </div>                

                                        <p>
                                            <asp:Button runat="server" ID="btnBookOnEvent" Text="Book on this event" CssClass="btn btn-primary" OnClick="btnBookOnEvent_Click" />
                                                </p>
                                            <h3>
                                                <asp:Label runat="server" ID="lblBookingInformation" />
                                            </h3>
                        </div>

                                                <asp:Panel runat="server" ID="pnlEventSessions" >

						    <div class="card">
								    <div class="card red">
									    <div class="card-content white-text">
										    <span class="card-title">Event sessions</span>
									    </div>
								    </div>
							    </div>
                                <div class="card-content">
                                    <asp:GridView runat="server" ID="gvSessionsForEvent" CssClass="table table-striped table-bordered" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    Name
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton runat="server" ID="lbtnSessionName" Text='<%#Eval("Name") %>' OnClick="lbtnSessionName_Click"  CommandArgument='<%#Eval("Id") %>' CausesValidation="false" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="SessionTypeName" HeaderText="Type" />
                                            <asp:BoundField DataField="TotalTime" HeaderText="Total time" />
                                            <asp:BoundField DataField="StartTime" HeaderText="Start time" />                            
                                        </Columns>
                                    </asp:GridView>
                                </div>
                </asp:Panel>
                            </div>
                    </div>
                    <div class="col-xs-10 col-sm-10 col-md-3">
                            <div class="card">
								<div class="card blue">
									<div class="card-content white-text">
										<span class="card-title">Round scores</span>
									</div>
								</div>
							
                            <div class="card-content">
                                <asp:GridView runat="server" ID="gvScores" CssClass="table table-bordered table-striped" OnRowDataBound="gvScores_RowDataBound"
                                    AutoGenerateColumns="false">
                                     <Columns>
                                        <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblPositionScore" />
                                        </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField>
                                            <HeaderTemplate>
                                                Player
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lblPlayerNameBeaten" Text='<%#Eval("PlayerName") %>' />
                                                <asp:HiddenField runat="server" ID="hdnSteamId" Value='<%#Eval("PlayerSteamId") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="sScore" HeaderText="Avg score" />
                                        <asp:BoundField DataField="TotalEvents" HeaderText="# events" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>

                        <div class="card">
								<div class="card blue">
									<div class="card-content white-text">
										<span class="card-title">Participants</span>
									</div>
								</div>
							</div>
                            <div class="card-content">
                                <asp:GridView ID="gvBookedPlayers" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="false">
                                    <Columns>
                                        <asp:BoundField DataField="PlayerName" HeaderText="Players Booked" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                    </div>
                </div>


                </div>
            </div>


</asp:Content>
