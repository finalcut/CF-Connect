<cfcomponent name="baseComponent">

 <cffunction name="getMemento" access="public" output="false" returntype="struct">
  <cfreturn copyMementoStruct(variables.instance) />
 </cffunction>
 
 <cffunction name="copyMementoStruct" access="private" output="false" returntype="struct">
  <cfargument name="memento" type="struct">
  <cfargument name="level" type="numeric" default="1" />

  <cfset var newMemento = structNew() />
  <cfset var keylist = structKeyList(arguments.memento) />
  <cfset var key = 0 />
  <cfset var skey = 0 />


    <cfif isComponent(arguments.memento)>
      <cfset newMemento = arguments.memento.getMemento() />
      <cfreturn  newMemento />
    <cfelse>
        <cfloop list="#keyList#" index="key">
         <cfif isSimpleValue(arguments.memento[key])>
          <cfset newMemento[key] = arguments.memento[key] />
         <cfelseif isQuery(arguments.memento[key])>
          <cfset newMemento[key] = arguments.memento[key] />
         <cfelseif isArray(arguments.memento[key]) AND ArrayLen(arguments.memento[key])>
            <cfset newMemento[key] = ArrayNew(1) />
            <cfloop from="1" to="#ArrayLen(arguments.memento[key])#" index="skey">
                  <cfset x = copyMementoStruct(arguments.memento[key][skey], arguments.level+1) />
                  <cfset newMemento[key][skey] =  x />
            </cfloop>
         <cfelseif isStruct(arguments.memento[key])>
            <cfset newMemento[key] = copyMementoStruct(arguments.memento[key], arguments.level+1) />
         <cfelseif isXMLDoc(arguments.memento[key])>
          <cfset newMemento[key] = arguments.memento[key] />
         <cfelseif isWDDX(arguments.memento[key])>
          <cfset newMemento[key] = arguments.memento[key] />
         </cfif>
        </cfloop>
    </cfif>

  <cfreturn newMemento />
 </cffunction>

  <cffunction name="dump" access="public" output="true" return="void">
 <cfargument name="abort" type="boolean" default="0" />
  <cfdump var="#getMemento()#" />
  <cfif arguments.abort>
   <cfabort />
  </cfif>
 </cffunction>


 <cffunction name="isComponent" access="public" output="false" return="string">
  <cfargument name="o">

  <cfset var md=GetMetaData(arguments.o) />
  <cfset var isComp = false />

  <cfif structKeyExists(md, "type")>
    <cfif md.type EQ "component">
      <cfset isComp = true />
    </cfif>
  </cfif>

  <cfreturn isComp />

 </cffunction>

</cfcomponent>