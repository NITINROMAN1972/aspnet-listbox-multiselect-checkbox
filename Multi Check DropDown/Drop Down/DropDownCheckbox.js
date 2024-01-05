
// SumoSelect JavaScript library
//https://github.com/HemantNegi/jquery.sumoselect
//https://hemantnegi.github.io/jquery.sumoselect/sumoselect_demo.html
// documentation: https://hemantnegi.github.io/jquery.sumoselect/



$(document).ready(function () {

    // opening event, to set custom select all list height
    // to prevent its overlapping over actual lists
    $('#ddlRole').on('sumo:opening', function () {
        $('.select-all').css('height', '40px');
    });

    // sumo select elements
    $('#ddlRole').SumoSelect({
        search: true,
        searchText: "search here....",
        multiSelect: true,
        okCancelInMulti: true,
        prefix: "",
        up: false, // list at top side
        selectAll: true, // not working properly
        clearAll: true, // not working at all
        renderOption: function (data, escape) {
            // Check if the option is the "Select Values" item
            if (data.value === "0") {
                // Add a class to "Select Values" item to handle differently
                return '<div class="title special-item">' + escape(data.text) + '</div>';
            } else {
                return '<div><label><input type="checkbox" />' + escape(data.text) + '</label></div>';
            }
        }
    });

    // Add an event listener to handle the specific item
    $('#ddlRole').on('sumo:opened', function () {
        // Check if the "Select Values" item is present
        if ($('#ddlRole .special-item').length > 0) {
            // Disable multiselect for the "Select Values" item
            $('#ddlRole .special-item input').prop('disabled', true);
        }
    });
});



