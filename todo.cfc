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

    <cffunction name="insertTodoFunction" access="remote" returnType="any">
        <cfargument name="todoText" type="string" required="true">
        <cfargument name="status" type="string" required="true">
        
        <cfquery name="insertTodo" datasource="#variables.dsn#">
            INSERT INTO todo (todoText,status)
                VALUES (
                    <cfqueryparam value="#arguments.todoText#" cfsqltype="cf_sql_varchar">
                    , <cfqueryparam value="#arguments.status#" cfsqltype="cf_sql_integer">
                )
        </cfquery>
        <cfreturn insertTodo>
    </cffunction>

</cfcomponent>