//
//  MasterViewController.m
//  iTunes_top_charts_2_(Universal)
//
//  Created by Edip Asanov on 07.10.14.
//  Copyright (c) 2014 Edip Asanov. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

@interface MasterViewController ()
{
    NSMutableData *webData;
    NSURLConnection *connection;
    
    NSMutableArray *nameArray;
    NSMutableArray *artistArray;
    NSMutableArray *priceArray;
    NSMutableArray *rightsArray;
    NSMutableArray *idArray;
    
    NSMutableArray *smallImageArray;
    NSMutableArray *bigImageArray;
}


@end

@implementation MasterViewController



const int songNameLabel = 100;
const int artistNameLabel = 101;
const int smallUIImageView = 102;

const int smallImageIndex = 0;
const int bigImageIndex = 2;

@synthesize mediaTypeReference = _mediaTypeReference;

- (void)awakeFromNib {
    [super awakeFromNib];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    messageText = @"No data is currently available. Please pull down to refresh.";
    messageColor = [UIColor blackColor];
    messageFont = [UIFont fontWithName:@"Palatino-Italic" size:20];;
    messageBackgroundColor = [UIColor whiteColor];
    
    self.mediaType = @"topaudiobooks";
    
    self.title = self.mediaType.description;

    // Implement a tableView
    [[self tableView] setDelegate:self];
    [[self tableView] setDataSource:self];
    
    nameArray = [[NSMutableArray alloc] init];
    artistArray = [[NSMutableArray alloc] init];
    priceArray = [[NSMutableArray alloc] init];
    rightsArray = [[NSMutableArray alloc] init];
    idArray = [[NSMutableArray alloc] init];
    
    smallImageArray = [[NSMutableArray alloc] init];
    bigImageArray = [[NSMutableArray alloc] init];
    
    // Add a splitview
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    // Add a refresh controll
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    refreshControl = [[UIRefreshControl alloc] init];
    refreshControl.backgroundColor = [UIColor colorWithRed:0.75 green:0.75 blue:0.75 alpha:0.75];
    refreshControl.tintColor = [UIColor whiteColor];
    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
    
    //add observer
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mediaTypeChanged:) name:@"MediaTypeChanged" object:nil];
        
    
    
    [self refreshUI];

}

// observer
- (void)mediaTypeChanged:(NSNotification *)notification {
    if( !notification.object )
        return;
    
    self.mediaType = notification.object;
    [self refreshUI];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Loading data

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{

}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
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
        
        NSDictionary *rights = [diction objectForKey:@"rights"];
        NSString *rightsLabel = [rights objectForKey:@"label"];
        [rightsArray addObject:rightsLabel];
        
        NSDictionary *price = [diction objectForKey:@"im:price"];
        NSString *priceLabel = [price objectForKey:@"label"];
        [priceArray addObject:priceLabel];
        
        NSDictionary *urlID = [diction objectForKey:@"id"];
        NSString *idLabel = [urlID objectForKey:@"label"];
        [idArray addObject:idLabel];
        
        NSArray *arrayOfImages = [diction objectForKey:@"im:image"];
        NSDictionary *smallImageDiction = [arrayOfImages objectAtIndex:smallImageIndex];
            NSString *smallImageLabel = [smallImageDiction objectForKey:@"label"];
            [smallImageArray addObject:smallImageLabel];
        
        NSDictionary *bigImageDiction = [arrayOfImages objectAtIndex:bigImageIndex];
        NSString *bigImageLabel = [bigImageDiction objectForKey:@"label"];
        [bigImageArray addObject:bigImageLabel];
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
        [detailController setIdDetailItem:[idArray objectAtIndex:indexPath.row]];
        [detailController setPriceDetailItem:[priceArray objectAtIndex:indexPath.row]];
        [detailController setRightsDetailItem:[rightsArray objectAtIndex:indexPath.row]];
        [detailController setImageDetailItem:[bigImageArray objectAtIndex:indexPath.row]];
        
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
        
        messageLabel.text = messageText;
        messageLabel.textColor = messageColor;
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = NSTextAlignmentCenter;
        messageLabel.font = messageFont;
        messageLabel.backgroundColor = messageBackgroundColor;
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
    
    UIImageView* smallImage = (UIImageView *)[cell viewWithTag:smallUIImageView];
    NSURL* smallImageURL = [NSURL URLWithString:[smallImageArray objectAtIndex:indexPath.row]];
    NSData* smallImageData = [NSData dataWithContentsOfURL:smallImageURL];
    smallImage.image = [UIImage imageWithData:smallImageData];

    return cell;
}

- (void)refresh:(UIRefreshControl *)refreshControl {
   
    [self refreshUI];
    [refreshControl endRefreshing];
    
}

-(void)refreshUI {

    [nameArray removeAllObjects];
    [artistArray removeAllObjects];
    [priceArray removeAllObjects];
    [rightsArray removeAllObjects];
    [idArray removeAllObjects];
    [smallImageArray removeAllObjects];
    [bigImageArray removeAllObjects];
    [self.tableView reloadData];
    
    [self.tableView setBackgroundView:nil];

    jsonReference = [NSString stringWithFormat:@"%@/%@/%@", @"http://itunes.apple.com/rss/", self.mediaType, @"/json"];
    NSURL *url = [NSURL URLWithString:jsonReference];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    connection = [NSURLConnection connectionWithRequest:request delegate:self];
    
    if (connection) {
        webData = [[NSMutableData alloc]init];
    }
    
    self.title = self.mediaType.description;
    
}

//static dispatch_once_t oncePredicate;
//dispatch_once(&oncePredicate, ^{
//});
@end
