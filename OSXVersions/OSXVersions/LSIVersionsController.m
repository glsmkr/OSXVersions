//
//  LSIVersionsController.m
//  OSXVersions
//
//  Created by Julian A. Fordyce on 3/30/19.
//  Copyright © 2019 Julian A. Fordyce. All rights reserved.
//

#import "LSIVersionsController.h"
#import "LSIOSXVersion.h"

NSString *baseURL = @"https://osx-versions.firebaseio.com/.json";

@implementation LSIVersionsController

- (void)fetchVersionsWithCompletionBlock:(void (^)(NSError *))completionBlock
{
    // use data task to fetch data
    NSURL *url = [NSURL URLWithString:baseURL];
    
    // check for an error
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *  data, NSURLResponse *  response, NSError *  error) {
        if (error !=nil) {
            NSLog(@"Error fetching versions data: %@", error);
            completionBlock(error);
            return;
        }
        
        // decode data
        NSArray *versionDictionaries = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        if (versionDictionaries == nil) {
            NSLog(@"Error decoding versions JSON: %@", error);
            completionBlock(error);
            return;
        }
        
        NSMutableArray *versions = [[NSMutableArray alloc] init];
        for (NSDictionary *dictionary in versionDictionaries) {
//            NSString *codename = dictionary[@"codename"];
//            NSString *releaseDate = dictionary[@"releaseDate"];
//            LSIOSXVersion *version = [[LSIOSXVersion alloc] initWithCodename:codename releaseDate:releaseDate];
            LSIOSXVersion *version = [[LSIOSXVersion alloc] initWithDictionary:dictionary];
            if (version != nil) { [versions addObject:version]; }
//            
        }
        
        // assign data to our array
        self.versions = versions;
        completionBlock(nil);
    }];
    [dataTask resume];
}

@end
