//
//  DataManager.m
//  Movies
//
//  Created by Thibaud Bourgeois on 11/10/2015.
//  Copyright © 2015 Thibaud Bourgeois. All rights reserved.
//

#import "DataManager.h"
#import "AFHTTPRequestOperationManager.h"

@implementation DataManager

- (void) getMovies:(void (^) (NSDictionary *response))successBlock withError:(void (^) (NSError *error))errorBlock {
    
    AFSecurityPolicy *policy = [[AFSecurityPolicy alloc] init];
    [policy setAllowInvalidCertificates:YES];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setSecurityPolicy:policy];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager GET:MOVIES_URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        successBlock(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        errorBlock(error);
    }];
}

@end
