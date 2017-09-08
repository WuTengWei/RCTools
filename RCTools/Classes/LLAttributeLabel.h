//
//  LLAttributeLabel.h
//  LoveLier
//
//  Created by Sely on 7/27/15.
//  Copyright (c) 2015 Sely. All rights reserved.
//

#import "TTTAttributedLabel.h"

@interface LLAttributeLabel : TTTAttributedLabel

-(NSString *)configWithText:(NSString *)text patterns:(NSArray *)patterns;
-(NSString *)configWithText:(NSString *)text patterns:(NSArray *)patterns needTailor:(BOOL)needTailor;

@end
