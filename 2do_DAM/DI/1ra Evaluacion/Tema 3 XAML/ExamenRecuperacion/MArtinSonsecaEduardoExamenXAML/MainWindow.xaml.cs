using System.Collections.ObjectModel;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace MArtinSonsecaEduardoExamenXAML
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            Recuperar();
        }

        private void Recuperar()
        {
            Autores autores = new Autores();
            lbAutores.ItemsSource = autores;
        }




        private void lbDatos_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }
    }
}