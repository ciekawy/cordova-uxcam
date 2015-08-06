
# Cordova UXCam plugin

## Release Notes ##

v2.2.1 - Moving to the new 'npm' plugin publishing system
v2.2.0 - Updating to iOS SDK 2.1.0 - adds occludeSensitiveScreen and startWithKeyAndAppVariant methods

v2.1.6 - Updating to Android SDK 2.0.4 fixing an issue on Android OS 5.0+
v2.1.5 - Updating to iOS SDK 2.0.4 which fixes a bug with uploading icon images
v2.1.4 - Updating to iOS SDK 2.0.2 which improves version reporting to the server
v2.1.3 - Fixing some publishing problems with both SDKs
v2.1.0 - Changes the startup call from startApplicationWithKey to startWithKey for consistency with native SDKs

v2.0.1 - Native SDKs updated to versions 2.0.1 to fix some problems

v2.0.0 - First full release


## Add UXCam plugin

STEP 1: INTEGRATE  WITH PHONEGAP

    cordova plugin add com.uxcam.cordova.plugin

or

    phonegap plugin add com.uxcam.cordova.plugin
  

To remove the plugin: 

    cordova/phonegap plugin remove com.uxcam.cordova.plugin 


Supported platforms: android, ios

---

STEP 2: START UXCAM

Call the startWithKey method on deviceready to start the UXCam session:

#### startWithKey
Starts the UXCam session

UXCam.startWithKey("API-key from https://www.uxcam.com to be placed here - this is your user account API key and is the same for all projects");

---

### OPTIONAL METHODS

#### startWithKeyAndAppVariant
Starts the UXCam session and sets a variant identifier for the app to differentiate builds of the same app on the dashboard.

UXCam.startWithKeyAndAppVariant("API-Key", "App variant identifier: appended to the bundle ID and app name in the dashboard");


#### stopApplicationAndUploadData 
Stops the UXCam application and sends captured data to the server. Use this to start sending the data on UXCam server without waiting for the app going into the background.

UXCam.stopApplicationAndUploadData();


#### stopUXCamCameraVideo
Stops the faceCamera video recording if your application uses camera 

UXCam.stopUXCamCameraVideo ();


#### tagScreenName
UXCam captures the view controller name automatically but in case where it doesn’t (such as in OpenGL) or you would like to set a different unique name, use this function.

UXCam.tagScreenName(“Screen Name”)
Parameters 
screenName: The name of the screen as required.


#### tagUsersName
UXCam uses a unique number to tag a device. You can tag a device allowing you to search for it on the dashboard and review their session further.

UXCam.tagUsersName(“User name”);
Parameters 
userName: The name of the tag of device


#### markUserAsFavorite
You can mark a user specifically if certain condition are met making them a good user for further testing. You can then filter these users and perform further test.

UXCam.markUserAsFavorite();


#### addTag
Insert a general tag into the timeline - stores the tag with the timestamp when it was added. 

UXCam.addTag(“Tag”);
Parameters 
Tag: The name of the tag

#### occludeSensitiveScreen
Hide / un-hide the screen from being recorded. Call once with 'true' to start hiding the screen and later with 'false' to record normal contents again.
Useful to hide sensitive entry fields that you would not want to record the contents of.

UXCam.occludeSensitiveScreen(bool hideScreen);

---

## Notes on Building a Plugin ##

If making a plugin like this, or trying to update the framework note that there are currently problems publishing cordova plugins that have iOS custom frameworks in them.

See the bug report: https://issues.apache.org/jira/browse/CB-6092 for details.

Work around: Pull your custom framework apart and put the library file directly in the Name.framework folder and have the headers in a 'Headers' sub-folder: you can't publish the symbolic links that are normal in frameworks.
Symptom: Project builds fine when testing plugin installed from a local folder or from a git URL - fails when installed by name from the plugin registry.

--- 
