
//
//  NSAttributedString+Extension.m
//  test
//
//  Created by wtw on 16/7/18.
//  Copyright © 2016年 rocedar. All rights reserved.
//

#import "NSAttributedString+Extension.h"

@implementation NSAttributedString (Extension)

+ (NSMutableAttributedString *)tw_changeCorlorWithColor:(UIColor *)color TotalString:(NSString *)totalStr SubStringArray:(NSArray *)subArray {
    
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:totalStr];
    for (NSString *rangeStr in subArray) {
        
        NSRange range = [totalStr rangeOfString:rangeStr options:NSBackwardsSearch];
        [attributedStr addAttribute:NSForegroundColorAttributeName value:color range:range];
    }
    
    return attributedStr;
}

+ (NSMutableAttributedString *)tw_changeSpaceWithTotalString:(NSString *)totalString Space:(CGFloat)space {
    
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:totalString];
    long number = space;
    CFNumberRef num = CFNumberCreate(kCFAllocatorDefault,kCFNumberSInt8Type,&number);
    [attributedStr addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:NSMakeRange(0,[attributedStr length])];
    CFRelease(num);
    
    return attributedStr;
}

+ (NSMutableAttributedString *)tw_changeLineSpaceWithTotalString:(NSString *)totalString LineSpace:(CGFloat)lineSpace {
    
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:totalString];
    
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    
    [attributedStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [totalString length])];
    
    return attributedStr;
}

+ (NSMutableAttributedString *)tw_changeLineAndTextSpaceWithTotalString:(NSString *)totalString LineSpace:(CGFloat)lineSpace textSpace:(CGFloat)textSpace {
    
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:totalString];
    
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    
    [attributedStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [totalString length])];
    
    long number = textSpace;
    CFNumberRef num = CFNumberCreate(kCFAllocatorDefault,kCFNumberSInt8Type,&number);
    [attributedStr addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:NSMakeRange(0,[attributedStr length])];
    CFRelease(num);
    
    return attributedStr;
}

+ (NSMutableAttributedString *)tw_changeFontAndColor:(UIFont *)font Color:(UIColor *)color TotalString:(NSString *)totalString SubStringArray:(NSArray *)subArray {
    
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:totalString];
    
    for (NSString *rangeStr in subArray) {
        
        NSRange range = [totalString rangeOfString:rangeStr options:NSBackwardsSearch];
        
        [attributedStr addAttribute:NSForegroundColorAttributeName value:color range:range];
        [attributedStr addAttribute:NSFontAttributeName value:font range:range];
    }
    
    return attributedStr;
}

+ (NSMutableAttributedString *)tw_changeTextFontWithFont:(UIFont *)font TotalString:(NSString *)totalStr{

    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:totalStr];
    [attr addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, totalStr.length -1)];
    return attr;
}

/**
 NSFontAttributeName ：字体字号
 value值：UIFont类型
 NSParagraphStyleAttributeName ： 段落样式
 value值：NSParagraphStyle类型（其属性如下）
 lineSpacing 行间距(具体用法可查看上面的设置行间距API)
 paragraphSpacing 段落间距
 alignment 对齐方式
 firstLineHeadIndent 指定段落开始的缩进像素
 headIndent 调整全部文字的缩进像素
 NSForegroundColorAttributeName 字体颜色
 value值：UIColor类型
 NSBackgroundColorAttributeName 背景颜色
 value值：UIColor类型
 NSObliquenessAttributeName 字体粗倾斜
 value值：NSNumber类型
 NSExpansionAttributeName 字体加粗
 value值：NSNumber类型(比例) 0就是不变 1增加一倍
 NSKernAttributeName 字间距
 value值：CGFloat类型
 NSUnderlineStyleAttributeName 下划线
 value值：1或0
 NSUnderlineColorAttributeName 下划线颜色
 value值：UIColor类型
 NSStrikethroughStyleAttributeName 删除线
 value值：1或0
 NSStrikethroughColorAttributeName 删除线颜色
 value值：UIColor类型
 NSStrokeColorAttributeName 字体颜色
 value值：UIColor类型
 NSStrokeWidthAttributeName 字体描边
 value值：CGFloat
 NSLigatureAttributeName 连笔字
 value值：1或0
 NSShadowAttributeName 阴影
 value值：NSShawdow类型（下面是其属性）
 shadowOffset 影子与字符串的偏移量
 shadowBlurRadius 影子的模糊程度
 shadowColor 影子的颜色
 NSTextEffectAttributeName 设置文本特殊效果,目前只有图版印刷效果可用
 value值：NSString类型
 NSAttachmentAttributeName 设置文本附件
 value值：NSTextAttachment类型（没研究过，可自行百度研究）
 NSLinkAttributeName 链接
 value值：NSURL (preferred) or NSString类型
 NSBaselineOffsetAttributeName 基准线偏移
 value值：NSNumber类型
 NSWritingDirectionAttributeName 文字方向 分别代表不同的文字出现方向
 value值：@[@(1),@(2)]
 NSVerticalGlyphFormAttributeName 水平或者竖直文本 在iOS没卵用，不支持竖版
 value值：1竖直 0水平
  */

@end
