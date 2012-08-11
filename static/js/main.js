$(function () {

    $('#topbar').dropdown();

    $("#friends").autocomplete({
        source: friends,
        search: function(event, ui){
            //if (event.keyCode == 229) return false;
            //return true;
        }
    })
    .keyup(function(event){
        if (event.keyCode == 13) {
            //$(this).autocomplete("search");
        }
    })
    .autocomplete('option', 'minLength', 1);

});
