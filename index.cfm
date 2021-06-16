<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>To-Do List</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.min.js" crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" crossorigin="anonymous">
        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <body>
		<cfoutput>
			<cfset selectTodo = Application.todoObject.selectTodoFunction()>
			<div class="container">
				<h3>Jquery - Todo - Project</h3>
				<h2>To-Do List <i class="fa fa-plus"></i></h2>
				<input type="text" placeholder="Enter To-Do" class="todoInput">
				<ul>
					<cfloop query="#selectTodo#">
						<li data-id="#selectTodo.id#">
							<span class="left"><i class="fa fa-trash"></i></span>
							<span class="text <cfif selectTodo.status EQ '1'>completed</cfif>" data-status="#selectTodo.status#">#selectTodo.todoText#</span>
							<span class="right"><i class="fa fa-pencil"></i></span>	
						</li>
					</cfloop>
				</ul>
			</div>
		</cfoutput>
        <script src="assets/js/todo.js"></script>
    </body>
</html>