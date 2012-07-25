<cfcomponent
	displayname="contact"
	extends="baseComponent"
	alias="contact"
	output="false"
	hint="A bean which models the blackberry connect contact data.">


	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="contact" output="false">
		<cfargument name="contactType" type="string" required="false" default="Student" />
		<cfargument name="firstName" type="string" required="false" default="" />
		<cfargument name="lastName" type="string" required="false" default="" />
		<cfargument name="referenceCode" type="string" required="false" default="" />
		<cfargument name="businessName" type="string" required="false" default="" />
		<cfargument name="acceptedTermsOfUse" type="boolean" required="false" default="false" />
		<cfargument name="expirationDate" type="string" required="false" default="" />
		<cfargument name="grade" type="string" required="false" default="" />
		<cfargument name="dataProvider" type="string" required="false" default="" />
		<cfargument name="refreshGroups" type="string" required="false" default="" />
		<cfargument name="gender" type="string" required="false" default="" />
		<cfargument name="language" type="string" required="false" default="" />
		<cfargument name="address" type="any" required="false" default=""  />
		<cfargument name="phone" type="any" required="false" default="" />
		<cfargument name="smsNumber" type="any" required="false" default="" />
		<cfargument name="emailAddress" type="any" required="false" default="" />
		<cfargument name="faxNumber" type="any" required="false" default="" />
		<cfargument name="imAddress" type="any" required="false" default="" />
		<cfargument name="pagerNumber" type="any" required="false" default="" />
		<cfargument name="group" type="any" required="false" default="" />



		<cfset variables.instance.addresses = ArrayNew(1) />
		<cfset variables.instance.phones = ArrayNew(1) />
		<cfset variables.instance.smsNumbers = ArrayNew(1) />
		<cfset variables.instance.emailAddresses = ArrayNew(1) />
		<cfset variables.instance.faxNumbers = ArrayNew(1) />
		<cfset variables.instance.imAddresses = ArrayNew(1) />
		<cfset variables.instance.pagerNumbers = ArrayNew(1) />
		<cfset variables.instance.groups = ArrayNew(1) />

		<!--- run setters --->
		<cfset setContactType(arguments.contactType) />
		<cfset setFirstName(arguments.firstName) />
		<cfset setLastName(arguments.lastName) />
		<cfset setreferenceCode(arguments.referenceCode) />
		<cfset setBusinessName(arguments.businessName) />
		<cfset setAcceptedTermsOfUse(arguments.acceptedTermsOfUse) />
		<cfset setExpirationDate(arguments.expirationDate) />
		<cfset setGrade(arguments.grade) />
		<cfset setDataProvider(arguments.dataProvider) />
		<cfset setRefreshGroups(arguments.refreshGroups) />
		<cfset setGender(arguments.gender) />
		<cfset setLanguage(arguments.language) />

		<cfset addAddress(arguments.address) />
		<cfset addPhone(arguments.phone) />
		<cfset addSmsNumber(arguments.smsNumber) />
		<cfset addEmailAddress(arguments.emailAddress) />
		<cfset addFaxNumber(arguments.faxNumber) />
		<cfset addImAddress(arguments.imAddress) />
		<cfset addPagerNumber(arguments.pagerNumber) />
		<cfset addGroup(arguments.group) />

		<cfreturn this />
 	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setContactType" access="public" returntype="void" output="false">
		<cfargument name="contactType" type="string" required="false" default="Student" />
		<cfset variables.instance.contactType = arguments.contactType />
	</cffunction>
	<cffunction name="getContactType" access="public" returntype="string" output="false">
		<cfreturn Trim(variables.instance.contactType) />
	</cffunction>

	<cffunction name="setFirstName" access="public" returntype="void" output="false">
		<cfargument name="firstName" type="string" required="true" />
		<cfset variables.instance.firstName = arguments.firstName />
	</cffunction>
	<cffunction name="getFirstName" access="public" returntype="string" output="false">
		<cfreturn Trim(variables.instance.firstName) />
	</cffunction>

	<cffunction name="setLastName" access="public" returntype="void" output="false">
		<cfargument name="lastName" type="string" required="true" />
		<cfset variables.instance.lastName = arguments.lastName />
	</cffunction>
	<cffunction name="getLastName" access="public" returntype="string" output="false">
		<cfreturn Trim(variables.instance.lastName) />
	</cffunction>

	<cffunction name="setreferenceCode" access="public" returntype="void" output="false">
		<cfargument name="referenceCode" type="string" required="true" />
		<cfset variables.instance.referenceCode = arguments.referenceCode />
	</cffunction>
	<cffunction name="getreferenceCode" access="public" returntype="string" output="false">
		<cfreturn Trim(variables.instance.referenceCode) />
	</cffunction>

	<cffunction name="setBusinessName" access="public" returntype="void" output="false">
		<cfargument name="businessName" type="string" required="true" />
		<cfset variables.instance.businessName = arguments.businessName />
	</cffunction>
	<cffunction name="getBusinessName" access="public" returntype="string" output="false">
		<cfreturn Trim(variables.instance.businessName) />
	</cffunction>

	<cffunction name="setAcceptedTermsOfUse" access="public" returntype="void" output="false">
		<cfargument name="acceptedTermsOfUse" type="boolean" required="true" />
		<cfset variables.instance.acceptedTermsOfUse = arguments.acceptedTermsOfUse />
	</cffunction>
	<cffunction name="getAcceptedTermsOfUse" access="public" returntype="boolean" output="false">
		<cfreturn Trim(variables.instance.acceptedTermsOfUse) />
	</cffunction>

	<cffunction name="setExpirationDate" access="public" returntype="void" output="false">
		<cfargument name="expirationDate" type="string" required="true" />
		<cfset variables.instance.expirationDate = arguments.expirationDate />
	</cffunction>
	<cffunction name="getExpirationDate" access="public" returntype="string" output="false">
		<cfreturn Trim(variables.instance.expirationDate) />
	</cffunction>

	<cffunction name="setGrade" access="public" returntype="void" output="false">
		<cfargument name="grade" type="string" required="true" />
		<cfset variables.instance.grade = arguments.grade />
	</cffunction>
	<cffunction name="getGrade" access="public" returntype="string" output="false">
		<cfreturn Trim(variables.instance.grade) />
	</cffunction>

	<cffunction name="setDataProvider" access="public" returntype="void" output="false">
		<cfargument name="dataProvider" type="string" required="true" />
		<cfset variables.instance.dataProvider = arguments.dataProvider />
	</cffunction>
	<cffunction name="getDataProvider" access="public" returntype="string" output="false">
		<cfreturn Trim(variables.instance.dataProvider) />
	</cffunction>

	<cffunction name="setRefreshGroups" access="public" returntype="void" output="false">
		<cfargument name="refreshGroups" type="string" required="true" />
		<cfset variables.instance.refreshGroups = arguments.refreshGroups />
	</cffunction>
	<cffunction name="getRefreshGroups" access="public" returntype="string" output="false">
		<cfreturn Trim(variables.instance.refreshGroups) />
	</cffunction>

	<cffunction name="setGender" access="public" returntype="void" output="false">
		<cfargument name="gender" type="string" required="true" />
		<cfif arguments.gender EQ "Female" OR arguments.gender EQ "F">
			<cfset variables.instance.gender = "F" />
		<cfelse>
			<cfset variables.instance.gender = "M" />
		</cfif>
	</cffunction>
	<cffunction name="getGender" access="public" returntype="string" output="false">
		<cfreturn Trim(variables.instance.gender) />
	</cffunction>

	<cffunction name="setLanguage" access="public" returntype="void" output="false">
		<cfargument name="language" type="string" required="true" />
		<cfset variables.instance.language = arguments.language />
	</cffunction>
	<cffunction name="getLanguage" access="public" returntype="string" output="false">
		<cfreturn Trim(variables.instance.language) />
	</cffunction>

	<cffunction name="addAddress" access="public" returntype="void" output="false">
		<cfargument name="address" type="any" required="true" />
		<cfif isValidType(arguments.address,"address")>
			<cfset ArrayAppend(variables.instance.addresses, arguments.address) />
		</cfif>
	</cffunction>
	<cffunction name="getAddresses" access="public" returntype="array" output="false">
		<cfreturn variables.instance.addresses />
	</cffunction>

	<cffunction name="addPhone" access="public" returntype="void" output="false">
		<cfargument name="phone" type="any" required="true" />
		<cfif isValidType(arguments.phone,"phone")>
			<cfset ArrayAppend(variables.instance.phones, arguments.phone) />
		</cfif>
	</cffunction>
	<cffunction name="getPhoneNumbers" access="public" returntype="array" output="false">
		<cfreturn variables.instance.phones />
	</cffunction>

	<cffunction name="addSmsNumber" access="public" returntype="void" output="false">
		<cfargument name="smsNumber" type="any" required="true" />
		<cfif isValidType(arguments.smsNumber,"sms")>
			<cfset ArrayAppend(variables.instance.smsNumbers, arguments.smsNumber) />
		</cfif>
	</cffunction>
	<cffunction name="getSmsNumbers" access="public" returntype="array" output="false">
		<cfreturn variables.instance.smsNumbers />
	</cffunction>

	<cffunction name="addEmailAddress" access="public" returntype="void" output="false">
		<cfargument name="emailAddress" type="any" required="true" />
		<cfif isValidType(arguments.emailAddress,"email")>
			<cfset ArrayAppend(variables.instance.emailAddresses, arguments.emailAddress) />
		</cfif>
	</cffunction>
	<cffunction name="getEmailAddresses" access="public" returntype="array" output="false">
		<cfreturn variables.instance.emailAddresses />
	</cffunction>

	<cffunction name="addFaxNumber" access="public" returntype="void" output="false">
		<cfargument name="faxNumber" type="any" required="true" />
		<cfif isValidType(arguments.faxNumber,"fax")>
			<cfset ArrayAppend(variables.instance.faxNumbers, arguments.faxNumber) />
		</cfif>
	</cffunction>
	<cffunction name="getFaxNumbers" access="public" returntype="array" output="false">
		<cfreturn variables.instance.faxNumbers />
	</cffunction>

	<cffunction name="addImAddress" access="public" returntype="void" output="false">
		<cfargument name="imAddress" type="any" required="true" />
		<cfif isValidType(arguments.imAddress,"im")>
			<cfset ArrayAppend(variables.instance.imAddresses, arguments.imAddress) />
		</cfif>
	</cffunction>
	<cffunction name="getImAddresses" access="public" returntype="array" output="false">
		<cfreturn variables.instance.imAddresses />
	</cffunction>

	<cffunction name="addPagerNumber" access="public" returntype="void" output="false">
		<cfargument name="pagerNumber" type="any" required="true" />
		<cfif isValidType(arguments.pagerNumber,"pager")>
			<cfset ArrayAppend(variables.instance.pagerNumbers, arguments.pagerNumber) />
		</cfif>
	</cffunction>
	<cffunction name="getPagerNumbers" access="public" returntype="array" output="false">
		<cfreturn variables.instance.pagerNumbers />
	</cffunction>

	<cffunction name="addGroup" access="public" returntype="void" output="false">
		<cfargument name="group" type="any" required="true" />
		<cfif isValidType(arguments.group,"group")>
			<cfset ArrayAppend(variables.instance.groups, arguments.group) />
		</cfif>
	</cffunction>
	<cffunction name="getGroups" access="public" returntype="array" output="false">
		<cfreturn variables.instance.groups />
	</cffunction>

	<cffunction name="isValidType" access="public" returntype="boolean">
		<cfargument name="obj" type="any" required="true">
		<cfargument name="typeName" type="string" required="true">

		<cfreturn isInstanceOf(arguments.obj, "com.blackboard.connect.#arguments.typeName#") />

	</cffunction>

</cfcomponent>