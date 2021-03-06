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
    public partial class AddProductTypeComponent : ComponentBase
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

        IyaElepoApp.Models.ConData.ProductType _producttype;
        protected IyaElepoApp.Models.ConData.ProductType producttype
        {
            get
            {
                return _producttype;
            }
            set
            {
                if (!object.Equals(_producttype, value))
                {
                    var args = new PropertyChangedEventArgs(){ Name = "producttype", NewValue = value, OldValue = _producttype };
                    _producttype = value;
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
            producttype = new IyaElepoApp.Models.ConData.ProductType(){};
        }

        protected async System.Threading.Tasks.Task Form0Submit(IyaElepoApp.Models.ConData.ProductType args)
        {
            try
            {
                var conDataCreateProductTypeResult = await ConData.CreateProductType(producttype);
                DialogService.Close(producttype);
            }
            catch (System.Exception conDataCreateProductTypeException)
            {
                NotificationService.Notify(new NotificationMessage(){ Severity = NotificationSeverity.Error,Summary = $"Error",Detail = $"Unable to create new ProductType!" });
            }
        }

        protected async System.Threading.Tasks.Task Button2Click(MouseEventArgs args)
        {
            DialogService.Close(null);
        }
    }
}
