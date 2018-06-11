//
//  ViewController.m
//  DMMacUI
//
//  Created by lbq on 2018/6/11.
//  Copyright © 2018年 lbq. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>

#import "DMLoginInputView.h"

@interface ViewController()

@property (nonatomic, strong) NSTextField *textField;

@property (nonatomic, strong) DMLoginInputView *inputView;

@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self makeUI];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (void)makeUI
{
    [self.inputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@100.);
        make.height.equalTo(@40.);
        make.center.equalTo(self.view);
    }];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        self.inputView.highlighted = YES;
//    });
}

- (DMLoginInputView *)inputView
{
    if(!_inputView){
        _inputView = [[DMLoginInputView alloc] init];
        [self.view addSubview:_inputView];
    }
    return _inputView;
}
@end
