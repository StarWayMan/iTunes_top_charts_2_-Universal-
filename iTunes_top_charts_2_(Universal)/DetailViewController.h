//
//  DetailViewController.h
//  iTunes_top_charts_2_(Universal)
//
//  Created by Edip Asanov on 07.10.14.
//  Copyright (c) 2014 Edip Asanov. All rights reserved.
//

#import <UIKit/UIKit.h>

NSString* idDetailURL;

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id nameDetailItem;
@property (weak, nonatomic) IBOutlet UILabel *nameDetailDescriptionLabel;

@property (strong, nonatomic) id artistDetailItem;
@property (weak, nonatomic) IBOutlet UILabel *artistDetailDescriptionLabel;

@property (strong, nonatomic) id priceDetailItem;
@property (weak, nonatomic) IBOutlet UILabel *priceDetailDescriptionLabel;

@property (strong, nonatomic) id rightsDetailItem;
@property (weak, nonatomic) IBOutlet UILabel *rightsDetailDescriptionLabel;

@property (strong, nonatomic) id imageDetailItem;
@property (weak, nonatomic) IBOutlet UIImageView *imageDetailUIView;

@property (strong, nonatomic) id idDetailItem;

- (IBAction)demoButton:(id)sender;
- (IBAction)viewInSafariButton:(id)sender;

@end

