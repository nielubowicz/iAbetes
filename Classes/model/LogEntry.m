//
//  LogEntry.m
//  iAbetes
//
//  Created by chris nielubowicz on 2/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LogEntry.h"

#pragma mark Log Points
#define kBloodSugar @"bloodSugar"
#define kTime @"timeOfEntry" 
#define kBolus @"bolus"
#define kBolusDuration @"bolusDuration"
#define kExercizeIntensity @"exercizeIntensity"
#define kExercizeDuration @"exercizeDuration"
#define kWaterConsumed @"waterConsumption"

@implementation LogEntry

-(id)init
{
	if (self = [super init])
	{
		information = [[NSMutableDictionary alloc] init];
	}
	return self;
}

-(void)setBloodSugar:(NSUInteger)bloodSugar
{
	[information setObject:[NSNumber numberWithUnsignedInt:bloodSugar] forKey:kBloodSugar];
}

-(void)setTime:(NSDate *)time
{
	[information setObject:timeOfEntry forKey:kTime];
}

-(void)setInsulinBolus:(double)units
{
	[information setObject:[NSNumber numberWithDouble:units] forKey:kBolus];
}

-(void)setInsulinBolus:(double)units overTimeInterval:(NSTimeInterval)bolusDuration
{
	[self setInsulinBolus:units];
	[information setObject:[NSNumber numberWithDouble:bolusDuration] forKey:kBolusDuration];
}

-(void)addFoodItem:(Food *)item
{
	// no food support yet
}

-(void)setExercize:(double)intensity duration:(NSTimeInterval)duration
{
	// improve this  - add type? 
	[information setObject:[NSNumber numberWithDouble:intensity] forKey:kExercizeIntensity];
	[information setObject:[NSNumber numberWithDouble:duration] forKey:kExercizeDuration];
}

-(void)setWaterConsumption:(NSUInteger)fluidOunces
{
	[information setObject:[NSNumber numberWithUnsignedInt:fluidOunces] forKey:kWaterConsumed];
}

-(void)dealloc
{
	[timeOfEntry release];
	[information release];
	[super dealloc];	
}

@end
