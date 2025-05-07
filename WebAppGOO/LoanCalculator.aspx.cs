using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppGOO
{
    public partial class LoanCalculator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) 
            {
                string FechaActual = DateTime.Now.ToString("MM/dd/yyyy");
                this.lblFechaCompra.Text = FechaActual;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DateTime FechaCompra = DateTime.Now;
            DateTime fechaPago = FechaCompra.AddDays(31);
            txtFechaPago.Text = fechaPago.ToString("MM/dd/yyyy");

            //double.Parse (Convierte la representación en forma de cadena (string) de un número
            //en el número de punto flotante de precisión doble equivalente)
            double PrecioVenta = double.Parse(this.PrecioVenta.Text.ToString());
            double DescFab = double.Parse(this.DescFab.Text.ToString());
            double DescDealer = double.Parse(this.DescDealer.Text.ToString());

            //Total Descuentos
            double TotalDescuentos = ((PrecioVenta) - (DescFab) - (DescDealer));
            //Format inserta un valor (currency) en una cadena (string)
            string formatoTotalDescuentos = String.Format("{0:C}", TotalDescuentos);
            this.lblTotalDescuentos.Text = formatoTotalDescuentos;

            double Pronto = double.Parse(this.Pronto.Text.ToString());

            //Balance Adeudado
            double TotalBalAdeudado = ((TotalDescuentos) - (Pronto));
            string formatoBalAdeudado = String.Format("{0:C}", TotalBalAdeudado);
            this.lblBalanceAdeudado.Text = formatoBalAdeudado;

            //Total Seguros
            double Seguro = double.Parse(this.Seguro.Text.ToString());
            double gExt = double.Parse(this.gExtendida.Text.ToString());
            double TotalSeguros = ((Seguro) + (gExt));
            string formatoTotSeguros = string.Format("{0:C}", TotalSeguros);
            this.lblTotalSeguros.Text = formatoTotSeguros;

            //Total Derechos
            double derecho1 = double.Parse(this.Derecho1.Text.ToString());
            double derecho2 = double.Parse(this.Derecho2.Text.ToString());
            double TotalDerechos = (derecho1 + derecho2);
            string formatoTotalDerechos = string.Format("{0:C}", TotalDerechos);
            lblTotalDerechos.Text = formatoTotalDerechos;

            //Pagos Mensual
            double BalFinanciar = ((TotalBalAdeudado) + (TotalSeguros));
            string formatoBalFinanciar = string.Format("{0:C}", BalFinanciar);
            this.lblBalanceFinanciar.Text = formatoBalFinanciar;
            double balancefinanciar = BalFinanciar;
            double interes = double.Parse(this.Interes.Text.ToString());

            int numeroPlazos = int.Parse(this.ddlNPlazos.Text.ToString());
            //Math.Pow (Devuelve un número especificado elevado a la potencia especificada.)
            double Pagomensual = (Math.Pow(1 + interes, numeroPlazos - 1) * balancefinanciar);
            double rate = interes / 100 / 12;
            double denominator = Math.Pow((1 + rate), numeroPlazos) - 1;
            //Math.Round (Redondea un valor al entero más próximo o al número especificado de
            //dígitos fraccionarios.)
            Pagomensual = Math.Round(((rate + (rate / denominator)) * balancefinanciar), 0);
            string formatoPagoMensual = string.Format("{0:C}", Pagomensual);
            this.lblPagoMensual.Text = formatoPagoMensual;

            double PrimerPago = (Pagomensual + TotalDerechos);
            string formatoPrimerPago = string.Format("{0:C}", PrimerPago);
            this.lblPrimerPago.Text = formatoPrimerPago;

            this.lblNumPagos.Text = (numeroPlazos - 1).ToString() + " Pagos de: ";

            lblPagoMen.Text = formatoPagoMensual;
            this.LinkButton1_ModalPopupExtender.Show();
        }

        protected void Enfoque()
        {
            PrecioVenta.Focus();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            lblAuto.Text = "Audi R8 2023";
            PrecioVenta.Text = "158600";
            Enfoque();

        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            lblAuto.Text = "Alpha Romeo Giulia Quadrifoglio 2018";
            PrecioVenta.Text = "78830";
            Enfoque();
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            lblAuto.Text = "Maserati Ghibli 2018";
            PrecioVenta.Text = "76200";
            Enfoque();
        }
    }    
}
