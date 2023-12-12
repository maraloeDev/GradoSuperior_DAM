using System.Diagnostics;

namespace GUI_XAML;

/* La página contiene un contenedor de diseño, 
 *      dos etiquetas, 
 *      dos entradas y 
 *      un botón. 
 *      
 * El código también controla el evento Clicked para el botón. También hay varias propiedades de diseño establecidas en los elementos de la página*/

public partial class MainPage : ContentPage
{
    Button loginButton;
    VerticalStackLayout layout;

    public MainPage()
    {

        InitializeComponent();

        this.BackgroundColor = Color.FromArgb("512bdf");

        layout = new VerticalStackLayout
        {
            Margin = new Thickness(15, 15, 15, 15),
            Padding = new Thickness(30, 60, 30, 30),
            Children =
            {
                new Label { Text = "Please log in", FontSize = 30, TextColor = Color.FromRgb(255, 255, 100) },
                new Label { Text = "Username", TextColor = Color.FromRgb(255, 255, 255) },
                new Entry (),
                new Label { Text = "Password", TextColor = Color.FromRgb(255, 255, 255) },
                new Entry { IsPassword = true }
            }
        };

        loginButton = new Button { Text = "Login", BackgroundColor = Color.FromRgb(0, 148, 255) };
        layout.Children.Add(loginButton);

        Content = layout;
    }

    private void LoginButton_Clicked(System.Object sender, System.EventArgs e)
    {
        Debug.WriteLine("Clicked !");
    }
}