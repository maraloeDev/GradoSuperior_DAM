namespace Notes.Views;

public partial class AboutPage : ContentPage
{
	public AboutPage()
	{
		InitializeComponent();
	}
    /* async palabra clave se ha agregado a la declaración de método, lo que permite el uso de la await palabra clave al abrir el explorador del sistema.*/
    private async void LearnMore_Clicked(object sender, EventArgs e)
    {
        if (BindingContext is Models.About about)
        {
            // Navigate to the specified URL in the system browser.
            await Launcher.Default.OpenAsync(about.MoreInfoUrl);
        }
    }
}