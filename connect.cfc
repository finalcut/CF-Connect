<cfcomponent name="connect" extends="baseComponent">
	<cffunction name="init" returntype="connect">
		<cfargument name="secret" type="string" required="true"  />
		<cfargument name="key" type="string" required="true"  />
		<cfargument name="webserviceURL" type="string" required="true" />
		<cfargument name="siteLocalId" type="string" required="true" />
		<cfargument name="loggingpath" type="string" required="true" />
		<cfargument name="uselogging" type="string" required="false" default="0" />

			<cfscript>
				variables.instance = structNew();
				variables.instance.secret = arguments.secret;
				variables.instance.key = arguments.key;
				variables.instance.webserviceURL = arguments.webserviceURL;
				variables.instance.upperKey = UCASE(variables.instance.key);
				variables.instance.siteLocalId = arguments.siteLocalId;
				variables.instance.loggingpath = arguments.loggingPath;
				variables.instance.uselogging = arguments.uselogging;

				return this;
			</cfscript>
	</cffunction>


	<cffunction name="getContact" returntype="any"  output="false">
		<cfargument name="referenceCode" type="string" required="true" hint="munet account name without the domain" />
		<cfargument name="contactType" type="string" default="Student" />

		<cfset var local = structNew() />

		<cfsavecontent variable="local.body"><cfoutput><GetContact xmlns="BBConnect.Service.Contact"><inputXml><ContactRequest xmlns="" ReferenceCode="#arguments.referenceCode#" ContactType="#arguments.contactType#" DataProvider="SELF" /></inputXml></GetContact></cfoutput></cfsavecontent>

		<cfset local.xmlVal = buildXml(local.body) />

		<cfset local.result = sendRequest(local.xmlVal, "BBConnect.Service.Contact/GetContact") />
		<cfset local.contact = xmlToContact(local.result.filecontent) />

		<cfreturn local.contact />
	</cffunction>

	<cffunction name="saveContact" returntype="any" output="false">
		<cfargument name="contact" type="contact" required="true" />

		<cfset var local = structNew() />

		<cfset local.dateval = getDateTimeString("yyyy-mm-dd", "HH:mm:ss", "T") />

		<cfsavecontent variable="local.body"><cfoutput><UpdateContact xmlns="BBConnect.Service.Contact"><inputXml><ContactRequest xmlns="" Version="2.0" TransactionID="#Replace(createUUID(),'-','','All')#" 
		TransactionDateTime="#local.dateval#" OriginalIP="#Trim(GetServerIP())#">
				<Site LocalID="#variables.instance.siteLocalID#"><Contact DataProvider="Web Service" Type="#contact.getContactType()#" AcceptedTermsOfUse="Yes" Action="Update" ReferenceCode="#contact.getReferenceCode()#" FirstName="#contact.getFirstName()#" LastName="#contact.getLastName()#">
				<Demographics Gender="#contact.getGender()#" Language="#contact.getLanguage()#" />
				#GetAddressNodes(arguments.contact.getAddresses())#
				#GetPhoneNodes(arguments.contact.getPhoneNumbers())#
				#GetSmsNodes(arguments.contact.getSmsNumbers())#
				#GetEmailNodes(arguments.contact.getEmailAddresses())#
				#GetFaxNodes(arguments.contact.getFaxNumbers())#
				#GetImNodes(arguments.contact.getImAddresses())#
				#GetPagerNodes(arguments.contact.getPagerNumbers())#
				#GetGroupNodes(arguments.contact.getGroups())#
				</Contact></Site></ContactRequest></inputXml></UpdateContact>
		</cfoutput></cfsavecontent>

		<cfset local.xmlVal = buildXml(TRIM(local.body)) />
		<cfset local.result = sendRequest(local.xmlVal, "BBConnect.Service.Contact/UpdateContact") />
		<cfreturn local.result />

	</cffunction>

	<cffunction name="deleteContact" returntype="any"  output="false">
		<cfargument name="referenceCode" type="string" required="true" hint="munet account name without the domain" />
		<cfargument name="contactType" type="string" default="Student" />
		<cfargument name="contact" type="contact" required="true" />

		<cfset var local = structNew() />
		<cfset local.dateval = getDateTimeString("yyyy-mm-dd", "HH:mm:ss", "T") />


		<cfsavecontent variable="local.body"><cfoutput><UpdateContact xmlns="BBConnect.Service.Contact"><inputXml><ContactRequest xmlns="" Version="2.0" TransactionID="#Replace(createUUID(),'-','','All')#" 
		TransactionDateTime="#local.dateval#" OriginalIP="#Trim(GetServerIP())#">
				<Site LocalID="#variables.instance.siteLocalID#"><Contact DataProvider="Web Service" Type="#contact.getContactType()#" AcceptedTermsOfUse="Yes" Action="Delete" ReferenceCode="#contact.getReferenceCode()#">
				</Contact></Site></ContactRequest></inputXml></UpdateContact>
		</cfoutput></cfsavecontent>


		<cfset local.xmlVal = buildXml(TRIM(local.body)) />
		<cfset local.result = sendRequest(local.xmlVal, "BBConnect.Service.Contact/UpdateContact") />


		<cfreturn local.result />
	</cffunction>

	<cffunction name="getAddressNodes" returntype="string" output="false" access="private">
		<cfargument name="addresses" type="array" required="true" />
		<cfset var local = structNew() />
		<cfset var address = "" />
		<cfset local.output = "" />

		<cfloop index="address" array="#arguments.addresses#">
				<cfset local.output = local.output & '<Address Street1="#address.getStreet1()#" Street2="#address.getStreet2()#" City="#address.getCity()#" State="#address.getState()#" ZipCode="#address.getZipCode()#" Country="#address.getCountry()#" Priority="#address.getPriority()#" />' />
		</cfloop>
		<cfreturn local.output />
	</cffunction>
	<cffunction name="getEmailNodes" returntype="string" output="false" access="private">
		<cfargument name="emails" type="array" required="true" />
		<cfset var local = structNew() />
		<cfset var email = "">
		<cfset local.output = "" />

		<cfloop index="email" array="#arguments.emails#">
				<cfset local.output = local.output & '<Email Index="#email.getIndex()#"  Address="#email.getEmailAddress()#" Priority="#email.getPriority()#" />' />
		</cfloop>
		<cfreturn local.output />
	</cffunction>
	<cffunction name="getPhoneNodes" returntype="string" output="false" access="private">
		<cfargument name="phones" type="array" required="true" />
		<cfset var local = structNew() />
		<cfset var phone = "" />
		<cfset local.output = "" />
		<cfloop index="phone" array="#arguments.phones#">
				<cfset local.output = local.output & '<Phone Index="#phone.getIndex()#" CountryCode="#phone.getCountryCode()#" Number="#phone.getPhoneNumber()#" Priority="#phone.getPriority()#" TTY="#phone.getTty()#" Attendance="#phone.getAttendance()#" />' />
		</cfloop>
		<cfreturn local.output />
	</cffunction>
	<cffunction name="getFaxNodes" returntype="string" output="false" access="private">
		<cfargument name="faxes" type="array" required="true" />
		<cfset var local = structNew() />
		<cfset var fax = "" />
		<cfset local.output = "" />
		<cfloop index="fax" array="#arguments.faxes#">
				<cfset local.output = local.output & '<Fax Index="#fax.getIndex()#" CountryCode="#fax.getCountryCode()#" Number="#fax.getFaxNumber()#" Priority="#fax.getPriority()#"  />' />
		</cfloop>

		<cfreturn local.output />
	</cffunction>
	<cffunction name="getSmsNodes" returntype="string" output="false" access="private">
		<cfargument name="smsNumbers" type="array" required="true" />
		<cfset var local = structNew() />
		<cfset var sms = "" />
		<cfset local.output = "" />
		<cfloop index="sms" array="#arguments.smsNumbers#">
				<cfset local.output = local.output & '<SMS Index="#sms.getIndex()#" Number="#sms.getSmsNumber()#" Priority="#sms.getPriority()#"  />' />
		</cfloop>

		<cfreturn local.output />
	</cffunction>
	<cffunction name="getImNodes" returntype="string" output="false" access="private">
		<cfargument name="ims" type="array" required="true" />
		<cfset var local = structNew() />
		<cfset var im = "" />
		<cfset local.output = "" />
		<cfloop index="im" array="#arguments.ims#">
				<cfset local.output = local.output & '<IMAddress Index="#im.getIndex()#" Address="#im.getImAddress()#" Provider="#im.getProvider()#" Priority="#im.getPriority()#" />' />
		</cfloop>

		<cfreturn local.output />
	</cffunction>
	<cffunction name="getPagerNodes" returntype="string" output="false" access="private">
		<cfargument name="pagers" type="array" required="true" />
		<cfset var local = structNew() />
		<cfset var pager = "" />
		<cfset local.output = "" />
		<cfloop index="pager" array="#arguments.pagers#">
				<cfset local.output = local.output & '<Pager Index="#pager.getIndex()#" Address="#pager.getPagerAddress()#" Priority="#pager.getPriority()#" />' />
		</cfloop>

		<cfreturn local.output />
	</cffunction>
	<cffunction name="getGroupNodes" returntype="string" output="false" access="private">
		<cfargument name="groups" type="array" required="true" />
		<cfset var local = structNew() />
		<cfset var group = "" />
		<cfset local.output = "" />
		<cfloop index="group" array="#arguments.groups#">
				<cfset local.output = local.output & '<Group Action="#group.getAction()#" Name="#group.getGroupName()#" />' />
		</cfloop>

		<cfreturn local.output />
	</cffunction>


	<cffunction name="GetServerIP" output="false" returntype="string" access="private">
		<cfscript>
		   var iaclass="";
		   var addr="";
		      
		   // Init class
		   iaclass=CreateObject("java", "java.net.InetAddress");

		   //Get Local host variable
		   addr=iaclass.getLocalHost();

		   // Return ip address
		   return Trim(addr.getHostAddress());
		</cfscript>
	</cffunction>


	<cffunction name="getAuthToken" access="private" returntype="string" output="false">
		<cfset var local = structNew() />
		<cfset var today = DateConvert("local2utc",Now()) />

		<cfset local.dateVal = getDateTimeString('yyyymmdd', "HHmm", "|") />
		<cfset local.prestring = "#variables.instance.upperKey#|#variables.instance.secret#|#local.dateVal#" />

		<cfset local.hashString = LCASE(hash(local.prestring,"md5")) />

		<cfreturn "#local.hashString#|#variables.instance.key#" />
	</cffunction>

	<cffunction name="buildXML" access="private" returntype="string" output="false">
		<cfargument name="xmlBody" type="string" required="true" />
		<cfset var local = structNew() />
		<cfset var token = getAuthToken() />



		<cfsavecontent variable="local.soap"><cfoutput><?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
		<soap:Header><AuthToken xmlns="BBConnect.Service.Contact"><Token>#Trim(token)#</Token></AuthToken></soap:Header>
		<soap:Body>#arguments.xmlBody#</soap:Body></soap:Envelope></cfoutput></cfsavecontent>

		<cfreturn trim(#local.soap#) />
	</cffunction>

	<cffunction name="sendRequest" access="private" returntype="any" output="true">
		<cfargument name="soapBody" type="string" required="true" />
		<cfargument name="headerString" type="string" required="false" default="" />
		<cfset var httpResponse = "" />

		<cfset logger("headerString",arguments.headerString) />
		<cfset logger("soapBody",arguments.soapBody) />


		<cfhttp
			url="#variables.instance.webserviceURL#"
			method="post"
			result="httpResponse">

			<cfif LEN(arguments.headerString)>
				<cfhttpparam
					type="header"
					name="SOAPAction"
					value="#arguments.headerString#" />
			</cfif>

			<cfhttpparam
				type="xml"
				value="#Trim(arguments.soapBody)#" />
		</cfhttp>

		<cfset logger("webservice response",httpResponse) />
		<cfreturn httpResponse />		
	</cffunction>

	<cffunction name="xmlToContact" access="private" returntype="any">
		<cfargument name="x" type="string" required="true" hint="xml returned from connect web service" />
		<cfscript>
			var local = structNew();
			local.c = createObject("component", "com.blackboard.connect.contact").init();
			local.xml = XmlParse(arguments.x);
		</cfscript>
		<cftry>
		<cfscript>
			local.xml = local.xml["soap:Envelope"]["soap:Body"]["GetContactResponse"]["GetContactResult"]["ContactResponse"]["Site"]["Contact"];
			local.c.setFirstName(local.xml["xmlAttributes"]["FirstName"]);
			local.c.setLastName(local.xml["xmlAttributes"]["LastName"]);
			local.c.setReferenceCode(local.xml["xmlAttributes"]["ReferenceCode"]);
			local.c.setGender(local.xml["Demographics"]["xmlAttributes"]["Gender"]);

			local.childCount = ArrayLen(local.xml["xmlChildren"]);

			for(local.i = 1; local.i LTE local.childCount; local.i = local.i + 1){
				local.child = local.xml["xmlChildren"][local.i];
				if(local.child.xmlName NEQ "Demographics"){
					local.o = createObject("component", "com.blackboard.connect.#local.child.xmlName#").initFromXML(local.child);
					if(local.child.xmlName EQ "Phone"){
						local.c.addPhone(local.o);
					}
					if(local.child.xmlName EQ "SMS"){
						local.c.addSmsNumber(local.o);
					}
					if(local.child.xmlName EQ "Email"){
						local.c.addEmailAddress(local.o);
					}
				}


			}
	</cfscript>
	<cfcatch>
	</cfcatch>
	</cftry>
	<!---<cfdump var="#local.xml#"><cfabort>--->
	<cfreturn local.c>
	</cffunction>

	<cffunction name="logger" access="private">
		<cfargument name="entryname" type="string">
		<cfargument name="logvalue" type="any">

		<cfset var keyname = "" />
		<cfset var d = "" />
		<cfset var logval = "" />


		<cfif variables.instance.uselogging>
			<cfset logval = getDateTimeString("yyyy-mm-dd", "HH-mm-ss", " ") />

			<cfif isStruct(arguments.logvalue)>
				<cffile action="append" file="#variables.instance.loggingpath#" output="#logval#" addnewline="true" />
				<cfloop list="#structKeyLIst(arguments.logvalue)#" index="keyname">
					<cfset logger(keyname, arguments.logvalue[keyname]) />
				</cfloop>
			<cfelse>
				<cfset logval = "#logval# #arguments.logvalue#" />
				<cffile action="append" file="#variables.instance.loggingpath#" output="#logval#" addnewline="true" />
			</cfif>
		</cfif>
		
	</cffunction>


	<cffunction name="getCFVersion">
		<cfreturn GetToken(server.coldfusion.productversion, 1,',') />
	</cffunction>	


	<cffunction name="getDateTimeString">
		<cfargument name="datemask" type="string" />
		<cfargument name="timemask" type="string" default = "">
		<cfargument name="separator" type="string" default="">

		<cfset var rt  = "" />
		<cfset var ut = "" />

		<cfif getCFVersion() GTE 10>
			<cfset rt =  DateTimeFormat(Now(), arguments.datemask, "UTC") />
		<cfelse>
			<cfset ut = DateConvert("local2utc",Now()) />
				<cfset rt = DateFormat(ut, arguments.datemask) />
				<cfif LEN(arguments.timemask)>
					<cfset rt = rt & arguments.separator & TimeFormat(ut, arguments.timemask) />
				</cfif>
		</cfif>


		<cfreturn rt />
			
		
	</cffunction>


</cfcomponent>