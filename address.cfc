<cfcomponent
	displayname="address"
	extends="baseComponent"
	alias="address"
	output="false"
	hint="A bean which models the address form.">


	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="address" output="false">
		<cfargument name="street1" type="string" required="false" default="" />
		<cfargument name="street2" type="string" required="false" default="" />
		<cfargument name="city" type="string" required="false" default="" />
		<cfargument name="state" type="string" required="false" default="" />
		<cfargument name="zipcode" type="string" required="false" default="" />
		<cfargument name="country" type="string" required="false" default="" />
		<cfargument name="priority" type="numeric" required="false" default="1" />
		<cfargument name="index" type="numeric" required="false" default="1" />

		<!--- run setters --->
		<cfset setStreet1(arguments.street1) />
		<cfset setStreet2(arguments.street2) />
		<cfset setCity(arguments.city) />
		<cfset setState(arguments.state) />
		<cfset setZipcode(arguments.zipcode) />
		<cfset setCountry(arguments.country) />
		<cfset setPriority(arguments.priority) />
		<cfset setIndex(arguments.index) />

		<cfreturn this />
 	</cffunction>
	<cffunction name="initFromXML" access="public" returntype="address" output="false">
 		<cfargument name="x" required="true" hint="xml node representing phone number from blackboard connect webserivce">

		<!--- run setters --->
		<cfset setStreet1(arguments.x.xmlAttributes.Street1) />
		<cfset setStreet2(arguments.x.xmlAttributes.Street2) />
		<cfset setCity(arguments.x.xmlAttributes.City) />
		<cfset setState(arguments.x.xmlAttributes.State) />
		<cfset setZipcode(arguments.x.xmlAttributes.ZipCode) />
		<cfset setCountry(arguments.x.xmlAttributes.CountryCode) />
		<cfset setPriority(arguments.x.xmlAttributes.Priority) />
		<cfset setIndex(arguments.x.XmlAttributes.Index) />

		<cfreturn this />
 	</cffunction>


	<!---
	ACCESSORS
	--->
	<cffunction name="setStreet1" access="public" returntype="void" output="false">
		<cfargument name="street1" type="string" required="true" />
		<cfset variables.instance.street1 = arguments.street1 />
	</cffunction>
	<cffunction name="getStreet1" access="public" returntype="string" output="false">
		<cfreturn trim(variables.instance.street1) />
	</cffunction>

	<cffunction name="setStreet2" access="public" returntype="void" output="false">
		<cfargument name="street2" type="string" required="true" />
		<cfset variables.instance.street2 = arguments.street2 />
	</cffunction>
	<cffunction name="getStreet2" access="public" returntype="string" output="false">
		<cfreturn trim(variables.instance.street2) />
	</cffunction>

	<cffunction name="setCity" access="public" returntype="void" output="false">
		<cfargument name="city" type="string" required="true" />
		<cfset variables.instance.city = arguments.city />
	</cffunction>
	<cffunction name="getCity" access="public" returntype="string" output="false">
		<cfreturn trim(variables.instance.city) />
	</cffunction>

	<cffunction name="setState" access="public" returntype="void" output="false">
		<cfargument name="state" type="string" required="true" />
		<cfset variables.instance.state = arguments.state />
	</cffunction>
	<cffunction name="getState" access="public" returntype="string" output="false">
		<cfreturn trim(variables.instance.state) />
	</cffunction>

	<cffunction name="setZipcode" access="public" returntype="void" output="false">
		<cfargument name="zipcode" type="string" required="true" />
		<cfset variables.instance.zipcode = arguments.zipcode />
	</cffunction>
	<cffunction name="getZipcode" access="public" returntype="string" output="false">
		<cfreturn trim(variables.instance.zipcode) />
	</cffunction>

	<cffunction name="setCountry" access="public" returntype="void" output="false">
		<cfargument name="country" type="string" required="true" />
		<cfset variables.instance.country = arguments.country />
	</cffunction>
	<cffunction name="getCountry" access="public" returntype="string" output="false">
		<cfreturn trim(variables.instance.country) />
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