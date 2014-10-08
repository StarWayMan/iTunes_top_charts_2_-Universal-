//
//  SettingsViewController.m
//  iTunes_top_charts_2_(Universal)
//
//  Created by Edip Asanov on 07.10.14.
//  Copyright (c) 2014 Edip Asanov. All rights reserved.
//

#import "SettingsViewController.h"
#import "MasterViewController.h"


@interface SettingsViewController ()

@end

@implementation SettingsViewController

@synthesize mediaTypePicker;
@synthesize type = _type;

- (void)viewDidLoad {
    mediaTypes = [[NSArray alloc] initWithObjects:@"Top Audiobooks", @"Top Free Books", @"Top Paid Books", @"Top Text Books", @"iOS New Apps", @"iOS New Apps", @"iOS New Free Apps", @"iOS New Paid Apps", @"iOS Top Free Apps", @"iOS Top iPad Apps", @"iOS Top Grossing Apps", @"iOS Top Grossing iPad Apps", @"iOS Top iPad Apps", @"iOS Top Paid iPad Apps", @"iTunesU Collections", @"iTunesU Courses", @"Mac Top Free Apps", @"Mac Top Grossing Apps", @"Mac Top Apps", @"Mac Top Paid Apps", @"Movies", @"Video Rentals", @"Top Albums", @"Top iMixes", @"Top Songs", @"Top Music Videos", @"Top Podcasts", @"Top TV Episodes", @"Top TV Seasons", nil];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Implement UIPicker for mediatype

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [mediaTypes count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component {
    return [mediaTypes objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    switch (row) {
        case 0:
            _type = @"topaudiobooks"; // Top Audiobooks
            break;
        case 1:
            _type = @"topfreeebooks"; // Top Free Books
            break;
        case 2:
            _type = @"toppaidebooks"; // Top Paid Books
            break;
        case 3:
            _type = @"toptextbooks"; // Top Text Books
            break;
        case 4:
            _type = @"newapplications"; // iOS New Apps
            break;
        case 5:
            _type = @"newfreeapplications"; // iOS New Free Apps
            break;
        case 6:
            _type = @"newpaidapplications"; // iOS New Paid Apps
            break;
        case 7:
            _type = @"topfreeapplications"; // iOS Top Free Apps
            break;
        case 8:
            _type = @"topfreeipadapplications"; // iOS Top iPad Apps
            break;
        case 9:
            _type = @"topgrossingapplications"; // iOS Top Grossing Apps
            break;
        case 10:
            _type = @"topgrossingipadapplications"; // iOS Top Grossing iPad Apps
            break;
        case 11:
            _type = @"toppaidapplications"; // iOS Top iPad Apps
            break;
        case 12:
            _type = @"toppaidipadapplications"; // iOS Top Paid iPad Apps
            break;
        case 13:
            _type = @"topitunesucollections"; // iTunesU Collections
            break;
        case 14:
            _type = @"topitunesucourses"; // iTunesU Courses
            break;
        case 15:
            _type = @"topfreemacapps"; // Mac Top Free Apps
            break;
        case 16:
            _type = @"topgrossingmacapps"; // Mac Top Grossing Apps
            break;
        case 17:
            _type = @"topmacapps"; // Mac Top Apps
            break;
        case 18:
            _type = @"toppaidmacapps"; // Mac Top Paid Apps
            break;
        case 19:
            _type = @"topmovies"; // Movies
            break;
        case 20:
            _type = @"topvideorentals"; // Video Rentals
            break;
        case 21:
            _type = @"topalbums"; // Top Albums
            break;
        case 22:
            _type = @"topimixes"; // Top iMixes
            break;
        case 23:
            _type = @"topsongs"; // Top Songs
            break;
        case 24:
            _type = @"topmusicvideos"; // Top Music Videos
            break;
        case 25:
            _type = @"toppodcasts"; // Top Podcasts
            break;
        case 26:
            _type = @"toptvepisodes"; // Top TV Episodes
            break;
        case 27:
            _type = @"toptvseasons"; // Top TV Seasons
            break;
    }
    
}

#pragma mark - segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
        MasterViewController *masterController = (MasterViewController *)[[segue destinationViewController] topViewController];
        
        [masterController setSourceUrlItem:_type];
        
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
