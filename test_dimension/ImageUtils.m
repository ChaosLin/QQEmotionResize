//
//  ImageResizer.m
//  test_dimension
//
//  Created by Renton Lin on 2/13/14.
//  Copyright (c) 2014 Renton Lin. All rights reserved.
//

#import "ImageUtils.h"

@implementation ImageUtils

+ (UIImage*)resizeImage:(UIImage*)image toSize:(CGSize)size
{
    if (!image)
    {
        return nil;
    }
    else
    {
        UIGraphicsBeginImageContext(size);
        [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
        UIImage* image_return = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image_return;
    }
}

+ (BOOL)saveImage:(UIImage*)image toPath:(NSString*)path
{
    if (!image || !path)
    {
        return NO;
    }
    else
    {
        NSLog(@"write file to path :%@", path);
        NSData* data_image = UIImagePNGRepresentation(image);
        return [data_image writeToFile:path atomically:YES];
    }
}
@end
