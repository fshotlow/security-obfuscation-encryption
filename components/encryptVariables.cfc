<cfcomponent displayname="encrypt" output="false"> 
    <!--- functions and other values here --->
    <cfset variables.app ={} />
    <cfset variables.app.Key='ITRkCTb/XMtGT0g99WUkKak/hhNvPml3k+UbsVDqSBE='>
    <cfset variables.app.Encoding = 'HEX'>
    <cfset variables.app.Algorithm = 'AES/CBC/PKCS5Padding'>

    <!--- CBC/PKCS5Padding --->
    <cfset variables.app.myKey1 = 'RQr9IRygGQtguVEHvKh4WLgs5wz3V+BZIq82GKM5FrI='>
    <cfset variables.app.myAlgorithm1 = 'AES'>
    <cfset variables.app.myEncoding1 = 'HEX'>
    <cfset variables.app.myKey2 = '7SlPIgphVuR8sTGjBdKHBUqw2wss1XKwz5vYZXn7TY0='>
    <cfset variables.app.myAlgorithm2 = 'BLOWFISH'>
    <cfset variables.app.myEncoding2 = 'BASE64'>
    <cfset variables.app.myKey3 = 'zZYZVmsNFMqZcz0SzKMGPtCixdP9CWfmV3/xu9cwCRA='>
    <cfset variables.app.myAlgorithm3 = 'AES'>
    <cfset variables.app.myEncoding3 = 'HEX'>

    <cffunction name="encString" access="public"  output="false" returnType="string">
        <cfargument name="theString" type="string" required="yes">
        <cfset encString="" />
        <cfset encString = encrypt( arguments.theString, variables.app.Key, variables.app.Algorithm , variables.app.Encoding )>
        <cfreturn encString />
    </cffunction>

    <cffunction  name="encUsername" access="public"  output="false" returnType="string">    
        <cfargument name="theString" type="string" required="yes">
        <cfset encUsername='' />
        <cfscript>
        encUsername = encrypt( arguments.theString,   variables.app.myKey1, variables.app.myAlgorithm1, variables.app.myEncoding1 );
        encUsername = encrypt( encUsername, variables.app.myKey2, variables.app.myAlgorithm2, variables.app.myEncoding2 );
        encUsername = encrypt( encUsername, variables.app.myKey3, variables.app.myAlgorithm3, variables.app.myEncoding3 );
        </cfscript>
        <cfreturn encUsername />
    </cffunction> 

    <cffunction  name="encPassword" access="public"  output="false" returnType="string">
        <cfargument name="theString" type="string" required="yes">
        <cfset encString="" />
        <cfset encString = encrypt( arguments.theString, variables.app.Key, variables.app.Algorithm, variables.app.Encoding )>
        <cfset encString = hash(encString, "SHA-256", "UTF-8") />
        <cfreturn encString />
    </cffunction>
</cfcomponent>