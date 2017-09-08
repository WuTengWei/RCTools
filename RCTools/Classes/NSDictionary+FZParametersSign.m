//
//  NSDictionary+FZParametersSign.m
//  FangZhou
//
//  Created by wtw on 16/6/12.
//  Copyright © 2016年 rocedar. All rights reserved.
//

#import "NSDictionary+FZParametersSign.h"
#import "NSString+Extension.h"

NSString * const kNetWorkingRequestTypePostString = @"POST";
NSString * const kNetWorkingRequestTypeGetString  = @"GET";
NSString * const kCustomSignString = @"FIT753NESS";

@implementation NSDictionary (FZParametersSign)


- (NSDictionary *)parametersSignedWithInterfaceString:(NSString *)interfaceString methodType:(NSString *)PostOrGet
{
    NSMutableString *signStr = [NSMutableString string];
    [signStr appendString:interfaceString];
    
    NSArray *keys = [self allKeys];
    NSArray *sortedKeys = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSString *key1 = (NSString *)obj1;
        NSString *key2 = (NSString *)obj2;
        
        return [key1 compare:key2];
    }];
    
    for (NSString *key in sortedKeys) {
        NSString *tempStr = [NSString stringWithFormat:@"%@=%@",key,self[key]];
        [signStr appendString:tempStr];
        [signStr appendString:@"&"];
    }
    NSString *subSignStr = [signStr substringToIndex:(signStr.length-1)];
    NSString *methodSt = [NSString stringWithFormat:@"%@%@%@",PostOrGet,subSignStr,kCustomSignString];
    NSString *md5Str = [methodSt md5];
    
    //    NSString *md5Str = [self parametersSignedStringWithInterfaceString:interfaceString methodType:PostOrGet];
    
    //添加参数
    NSMutableDictionary *newParameters = [NSMutableDictionary new];
    for (NSString *key in sortedKeys) {
        [newParameters setObject:self[key] forKey:key];
    }
    [newParameters setObject:md5Str forKey:@"sign"];
    
    return newParameters;
}

- (NSString *)parametersSignedStringWithInterfaceString:(NSString *)interfaceString methodType:(NSString *)PostOrGet
{
    NSMutableString *signStr = [NSMutableString string];
    [signStr appendString:interfaceString];
    
    NSArray *keys = [self allKeys];
    NSArray *sortedKeys = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSString *key1 = (NSString *)obj1;
        NSString *key2 = (NSString *)obj2;
        
        return [key1 compare:key2];
    }];
    
    for (NSString *key in sortedKeys) {
        NSString *tempStr = [NSString stringWithFormat:@"%@=%@",key,self[key]];
        [signStr appendString:tempStr];
        [signStr appendString:@"&"];
    }
    NSString *subSignStr = [signStr substringToIndex:(signStr.length-1)];
    NSString *methodSt = [NSString stringWithFormat:@"%@%@%@",PostOrGet,subSignStr,kCustomSignString];
    NSString *md5Str = [methodSt md5];
    
    return md5Str;
}

- (NSString *)signedStringWithMethod:(NSString *)method urlString:(NSString *)urlString sign:(NSString *)signString {
    
    NSArray *keys = [self allKeys];
    keys = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2];
    }];
    NSString *body = @"";
    for (NSString *key in keys) {
        body = [body stringByAppendingFormat:@"%@=%@", key, self[key]];
    }
    //    body = [body substringFromIndex:1];
    
    NSString *stringToSign = [NSString stringWithFormat:@"%@%@%@%@", method, urlString, body,signString] ;
    
    NSString *encodestr = [[NSString encodeString:stringToSign] stringByReplacingOccurrencesOfString:@"%20" withString:@"+"];
    
    return [encodestr md5];
    
    //    return [stringToSign md5];
}

- (NSDictionary *)dictionaryWithMethod:(NSString *)method urlString:(NSString *)urlString sign:(NSString *)signString {
    NSMutableDictionary *dict = [self mutableCopy];
    dict[@"sign"] = [self signedStringWithMethod:method urlString:urlString sign:signString];
    return [dict copy];
}

- (NSString *)queryString {
    NSArray *keys = [self allKeys];
    keys = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2];
    }];
    NSString *queryString = @"";
    for (NSString *key in keys) {
        queryString = [queryString stringByAppendingFormat:@"&%@=%@", key, self[key]];
    }
    if (queryString.length>1) {
        
        queryString = [queryString substringFromIndex:1];
    }
    return queryString;
}


@end
