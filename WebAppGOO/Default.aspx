<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebAppGOO._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        
        <section class="row" aria-labelledby="aspnetTitle">
            <h1>Bienvenido a GOO Finance</h1>
            <h6 style="font-weight: normal">The Most Reliable Financial Company in Puerto Rico</h6>
            <br />
            <br />
        </section>

        <div class="row">
            <section class="col-md-4" aria-labelledby="Image">
                <img src="Car finance Approved.png" width="450"/>
            </section>
            &nbsp;
           <section class="col-md-4" aria-labelledby="Info">
                <h6 style="line-height: 35px">&nbsp;Préstamo de Auto</h6>

                <p style="line-height: 25px">
                    &nbsp;El término del préstamo se puede extender hasta un  
                    &nbsp;máximo de 84 meses, disminuyendo así el pago mensual.
                </p>
                <p>
                    &nbsp;No hay valor residual al finalizar el contrato.
                <br /> <br />
                    &nbsp;Financiamos la cubierta del seguro.
                </p>
                &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-outline-dark" PostBackUrl="~/LoanCalculator.aspx" >Solicita ya</asp:LinkButton>
            </section>
   
        </div>
    </main>

</asp:Content>
