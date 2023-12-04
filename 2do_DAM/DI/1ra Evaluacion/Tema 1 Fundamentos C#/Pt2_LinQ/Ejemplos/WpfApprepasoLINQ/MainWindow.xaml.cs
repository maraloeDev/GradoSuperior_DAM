using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Data;

namespace WpfApprepasoLINQ
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        int[] puntuaciones = { 90, 71, 82, 93, 75, 82 };

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            var resultado = from mejorPuntuaciones in puntuaciones
                            where mejorPuntuaciones > 80
                            orderby mejorPuntuaciones ascending
                            select mejorPuntuaciones;

            lbResultados.Items.Clear();

            foreach (var item in resultado)
            {
                lbResultados.Items.Add(item);

            }
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            var resultado = from mejorResultadoMetodo in puntuaciones
                            where mejorResultadoMetodo > 80
                            select new
                            {
                                Puntuaciones = mejorResultadoMetodo
                            };

            lbResultados.Items.Clear();

            foreach(var item in resultado)
            {
                lbResultados.Items.Add($"... {item.Puntuaciones}");
            }
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {

            var resultado = from listaClientes in Datos.GetClientes()
                            select new
                            {
                                NombreClientes = listaClientes.Nombre
                            };

            lbResultados.Items.Clear();

            foreach (var item in resultado)
            {
                lbResultados.Items.Add($"Clientes : {item.NombreClientes}");

            }
        }

        private void Button_Click_3(object sender, RoutedEventArgs e)
        {

            var resultado = from datosEmpleado in Datos.GetClientes()
                            select new
                            {
                                Nombre = datosEmpleado.Nombre,
                                TotalCompras = datosEmpleado.TotalCompras
                            };
            lbResultados.Items.Clear();

            foreach (var item in resultado)
            {
                lbResultados.Items.Add($"Nombre: {item.Nombre} \n\t Total Compras: {item.TotalCompras:C}");

            }
        }

        private void Button_Click_4(object sender, RoutedEventArgs e)
        {
            var resultado = from datosEmpleado in Datos.GetClientes()
                            select $"{datosEmpleado.Nombre} - {datosEmpleado.TotalCompras:C}";

            lbResultados.Items.Clear();

            foreach (var item in resultado)
            {
                lbResultados.Items.Add(item);
            }
        }

        private void Button_Click_5(object sender, RoutedEventArgs e)
        {

            double suma = Datos.GetClientes().Sum(c => c.TotalCompras);
            double resultado = (from totalComprasCliente in Datos.GetClientes()
                             select totalComprasCliente.TotalCompras).Sum();

            lbResultados.Items.Clear();

            tbResultado.Text = resultado.ToString("C") + "<=>" + suma.ToString("C");

        }

        private void Button_Click_6(object sender, RoutedEventArgs e)
        {

            var resultado = from agrupaciones in Datos.GetClientes()
                            group agrupaciones by agrupaciones.Localidad;

            lbResultados.Items.Clear();

            foreach (IGrouping<string, Cliente> item in resultado)
            {

                lbResultados.Items.Add($"{item.Key}");

                foreach (var item2 in item)
                {
                    lbResultados.Items.Add("\t" + item2.Nombre);

                }
            }

        }

        private void Button_Click_7(object sender, RoutedEventArgs e)
        {

            var r = from cliente in Datos.GetClientes()
                    orderby cliente.TotalCompras descending
                    select cliente;
            lbResultados.Items.Clear();
            foreach (Cliente c in r)
                lbResultados.Items.Add($"{c.Nombre,-10}\t{c.TotalCompras,+12:C}");
        }

        private void Button_Click_8(object sender, RoutedEventArgs e)
        {

            var r = (from c in Datos.GetClientes()
                     group c by c.Localidad into agrupacionLocalidad
                     select new
                     {
                         Localidad = agrupacionLocalidad.Key,
                         Total = agrupacionLocalidad.Sum<Cliente>(l => l.TotalCompras)
                     }).OrderByDescending(x => x.Total);
            foreach (var cl in r)
                lbResultados.Items.Add($"{cl.Localidad,-10}\t{cl.Total,+12:C}");
        
    }

        private void Button_Click_9(object sender, RoutedEventArgs e)
        {
            var r = from p in Datos.GetPedidos()
                    join a in Datos.GetArticulos() on p.IdArticulo equals a.IdArticulo
                    join c in Datos.GetClientes() on p.IdCliente equals c.IdCliente
                    select new
                    {
                        Pedido = p.IdPedido,
                        Fecha = p.Fecha,
                        Cliente = c.Nombre,
                        c.IdCliente,
                        Descripcion = a.Descripcion,
                        Cantidad = p.Cantidad,
                        Importe = a.Precio * p.Cantidad,
                        Localidad = c.Localidad
                    } into consulta
                    group consulta by new { consulta.Localidad, consulta.Cliente };

            foreach (var grupo in r)
            {
                lbResultados.Items.Add($"{grupo.Key.Cliente} ({grupo.Key.Localidad})");
                foreach (var fila in grupo)
                    lbResultados.Items.Add($"\t{fila.Fecha,35:D}:{fila.Importe,10:C}");
            }
        }

        private void Button_Click_10(object sender, RoutedEventArgs e)
        {

            var r = from p in Datos.Pedidos
                    join a in Datos.Articulos on p.IdArticulo equals a.IdArticulo
                    join c in Datos.Clientes on p.IdCliente equals c.IdCliente
                    select new
                    {
                        p.IdPedido,
                        c.Nombre,
                        c.IdCliente,
                        Importe = p.Cantidad * a.Precio
                    } into pc
                    group pc by pc.IdCliente into grupo
                    select new
                    {
                        Id = grupo.Key,
                        Cliente = grupo.First(g => g.IdCliente == grupo.Key),
                        NombreCliente = grupo.Select(x => x.Nombre).First(),
                        Values = grupo.ToArray(),
                        Total = grupo.Sum(g => g.Importe)
                    };
            foreach (var grupo in r)
            {
                lbResultados.Items.Add($"{grupo.NombreCliente}" +
                    $"({grupo.Cliente.Nombre})={grupo.Total}");
                foreach (var c in grupo.Values)
                    lbResultados.Items.Add(c);
            } 

        }
    }
    }