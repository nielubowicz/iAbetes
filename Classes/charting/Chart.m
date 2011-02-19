//
//  Chart.m
//  iAbetes
//
//  Created by chris nielubowicz on 2/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Chart.h"
#import "ChartFormatter.h"

@implementation Chart

@synthesize chartView, data;

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
	{
	}
	return self;
}

-(void)viewDidLoad
{	
	ChartFormatter *format = [[[ChartFormatter alloc] init] autorelease];
	chartURL = [NSURL URLWithString:[format urlForData:data]];	
	NSLog(@"chartURL:\n%@", [chartURL description]);
	[chartView loadRequest:[NSURLRequest requestWithURL:chartURL]];
}

-(void)dealloc
{
	[chartView setDelegate:nil];
	[chartView release];
    [super dealloc];
}


@end
