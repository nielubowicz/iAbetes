//
//  iAbetesViewController.m
//  iAbetes
//
//  Created by chris nielubowicz on 2/18/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import "iAbetesViewController.h"
#import "NSDate+TimeString.h"
#import "LogEntry.h"
#import "Chart.h"

@interface iAbetesViewController()

-(NSString *)documentsDirectory;
-(void)loadDataFromDisk;

@end

@implementation iAbetesViewController

@synthesize currentTime, bloodSugar, exercizeDuration, exercizeIntensity, insulin;

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
	{
		logEntries = [[NSMutableArray alloc] init];
	}
	return self;
}

-(void)awakeFromNib
{
	[self loadDataFromDisk];
}

-(void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	[currentTime setText:[[NSDate date] timeString]];
}


-(IBAction)saveLogEntry
{
	LogEntry *entry = [[[LogEntry alloc] init] autorelease];
	if ([[bloodSugar text] doubleValue]) 
		[entry setBloodSugar:[[bloodSugar text] doubleValue]];
	
	if ([[insulin text] doubleValue]) 
		[entry setInsulinBolus:[[insulin text] doubleValue]];
	
	if ([[exercizeDuration text] intValue])
		[entry setExercize:[exercizeIntensity value] duration:[[exercizeDuration text] intValue]];
	
	[entry setTime:[NSDate date]];	
	[logEntries addObject:entry];
}

-(IBAction)graph
{
	[self loadDataFromDisk];
	
	Chart *c = [[[Chart alloc] initWithNibName:@"Chart" bundle:nil] autorelease];
	[c setData:logEntries];
	
	[self presentModalViewController:c animated:YES];
}

-(void)saveDataToDisk
{
	NSString *path = [NSString stringWithFormat:@"%@/logs.dat", [self documentsDirectory]];	
	if (!path) return;
	
	NSLog(@"saving %@ to path: %@", [logEntries description], path);
	NSMutableDictionary *rootObject = [NSMutableDictionary dictionary];    
	[rootObject setValue:logEntries forKey:@"logEntries"];
	[NSKeyedArchiver archiveRootObject:rootObject toFile:path];
	
	[logEntries removeAllObjects];
}

-(void)loadDataFromDisk
{
	NSString *path = [NSString stringWithFormat:@"%@/logs.dat", [self documentsDirectory]];
	if (!path) return;
	
	NSDictionary *rootObject = [NSKeyedUnarchiver unarchiveObjectWithFile:path];    
	if (logEntries)
		[logEntries release];
	
	logEntries = [[rootObject valueForKey:@"logEntries"] retain];
	if (!logEntries)
		logEntries = [[NSMutableArray alloc] init];
	
	NSLog(@"logs loaded: %@", [logEntries description]);
}

- (NSString *)documentsDirectory {
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
	return basePath;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return YES;
}

- (void)dealloc 
{
	[currentTime release];
	[bloodSugar release];
	[exercizeDuration release];	
	[exercizeIntensity release];
	[insulin release];
	[logEntries release];
    [super dealloc];
}

@end
