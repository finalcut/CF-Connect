<cfcomponent
	displayname="phone"
	extends="baseComponent"
	alias="phone"
	output="false"
	hint="A bean which models the phone form.">


	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="phone" output="false">
		<cfargument name="phoneNumber" type="string" required="false" default="" />
		<cfargument name="priority" type="numeric" required="false" default="1" />
		<cfargument name="index" type="numeric" required="false" default="1" />
		<cfargument name="countryCode" type="string" required="false" default="01" />
		<cfargument name="tty" type="string" required="false" default="false" />
		<cfargument name="attendance" type="boolean" required="false" default="false" />

		<!--- run setters --->
		<cfset setPhoneNumber(arguments.phoneNumber) />
		<cfset setPriority(arguments.priority) />
		<cfset setCountryCode(arguments.countryCode) />
		<cfset setTty(arguments.tty) />
		<cfset setAttendance(arguments.attendance) />
		<cfset setIndex(arguments.index) />

		<cfreturn this />
 	</cffunction>

 	<cffunction name="initFromXML" access="public" returntype="phone" output="false">
 		<cfargument name="x" required="true" hint="xml node representing phone number from blackboard connect webserivce">
		<cfset setPhoneNumber(arguments.x.XmlAttributes.Number) />
		<cfset setPriority(arguments.x.XmlAttributes.Priority) />
		<cfset setCountryCode(arguments.x.XmlAttributes.CountryCode) />
		<cfset setTty(arguments.x.XmlAttributes.TTY) />
		<cfset setIndex(arguments.x.XmlAttributes.Index) />

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

	<cffunction name="setPhoneNumber" access="public" returntype="void" output="false">
		<cfargument name="phoneNumber" type="string" required="true" />
		<cfif arguments.phonenumber NEQ "9999999999">
			<cfset variables.instance.phoneNumber = arguments.phoneNumber />
		<cfelse>
			<cfset variables.instance.phoneNumber = "" />
		</cfif>
	</cffunction>
	<cffunction name="getPhoneNumber" access="public" returntype="string" output="false">
		<cfreturn trim(variables.instance.phoneNumber) />
	</cffunction>

	<cffunction name="setTty" access="public" returntype="void" output="false">
		<cfargument name="tty" type="string" required="true" />
		<cfset variables.instance.tty = arguments.tty />
	</cffunction>
	<cffunction name="getTty" access="public" returntype="string" output="false">
		<cfreturn YesNoFormat(variables.instance.tty) />
	</cffunction>

	<cffunction name="setAttendance" access="public" returntype="void" output="false">
		<cfargument name="attendance" type="boolean" required="true" />
		<cfset variables.instance.attendance = arguments.attendance />
	</cffunction>
	<cffunction name="getAttendance" access="public" returntype="boolean" output="false">
		<cfreturn YesNoFormat(variables.instance.attendance) />
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