//
//  LLAttributeLabel.m
//  LoveLier
//
//  Created by Sely on 7/27/15.
//  Copyright (c) 2015 Sely. All rights reserved.
//

#import "LLAttributeLabel.h"

@interface LLAttributeLabel()


@end

#define MAX_LENGTH 35

@implementation LLAttributeLabel

-(NSString *)configWithText:(NSString *)text patterns:(NSArray *)patterns
{
    return [self configWithText:text patterns:patterns needTailor:NO];
}

-(NSString *)configWithText:(NSString *)text patterns:(NSArray *)patterns needTailor:(BOOL)needTailor
{
    if (needTailor)
    {
        text = [self tailorString:text withPatterns:patterns];
    }
    __weak LLAttributeLabel *weakself = self;
    [self setText:text afterInheritingLabelAttributesAndConfiguringWithBlock:^ NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
        
        NSArray *array = [weakself applyStylesToText:text pattern:[weakself patternExpressionWithPatterns:patterns]];
        
        UIFont *boldSystemFont = [UIFont systemFontOfSize:weakself.font.pointSize];
        CTFontRef font = CTFontCreateWithName((__bridge CFStringRef)boldSystemFont.fontName, boldSystemFont.pointSize, NULL);
        for (NSTextCheckingResult *result in array)
        {
            if (font) {
                [mutableAttributedString addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)font range:result.range];
                [mutableAttributedString addAttribute:(id)kCTForegroundColorAttributeName value:(id)[UIColor getColor:FZBASIC_COLOR].CGColor range:result.range];
            }
        }
        CFRelease(font);
        return mutableAttributedString;
    }];
    return text;
}

-(NSString *)tailorString:(NSString *)string withPatterns:(NSArray *)patterns
{
    
    NSInteger firstLocation = string.length;
    NSString *tailoredString = string;
    for (NSString *pattern in patterns)
    {
        NSRange range = [string rangeOfString:pattern];
        if(range.location < firstLocation)
        {
            firstLocation = range.location;
        }
    }
    if (firstLocation == string.length)
    {
        firstLocation = 0;
    }
    
    NSRange firstRange = NSMakeRange(firstLocation, MAX_LENGTH);
    
    if (firstRange.location > MAX_LENGTH)
    {
        if (string.length - firstRange.location > MAX_LENGTH)
        {
            //            firstRange.length = string.length - firstRange.location;
            tailoredString = [NSString stringWithFormat:@"...%@...", [string substringWithRange:firstRange]];
        }
        else
        {
            firstRange.location = string.length - MAX_LENGTH;
            tailoredString = [NSString stringWithFormat:@"...%@", [string substringWithRange:firstRange]];
        }
    }
    else
    {
        if (firstRange.location + firstRange.length < string.length)
        {
            firstRange.location = 0;
            tailoredString = [NSString stringWithFormat:@"%@...", [string substringWithRange:firstRange]];
        }
    }
    return tailoredString;
}

-(NSString *)patternExpressionWithPatterns:(NSArray *)patterns
{
    return [NSString stringWithFormat:@"(%@)", [patterns componentsJoinedByString:@"|"]];
}

- (NSArray *)applyStylesToText:(NSString *)text pattern:(NSString *)pattern
{
    NSMutableArray *arrya = [NSMutableArray array];
    NSRange searchRange = NSMakeRange(0, text.length);
    NSRange paragaphRange = [text paragraphRangeForRange: searchRange];
    
    NSRegularExpression *regex = [self expressionForDefinitionWithPattern:pattern];
    
    [regex enumerateMatchesInString:text options:0 range:paragaphRange
                         usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
                             [arrya addObject:result];
                         }];
    return arrya;
}

- (NSRegularExpression *)expressionForDefinitionWithPattern:(NSString *)pattern
{
    NSRegularExpression *expression = nil;
    expression = [NSRegularExpression regularExpressionWithPattern:pattern
                                                           options:NSRegularExpressionCaseInsensitive error:nil];
    
    return expression;
}

@end
