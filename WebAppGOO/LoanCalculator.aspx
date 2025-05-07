<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoanCalculator.aspx.cs" UnobtrusiveValidationMode="None" Inherits="WebAppGOO.LoanCalculator" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <%--Jumbotron--%>
        <div class="container mt-3">
            <div class="mt-4 p-5 bg-secondary text-white rounded">
                <h1>Pago Mensual Préstamo de Auto</h1>

                <%--Seleccionar los autos image button--%>
                <p>Seleccione un auto</p>
                <div class="row">
                    <section class="col-md-4 d-flex justify-content-center">
                        <div class="card" style="width: 18rem; background-color: transparent; border: none;">
                            <%--Auto1--%>
                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/r8 audi.png" CssClass="card-img-top" Height="180px" OnClick="ImageButton1_Click" ValidationGroup="img" />
                            <div class="card-body">
                                <h6 class="card-title">Audi R8</h6>
                            </div>
                        </div>
                    </section>
                    <section class="col-md-4 d-flex justify-content-center">
                        <div class="card" style="width: 18rem; background-color: transparent; border: none;">
                            <%--Auto2--%>
                            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/quadrifoglio.png" Height="180px" OnClick="ImageButton2_Click" ValidationGroup="img" />
                            <div class="card-body">
                                <h6 class="card-title">Alfa Romeo Giulia Quadrifoglio</h6>
                            </div>
                        </div>
                    </section>
                    <section class="col-md-4 d-flex justify-content-center">
                        <div class="card" style="width: 18rem; background-color: transparent; border: none;">
                            <%--Auto3--%>
                            <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/Maserati ghibli.png" Height="180px" OnClick="ImageButton3_Click" ValidationGroup="img" />
                            <div class="card-body">
                                <h6 class="card-title">Maserati Ghibli</h6>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>

        <br />

        <%--Auto Seleccionado en label--%>
        <div class="container mt-3">
        <p>Auto Seleccionado: 
        <asp:Label ID="lblAuto" runat="server" Text="" Font-Bold="True"></asp:Label></p>

        <br /> 

        <%--Costos--%>
        <div class="row d-flex">
            <section class="col-md-4" aria-labelledby="Costos">
                <h2 id="Costos">Costos</h2>
                <br />
                <p>Precio de Venta <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ErrorMessage="Requerido" ControlToValidate="PrecioVenta"></asp:RequiredFieldValidator></p>
                <asp:TextBox ID="PrecioVenta" runat="server" CssClass="form-control" ForeColor="Gray"></asp:TextBox>
                <br />
                <p>Descuento Fabricante
                <asp:TextBox ID="DescFab" runat="server" CssClass="form-control" ForeColor="Gray" Text="0"></asp:TextBox></p>
                <p>Descuento Dealer
                <asp:TextBox ID="DescDealer" runat="server" CssClass="form-control" ForeColor="Gray" Text="0"></asp:TextBox></p>
                <p>Pronto/Trade-In
                <asp:TextBox ID="Pronto" runat="server" CssClass="form-control" ForeColor="Gray" Text="0"></asp:TextBox></p>
                <p>Seguro <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="Red" ErrorMessage="Requerido" ControlToValidate="Seguro"></asp:RequiredFieldValidator></p>
                <asp:TextBox ID="Seguro" runat="server" CssClass="form-control" ForeColor="Gray" Text=""></asp:TextBox>
                <br />
                <p>Garantía Extendida
                <asp:TextBox ID="gExtendida" runat="server" CssClass="form-control" ForeColor="Gray" Text="0"></asp:TextBox></p>
                <p>Derechos
                <asp:TextBox ID="Derecho1" runat="server" CssClass="form-control" ForeColor="Gray" Text="0"></asp:TextBox></p>
                <p>Registro
                <asp:TextBox ID="Derecho2" runat="server" CssClass="form-control" ForeColor="Gray" Text="0"></asp:TextBox></p>
            </section>

            <%--Financiamiento--%>
            <section class="col-md-4" aria-labelledby="Financiamiento">
                <h2 id="Financiamiento">Financiamiento</h2>
                <br />
                <p>Interés</p>

                <%--Slider--%>
                <asp:TextBox ID="Interes" runat="server"></asp:TextBox>
                <ajaxToolkit:SliderExtender ID="txtSlider_SliderExtender1" runat="server" RailCssClass="ajax__slider_h_rail test"
                    TargetControlID="Interes" 
                    EnableHandleAnimation="true" 
                    BoundControlID="lblSliderValue" 
                    Decimals="1"
                    Minimum="1"
                    Maximum="13"/>
                <asp:Label ID="lblSliderValue" runat="server" Font-Size="Small"></asp:Label>
                <br /> 
                <br />

                <%--DropDown List--%>
                <p>Plazos <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ForeColor="Red" ErrorMessage="Requerido" ControlToValidate="ddlNPlazos"></asp:RequiredFieldValidator></p>
                <asp:DropDownList ID="ddlNPlazos" runat="server" CssClass="form-control">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>48</asp:ListItem>
                    <asp:ListItem>60</asp:ListItem>
                    <asp:ListItem>72</asp:ListItem>
                    <asp:ListItem>84</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />

                <%--Resumen--%>
                <h5>Resumen</h5>
                <p>Total Menos Descuentos:
                <asp:Label ID="lblTotalDescuentos" runat="server" Text="" ForeColor="Red"></asp:Label></p>
                <p>Balance Adeudado:
                <asp:Label ID="lblBalanceAdeudado" runat="server" Text="" ForeColor="Red"></asp:Label></p>
                <p>Total Seguros:
                <asp:Label ID="lblTotalSeguros" runat="server" Text="" ForeColor="Red"></asp:Label></p>
                <p>Total Derechos:
                <asp:Label ID="lblTotalDerechos" runat="server" Text="" ForeColor="Red"></asp:Label></p>
            </section>
            <br />

            <%--Pago--%>
            <section class="col-md-4" aria-labelledby="Pago">
                <h2 id="Pago">Pago</h2>
                <br />
                <asp:LinkButton ID="Pagos" runat="server" OnClick="Button1_Click" CssClass="btn btn-success btn-block" Width="275px">Calcular</asp:LinkButton>
                <br />
                <asp:LinkButton ID="LinkButton1" runat="server" Width="1px" />

                <ajaxToolkit:ModalPopupExtender ID="LinkButton1_ModalPopupExtender" runat="server"
                    TargetControlID="LinkButton1"
                    PopupControlID="Panel1"
                    BackgroundCssClass="modalBackground"
                    DropShadow="false"
                    CancelControlID="CancelButton"
                    PopupDragHandleControlID="Panel1" />
                <br />
                <br />

                <%--Popup Panel--%>
                <asp:Panel ID="Panel1" runat="server" align="center" Style="display: none; background-color: #FFFFFF; border-width: 3px; padding-top: 10px; padding-left: 10px; width: 360px; height: 175px; border-radius: 25px">
                    <div class="container">
                        <div class="row">
                            <div class="col">
                                <div class="row">
                                    <div class="col" style="padding-left: 300px">

                                        <asp:Button ID="CancelButton" runat="server" Text="X" BorderStyle="None" BackColor="White" Font-Bold="True" ForeColor="Red" />

                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">

                                        <p style="font-size: 20px">Su pago mensual será: &nbsp;&nbsp;</p>
                                        <asp:Label ID="lblPagoMen" runat="server" Text="Label" Font-Bold="true" Font-Size="35px"></asp:Label>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </asp:Panel>

                <%--Info--%>
                <p>
                    Fecha de Compra:
                <asp:Label ID="lblFechaCompra" runat="server" Text="" ForeColor="Red"></asp:Label>
                </p>

                <p>
                    Balance a Financiar:
                <asp:Label ID="lblBalanceFinanciar" runat="server" Text="" ForeColor="Red"></asp:Label>
                </p>
                <br />
                <p>
                    Primer Pago:
                <asp:Label ID="lblPrimerPago" runat="server" Text="" ForeColor="Red"></asp:Label>
                </p>
                <%--Pagos de:--%>
                <asp:Label ID="lblNumPagos" runat="server" Text=""></asp:Label>
                <asp:Label ID="lblPagoMensual" runat="server" Text="" Font-Bold="true" ForeColor="Red"></asp:Label>
                <br />
                <br />

                <%--Calendar--%>
                <p>
                    Fecha Primer Pago
                <asp:TextBox ID="txtFechaPago" runat="server" CssClass="form-control"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="txtFechaPago_CalendarExtender" runat="server" BehaviorID="txtFechaPago_CalendarExtender" TargetControlID="txtFechaPago" />
                </p>
            </section>
        </div>
            </div>
                </ContentTemplate>
        </asp:UpdatePanel>
    </main>
    <br />
</asp:Content>