<cfcomponent
	displayname="group"
	extends="baseComponent"
	alias="group"
	output="false"
	hint="A bean which models the group form.">


	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="group" output="false">
		<cfargument name="action" type="string" required="false" default="" />
		<cfargument name="groupName" type="string" required="false" default="" />

		<!--- run setters --->
		<cfset setAction(arguments.action) />
		<cfset setGroupName(arguments.groupName) />

		<cfreturn this />
 	</cffunction>


	<!---
	ACCESSORS
	--->
	<cffunction name="setAction" access="public" returntype="void" output="false">
		<cfargument name="action" type="string" required="true" />
		<cfset variables.instance.action = arguments.action />
	</cffunction>
	<cffunction name="getAction" access="public" returntype="string" output="false">
		<cfreturn trim(variables.instance.action) />
	</cffunction>

	<cffunction name="setGroupName" access="public" returntype="void" output="false">
		<cfargument name="groupName" type="string" required="true" />
		<cfset variables.instance.groupName = arguments.groupName />
	</cffunction>
	<cffunction name="getGroupName" access="public" returntype="string" output="false">
		<cfreturn trim(variables.instance.groupName) />
	</cffunction>

</cfcomponent>