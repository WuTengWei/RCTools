//
//  NSString+Extension.m
//  FangZhou
//
//  Created by wtw on 16/6/6.
//  Copyright © 2016年 rocedar. All rights reserved.
//

#import "NSString+Extension.h"
#import <CommonCrypto/CommonDigest.h>
#import "sys/utsname.h"

#define EmojiCodeToSymbol(c) ((((0x808080F0 | (c & 0x3F000) >> 4) | (c & 0xFC0) << 10) | (c & 0x1C0000) << 18) | (c & 0x3F) << 24)

@implementation NSString (Extension)

/**
 *  追加文档目录
 *
 *  @return 返回追加文档目录后的路径
 */
-(NSString *)appendDocumentDir {
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    return [path stringByAppendingPathComponent:self];
}

/**
 *  追加缓存目录
 *
 *  @return 返回追加缓存目录的路径
 */
- (NSString *)appendCacheDir {
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject];
    return [path stringByAppendingPathComponent:self];
}

/**
 *  追加临时目录
 *
 *  @return 返回追加追加临时目录的路径
 */
- (NSString *)appendTempDir {
    NSString *path = NSTemporaryDirectory();
    return [path stringByAppendingPathComponent:self];
}

+ (NSString *)stringFromDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter =[[NSDateFormatter alloc] init];
    dateFormatter.calendar = [NSCalendar currentCalendar];
    dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    return [dateFormatter stringFromDate:date];
}

+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)format
{
    NSDateFormatter *dateFormatter =[[NSDateFormatter alloc] init];
    dateFormatter.calendar = [NSCalendar currentCalendar];
    dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [dateFormatter setDateFormat: format];
    return [dateFormatter stringFromDate:date];
}

+ (NSString *)stringFromDate:(NSDate *)date withDateFormatStyle:(DateFormatStyle)format{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.calendar = [NSCalendar currentCalendar];
    dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    switch (format) {
        case DateFormatYMDHMS: {
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            break;
        }
        case DateFormatYMDHM: {
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
            break;
        }
        case DateFormatYMD: {
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
            break;
        }
        case DateFormatMDHMS: {
            [dateFormatter setDateFormat:@"MM-dd HH:mm:ss"];
            break;
        }
        case DateFormatMDHM: {
            [dateFormatter setDateFormat:@"MM-dd HH:mm"];
            break;
        }
        case DateFormatMD: {
            [dateFormatter setDateFormat:@"MM-dd"];
            break;
        }
        case DateFormatHMS: {
            [dateFormatter setDateFormat:@"HH:mm:ss"];
            break;
        }
        case DateFormatHM: {
            [dateFormatter setDateFormat:@"HH:mm"];
            break;
        }
        case DateFormatMS: {
            [dateFormatter setDateFormat:@"mm:ss"];
            break;
        }
        default: {
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            break;
        }
    }
    
    return [dateFormatter stringFromDate:date];
}

/**
 *  时间戳转字符串
 *
 *  @param timestamp 时间戳，单位秒
 *  @param format    日期字符串格式
 *
 *  @return 日期字符串
 */
+ (NSString *)stringFromTimestamp:(NSInteger)timestamp withFormat:(NSString *)format {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp];
    return [self stringFromDate:date withFormat:format];
}

+ (NSString *)stringFromTimestamp:(NSInteger)timestamp {
    return [self stringFromTimestamp:timestamp withFormat:@"yyyy-MM-dd HH:mm:ss"];
}

- (NSString *)md5 {
    return [self md5WithType:MD5Type32BitLowercase];
}

- (NSString *)md5WithType:(MD5Type)type {
    
    const char *original_str = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, (CC_LONG)strlen(original_str), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [hash appendFormat:@"%02X", result[i]];
    
    NSString *MD5Strubg = @"";
    
    switch (type) {
        case MD5Type16BitLowercase:
            MD5Strubg = [[hash lowercaseString] substringWithRange:NSMakeRange(8, 16)];
            break;
        case MD5Type16BitUppercase:
            MD5Strubg = [[hash uppercaseString] substringWithRange:NSMakeRange(8, 16)];
            break;
        case MD5Type32BitLowercase:
            MD5Strubg = [hash lowercaseString];
            break;
        case MD5Type32BitUppercase:
            MD5Strubg = [hash uppercaseString];
            break;
    }
    return MD5Strubg;
}

/**
 *  时间戳转成提示的消息文字，如几小时前等
 *
 *  @param timeStamp 时间戳
 *
 *  @return 时间文字字符串
 */
+ (NSString *)timeStampToUserInfoStr:(NSInteger)timeStamp {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    NSDate *now  = [NSDate date];
    NSTimeInterval timeInterval = [now timeIntervalSinceDate:date];
    
    NSInteger theMinute = timeInterval / 60;
    NSInteger theHour   = timeInterval / (60*60);
    
    if (theMinute <= 0) {
        return @"刚刚";
    }
    else if (theMinute > 0 && theMinute < 30) {
        return [NSString stringWithFormat:@"%zd分钟前",theMinute];
    }
    else if (theMinute == 30) {
        return @"半小时前";
    }
    else if (theMinute > 30 && theMinute < 60) {
        return [NSString stringWithFormat:@"%zd分钟前",theMinute];
    }
    else if (theMinute >= 60 && theHour < 24) {
        return [NSString stringWithFormat:@"%zd小时前",theHour];
    }
    else if (theHour >= 24 && theHour <48) {
        return @"1天前";
    }
    else {
        return [self stringFromDate:date];
    }
}

/**
 *  日期字符串转时间戳
 *
 *  @param timeString 日期字符串
 *  @param format     日期字符串格式
 *
 *  @return 时间戳
 */
+ (NSInteger)timeStampFromString:(NSString *)timeString withFormat:(NSString *)format {
    NSDate *date = [NSDate dateFromString:timeString withFormat:format];
    return [date timeIntervalSince1970];
}

+ (NSString*)objectTojsonString:(id)object
{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:0 // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (jsonData != nil && error == nil){
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }else{
        // 解析错误
        return nil;
    }
    
}
- (id)jsonStringToObject{
    
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *error = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData
                                                    options:NSJSONReadingAllowFragments
                                                      error:&error];
    if (jsonObject != nil && error == nil){
        return jsonObject;
    }else{
        // 解析错误
        return nil;
    }
}

+ (NSString *)dateStampString:(NSString *)fileExtension {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat    = @"yyyyMMddHHmmss";
    NSString *stamp =[NSString stringWithFormat:@"%@%04d", [dateFormatter stringFromDate:[NSDate date]], rand()%10000];
    if (!fileExtension) {
        return stamp;
    }
    return [stamp stringByAppendingPathExtension:fileExtension];
}

/**
 *  获取用户设备型号
 *
 *  @return 获取设备型号
 */
+ (NSString*)deviceVersion
{
    // 需要#import "sys/utsname.h"
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    //iPhone
    if ([deviceString isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([deviceString isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([deviceString isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,3"])    return @"iPhone 5C";
    if ([deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone 5C";
    if ([deviceString isEqualToString:@"iPhone6,1"])    return @"iPhone 5S";
    if ([deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone 5S";
    if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceString isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([deviceString isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    
    return deviceString;
}

/**
 *  对字符串进行URLEncode
 *
 *  @param unencodedString 需要进行URLEncode的字符串
 *
 *  @return 返回URLEncode后的串
 */
+(NSString*)encodeString:(NSString*)unencodedString{
    
    // CharactersToBeEscaped = @":/?&=;+!@#$()~',*";
    
    // CharactersToLeaveUnescaped = @"[].";
    
    NSString *encodedString = (NSString *)
    
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              
                                                              (CFStringRef)unencodedString,
                                                              NULL,
                                                              (CFStringRef)@"!*'();:@&=+$,~/?%#[]",
                                                              kCFStringEncodingUTF8));
    
    return encodedString;
    
}

/**
 *  将十六进制的编码转为emoji字符
 */
+ (NSString *)emojiWithIntCode:(int)intCode {
    int symbol = EmojiCodeToSymbol(intCode);
    NSString *string = [[NSString alloc] initWithBytes:&symbol length:sizeof(symbol) encoding:NSUTF8StringEncoding];
    if (string == nil) { // 新版Emoji
        string = [NSString stringWithFormat:@"%C", (unichar)intCode];
    }
    return string;
}

- (NSString *)emoji
{
    return [NSString emojiWithStringCode:self];
}

/**
 *  将十六进制的编码转为emoji字符
 */
+ (NSString *)emojiWithStringCode:(NSString *)stringCode
{
    char *charCode = (char *)stringCode.UTF8String;
    int intCode = (int)strtol(charCode, NULL, 16);
    return [self emojiWithIntCode:intCode];
}

// 判断是否是 emoji表情
- (BOOL)isEmoji
{
    BOOL returnValue = NO;
    
    const unichar hs = [self characterAtIndex:0];
    // surrogate pair
    if (0xd800 <= hs && hs <= 0xdbff) {
        if (self.length > 1) {
            const unichar ls = [self characterAtIndex:1];
            const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
            if (0x1d000 <= uc && uc <= 0x1f77f) {
                returnValue = YES;
            }
        }
    } else if (self.length > 1) {
        const unichar ls = [self characterAtIndex:1];
        if (ls == 0x20e3) {
            returnValue = YES;
        }
    } else {
        // non surrogate
        if (0x2100 <= hs && hs <= 0x27ff) {
            returnValue = YES;
        } else if (0x2B05 <= hs && hs <= 0x2b07) {
            returnValue = YES;
        } else if (0x2934 <= hs && hs <= 0x2935) {
            returnValue = YES;
        } else if (0x3297 <= hs && hs <= 0x3299) {
            returnValue = YES;
        } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
            returnValue = YES;
        }
    }
    
    return returnValue;
}

#pragma mark - 获取MAC地址
- (NSString *)getMacAddress:(NSString *)macString {
    
    NSMutableArray *arrayM = [NSMutableArray array];
    while([macString length] > 0) {
        if ([macString length] == 1) {
            [arrayM addObject:macString];
            break;
        }
        int index = 2;
        NSString *subStr = [macString substringToIndex:index];
        NSString *newSubString = @"";
        if (macString.length != 2) {
            newSubString = [subStr stringByAppendingString:@":"];
        }else {
            [arrayM addObject:subStr];
            
        }
        macString = [macString substringFromIndex:index];
        [arrayM addObject:newSubString];
    }
    NSString *stringM = @"";
    for (int i = 0; i < arrayM.count; i++) {
        NSString *arrayString = arrayM[i];
        stringM = [stringM stringByAppendingString:arrayString];
    }
    return stringM;
}

@end
