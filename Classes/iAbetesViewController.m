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

@interface iAbetesViewController()

-(NSString *)documentsDirectory;
-(void)loadDataFromDisk;
-(void)saveDataToDisk;

@end

@implementation iAbetesViewController

@synthesize currentTime, bloodSugar, exercizeDuration, exercizeIntensity, insulin;

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
	{
		logEntries = [[NSMutableSet alloc] init];
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
	NSLog(@"current: %@", [[NSDate date] timeString]);
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
	NSLog(@"saving %@", [entry description]);
	[logEntries addObject:entry];
	[self saveDataToDisk];
}

-(void)saveDataToDisk
{
	NSString * path = [self documentsDirectory];	
	if (!path) return;
	
	NSLog(@"saving %@ to path: %@", [logEntries description], path);
	NSMutableDictionary *rootObject = [NSMutableDictionary dictionary];    
	[rootObject setValue:logEntries forKey:@"logEntries"];
	[NSKeyedArchiver archiveRootObject:rootObject toFile:path];
	
	[logEntries removeAllObjects];
}

-(void)loadDataFromDisk
{
	NSString *path = [self documentsDirectory];
	if (!path) return;
	
	NSDictionary *rootObject = [NSKeyedUnarchiver unarchiveObjectWithFile:path];    
	if (logEntries)
		[logEntries release];
	
	logEntries = [[rootObject valueForKey:@"logEntries"] retain];
	if (!logEntries)
		logEntries = [[NSMutableSet alloc] init];
	
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

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void) applicationWillTerminate: (NSNotification *)note
{
	[self saveDataToDisk];
}

- (void)dealloc {
    [super dealloc];
}

@end
