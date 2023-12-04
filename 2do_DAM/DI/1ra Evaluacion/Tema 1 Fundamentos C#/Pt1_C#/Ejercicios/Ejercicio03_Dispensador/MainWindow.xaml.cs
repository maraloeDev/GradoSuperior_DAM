using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Ejemplo03_Dispensador
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private Deposito deposito;
        public MainWindow()
        {
            InitializeComponent();

            deposito = new Deposito();
            deposito.Cantidad_Changed += Deposito_Cantidad_Changed;
            deposito.DepositoVacio += Deposito_DepositoVacio;
            deposito.Llenar(10);
        }

        private void Deposito_DepositoVacio(object sender, EventArgs e)
        {
            // desahabilito el botón cuando salte el evento DepositoVacio
            botonBeber.IsEnabled = false;
        }

        private void Deposito_Cantidad_Changed(object sender, EventArgs e)
        {
            // cada vez que salta el evento... (porque me he suscrito)
            pbDeposito.Value = deposito.Cantidad; // modifica el valor del progressBar
            botonBeber.IsEnabled = deposito.Cantidad > 0;
        }



        private void botonBeber_Click(object sender, RoutedEventArgs e)
        {
            deposito.Cantidad--;
        }

        private void botonLlenar_Click(object sender, RoutedEventArgs e)
        {
            deposito.Cantidad = 100; // Llenar el depósito al 100%
            deposito.Llenar(10);
        }
    }
}
