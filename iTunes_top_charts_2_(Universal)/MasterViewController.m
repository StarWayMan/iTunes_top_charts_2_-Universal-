//
//  MasterViewController.m
//  iTunes_top_charts_2_(Universal)
//
//  Created by Edip Asanov on 07.10.14.
//  Copyright (c) 2014 Edip Asanov. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "SettingsViewController.h"

@interface MasterViewController ()
{
    NSMutableData *webData;
    NSURLConnection *connection;
    NSMutableArray *nameArray;
    NSMutableArray *artistArray;
    NSMutableArray *imageArray;
}


@end

@implementation MasterViewController

const int songNameLabel = 100;
const int artistNameLabel = 101;

- (void)awakeFromNib {
    [super awakeFromNib];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Implement a tableView
    [[self tableView] setDelegate:self];
    [[self tableView] setDataSource:self];
    
    nameArray = [[NSMutableArray alloc] init];
    artistArray = [[NSMutableArray alloc] init];
    imageArray = [[NSMutableArray alloc] init];
    
    // Create bar buttons
    UIBarButtonItem *settingsButton = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(showSettings:)];
    self.navigationItem.rightBarButtonItem = settingsButton;
    
    // Add a splitview
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    // Add a refresh controll
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    refreshControl = [[UIRefreshControl alloc] init];
    refreshControl.backgroundColor = [UIColor colorWithRed:0.75 green:0.75 blue:0.75 alpha:0.75];
    refreshControl.tintColor = [UIColor whiteColor];
    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Implement bar buttons

-(void)showSettings:(id)sender {
    
}


#pragma mark - Loading data

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    //[webData setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    webData = [[NSMutableData alloc]init];
    [webData appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"connection failed");
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSDictionary *allDataDictionary = [NSJSONSerialization JSONObjectWithData:webData options:0 error:nil];
    NSDictionary *feed = [allDataDictionary objectForKey:@"feed"];
    NSArray *arrayOfEntry = [feed objectForKey:@"entry"];
    
    for (NSDictionary *diction in arrayOfEntry) {
        NSDictionary *name = [diction objectForKey:@"im:name"];
        NSString *label = [name objectForKey:@"label"];
        [nameArray addObject:label];
        
        NSDictionary *artist = [diction objectForKey:@"im:artist"];
        NSString *artistLabel = [artist objectForKey:@"label"];
        [artistArray addObject:artistLabel];
        
        NSArray *arrayOfImages = [diction objectForKey:@"im:image"];
        for (NSDictionary *imageDiction in arrayOfImages) {
            NSString *imageLabel = [imageDiction objectForKey:@"label"];
            [imageArray addObject:imageLabel];
        }
    }
    
    [[self tableView]reloadData];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DetailViewController *detailController = (DetailViewController *)[[segue destinationViewController] topViewController];
        
        [detailController setNameDetailItem:[nameArray objectAtIndex:indexPath.row]];
        [detailController setArtistDetailItem:[artistArray objectAtIndex:indexPath.row]];
        detailController.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        detailController.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (nameArray.count > 0) {
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        return 1;
        
    } else {
        
        // Display a message when the table is empty
        UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        
        messageLabel.text = @"No data is currently available. Please pull down to refresh.";
        messageLabel.textColor = [UIColor blackColor];
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = NSTextAlignmentCenter;
        messageLabel.font = [UIFont fontWithName:@"Palatino-Italic" size:20];
        messageLabel.backgroundColor = [UIColor whiteColor];
        [messageLabel sizeToFit];
        
        self.tableView.backgroundView = messageLabel;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [nameArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    UILabel* nameLabel = (UILabel *)[cell viewWithTag:songNameLabel];
    nameLabel.text = [nameArray objectAtIndex:indexPath.row];
    
    
    UILabel* artistLabel = (UILabel *)[cell viewWithTag:artistNameLabel];
    artistLabel.text = [artistArray objectAtIndex:indexPath.row];

    return cell;
}

- (void)refresh:(UIRefreshControl *)refreshControl {
    [nameArray removeAllObjects];
    [artistArray removeAllObjects];
    [imageArray removeAllObjects];
    
    [[self tableView] reloadData];
    
    [self.tableView setBackgroundView:nil];
    
    NSURL *url = [NSURL URLWithString:@"http://itunes.apple.com/ru/rss/topsongs/limit=100/json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    connection = [NSURLConnection connectionWithRequest:request delegate:self];
    
    [refreshControl endRefreshing];
}

@end
