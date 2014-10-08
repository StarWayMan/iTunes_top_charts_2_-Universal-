//
//  DetailViewController.h
//  iTunes_top_charts_2_(Universal)
//
//  Created by Edip Asanov on 07.10.14.
//  Copyright (c) 2014 Edip Asanov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id nameDetailItem;
@property (weak, nonatomic) IBOutlet UILabel *nameDetailDescriptionLabel;

@property (strong, nonatomic) id artistDetailItem;
@property (weak, nonatomic) IBOutlet UILabel *artistDetailDescriptionLabel;

@end

