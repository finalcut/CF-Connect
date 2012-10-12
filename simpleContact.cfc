<cfcomponent
	displayname="simpleContact"
	extends="baseComponent"
	alias="simpleContact"
	output="false"
	hint="holds just the basic information for a user as needed by MuAlerts screen.">


	<cffunction name="preinit" returntype="void" outupt="false" access="private">
		<cfset variables.instance = structNew() />


		<cfset variables.instance.firstname = "" />
		<cfset variables.instance.lastname = "" />
		<cfset variables.instance.username = "" />
		<cfset variables.instance.primaryEmail = "" />
		<cfset variables.instance.secondaryEmail = "" />
		<cfset variables.instance.textNumber = "" />
		<cfset variables.instance.homePhone = "" />
		<cfset variables.instance.workPhone = "" />
		<cfset variables.instance.mobilePhone = "" />
		<cfset variables.instance.nineOhOneNumber = "" />
	</cffunction>

	<cffunction name="init" returntype="simpleContact" output="false" access="public">
		<cfargument name="contact" type="contact" required="true" />

		<cfset preInit() />
		<cfset extractContactInformation(arguments.contact) />


		<cfreturn this />
	</cffunction>

	<cffunction name="simpleInit" returntype="simpleContact" output="false" access="public">
		<cfargument name="firstname" type="string">
		<cfargument name="lastname" type="string">
		<cfargument name="muid" type="string">
		<cfargument name="nineOhOneNumber" type="string">
		<cfargument name="email" type="string">
		<cfargument name="homephone" type="string">
		<cfargument name="mobilephone" type="string">
		<cfargument name="workphone" type="string">
		<cfargument name="text" type="string">

		<cfset var emails = listToArray(arguments.email) />

		<cfset preInit() />

		<cfscript>
		
		if(ArrayLen(emails)){
			variables.instance.primaryEmail = emails[1];
		}
		if(ArrayLen(emails) GT 1){
			variables.instance.secondaryEmail =  emails[2];
		}
		
		variables.instance.firstname = arguments.firstname;
		variables.instance.lastname = arguments.lastname;
		variables.instance.textNumber =  arguments.text;
		variables.instance.homePhone =  arguments.homephone;
		variables.instance.workPhone =  arguments.workphone;
		variables.instance.mobilePhone = arguments.mobilephone;
		variables.instance.nineOhOneNumber = arguments.nineOhOneNumber;

		return this;
		</cfscript>
	</cffunction>


	<cffunction name="extractContactInformation" access="private">
		<cfargument name="contact" required="true" />

		<cfset var local = structNew() />

		<cfscript>
			variables.instance.nineOhOneNumber = arguments.contact.getReferenceCode();
			local.email = arguments.contact.getEmailAddresses();
			for(local.i=1;local.i LTE ArrayLen(local.email); local.i = local.i+1){
				local.e = local.email[local.i];
				if(local.e.getIndex() EQ 1){
					variables.instance.primaryEmail = local.e.getEmailAddress();
				} else {
					variables.instance.secondaryEmail = local.e.getEmailAddress();
				}
			}

			local.phone = arguments.contact.getPhoneNumbers();
			for(local.i=1;local.i LTE ArrayLen(local.phone); local.i = local.i+1){
				local.p = local.phone[local.i];
				if(local.p.getIndex() EQ 1){
					variables.instance.homePhone = local.p.getPhoneNumber();
				} else if(local.p.getIndex() EQ 2){
					variables.instance.workPhone = local.p.getPhoneNumber();
				} else if(local.p.getIndex() EQ 3){
					variables.instance.mobilePhone = local.p.getPhoneNumber();
				}
			}

			local.sms = arguments.contact.getSMSNumbers();
			if(arrayLen(local.sms) EQ 1){
				local.s = local.sms[1];
				variables.instance.textNumber = local.s.getSmsNumber();
			}


		</cfscript>
	</cffunction>

	<cffunction name="getContact" returntype="contact" access="public">
		<cfscript>
			var local = structNew();
			var c = createObject("component", "com.blackboard.connect.contact").init();
			if(len(trim(variables.instance.primaryEmail))){
				 local.pe = createObject("component", "com.blackboard.connect.email").init(variables.instance.primaryEmail, 1);
				 c.addEmailAddress(local.pe);
			}
			if(len(trim(variables.instance.secondaryEmail))){
				 local.se = createObject("component", "com.blackboard.connect.email").init(variables.instance.secondaryEmail, 2, 2);
				 c.addEmailAddress(local.se);
			}
			if(len(trim(variables.instance.homePhone))){
				 local.hp = createObject("component", "com.blackboard.connect.phone").init(variables.instance.homePhone, 1, 1);
				 c.addPhone(local.hp);
			}
			if(len(trim(variables.instance.workPhone))){
				 local.wp = createObject("component", "com.blackboard.connect.phone").init(variables.instance.workPhone, 2, 2);
				 c.addPhone(local.wp);
			}
			if(len(trim(variables.instance.mobilePhone))){
				 local.mp = createObject("component", "com.blackboard.connect.phone").init(variables.instance.mobilePhone, 2, 3);
				 c.addPhone(local.mp);
			}

			if(len(trim(variables.instance.textNumber))){
				 local.s = createObject("component", "com.blackboard.connect.sms").init(variables.instance.textNumber, 1, 1);
				 c.addSmsNumber(local.s);
			}
			c.setFirstName(variables.instance.firstname);
			c.setLastName(variables.instance.lastname);
			c.setreferenceCode(variables.instance.nineOhOneNumber);

			return c;
		</cfscript>
	</cffunction>

	<cffunction name="getPrimaryEmail" returntype="string" access="public" output="false">
		<cfreturn TRIM(variables.instance.primaryEmail) />
	</cffunction>
	<cffunction name="getSecondaryEmail" returntype="string" access="public" output="false">
		<cfreturn TRIM(variables.instance.secondaryEmail) />
	</cffunction>
	<cffunction name="getTextNumber" returntype="string" access="public" output="false">
		<cfreturn TRIM(variables.instance.textNumber) />
	</cffunction>
	<cffunction name="getHomePhone" returntype="string" access="public" output="false">
		<cfreturn TRIM(variables.instance.homePhone) />
	</cffunction>
	<cffunction name="getWorkPhone" returntype="string" access="public" output="false">
		<cfreturn TRIM(variables.instance.workPhone) />
	</cffunction>
	<cffunction name="getMobilePhone" returntype="string" access="public" output="false">
		<cfreturn TRIM(variables.instance.mobilePhone) />
	</cffunction>
	<cffunction name="getnineOhOneNumber" returntype="string" access="public" output="false">
		<cfreturn TRIM(variables.instance.nineOhOneNumber) />
	</cffunction>


</cfcomponent>
