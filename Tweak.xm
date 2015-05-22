#import <Foundation/Foundation.h>
#import <UIKit/UIAlertView.h>

%hook SBLockScreenViewController
//iOS7 and iOS8

	-(void)deactivate {
		NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
		NSDictionary *prefs=[[NSDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.richardlindsay.remindme.plist"];
		
		%orig;
		
		if ([[prefs objectForKey:@"enable"] boolValue] == YES){
			NSString *message = [prefs valueForKey:@"message"];

			if ([message length] != 0) {
				UIAlertView *greeting=[[UIAlertView alloc] initWithTitle:@"Remember to" message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK, until next time!", nil];
				[greeting show];
				[greeting release];
			}
		}
		[prefs release];
		[pool drain];
	}

%end

%hook SBAwayController
//iOS6

	-(void)deactivate {

		NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
		NSDictionary *prefs=[[NSDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.richardlindsay.remindme.plist"];
		
		%orig;
		
		if ([[prefs objectForKey:@"enable"] boolValue] == YES){
			NSString *message = [prefs valueForKey:@"message"];

			if ([message length] != 0) {
				UIAlertView *greeting=[[UIAlertView alloc] initWithTitle:@"Remember to" message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK, until next time!", nil];
				[greeting show];
				[greeting release];
			}
		}
		[prefs release];
		[pool drain];
	}

%end