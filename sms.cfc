<cfcomponent
	displayname="sms"
	extends="baseComponent"
	alias="sms"
	output="false"
	hint="A bean which models the sms form.">


	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="sms" output="false">
		<cfargument name="smsNumber" type="string" required="false" default="" />
		<cfargument name="priority" type="numeric" required="false" default="1" />
		<cfargument name="index" type="numeric" required="false" default="1" />

		<!--- run setters --->
		<cfset setPriority(arguments.priority) />
		<cfset setSmsNumber(arguments.smsNumber) />
		<cfset setIndex(arguments.index) />

		<cfreturn this />
 	</cffunction>
	<cffunction name="initFromXML" access="public" returntype="sms" output="false">
 		<cfargument name="x" required="true" hint="xml node representing phone number from blackboard connect webserivce">

		<!--- run setters --->
		<cfset setSmsNumber(arguments.x.xmlAttributes.Number) />
		<cfset setPriority(arguments.x.xmlAttributes.Priority) />
		<cfset setIndex(arguments.x.XmlAttributes.Index) />

		<cfreturn this />
 	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setSmsNumber" access="public" returntype="void" output="false">
		<cfargument name="smsNumber" type="string" required="true" />
		<cfset variables.instance.smsNumber = arguments.smsNumber />
	</cffunction>
	<cffunction name="getSmsNumber" access="public" returntype="string" output="false">
		<cfreturn trim(variables.instance.smsNumber) />
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