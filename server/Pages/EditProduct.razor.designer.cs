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
    public partial class EditProductComponent : ComponentBase
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

        [Parameter]
        public dynamic ProductID { get; set; }

        IyaElepoApp.Models.ConData.Product _product;
        protected IyaElepoApp.Models.ConData.Product product
        {
            get
            {
                return _product;
            }
            set
            {
                if (!object.Equals(_product, value))
                {
                    var args = new PropertyChangedEventArgs(){ Name = "product", NewValue = value, OldValue = _product };
                    _product = value;
                    OnPropertyChanged(args);
                    Reload();
                }
            }
        }

        IEnumerable<IyaElepoApp.Models.ConData.ProductType> _getProductTypesResult;
        protected IEnumerable<IyaElepoApp.Models.ConData.ProductType> getProductTypesResult
        {
            get
            {
                return _getProductTypesResult;
            }
            set
            {
                if (!object.Equals(_getProductTypesResult, value))
                {
                    var args = new PropertyChangedEventArgs(){ Name = "getProductTypesResult", NewValue = value, OldValue = _getProductTypesResult };
                    _getProductTypesResult = value;
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
            var conDataGetProductByProductIdResult = await ConData.GetProductByProductId(ProductID);
            product = conDataGetProductByProductIdResult;

            var conDataGetProductTypesResult = await ConData.GetProductTypes();
            getProductTypesResult = conDataGetProductTypesResult;
        }

        protected async System.Threading.Tasks.Task Form0Submit(IyaElepoApp.Models.ConData.Product args)
        {
            try
            {
                var conDataUpdateProductResult = await ConData.UpdateProduct(ProductID, product);
                DialogService.Close(product);
            }
            catch (System.Exception conDataUpdateProductException)
            {
                NotificationService.Notify(new NotificationMessage(){ Severity = NotificationSeverity.Error,Summary = $"Error",Detail = $"Unable to update Product" });
            }
        }

        protected async System.Threading.Tasks.Task Button2Click(MouseEventArgs args)
        {
            DialogService.Close(null);
        }
    }
}
