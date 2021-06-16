<cfcomponent>
    
    <cffunction name="init" returntype="todo">
        <cfset variables.dsn = arguments.dsn>
        <cfreturn this>
    </cffunction>

    <cffunction name="selectTodoFunction" returnType="query" access="public">
        <cfset var todoQuery = ''>
        <cfquery name="todoQuery" datasource="#variables.dsn#">
            SELECT * FROM todo
        </cfquery>
        <cfreturn todoQuery>
    </cffunction>

    <cffunction name="insertTodoFunction" access="remote" returnformat="JSON">
        <cfargument name="todoText" type="string" required="true">
        <cfargument name="status" type="string" required="true">
        
        <cfquery name="insertTodo" datasource="demoSource" result="res">
            INSERT INTO todo (todoText,status)
                VALUES (
                    <cfqueryparam value="#arguments.todoText#" cfsqltype="cf_sql_varchar">
                    , <cfqueryparam value="#arguments.status#" cfsqltype="cf_sql_integer">
                )
        </cfquery>
        <cfreturn res>
    </cffunction>

    <cffunction name="updateStatusFunction" access="remote" returnformat="JSON">
        <cfargument name="id" type="string" required="true">
        <cfargument name="status" type="string" required="true">
        
        <cfquery name="insertTodo" datasource="demoSource" result="res">
            UPDATE todo SET 
                status = <cfqueryparam value="#arguments.status#" cfsqltype="cf_sql_integer">
                    WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn res>
    </cffunction>

    <cffunction name="deleteTodoFunction" access="remote" returnformat="JSON">
        <cfargument name="id" type="string" required="true">
        
        <cfquery name="insertTodo" datasource="demoSource" result="res">
            DELETE FROM  todo 
                    WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn res>
    </cffunction>

    <cffunction name="updateTodoFunction" access="remote" returnformat="JSON">
        <cfargument name="id" type="string" required="true">
        <cfargument name="todoText" type="string" required="true">
        
        <cfquery name="insertTodo" datasource="demoSource" result="res">
            UPDATE todo SET 
                todoText = <cfqueryparam value="#arguments.todoText#" cfsqltype="cf_sql_varchar">
                    WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn res>
    </cffunction>

</cfcomponent>