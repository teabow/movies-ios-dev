//
//  DetailsViewController.h
//  Movies
//
//  Created by Thibaud Bourgeois on 10/10/2015.
//  Copyright © 2015 Thibaud Bourgeois. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *detailsTitleUILabel;

@property NSString *detailsTitle;

- (IBAction)goBack:(id)sender;

@end
