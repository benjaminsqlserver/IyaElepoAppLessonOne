using System;
using System.Linq;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.JSInterop;
using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Components.Web;
using Radzen;
using Radzen.Blazor;
using IyaElepoApp.Models.ConData;
using Microsoft.EntityFrameworkCore;

namespace IyaElepoApp.Pages
{
    public partial class AddCustomerComponent : ComponentBase
    {
        [Parameter(CaptureUnmatchedValues = true)]
        public IReadOnlyDictionary<string, dynamic> Attributes { get; set; }

        public void Reload()
        {
            InvokeAsync(StateHasChanged);
        }

        public void OnPropertyChanged(PropertyChangedEventArgs args)
        {
        }

        [Inject]
        protected IJSRuntime JSRuntime { get; set; }

        [Inject]
        protected NavigationManager UriHelper { get; set; }

        [Inject]
        protected DialogService DialogService { get; set; }

        [Inject]
        protected TooltipService TooltipService { get; set; }

        [Inject]
        protected ContextMenuService ContextMenuService { get; set; }

        [Inject]
        protected NotificationService NotificationService { get; set; }

        [Inject]
        protected ConDataService ConData { get; set; }

        IEnumerable<IyaElepoApp.Models.ConData.CustomerType> _getCustomerTypesResult;
        protected IEnumerable<IyaElepoApp.Models.ConData.CustomerType> getCustomerTypesResult
        {
            get
            {
                return _getCustomerTypesResult;
            }
            set
            {
                if (!object.Equals(_getCustomerTypesResult, value))
                {
                    var args = new PropertyChangedEventArgs(){ Name = "getCustomerTypesResult", NewValue = value, OldValue = _getCustomerTypesResult };
                    _getCustomerTypesResult = value;
                    OnPropertyChanged(args);
                    Reload();
                }
            }
        }

        IyaElepoApp.Models.ConData.Customer _customer;
        protected IyaElepoApp.Models.ConData.Customer customer
        {
            get
            {
                return _customer;
            }
            set
            {
                if (!object.Equals(_customer, value))
                {
                    var args = new PropertyChangedEventArgs(){ Name = "customer", NewValue = value, OldValue = _customer };
                    _customer = value;
                    OnPropertyChanged(args);
                    Reload();
                }
            }
        }

        protected override async System.Threading.Tasks.Task OnInitializedAsync()
        {
            await Load();
        }
        protected async System.Threading.Tasks.Task Load()
        {
            var conDataGetCustomerTypesResult = await ConData.GetCustomerTypes();
            getCustomerTypesResult = conDataGetCustomerTypesResult;

            customer = new IyaElepoApp.Models.ConData.Customer(){};
        }

        protected async System.Threading.Tasks.Task Form0Submit(IyaElepoApp.Models.ConData.Customer args)
        {
            try
            {
                var conDataCreateCustomerResult = await ConData.CreateCustomer(customer);
                DialogService.Close(customer);
            }
            catch (System.Exception conDataCreateCustomerException)
            {
                NotificationService.Notify(new NotificationMessage(){ Severity = NotificationSeverity.Error,Summary = $"Error",Detail = $"Unable to create new Customer!" });
            }
        }

        protected async System.Threading.Tasks.Task Button2Click(MouseEventArgs args)
        {
            DialogService.Close(null);
        }
    }
}
