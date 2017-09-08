//
//  NSString+Extension.h
//  FangZhou
//
//  Created by wtw on 16/6/6.
//  Copyright © 2016年 rocedar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDate+Extension.h"

#define NSStringFromInteger(integerValue) [NSString stringWithFormat:@"%zd", integerValue]
#define NSStringFromFloat(format, floatValue) [NSString stringWithFormat:format, floatValue]
#define NSStringFromTimestamp(timestamp, format) [NSString stringFromTimestamp:timestamp withFormat:format]
#define NSStringFromDate(date, format) [NSString stringFromDate:date withFormat:format]
#define NSIntegerFromDateString(dateString, format) [NSString timeStampFromString:dateString withFormat:format]

typedef NS_ENUM(NSInteger, MD5Type) {
    MD5Type32BitLowercase = 0,
    MD5Type32BitUppercase = 1,
    MD5Type16BitLowercase = 2,
    MD5Type16BitUppercase = 3,
};

@interface NSString (Extension)

/**
 *  追加文档目录
 *
 *  @return 返回追加文档目录后的路径
 */
- (NSString *)appendDocumentDir;

/**
 *  追加缓存目录
 *
 *  @return 返回追加缓存目录的路径
 */
- (NSString *)appendCacheDir;

/**
 *  追加临时目录
 *
 *  @return 返回追加追加临时目录的路径
 */
- (NSString *)appendTempDir;

/**
 *  获取用户设备型号
 *
 *  @return 获取设备型号
 */
+ (NSString*)deviceVersion;

/**
 *  对指定的字符串进行URLEncode编码
 *
 *  @param unencodedString 需要编码的字符串
 *
 *  @return 指定的字符串进行URLEncode编码
 */
+(NSString*)encodeString:(NSString*)unencodedString;

+ (NSString *)stringFromDate:(NSDate *)date;
+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)format;
+ (NSString *)stringFromDate:(NSDate *)date withDateFormatStyle:(DateFormatStyle)format;

- (NSString *)md5;
- (NSString *)md5WithType:(MD5Type)type;

/**
 *  时间戳转成提示的消息文字，如几小时前等
 *
 *  @param timeStamp 时间戳
 *
 *  @return 时间文字字符串
 */
+ (NSString *)timeStampToUserInfoStr:(NSInteger)timeStamp;

/**
 *  时间戳转字符串
 *
 *  @param timestamp 时间戳，单位秒
 *  @param format    日期字符串格式
 *
 *  @return 日期字符串
 */
+ (NSString *)stringFromTimestamp:(NSInteger)timestamp withFormat:(NSString *)format;
+ (NSString *)stringFromTimestamp:(NSInteger)timestamp;

/**
 *  日期字符串转时间戳
 *
 *  @param timeString 日期字符串
 *  @param format     日期字符串格式
 *
 *  @return 时间戳
 */
+ (NSInteger)timeStampFromString:(NSString *)timeString withFormat:(NSString *)format;


+ (NSString*)objectTojsonString:(id)object;

- (id)jsonStringToObject;


+ (NSString *)dateStampString:(NSString *)fileExtension;

/**
 *  将十六进制的编码转为emoji字符
 */
+ (NSString *)emojiWithIntCode:(int)intCode;

/**
 *  将十六进制的编码转为emoji字符
 */
+ (NSString *)emojiWithStringCode:(NSString *)stringCode;
- (NSString *)emoji;

/**
 *  是否为emoji字符
 */
- (BOOL)isEmoji;

/** 
 *  获取MAC地址
 */
- (NSString *)getMacAddress:(NSString *)macString;
@end
