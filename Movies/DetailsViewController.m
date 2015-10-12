//
//  DetailsViewController.m
//  Movies
//
//  Created by Thibaud Bourgeois on 10/10/2015.
//  Copyright © 2015 Thibaud Bourgeois. All rights reserved.
//

#import "DetailsViewController.h"
#import "ViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController
@synthesize details, detailsTitleUILabel, detailsUIImageView, detailsSynopsisUIText;

- (IBAction)goBack:(id)sender {
    
    ViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    
    [self presentViewController:viewController animated:NO completion:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (details != nil) {
        detailsTitleUILabel.text = [details objectForKey:@"title"];
        detailsSynopsisUIText.text = [details objectForKey:@"synopsis"];
        
        NSDictionary *posters = [details objectForKey:@"posters"];
        
        [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[posters objectForKey:@"original"]]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
            detailsUIImageView.image = [UIImage imageWithData:data];
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
