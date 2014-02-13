//
//  ImageResizer.h
//  test_dimension
//
//  Created by Renton Lin on 2/13/14.
//  Copyright (c) 2014 Renton Lin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageUtils : NSObject

+ (UIImage*)resizeImage:(UIImage*)image toSize:(CGSize)size;

+ (BOOL)saveImage:(UIImage*)image toPath:(NSString*)path;
@end
