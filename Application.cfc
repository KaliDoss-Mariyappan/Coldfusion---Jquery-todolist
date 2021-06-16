<cfcomponent>
    
    <cfset this.name = 'jquery-todo-project111s11231ssssssssssssdssss'>

    <cffunction name="onApplicationStart">
        <cfset Application.todoObject = createObject('component', 'com.db.todo').init(dsn = 'demoSource')>
    </cffunction>

</cfcomponent>