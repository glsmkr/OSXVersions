//
//  LSIOSXVersion.h
//  OSXVersions
//
//  Created by Julian A. Fordyce on 3/30/19.
//  Copyright © 2019 Julian A. Fordyce. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSIOSXVersion : NSObject

- (instancetype)initWithCodename:(NSString *)codename releaseDate:(NSString *)releaseDate;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property NSString *codename;
@property NSString *releaseDate;

@end

NS_ASSUME_NONNULL_END
