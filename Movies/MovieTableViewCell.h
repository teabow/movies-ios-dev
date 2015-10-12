//
//  MovieTableViewCell.h
//  Movies
//
//  Created by Thibaud Bourgeois on 10/10/2015.
//  Copyright © 2015 Thibaud Bourgeois. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *movieTitle;
@property (weak, nonatomic) IBOutlet UIImageView *movieImage;

@end
