//
//  Chart.h
//  iAbetes
//
//  Created by chris nielubowicz on 2/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Chart : UIViewController <UIWebViewDelegate>
{
	IBOutlet UIWebView *chartView;
	NSURL *chartURL;
	NSArray *data;
}

@property (nonatomic, retain) IBOutlet UIWebView *chartView;
@property (nonatomic, retain) NSArray *data;

@end
