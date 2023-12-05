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

namespace Examen_Martin_Sonseca_Eduardo_LinQ
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            Consultas();
        }

        private void Consultas()
        {


            // En esta primera parte de la consulta muestro el nombre y el apellido, ordenado por apellidos
            var resultado = from clientes in Datos.GetClientes()
                            join interVenc in Datos.GetIntervenciones()
                            on clientes.IdCliente equals interVenc.IdCliente

                            join services in Datos.GetServicios()
                            on interVenc.IdServicio equals services.IdServicio
                            select new
                            {
                                Id = clientes.IdCliente,
                                Nombre = clientes.Nombre,
                                Apellidos = clientes.Apellidos,
                                Domicilio = clientes.Domicilio,
                                Fecha = interVenc.Fecha,
                                Servicio = services.Descripcion,
                                Tiempo = interVenc.TiempoMinutos,
                                Precio = services.Precio

                            };

            foreach ( var item in resultado)
            {
                lbInforme.Items.Add($"{item.Nombre},{item.Apellidos} ({item.Domicilio})" +
                    $"\n\t   {item.Fecha}\t  {item.Servicio}\t   {item.Tiempo}\t    {item.Precio:C}");

            }

        }
    }
}
