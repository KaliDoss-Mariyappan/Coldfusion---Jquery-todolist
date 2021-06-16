$(".todoInput").keypress(function(event) {
    if(event.which === 13) {
        var text = $(this).val();
        if(text === "")
            return false;
        insertTodoText(text);
        $(this).val("");
    }
});

$(".fa-plus").on("click", function() {
    $("input").fadeToggle("slow");
});

$("ul").on("click", "span.text", function(event) {
    var $this = $(this);
    var id = $this.parent().attr('data-id');
    var status = '';
    $this.toggleClass("completed");
    if($this.attr('class') === 'text')
        $this.attr('data-status','0');
    else
        $this.attr('data-status', '1');
    status = $this.attr('data-status');
    updateStatus(id, status);
});

$("ul").on("click", "span.left", function(event) {
    var id = $(this).parent().attr('data-id');
    var parent = $(this).parent();
    $.ajax({
        type: 'post'
        , url: 'com/db/todo.cfc'
        , data: {
            'method': 'deleteTodoFunction'
            , 'id': id
        }
        , success: function(result) {
            parent.fadeOut(500, function() {
                parent.remove();
            });
        }
    });
});

$("ul").on("click", "span.right", function(event) {
    var parent = $(this).parent();
    var oldText = parent.text();
    var id = $(this).parent().attr('data-id');
    parent.html("<input type='text' class='editInput'>");
    $(".editInput").keypress(function(event) {
        if(event.which === 13){
            if($(this).val() === ""){
                parent.html(
                    `<li data-id="${id}">
                        <span class="left"><i class="fa fa-trash"></i></span>
                        <span class="text">${oldText}</span>
                        <span class="right"><i class="fa fa-pencil"></i></span>
                    </li>`
                );
            }else{
                var newText = $(this).val();
                updateTodoText(id,newText);
                parent.html(
                    `<li data-id="${id}">
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
        , url: './com/db/todo.cfc'
        , data :{
            'method': 'insertTodoFunction'
            , 'todoText': text
            , 'status': '0'
        }
        , success: function(result) {
            var res = JSON.parse(result);
            $("ul").prepend(
                `<li data-id="${res.GENERATED_KEY}">
                    <span class="left"><i class="fa fa-trash"></i></span>
                    <span class="text">${text}</span>
                    <span class="right"><i class="fa fa-pencil"></i></span>
                </li>`
            );
            if(res.RECORDCOUNT == 1) {
                console.log('Text Insert Successfully...!');
            }
        }
    });
}

function updateStatus(id, status) {
    console.log('id', id);
    console.log('status', status);
    $.ajax({
        type: 'post'
        , url: 'com/db/todo.cfc'
        , data: {
            'method': 'updateStatusFunction'
            , 'id': id
            , 'status': status
        }
        , success: function(result) {
        }
    });
}

function updateTodoText(id, newText) {
    $.ajax({
        type: 'post'
        , url: 'com/db/todo.cfc'
        , data: {
            'method': 'updateTodoFunction'
            , 'id': id
            , 'todoText': newText
        }
        , success: function(result) {
            console.log('result', res);
        }
    });
}