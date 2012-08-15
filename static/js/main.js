$(function () {

    $('#topbar').dropdown();

    $("#friends").autocomplete({
        source: friends,
        select: function(event, ui) {
            var li = '<li><img src="http://graph.facebook.com/'+ui.item.id+'/picture">' + ui.item.name + '</li>'
            $('#selected').append(li);
        },
        search: function(event, ui){
            //if (event.keyCode == 229) return false;
            //return true;
        },
        minLength: 2,
    })
    .keyup(function(event){
        if (event.keyCode == 13) {
            //$(this).autocomplete("search");
        }
    });

    $('#tags input.tag').tagedit({
        autocompleteURL: '/tag_search',
        autocompleteOptions: {minLength: 0},
    }); 

});
