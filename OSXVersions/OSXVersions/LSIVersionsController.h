//
//  LSIVersionsController.h
//  OSXVersions
//
//  Created by Julian A. Fordyce on 3/30/19.
//  Copyright © 2019 Julian A. Fordyce. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSIVersionsController : NSObject

@property (class, readonly) LSIVersionsController *sharedController;

// func fetchVersions(completion: (Error?) -> Void)

- (void)fetchVersionsWithCompletionBlock:(void (^) (NSError *error))completionBlock;

@property NSArray *versions;

@end

NS_ASSUME_NONNULL_END
