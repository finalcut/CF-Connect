<cfcomponent
	displayname="im"
	extends="baseComponent"
	alias="im"
	output="false"
	hint="A bean which models the im form.">


	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="im" output="false">
		<cfargument name="imAddress" type="string" required="false" default="" />
		<cfargument name="provider" type="string" required="false" default="" />
		<cfargument name="priority" type="numeric" required="false" default="1" />
		<cfargument name="index" type="numeric" required="false" default="1" />

		<!--- run setters --->
		<cfset setImAddress(arguments.imAddress) />
		<cfset setProvider(arguments.provider) />
		<cfset setPriority(arguments.priority) />
		<cfset setIndex(arguments.index) />

		<cfreturn this />
 	</cffunction>


	<!---
	ACCESSORS
	--->
	<cffunction name="setImAddress" access="public" returntype="void" output="false">
		<cfargument name="imAddress" type="string" required="true" />
		<cfset variables.instance.imAddress = arguments.imAddress />
	</cffunction>
	<cffunction name="getImAddress" access="public" returntype="string" output="false">
		<cfreturn trim(variables.instance.imAddress) />
	</cffunction>

	<cffunction name="setProvider" access="public" returntype="void" output="false">
		<cfargument name="provider" type="string" required="true" />
		<cfset variables.instance.provider = UCASE(arguments.provider) />
	</cffunction>
	<cffunction name="getProvider" access="public" returntype="string" output="false">
		<cfreturn trim(variables.instance.provider) />
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