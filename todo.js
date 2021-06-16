$(".todoInput").keypress(function(event) {
    if(event.which === 13) {
        var text = $(this).val();
        if(text === "")
            return false;
        $("ul").prepend(
            `<li>
                <span class="left"><i class="fa fa-trash"></i></span>
                <span class="text">${text}</span>
                <span class="right"><i class="fa fa-pencil"></i></span>
            </li>`
        );
        insertTodoText(text);
        $(this).val("");
    }
});

$(".fa-plus").on("click", function() {
    $("input").fadeToggle("slow");
});

$("ul").on("click", "span.text", function(event) {
    $(this).toggleClass("completed");
});

$("ul").on("click", "span.left", function(event) {
    $(this).parent().fadeOut(500, function() {
        $(this).remove();
    });
});

$("ul").on("click", "span.right", function(event) {
    var parent = $(this).parent();
    var oldText = parent.text();
    parent.html("<input type='text' class='editInput'>");
    $(".editInput").keypress(function(event) {
        if(event.which === 13){
            if($(this).val() === ""){
                parent.html(
                    `<li>
                        <span class="left"><i class="fa fa-trash"></i></span>
                        <span class="text">${oldText}</span>
                        <span class="right"><i class="fa fa-pencil"></i></span>
                    </li>`
                );
            }else{
                var newText = $(this).val();
                parent.html(
                    `<li>
                        <span class="left"><i class="fa fa-trash"></i></span>
                        <span class="text">${newText}</span>
                        <span class="right"><i class="fa fa-pencil"></i></span>
                    </li>`
                );
            }
        }
        event.stopPropagation();
    });
    event.stopPropagation();
});

function insertTodoText(text) {
    $.ajax({
        type: 'post'
        , url: 'todo.cfc'
        , data :{
            'method': 'insertTodoFunction'
            , 'todoText': text
            , 'status': '0'
        }
        , success: function(result) {
            console.log('result', result);
        }
    });
}
