//
//  SettingsViewController.h
//  iTunes_top_charts_2_(Universal)
//
//  Created by Edip Asanov on 07.10.14.
//  Copyright (c) 2014 Edip Asanov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MasterViewController;

@interface SettingsViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource> {
    NSArray *mediaTypes;
    IBOutlet UIPickerView *mediaTypePicker;
}

@property (retain, nonatomic) IBOutlet UIPickerView *mediaTypePicker;

@property (strong, nonatomic) MasterViewController *masterViewController;

//@property (strong, nonatomic) id typeSettingsItem;
@property NSString *type;

@end
