//
//  URCommonTool.m
//  OnlineClassTest
//
//  Created by shen zhen on 13-6-21.
//  Copyright (c) 2013年 沈桢. All rights reserved.
//

#import "URCommonTool.h"
#import <CoreGraphics/CoreGraphics.h>

@implementation URCommonTool

/*
 * 函数作用: 获取uuid
 * 函数参数: 
 * 函数返回值: uuid
 */
+(NSString *)uuid{
    CFUUIDRef puuid = CFUUIDCreate( nil );
    CFStringRef uuidString = CFUUIDCreateString( nil, puuid );
    NSString * result = (NSString *)CFStringCreateCopy( NULL, uuidString);
    CFRelease(puuid);
    CFRelease(uuidString);
    return [result autorelease];
}

/*
 * 函数作用: 压缩图片
 * 函数参数:
 * 函数返回值:
 */
+(UIImage *)compressImage:(UIImage *)image width:(float)width height:(float)height
{
    float imageWidth = image.size.width;
    float imageHeight = image.size.height;
    
    float widthScale = imageWidth /width;
    float heightScale = imageHeight /height;
    
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    
    if (widthScale > heightScale) {
        [image drawInRect:CGRectMake(0, 0, imageWidth /heightScale , height)];
    }
    else {
        [image drawInRect:CGRectMake(0, 0, width , imageHeight /widthScale)];
    }
    
    // 从当前context中创建一个改变大小后的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    [newImage retain];
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    return newImage;
    
}


//将string转换成MD5格式数据,需引进库<CommonCrypto/CommonDigest.h>
+ (NSString *)stringToMD5Value:(NSString *)string
{
	if (string==nil)
    {
		return nil;
	}
    const char *cStr = [string UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr), result );
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15]
            ];
}

@end
