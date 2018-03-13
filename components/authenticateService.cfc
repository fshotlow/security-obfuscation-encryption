<cfcomponent displayname="login" output="false">
    <cfset encryptCFC =createobject("component","encryptVariables")>

    <cffunction  name="validateUser" access="public" output="false" returntype="array">
        <cfargument  name="userName" type="string" required="true">
        <!--- <cfargument  name="userEmail" type="string" required="true"> --->
        <cfargument  name="userPassword" type="string" required="true">
        <cfset var aErrorMessages = ArrayNew(1) />
        <cfif arguments.userName eq "">
            <cfset arrayAppend(aErrorMessages, 'Please, provide a valid user Name')>
        </cfif>
        <cfif arguments.userPassword eq "">
            <cfset arrayAppend(aErrorMessages, 'Please, provide a valid password')>
        </cfif>
        <!--- <cfif not isValid('email', arguments.userEmail)>
            <cfset arrayAppend(aErrorMessages, 'Please, provide a valid email address')
        </cfif> --->
        <cfreturn aErrorMessages />
    </cffunction>

    <cffunction  name="login" access="public">
        <cfargument  name="userName" type="string" required="true">
        <cfargument  name="userPassword" type="string" required="true">
        <cfset var q = "">
        <cfset var isUserLoggedIn = false />
        <cfquery name="rsLoginUser" datasource="#application.dsn#">
        SELECT userID, username, password, userRole, firstname, lastname
        FROM USERS u
        INNER JOIN roles r on roleid = u.userRole 
        WHERE 1=1 
        and username=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.userName#" /> and password = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.userPassword#" />
        </cfquery>
        <cfif rsLoginUser.recordCount is 1>
            <!--- <cfset chkPassword = getPassword(arguments.password) />
            <cfif len(chkPassword) and chkPassword = q.password>

            <cfelse>
                password invalid
            </cfif> --->
            <cflogin>
                <cfloginuser name="#rsLoginUser.firstname# #rsLoginUser.lastname#" password="#rsLoginUser.password#" roles="#rsLoginUser.userRole#" />
            </cflogin>
            <cfset session.stLoggedInUser = {'userFirstName'=rsLoginUser.firstname, 'userLastName'=rsLoginUser.lastname, 'userID'} />
            <cfset var isUserLoggedIn=true />
        </cfif>
        <cfreturn isUserLoggedIn />
    </cffunction>

    <cffunction  name="getPassword" access="private" returntype="string">
        <cfargument  name="password_string" type="string" required="true">
        <!--- check form password against hashed-saved password --->
        <cfset passwordVariables = encryptCFC.encPassword(#arguments.password_string#) />
        <cfreturn passwordVariables />
    </cffunction>

    <cffunction  name="doLogout" access="public" output="false" returntype="void">
        <cfset structDelete(Session, 'stLoggedInUser') />
        <cflogout />
    </cffunction>

</cfcomponent>