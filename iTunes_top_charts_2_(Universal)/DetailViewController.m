//
//  DetailViewController.m
//  iTunes_top_charts_2_(Universal)
//
//  Created by Edip Asanov on 07.10.14.
//  Copyright (c) 2014 Edip Asanov. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_nameDetailItem != newDetailItem) {
        _nameDetailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
    if (_artistDetailItem != newDetailItem) {
        _artistDetailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.nameDetailItem) {
        self.nameDetailDescriptionLabel.text = [self.nameDetailItem description];
    }
    if (self.artistDetailItem) {
        self.artistDetailDescriptionLabel.text = [self.artistDetailItem description];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
