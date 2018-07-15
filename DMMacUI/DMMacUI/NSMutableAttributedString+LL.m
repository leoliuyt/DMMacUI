//
//  NSMutableAttributedString+LL.m
//  AttributeStringLink
//
//  Created by lbq on 2017/6/15.
//  Copyright © 2017年 lbq. All rights reserved.
//

#import "NSMutableAttributedString+LL.h"

@implementation NSMutableAttributedString (LL)

+(NSMutableAttributedString *)ll_makeAttributeString:(NSString *)string attribute:(void(^)(NSMutableDictionary * attributes))block
{
    NSMutableDictionary * attributes = [NSMutableDictionary dictionary];
    block(attributes);
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:string attributes:attributes];
    return attributeStr;
}

-(NSMutableAttributedString *)ll_makeAttributeStringAdd:(NSString *)string attribute:(void(^)(NSMutableDictionary * attributes))block
{
    NSMutableDictionary * attributes = [NSMutableDictionary dictionary];
    block(attributes);
    NSMutableAttributedString * as = [[NSMutableAttributedString alloc] initWithString:string attributes:attributes];
    [self appendAttributedString:as];
    return self;
}
@end
