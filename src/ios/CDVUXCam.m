#import "CDVUXCam.h"

#import <UXCam/UXCam.h>

@implementation CDVUXCam

- (void)start:(CDVInvokedUrlCommand*)command
{
	CDVPluginResult* pluginResult = nil;
	NSString* apiKey = [command.arguments objectAtIndex:0];
	
	if (apiKey.length > 0)
	{
		NSLog(@"UXCam: Starting UXCam with API Key: %@", apiKey);

		[UXCam startApplicationWithKey:apiKey];
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
	}
	else
	{
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
	}
	
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)stopUXCamCameraVideo:(CDVInvokedUrlCommand*)command
{
	// RAG: This was in the Android plugin - but I don't see it maps to anything in iOS
	CDVPluginResult* pluginResult = nil;
	pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)stopApplicationAndUploadData:(CDVInvokedUrlCommand*)command
{
	[UXCam stopApplicationAndUploadData];
	
	[self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK]
								callbackId:command.callbackId];
}

- (void)markUserAsFavorite:(CDVInvokedUrlCommand*)command
{
	[UXCam markUserAsFavorite];
	
	[self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK]
								callbackId:command.callbackId];
}

- (void)tagUsersName:(CDVInvokedUrlCommand*)command
{
	CDVPluginResult* pluginResult = nil;
	NSString* userName = [command.arguments objectAtIndex:0];
	if (userName.length>0)
	{
		[UXCam tagUsersName:userName additionalData:nil];
		
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
	}
	else
	{
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
	}
	
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)tagScreenName:(CDVInvokedUrlCommand*)command
{
	CDVPluginResult* pluginResult = nil;
	NSString* screenName = [command.arguments objectAtIndex:0];
	if (screenName.length>0)
	{
		[UXCam tagScreenName:screenName];
		
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
	}
	else
	{
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
	}
	
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)addTag:(CDVInvokedUrlCommand*)command
{
	CDVPluginResult* pluginResult = nil;
	NSString* tag = [command.arguments objectAtIndex:0];
	if (tag.length>0)
	{
		[UXCam addTag:tag];
		
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
	}
	else
	{
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
	}
	
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end