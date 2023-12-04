using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;

namespace Ejercicio02_Palabras2
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {

        private string[] palabras = { "Carro", "Cerdo", "Esternocleidomastoideo", "Consola", "Juguete", "Programacion", "Frio", "Calor" };
        private int indicePalabra = -1; //Escojo el indice de la palabra actual como -1 (Por que las coje del array)
        private string palabraActual;
        private string palabraDescubierta;
        public MainWindow()
        {
            InitializeComponent();

            for (int i = 97; i < 123; i++)
            {
                Button b = new Button();
                char letra = (char)i;
                b.Content = letra;
                b.Height = 50;
                b.Width = 50;
                b.Background = new SolidColorBrush(Colors.White);
                wpBoton.Children.Add(b);

            }

            indicePalabra++;

            if (indicePalabra < palabras.Length)
            {
                palabraActual = palabras[indicePalabra];
                palabraDescubierta = new string('-', palabraActual.Length);
                tbxLetra.Text = palabraDescubierta;
            }
            else //Si el usuario, ingresa mas de una letra, salta un mensaje
            {
                MessageBox.Show($"Has adivinado todas las palabras");
            }

            private void Button_Siguiente(object sender, RoutedEventArgs e)
            {
                //Cuando se le de al boton Siguiente, se llamara al metodo cargarPalabra();
                CargarPalabra();

            }
        }
    }
}
