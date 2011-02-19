//
//  NSDate+CurrentTimeString.m
//  iAbetes
//
//  Created by chris nielubowicz on 2/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NSDate+TimeString.h"


@implementation NSDate(TimeString)

-(NSString *)timeString
{
	NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
	// display in 12HR/24HR (i.e. 11:25PM or 23:25) format according to User Settings
	[dateFormatter setTimeStyle:NSDateFormatterShortStyle];
	return [dateFormatter stringFromDate:self];
}	

@end
