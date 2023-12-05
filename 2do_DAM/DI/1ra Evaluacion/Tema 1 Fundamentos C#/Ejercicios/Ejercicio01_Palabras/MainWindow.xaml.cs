using System.Windows;

namespace Ejercicio01_Palabras
{

    /* 
     Crea una aplicación WPF para escritorio que muestre en un listBox una lista de palabras que deberá cargarse previamente desde un array.

    cuando se pulse el botón "siguiente" extraerá del ListBox el siguiente elemento y mostrará en un textBlock tantos guiones como la longitud de la palabra.
    cuando se seleccione el botón con el textBox, se reemplazarán los guiones por la letra en su correspondiente posición.
    cuando se acierte la palabra completa deberá aparecer un mensaje indicándolo.
    
     */
    public partial class MainWindow : Window
    {
            // Creación del array con las palabras

            string[] palabras = { "Estudiar", "Caparazon", "Muleta", "Patatas", "Labios", "Manzana" };
            int indicePalabraActual = 0;
            string palabraActual;
        public MainWindow()
        {
            InitializeComponent();
            cargarPalabras();
            foreach (var palabra in palabras) // Recorro el for each creando una variable que recorrera todo el array de palabras, y lo añado a la ListBox
            {
                lbPalabras.Items.Add(palabra);
            }
        }

        // Aqui compruebo si el indice de la palabra actual es menor que la longitud de la palabra, me añades a la palabra actual (La que se va a mostrar)
        void cargarPalabras()
        {
            if (indicePalabraActual < palabras.Length)
            {
                palabraActual = palabras[indicePalabraActual];
                tbkPalabra.Text = palabraActual;
            }
            else
            {
                MessageBox.Show("No hay mas palabras!!");
                Close();
            }
        }

        // en este metodo, compruebo que si el indice es menor que la longitud es mayor que la palabra, entonces, aumenta en 1 el contador y va eliminando las palabras
        private void botSiguiente_Click(object sender, RoutedEventArgs e)
        {

            if (indicePalabraActual < palabras.Length)
            {
                indicePalabraActual++;
                lbPalabras.Items.Clear();
                cargarPalabras();
            }

        }

        private void botA_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
