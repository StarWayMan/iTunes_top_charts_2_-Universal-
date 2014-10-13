//
//  MasterViewController.h
//  iTunes_top_charts_2_(Universal)
//
//  Created by Edip Asanov on 07.10.14.
//  Copyright (c) 2014 Edip Asanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsViewController.h"

NSString *jsonReference;
static NSString *messageText;
static UIColor *messageColor;
static UIFont *messageFont;
static UIColor *messageBackgroundColor;

@class DetailViewController;

@interface MasterViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate, NSURLConnectionDataDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;

@property (nonatomic, copy) SettingsViewController *mediaTypeReference;
@property (nonatomic, copy) NSString *mediaType;


@end

