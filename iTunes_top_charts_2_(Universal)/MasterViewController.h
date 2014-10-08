//
//  MasterViewController.h
//  iTunes_top_charts_2_(Universal)
//
//  Created by Edip Asanov on 07.10.14.
//  Copyright (c) 2014 Edip Asanov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;
@class SettingsViewController;

@interface MasterViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate, NSURLConnectionDataDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (strong, nonatomic) SettingsViewController *settingsViewController;

@property (strong, nonatomic) id sourceUrlItem;
@property NSString *sourceUrl;


@end

