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
@property (nonatomic, strong) DMLoginInputView *checkCode;

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
        make.width.equalTo(@310.);
        make.height.equalTo(@44.);
        make.center.equalTo(self.view);
    }];
    
    
    [self.checkCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@310.);
        make.height.equalTo(@44.);
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).offset(60.);
    }];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        self.inputView.highlighted = YES;
//    });
}

- (DMLoginInputView *)inputView
{
    if(!_inputView){
        _inputView = [[DMLoginInputView alloc] initWithType:EDMInputViewTypeNumberAndText];
        [self.view addSubview:_inputView];
    }
    return _inputView;
}

- (DMLoginInputView *)checkCode
{
    if(!_checkCode){
        _checkCode = [[DMLoginInputView alloc] initWithType:EDMInputViewTypeText];
        [self.view addSubview:_checkCode];
    }
    return _checkCode;
}
@end
