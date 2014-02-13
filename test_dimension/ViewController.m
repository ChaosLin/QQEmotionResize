//
//  ViewController.m
//  test_dimension
//
//  Created by Renton Lin on 2/13/14.
//  Copyright (c) 2014 Renton Lin. All rights reserved.
//

#import "ViewController.h"
#import "ImageUtils.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //遍历目录
    NSError* error;
    NSString* str_pathOrigin = NSTemporaryDirectory();
    NSString* str_pathToWrite = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSArray* arr_fileNames = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:str_pathOrigin error:&error];
    if (!arr_fileNames)
    {
        NSLog(@"get files error:%@", [error localizedDescription]);
    }
    else if (!str_pathToWrite)
    {
        NSLog(@"Something went wrong when search the document path");
    }
    else
    {
        NSLog(@"begin");
        for (NSString* str_fileName in arr_fileNames)
        {
            NSString* str_fullPath = [str_pathOrigin stringByAppendingPathComponent:str_fileName];
            if ([str_fileName hasSuffix:@".png"])
            {
                UIImage* image_origin = [UIImage imageWithContentsOfFile:str_fullPath];
                CGSize size_origin = image_origin.size;
                CGSize size_new = CGSizeMake((NSInteger)(size_origin.width * 0.4), (NSInteger)(size_origin.height * 0.4));
            
                UIImage* image_scaled = [ImageUtils resizeImage:image_origin toSize:size_new];
                BOOL result_save =[ImageUtils saveImage:image_scaled toPath:[str_pathToWrite stringByAppendingPathComponent:str_fileName]];
                if (!result_save)
                {
                    NSLog(@"Save image:%@ failed", str_fileName);
                }
            }
            //bmp缩略图不用自己生成
//            else if ([str_fileName hasSuffix:@".bmp"])
//            {
//                UIImage* image_origin = [UIImage imageWithContentsOfFile:str_fullPath];
//                BOOL result_save =[ImageUtils saveImage:image_origin toPath:[str_pathToWrite stringByAppendingPathComponent:str_fileName]];
//                if (!result_save)
//                {
//                    NSLog(@"Save image:%@ failed", str_fileName);
//                }
//
//            }
        }
        NSLog(@"end");
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
