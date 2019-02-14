//
//  XRKeyChainManager.m
//  ITingTest
//
//  Created by wtw on 2019/2/13.
//  Copyright © 2019 wtw. All rights reserved.
//

#import "XRKeyChainManager.h"
#import <Security/Security.h>

@implementation XRKeyChainManager

//创建生成保存数据查询条件
+ (NSMutableDictionary *)keyChainIdentifier:(NSString *)identifier {
    NSMutableDictionary *keyChainMutableDictonary = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                                     (id)kSecClassGenericPassword,
                                                     kSecClass,identifier,
                                                     kSecAttrService,identifier,
                                                     kSecAttrAccount,
                                                     kSecAttrAccessibleAfterFirstUnlock,
                                                     kSecAttrAccessible, nil];
    return keyChainMutableDictonary;
}

+ (BOOL)keyChainSavaData:(id)data withIdentifier:(NSString *)identifier {
    //获取存储的数据的条件
    NSMutableDictionary *saveQueryMutableDictionary = [self keyChainIdentifier:identifier];
    //删除旧的数据
    SecItemDelete((CFDictionaryRef)saveQueryMutableDictionary);
    //设置新的数据
    [saveQueryMutableDictionary setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(id)kSecValueData];
    //添加数据
    OSStatus saveState = SecItemAdd((CFDictionaryRef)saveQueryMutableDictionary, nil);
    //释放对象
    saveQueryMutableDictionary = nil ;
    //判断是否存储成功
    return (saveState == errSecSuccess);
}

+ (id)keyChainReadData:(NSString *)identifier {
    id idObject = nil ;
    // 通过标识获取数据查询条件
    NSMutableDictionary * keyChainReadQueryMutableDictionary = [self keyChainIdentifier:identifier];
    // 这是获取数据的时，必须提供的两个属性
    // TODO: 查询结果返回到 kSecValueData
    [keyChainReadQueryMutableDictionary setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    // TODO: 只返回搜索到的第一条数据
    [keyChainReadQueryMutableDictionary setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];
    // 创建一个数据对象
    CFDataRef keyChainData = nil ;
    // 通过条件查询数据
    if (SecItemCopyMatching((CFDictionaryRef)keyChainReadQueryMutableDictionary , (CFTypeRef *)&keyChainData) == noErr){
        @try {
            idObject = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)(keyChainData)];
        } @catch (NSException * exception){
            NSLog(@"Unarchive of search data where %@ failed of %@ ",identifier,exception);
        }
    }
    if (keyChainData) {
        CFRelease(keyChainData);
    }
    // 释放对象
    keyChainReadQueryMutableDictionary = nil;
    // 返回数据
    return idObject;
}

+ (BOOL)keyChainUpdateData:(id)data withIdentifier:(NSString *)identifier {
    // 通过标记获取数据更新的条件
    NSMutableDictionary * keyChainUpdataQueryMutableDictionary = [self keyChainIdentifier:identifier];
    // 创建更新数据字典
    NSMutableDictionary * updataMutableDictionary = [NSMutableDictionary dictionaryWithCapacity:0];
    // 存储数据
    [updataMutableDictionary setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(id)kSecValueData];
    // 获取存储的状态
    OSStatus  updataStatus = SecItemUpdate((CFDictionaryRef)keyChainUpdataQueryMutableDictionary, (CFDictionaryRef)updataMutableDictionary);
    // 释放对象
    keyChainUpdataQueryMutableDictionary = nil;
    updataMutableDictionary = nil;
    // 判断是否更新成功
    return updataStatus == errSecSuccess;
}

+ (void)keyChainDeleteData:(NSString *)identifier {
    // 获取删除数据的查询条件
    NSMutableDictionary * keyChainDeleteQueryMutableDictionary = [self keyChainIdentifier:identifier];
    // 删除指定条件的数据
    SecItemDelete((CFDictionaryRef)keyChainDeleteQueryMutableDictionary);
    // 释放内存
    keyChainDeleteQueryMutableDictionary = nil ;
}

//获取uuid
//CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
//NSString *uuid = (NSString *)CFBridgingRelease(CFUUIDCreateString (kCFAllocatorDefault,uuidRef));
@end
