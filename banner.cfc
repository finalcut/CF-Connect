<cfcomponent
	displayname="banner"
	extends="baseComponent"
	alias="banner"
	output="false">
	
		<cffunction name="init" returntype="banner">
			<cfreturn this/>
		</cffunction>
		<cffunction name="getnineOhOneNumber" returntype="any" access="public">
			<cfargument name="munetid" type="string" required="true" />

			<!---- TODO: call some banner stored procedure and get the info I need --->

			<cfreturn "901182306" />
		</cffunction>
</cfcomponent>