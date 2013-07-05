# Installation
Put all of the files in the directory com/blackboard/connect in your webroot (or create a mapping to a folder that would resolve to com.blackboard.connect).

#Usage
Almost all of your usage will happen by invoking methods of the  connect CFC.  It can take in objects of the type contact and simpleContact depending on the method being used.
The contact objects are composed of the various other objects (email, fax, etc).  The connect object is responsible for communicating with blackboard.

When you invoke the connect object you'll need to pass in your blackboard API key and secret via the init method.    It would be trivial for you to add dependency injection to this using
coldspring or some other library and have that information injected instead of passing it.