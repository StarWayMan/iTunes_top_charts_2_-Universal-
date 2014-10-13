//
//  SettingsViewController.m
//  iTunes_top_charts_2_(Universal)
//
//  Created by Edip Asanov on 07.10.14.
//  Copyright (c) 2014 Edip Asanov. All rights reserved.
//

#import "SettingsViewController.h"


@interface SettingsViewController ()

@end

@implementation SettingsViewController

@synthesize mediaTypePicker;
@synthesize type = _type;

- (void)viewDidLoad {
    mediaTypesKeys =[[NSArray alloc] initWithObjects:@"Top Audiobooks", @"Top Free Books", @"Top Paid Books", @"Top Text Books", @"iOS New Apps", @"iOS New Apps", @"iOS New Free Apps", @"iOS New Paid Apps", @"iOS Top Free Apps", @"iOS Top iPad Apps", @"iOS Top Grossing Apps", @"iOS Top Grossing iPad Apps", @"iOS Top iPad Apps", @"iOS Top Paid iPad Apps", @"iTunesU Collections", @"iTunesU Courses", @"Mac Top Free Apps", @"Mac Top Grossing Apps", @"Mac Top Apps", @"Mac Top Paid Apps", @"Movies", @"Video Rentals", @"Top Albums", @"Top iMixes", @"Top Songs", @"Top Music Videos", @"Top Podcasts", @"Top TV Episodes", @"Top TV Seasons", nil];
    
    mediaTypesObjects = [[NSArray alloc] initWithObjects:@"topaudiobooks", @"topfreeebooks", @"toppaidebooks", @"toptextbooks", @"newapplications", @"newfreeapplications", @"newfreeapplications", @"newpaidapplications", @"topfreeapplications", @"topfreeipadapplications", @"topgrossingapplications", @"topgrossingipadapplications", @"toppaidapplications", @"toppaidipadapplications", @"topitunesucollections", @"topitunesucourses", @"topfreemacapps", @"topgrossingmacapps", @"topmacapps", @"toppaidmacapps", @"topmovies", @"topvideorentals", @"topalbums", @"topimixes", @"topsongs", @"topmusicvideos", @"toppodcasts", @"toptvepisodes", @"toptvseasons", nil];
    
    mediaTypes = [NSDictionary dictionaryWithObjects:mediaTypesObjects forKeys:mediaTypesKeys];
    
    sharedType = [Singleton sharedInstance];

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

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"MediaTypeChanged" object:sharedType.globalMediaType];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [mediaTypesKeys count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component {
    return [mediaTypesKeys objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    switch (row) {
        case 0:
            sharedType.globalMediaType = [mediaTypes objectForKey:@"Top Audiobooks"]; // Top Audiobooks
            break;
        case 1:
            sharedType.globalMediaType = [mediaTypes objectForKey:@"Top Free Books"]; // Top Free Books
            break;
        case 2:
            sharedType.globalMediaType = [mediaTypes objectForKey:@"Top Paid Books"]; // Top Paid Books
            break;
        case 3:
            sharedType.globalMediaType = [mediaTypes objectForKey:@"Top Text Books"]; // Top Text Books
            break;
        case 4:
            sharedType.globalMediaType = [mediaTypes objectForKey:@"iOS New Apps"]; // iOS New Apps
            break;
        case 5:
            sharedType.globalMediaType = [mediaTypes objectForKey:@"iOS New Free Apps"]; // iOS New Free Apps
            break;
        case 6:
            sharedType.globalMediaType = [mediaTypes objectForKey:@"iOS New Paid Apps"]; // iOS New Paid Apps
            break;
        case 7:
            sharedType.globalMediaType = [mediaTypes objectForKey:@"iOS Top Free Apps"]; // iOS Top Free Apps
            break;
        case 8:
            sharedType.globalMediaType = [mediaTypes objectForKey:@"iOS Top iPad Apps"]; // iOS Top iPad Apps
            break;
        case 9:
            sharedType.globalMediaType = [mediaTypes objectForKey:@"iOS Top Grossing Apps"]; // iOS Top Grossing Apps
            break;
        case 10:
            sharedType.globalMediaType = [mediaTypes objectForKey:@"iOS Top Grossing iPad Apps"]; // iOS Top Grossing iPad Apps
            break;
        case 11:
            sharedType.globalMediaType = [mediaTypes objectForKey:@"iOS Top iPad Apps"]; // iOS Top iPad Apps
            break;
        case 12:
            sharedType.globalMediaType = [mediaTypes objectForKey:@"iOS Top Paid iPad Apps"]; // iOS Top Paid iPad Apps
            break;
        case 13:
            sharedType.globalMediaType = [mediaTypes objectForKey:@"iTunesU Collections"]; // iTunesU Collections
            break;
        case 14:
            sharedType.globalMediaType = [mediaTypes objectForKey:@"iTunesU Courses"]; // iTunesU Courses
            break;
        case 15:
            sharedType.globalMediaType = [mediaTypes objectForKey:@"Mac Top Free Apps"]; // Mac Top Free Apps
            break;
        case 16:
            sharedType.globalMediaType = [mediaTypes objectForKey:@"Mac Top Grossing Apps"]; // Mac Top Grossing Apps
            break;
        case 17:
            sharedType.globalMediaType = [mediaTypes objectForKey:@"Mac Top Apps"]; // Mac Top Apps
            break;
        case 18:
            sharedType.globalMediaType = [mediaTypes objectForKey:@"Mac Top Paid Apps"]; // Mac Top Paid Apps
            break;
        case 19:
            sharedType.globalMediaType = [mediaTypes objectForKey:@"Movies"]; // Movies
            break;
        case 20:
            sharedType.globalMediaType = [mediaTypes objectForKey:@"Video Rentals"]; // Video Rentals
            break;
        case 21:
            sharedType.globalMediaType = [mediaTypes objectForKey:@"Top Albums"]; // Top Albums
            break;
        case 22:
            sharedType.globalMediaType = [mediaTypes objectForKey:@"Top iMixes"]; // Top iMixes
            break;
        case 23:
            sharedType.globalMediaType = [mediaTypes objectForKey:@"Top Songs"]; // Top Songs
            break;
        case 24:
            sharedType.globalMediaType = [mediaTypes objectForKey:@"Top Music Videos"]; // Top Music Videos
            break;
        case 25:
            sharedType.globalMediaType = [mediaTypes objectForKey:@"Top Podcasts"]; // Top Podcasts
            break;
        case 26:
            sharedType.globalMediaType = [mediaTypes objectForKey:@"Top TV Episodes"]; // Top TV Episodes
            break;
        case 27:
            sharedType.globalMediaType = [mediaTypes objectForKey:@"Top TV Seasons"]; // Top TV Seasons
            break;
    }
    
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
