<cfset username = "blair.shotlow@gmail.com" />
<cfset passwordVariables = '3p!EPA%3^Gw$p' />

<cfset encryptCFC =createobject("component","components.encryptVariables")>
<cfset decryptCFC =createobject("component","components.decryptVariables")>

<cfset passwordVariables = encryptCFC.encPassword(#passwordVariables#) />
<cfoutput>
<p>Encrypted Password: #passwordVariables#</p>

<cfset encUser = encryptCFC.encUsername(username) />
<cfset decUser = decryptCFC.decUsername(username) />
<p>
    Encrypted Username: #encUser# <br />
    Decrypted Username: #decUser#
</p>
</cfoutput>