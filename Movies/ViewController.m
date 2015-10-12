//
//  ViewController.m
//  Movies
//
//  Created by Thibaud Bourgeois on 10/10/2015.
//  Copyright © 2015 Thibaud Bourgeois. All rights reserved.
//

#import "ViewController.h"
#import "MovieTableViewCell.h"
#import "DetailsViewController.h"
#import "DataManager.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize moviesTableView, array;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //array = [[NSArray alloc] initWithObjects:@"Movie 1", @"Movie 2", @"Movie 3", @"Movie 4", nil];
    
    DataManager *dataManager = [[DataManager alloc] init];
    [dataManager getMovies:^(NSDictionary *data) {
        NSLog(@"Data : %@", data);
        
        array = [data objectForKey:@"movies"];
        [moviesTableView reloadData];
        
    } withError:^(NSError *error) {
        NSLog(@"Error retrieving data : %@", error);
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"MovieTableViewCell";
    
    MovieTableViewCell *cell = (MovieTableViewCell *)[moviesTableView dequeueReusableCellWithIdentifier:identifier];    
    
    NSDictionary *content = [array objectAtIndex:indexPath.row];
    NSDictionary *posters = [content objectForKey:@"posters"];
        
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[posters objectForKey:@"thumbnail"]]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        cell.movieImage.image = [UIImage imageWithData:data];
    }];
    
    cell.movieTitle.text = [content objectForKey:@"title"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *currentItem = [array objectAtIndex:indexPath.row];
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Movies" message:[[NSString alloc] initWithFormat:@"Do you want to see %@", [currentItem objectForKey:@"title"]] preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    
    UIAlertAction *actionValidate = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self goToDetailsView:currentItem];
    }];
    
    [alert addAction:actionCancel];
    [alert addAction:actionValidate];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void) goToDetailsView:(NSDictionary *)item {
    DetailsViewController *detailsViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailsViewController"];
    
    detailsViewController.details = item;
    
    [self presentViewController:detailsViewController animated:NO completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
