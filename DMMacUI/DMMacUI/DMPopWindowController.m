//
//  DMPopWindowController.m
//  DMMacUI
//
//  Created by lbq on 2018/6/14.
//  Copyright © 2018年 lbq. All rights reserved.
//

#import "DMPopWindowController.h"
#import "BorderlessWindow.h"
#import "RoundWindowFrameView.h"
@interface DMPopWindowController ()
@property (nonatomic, strong) NSView *itemsTable;
@end

@implementation DMPopWindowController

- (instancetype)init
{
    BorderlessWindow *window = [BorderlessWindow new];
    return [super initWithWindow:window];
}

- (void)windowDidLoad {
    [super windowDidLoad];
    [self.window.contentView addSubview:self.itemsTable];
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}


- (NSUInteger)windowWidth
{
    return self.window.frame.size.width;
}

- (void)setWindowWidth:(NSUInteger)windowWith
{
    NSRect rect = self.window.frame;
    rect.size.width = windowWith;
    //    NSRect tableRect = [[self.itemsTable superview]superview].frame;
    //    tableRect.size.width = windowWith;
    //    [[[self.itemsTable superview] superview] setFrame:tableRect];
    //    self.itemsTable setFrame:
    [self.window setFrame:rect display:YES];
}


- (void)popUpContextMenuAtPoint:(NSPoint)point {
    [self loadHeightsWithWindowOrigin:point];
    [self.window orderFront:nil];
}

// 在指定的Point弹出窗口
- (void)loadHeightsWithWindowOrigin:(NSPoint)point {
    NSRect newWindowFrame = self.window.frame;
    
    int sizeOfCellsInTableView = 300;
    //    for (SYXMenuItem *item in self.menuItems) {
    //        sizeOfCellsInTableView += [self.itemsTable rectOfRow:[menuItems indexOfObject:item]].size.height;
    //    }
    
    sizeOfCellsInTableView = MIN(300,sizeOfCellsInTableView);
    
    //设置新窗口的大小
    newWindowFrame.size.height = sizeOfCellsInTableView + 10;
    newWindowFrame.origin.y = point.y - newWindowFrame.size.height - 2;
    newWindowFrame.origin.x = point.x;
    
    [self.window setFrame:newWindowFrame display:YES];
    
    //将contentView的superview改成四角都是圆角
    [(RoundWindowFrameView *)[[self.window contentView] superview] setAllCornersRounded:YES];
    //[(RoundWindowFrameView *)[[self.window contentView] superview] setProMode:YES];
    
    //设置新contentview的大小
    NSRect contentViewFrame = newWindowFrame;
    contentViewFrame.origin.x = 0;
    contentViewFrame.origin.y = 5;
    contentViewFrame.size.height -= 10;
    [self.window.contentView setFrame:contentViewFrame];
    [(RoundWindowFrameView *)[self.window contentView] setFrame:contentViewFrame];
    
    //设置tableview的大小
    //table的position是相对于contentview的，所以origin.y设置成0，而不是5
    NSRect tableOldFrame = self.itemsTable.frame;
    tableOldFrame.origin.x = 0;
    tableOldFrame.size.height = sizeOfCellsInTableView;
    tableOldFrame.origin.y = 0;
    //    [[[self.itemsTable superview] superview] setFrame:tableOldFrame];
    [self.itemsTable setFrame:tableOldFrame];
}
- (void)closeWindow
{
    //下面两行用于立即关闭窗口，而不是渐渐退隐窗口
    [self.window orderOut:nil];
}

- (NSView *)itemsTable
{
    NSView *view = [[NSView alloc] initWithFrame:CGRectMake(0, 0, 300, 178)];
    view.wantsLayer = YES;
    view.layer.backgroundColor = [NSColor redColor].CGColor;
    return view;
}

@end
