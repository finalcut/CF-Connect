<cfcomponent
	displayname="pager"
	extends="baseComponent"
	alias="pager"
	output="false"
	hint="A bean which models the pager form.">


	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="pager" output="false">
		<cfargument name="pagerAddress" type="string" required="false" default="" />
		<cfargument name="priority" type="numeric" required="false" default="1" />
		<cfargument name="index" type="numeric" required="false" default="1" />

		<!--- run setters --->
		<cfset setPagerAddress(arguments.pagerAddress) />
		<cfset setPriority(arguments.priority) />
		<cfset setIndex(arguments.index) />

		<cfreturn this />
 	</cffunction>


	<!---
	ACCESSORS
	--->
	<cffunction name="setPagerAddress" access="public" returntype="void" output="false">
		<cfargument name="pagerAddress" type="string" required="true" />
		<cfset variables.instance.pagerAddress = arguments.pagerAddress />
	</cffunction>
	<cffunction name="getPagerAddress" access="public" returntype="string" output="false">
		<cfreturn trim(variables.instance.pagerAddress) />
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