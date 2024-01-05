<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DropDown.aspx.cs" Inherits="Drop_Down_DropDown" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Drop Down</title>

    <%-- Bootstrap CSS --%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />

    <%-- jQuery --%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha384-KyZXEAg3QhqLMpG8r+J2Wk5vqXn3Fm/z2N1r8f6VZJ4T3Hdvh4kXG1j4fZ6IsU2f5" crossorigin="anonymous"></script>

    <%-- Bootstrap JS --%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

    <%-- AJAX JS --%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script type="text/javascript" src="JavaScript.js"></script>


    <%-- SumoSelect CSS --%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery.sumoselect/3.1.6/sumoselect.min.css" />
    <!-- SumoSelect JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.sumoselect/3.1.6/jquery.sumoselect.min.js"></script>

    <!-- Your custom script -->
    <script type="text/javascript" src="DropDownCheckbox.js"></script>

    <%--as SumoSelect in JS is not working, hence manually setting it --%>
    <style>
        .SumoSelect {
            width: 482px !important;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="card no-b no-r px-4">
            <div class="card-body">
                <div class="form-row mt-3">
                    <div class="form-group col-md-4 m-0">
                        <label for="email" class="col-form-label badge bg-primary text-wrap mb-4 fs-6 shadow border">
                            <i class="icon-wpforms mr-2"></i>
                            <asp:Literal ID="Literal1" Text="Select CheckBox" runat="server"></asp:Literal>
                        </label>
                        <%-- OnPreRender="ddlRole_SelectedIndexChanged" --%>
                        <asp:ListBox runat="server" ID="ddlRole" ClientIDMode="Static" SelectionMode="Multiple" OnSelectedIndexChanged="ddlRole_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control rounded shadow border-0"></asp:ListBox>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
