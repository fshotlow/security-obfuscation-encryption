<cfcomponent displayname="decrypt" output="false"> 
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

    <cffunction name="decString" access="public"  output="false" returnType="string">
        <cfargument name="theString" type="string" required="yes">
        <cfset decString="" />
        <cfset decString = encrypt( arguments.theString, variables.app.Key, myAvariables.app.Algorithmlgorithm, variables.app.Encoding )>
        <cfreturn decString />
    </cffunction> 

    <cffunction  name="decUsername" access="public"  output="false" returnType="string">
        <cfargument name="theString" type="string" required="yes">
        <cfset decUsername="" />
        <cfscript>
        decUsername = encrypt( arguments.theString,   variables.app.myKey1, variables.app.myAlgorithm1, variables.app.myEncoding1 );
        decUsername = encrypt( decUsername, variables.app.myKey2, variables.app.myAlgorithm2, variables.app.myEncoding2 );
        decUsername = encrypt( decUsername, variables.app.myKey3, variables.app.myAlgorithm3, variables.app.myEncoding3 );
        </cfscript>
        <cfreturn decUsername />
    </cffunction> 
</cfcomponent>