# aspnet-listbox-multiselect-checkbox
ASP.NET C# code for ListBox with multipple selection using checkbox and search functionality using the SumoSelect library

### SumoSelect jQuery Plugin
* A beautiful cross device Single/Multi Select jQuery Select plugin
* A jQuery plugin that progressively enhances an HTML Select Box into a Single/Multiple option dropdown list
*  The dropdown list can be fully customizable using simple css

`Documentation` <a href="https://hemantnegi.github.io/jquery.sumoselect/" target="_blank">SumoSelect Documentation</a>   
`Demo` <a href="https://hemantnegi.github.io/jquery.sumoselect/sumoselect_demo.html" target="_blank">SumoSelect Demo</a>


`import`  
``` html
<!-- SumoSelect CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery.sumoselect/3.1.6/sumoselect.min.css" />
<!-- SumoSelect JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.sumoselect/3.1.6/jquery.sumoselect.min.js"></script>
```


`asp:ListBox`   
``` html
<asp:ListBox runat="server" ID="ddlRole" ClientIDMode="Static" SelectionMode="Multiple" OnSelectedIndexChanged="ddlRole_SelectedIndexChanged" 
      AutoPostBack="true" CssClass="form-control rounded shadow border-0" OnPreRender="ddlRole_SelectedIndexChanged"></asp:ListBox>
```    


`OnPreRender & OnSelectedIndexChanged Events`   
``` csharp
protected void ddlRole_SelectedIndexChanged(object sender, EventArgs e)
{
    string selectedValues = string.Empty;
    foreach (ListItem li in ddlRole.Items)
        {
            if (li.Selected == true)
            {
                selectedValues += li.Text + ",";
            }
        }

    // to check the values printed on front, for testing
    Response.Write(selectedValues.ToString());
}
```


<hr/>



### SumoSelect Application
`SumoSelect initialization`    
``` javascript
$(document).ready(function () {

  $(document).ready(function () {
    $('.selectBox').SumoSelect();
  });

});
```


`Additional parameters for customization`     
``` javascript
$(document).ready(function () {
  $('.selectBox').SumoSelect({
    search: true,
    searchText: "search here...."
  });
});
```


`Multiple Chekbox Select`  
``` javascript
$(document).ready(function () {
  $('.selectBox').SumoSelect({
    search: true,
    searchText: "search here....",
    multiSelect: true
  });
});
```


<hr/>


### SumoSelect Events
`sumo:opened`
`sumo:opening`
`sumo:closing`
`sumo:closed`
`sumo:initialized`
`sumo:unloaded`

<hr/>


### Working additional parameters with ASP.NET C#

``` javascript
$(document).ready(function () {
    $('#ddlRole').SumoSelect({
        search: true,                    // to get search functionality
        searchText: "search here....",   // place holder for search
        multiSelect: true,               // for checkbox
        okCancelInMulti: true,           // to have OK and Cancel button for events
        prefix: "",                      // for fianl display selected value
        up: false,                       // list at top side
        selectAll: true,                 // not working properly
    });
});
```

<hr/>

`selectAll: true` parameters list option is overlapping over other actual lists generated,   
so there is a solution for that, by providing custom padding for more customization using `sumo:opening` event   

```javascript
// opening event, to set custom select all list height
// to prevent its overlapping over actual lists

$('#ddlRole').on('sumo:opening', function () {
    $('.select-all').css('height', '40px');
});
```


The `width` is getting by default smaller, so customizing the width of ListBox using the internal CSS   
``` html
<!-- as SumoSelect in JS is not working, hence manually setting it -->
<!-- !important is needed -->
<style>
    .SumoSelect {
        width: 482px !important;
    }
</style>
```
