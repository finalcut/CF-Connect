<cfcomponent
	displayname="email"
	extends="baseComponent"
	alias="email"
	output="false"
	hint="A bean which models the email form.">


	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="email" output="false">
		<cfargument name="emailAddress" type="string" required="false" default="" />
		<cfargument name="priority" type="numeric" required="false" default="1" />
		<cfargument name="index" type="numeric" required="false" default="1" />


		<!--- run setters --->
		<cfset setEmailAddress(arguments.emailAddress) />
		<cfset setPriority(arguments.priority) />
		<cfset setIndex(arguments.index) />

		<cfreturn this />
 	</cffunction>
	<cffunction name="initFromXML" access="public" returntype="email" output="false">
 		<cfargument name="x" required="true" hint="xml node representing phone number from blackboard connect webserivce">

		<!--- run setters --->
		<cfset setEmailAddress(arguments.x.xmlAttributes.Address) />
		<cfset setPriority(arguments.x.xmlAttributes.Priority) />
		<cfset setIndex(arguments.x.XmlAttributes.Index) />

		<cfreturn this />
 	</cffunction>


	<!---
	ACCESSORS
	--->
	<cffunction name="setEmailAddress" access="public" returntype="void" output="false">
		<cfargument name="emailAddress" type="string" required="true" />
		<cfset variables.instance.emailAddress = arguments.emailAddress />
	</cffunction>
	<cffunction name="getEmailAddress" access="public" returntype="string" output="false">
		<cfreturn trim(variables.instance.emailAddress) />
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