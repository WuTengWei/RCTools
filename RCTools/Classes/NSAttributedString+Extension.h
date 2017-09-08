//
//  NSAttributedString+Extension.h
//  test
//
//  Created by wtw on 16/7/18.
//  Copyright © 2016年 rocedar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>

@interface NSAttributedString (Extension)

/**
 *  改变一句话中某些字的颜色
 *
 *  @param color    需要改变成的颜色
 *  @param totalStr 整句话字符串
 *  @param subArray 需要改变颜色的文字数组（如果有相同的只取第一个）
 *
 *  @return 生成后的富文本
 */
+ (NSMutableAttributedString *)tw_changeCorlorWithColor:(UIColor *)color TotalString:(NSString *)totalStr SubStringArray:(NSArray *)subArray;
/**
 *  改变句子的字间距
 *
 *  @param totalString 需要改变的字符串
 *  @param space       字间距
 *
 *  @return 生成后的富文本
 */
+ (NSMutableAttributedString *)tw_changeSpaceWithTotalString:(NSString *)totalString Space:(CGFloat)space ;

/**
 *  改变段落的行间距
 *
 *  @param totalString 需要更改的字符串
 *  @param lineSpace   行间距
 *
 *  @return 生成后的富文本
 */
+ (NSMutableAttributedString *)tw_changeLineSpaceWithTotalString:(NSString *)totalString LineSpace:(CGFloat)lineSpace;

/**
 *  同时更改行间距和字间距
 *
 *  @param totalString 需要更改的字符串
 *  @param lineSpace   行间距
 *  @param textSpace   字间距
 *
 *  @return 生成后的富文本
 */
+ (NSMutableAttributedString *)tw_changeLineAndTextSpaceWithTotalString:(NSString *)totalString LineSpace:(CGFloat)lineSpace textSpace:(CGFloat)textSpace ;

/**
 *  设置某些文字的颜色 并单独设置其字体
 *
 *  @param font        设置的字体
 *  @param color       颜色
 *  @param totalString 总的字符串
 *  @param subArray    想要改变颜色的字符串
 *
 *  @return 生成的富文本
 */
+ (NSMutableAttributedString *)tw_changeFontAndColor:(UIFont *)font Color:(UIColor *)color TotalString:(NSString *)totalString SubStringArray:(NSArray *)subArray ;

/**
 改变部分字体大小
 */
+ (NSMutableAttributedString *)tw_changeTextFontWithFont:(UIFont *)font TotalString:(NSString *)totalStr;

@end
