<cfcomponent
	displayname="fax"
	extends="baseComponent"
	alias="fax"
	output="false"
	hint="A bean which models the fax form.">


	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="fax" output="false">
		<cfargument name="countryCode" type="string" required="false" default="01" />
		<cfargument name="faxNumber" type="string" required="false" default="" />
		<cfargument name="priority" type="numeric" required="false" default="1" />
		<cfargument name="index" type="numeric" required="false" default="1" />

		<!--- run setters --->
		<cfset setCountryCode(arguments.countryCode) />
		<cfset setFaxNumber(arguments.faxNumber) />
		<cfset setPriority(arguments.priority) />
		<cfset setIndex(arguments.index) />

		<cfreturn this />
 	</cffunction>


	<!---
	ACCESSORS
	--->
	<cffunction name="setCountryCode" access="public" returntype="void" output="false">
		<cfargument name="countryCode" type="string" required="true" />
		<cfset variables.instance.countryCode = arguments.countryCode />
	</cffunction>
	<cffunction name="getCountryCode" access="public" returntype="string" output="false">
		<cfreturn trim(variables.instance.countryCode) />
	</cffunction>

	<cffunction name="setFaxNumber" access="public" returntype="void" output="false">
		<cfargument name="faxNumber" type="string" required="true" />
		<cfset variables.instance.faxNumber = arguments.faxNumber />
	</cffunction>
	<cffunction name="getFaxNumber" access="public" returntype="string" output="false">
		<cfreturn trim(variables.instance.faxNumber) />
	</cffunction>

	<cffunction name="setPriority" access="public" returntype="void" output="false">
		<cfargument name="priority" type="numeric" required="true" />
		<cfset variables.instance.priority = arguments.priority />
	</cffunction>
	<cffunction name="getPriority" access="public" returntype="numeric" output="false">
		<cfreturn trim(variables.instance.priority) />
	</cffunction>
	<cffunction name="setIndex" access="public" returntype="void" output="false">
		<cfargument name="index" type="numeric" required="true" />
		<cfset variables.instance.index = arguments.index />
	</cffunction>
	<cffunction name="getIndex" access="public" returntype="numeric" output="false">
		<cfreturn trim(variables.instance.index) />
	</cffunction>

</cfcomponent>