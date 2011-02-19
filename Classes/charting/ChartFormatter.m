//
//  ChartFormatter.m
//  iAbetes
//
//  Created by chris nielubowicz on 2/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ChartFormatter.h"
#import "LogEntry.h"

@implementation ChartFormatter

-(id)init
{
	if (self = [super init])
	{
		
	}
	return self;
}

-(NSString *)urlForData:(NSArray *)logEntries
{
	NSMutableString *dataString = [NSMutableString string];
	NSSortDescriptor *sort = [[[NSSortDescriptor alloc] initWithKey:@"timeOfEntry" ascending:YES] autorelease];
	NSArray *timeSortedArray = [logEntries sortedArrayUsingDescriptors:[NSArray arrayWithObject:sort]];
	NSLog(@"sort : %@", [timeSortedArray description]);
	for (LogEntry *log in timeSortedArray)
	{
		[dataString appendFormat:@"%d,", [log bloodSugar]];
	}
	return [NSString stringWithFormat:@"https://chart.googleapis.com/chart?cht=lc&chd=t:%@&chds=20,500&chs=280x250&chxt=y&chxr=0,20,500",  [dataString substringToIndex:[dataString length]-1]];
}

-(void)dealloc
{
	[super dealloc];
}

@end
