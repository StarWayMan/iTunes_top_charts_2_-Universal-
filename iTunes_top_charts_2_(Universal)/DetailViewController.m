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
    }
    
    if (_artistDetailItem != newDetailItem) {
        _artistDetailItem = newDetailItem;
    }
    
    if (_idDetailItem != newDetailItem) {
        _idDetailItem = newDetailItem;
    }
    
    if (_priceDetailItem != newDetailItem) {
        _priceDetailItem = newDetailItem;
    }
    
    if (_rightsDetailItem != newDetailItem) {
        _rightsDetailItem = newDetailItem;
    }
    
    if (_imageDetailItem != newDetailItem) {
        _imageDetailItem = newDetailItem;
    }
    
    // Update the view.
    
    
    
        [self configureView];
    
}

- (void)configureView {
    // Update the user interface for the detail item.
    
    if (self.nameDetailItem) {
        self.nameDetailDescriptionLabel.text = [self.nameDetailItem description];
    }
    if (self.artistDetailItem) {
        self.artistDetailDescriptionLabel.text = [self.artistDetailItem description];
    }
    if (self.priceDetailItem) {
        self.priceDetailDescriptionLabel.text = [self.priceDetailItem description];
    }
    if (self.rightsDetailItem) {
        self.rightsDetailDescriptionLabel.text = [self.rightsDetailItem description];
    }
    if (self.imageDetailItem) {
        NSURL* detailImageURL = [NSURL URLWithString:[self.imageDetailItem description]];
        NSData* detailImageData = [NSData dataWithContentsOfURL:detailImageURL];
        _imageDetailUIView.image = [UIImage imageWithData:detailImageData];

    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _imageDetailUIView.image = [UIImage imageNamed:@"placeholder.png"];

   
    [self configureView];
       
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)demoButton:(id)sender {
}

- (IBAction)viewInSafariButton:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[self.idDetailItem description]]];
}
@end
