//
//  iAbetesViewController.h
//  iAbetes
//
//  Created by chris nielubowicz on 2/18/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iAbetesViewController : UIViewController <UITextFieldDelegate>
{
	IBOutlet UILabel *currentTime;
	IBOutlet UITextField *bloodSugar;
	IBOutlet UITextField *insulin;
	IBOutlet UITextField *exercizeDuration;
	IBOutlet UISlider *exercizeIntensity;
	
	NSMutableSet *logEntries;	
}

@property (nonatomic, retain) IBOutlet UILabel *currentTime;
@property (nonatomic, retain) IBOutlet UITextField *bloodSugar;
@property (nonatomic, retain) IBOutlet UITextField *insulin;
@property (nonatomic, retain) IBOutlet UITextField *exercizeDuration;
@property (nonatomic, retain) IBOutlet UISlider *exercizeIntensity;

-(IBAction)saveLogEntry;

@end

