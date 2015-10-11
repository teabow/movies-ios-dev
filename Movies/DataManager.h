//
//  DataManager.h
//  Movies
//
//  Created by Thibaud Bourgeois on 11/10/2015.
//  Copyright © 2015 Thibaud Bourgeois. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject

#define MOVIES_URL @"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=7waqfqbprs7pajbz28mqf6vz&page_limit=25"

- (void) getMovies:(void (^) (NSDictionary *response))successBlock withError:(void (^) (NSError *error))errorBlock;

@end
