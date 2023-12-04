using System;
using System.Collections.ObjectModel;
using System.Windows.Input;
using WpfMVVM.Modelos;

namespace WpfMVVM.ViewModels { internal class MainPageViewModel : BaseViewModel { private Persona currentPersona; private int indice; public ObservableCollection<Persona> personas { get; private set; } = new;  public String Posicion { get => $" {indice + 1} / {personas.Count}"; }} public class RelayCommand : ICommand{private Action _execute; private Func<bool> _canExecute;public RelayCommand(Action execute, Func<bool> canExecute = null){ _execute = execute; _canExecute = canExecute; } public bool CanExecute(object? parameter){return _canExecute == null || _canExecute();}public void Execute(object? parameter){ _execute();  }  public event EventHandler? CanExecuteChanged { add { CommandManager.RequerySuggested += value; } remove { CommandManager.RequerySuggested -= value; }  }}}