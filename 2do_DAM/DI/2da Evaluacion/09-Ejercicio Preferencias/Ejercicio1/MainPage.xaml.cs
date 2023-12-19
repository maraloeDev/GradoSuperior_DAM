
namespace Ejercicio1
{
    public partial class MainPage : ContentPage
    {
        int count = 0;

        public MainPage()
        {
            InitializeComponent();
            
        }

        private void Button_Clicked(object sender, EventArgs e)
        {
            if (editNombre.MaxLength > 10 || editNombre.MaxLength < 10)
            {
                TextoErroneo.Text = "(*) Esta casilla es obligatoria";

            }
        }
    }

}
