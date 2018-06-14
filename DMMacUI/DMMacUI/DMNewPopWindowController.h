//
//  DMNewPopWindowController.h
//  DMMacUI
//
//  Created by lbq on 2018/6/14.
//  Copyright © 2018年 lbq. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface DMNewPopWindowController : NSWindowController
@property (assign)  NSUInteger windowWidth;
- (void)popUpContextMenuAtPoint:(NSPoint)point;
- (void)loadHeightsWithWindowOrigin:(NSPoint)point;
- (void)closeWindow;
@end
