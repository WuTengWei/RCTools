//
//  XRKeyChainManager.h
//  ITingTest
//
//  Created by wtw on 2019/2/13.
//  Copyright © 2019 wtw. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XRKeyChainManager : NSObject

/**
 保存数据

 @param data 要存储的数据
 @param identifier 存储数据的标识
 @return 返回成功失败
 */
+ (BOOL)keyChainSavaData:(id)data withIdentifier:(NSString *)identifier;


/**
 读取数据

 @param identifier 存储数据的标识
 @return 返回读取到的数据
 */
+ (id)keyChainReadData:(NSString *)identifier;


/**
 更新数据

 @param data 待更新数据
 @param identifier 存储数据的标识
 @return 返回成功失败
 */
+ (BOOL)keyChainUpdateData:(id)data withIdentifier:(NSString *)identifier;


/**
 删除数据

 @param identifier 存储数据的标识
 */
+ (void)keyChainDeleteData:(NSString *)identifier;

@end

NS_ASSUME_NONNULL_END
