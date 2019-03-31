//
//  LSIOSXVersion.m
//  OSXVersions
//
//  Created by Julian A. Fordyce on 3/30/19.
//  Copyright © 2019 Julian A. Fordyce. All rights reserved.
//

#import "LSIOSXVersion.h"

@implementation LSIOSXVersion

- (instancetype)initWithCodename:(NSString *)codename releaseDate:(NSString *)releaseDate
{
    self = [super init];
    if (self) {
        // Actually do initialization of properties in here
        _codename = codename;
        _releaseDate = releaseDate;
    }
    
    return self;
}

@end
