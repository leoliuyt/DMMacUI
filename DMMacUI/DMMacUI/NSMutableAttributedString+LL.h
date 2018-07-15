//
//  NSMutableAttributedString+LL.h
//  AttributeStringLink
//
//  Created by lbq on 2017/6/15.
//  Copyright © 2017年 lbq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableAttributedString (LL)

+(NSMutableAttributedString *)ll_makeAttributeString:(NSString *)string attribute:(void(^)(NSMutableDictionary * attributes))block;

-(NSMutableAttributedString *)ll_makeAttributeStringAdd:(NSString *)string attribute:(void(^)(NSMutableDictionary * attributes))block;

@end
