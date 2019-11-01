//
//  WJViewController.m
//  WJFunctionThrottle
//
//  Created by wangwanjie on 11/01/2019.
//  Copyright (c) 2019 wangwanjie. All rights reserved.
//

#import "WJViewController.h"
#import "WJFunctionThrottle.h"

@interface WJViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITextField *textfield;  ///< 输入框
@end

@implementation WJViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];

    [self setupData];
}

- (void)setupUI {
    [self.view addSubview:({
                   UITextField *view = UITextField.new;
                   view.borderStyle = UITextBorderStyleRoundedRect;
                   view.frame = CGRectMake(30, UIApplication.sharedApplication.statusBarFrame.size.height + 5, CGRectGetWidth(self.view.frame) - 60, 50);
                   [view addTarget:self action:@selector(textFieldTextChangedHandler:) forControlEvents:UIControlEventEditingChanged];
                   self.textfield = view;
                   view;
               })];

    [self.view addSubview:({
                   UITableView *view = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.textfield.frame), CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - CGRectGetMaxY(self.textfield.frame)) style:UITableViewStylePlain];
                   view.delegate = self;
                   view.dataSource = self;
                   view.rowHeight = 50;
                   view;
               })];
}

- (void)setupData {
    for (NSUInteger i = 0; i < 100; i++) {
        [WJFunctionThrottle throttleWithInterval:0.2
                                         handler:^{
                                             NSLog(@"perform index: %zd", i);
                                         }];
    }
}

#pragma mark - event response
- (void)textFieldTextChangedHandler:(UITextField *)textfield {
    NSString *text = textfield.text;
    if (text && text.length > 0) {
        [WJFunctionThrottle throttleWithInterval:0.5
                                             key:@"key"
                                         handler:^{
                                             NSLog(@"text changed, search for keyword：%@", textfield.text);
                                         }];
    } else {
        [WJFunctionThrottle throttleCancelWithKey:@"key"];
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    [self handerScrollViewDidScrollWithoutThrollteOffset:scrollView.contentOffset];

    [WJFunctionThrottle throttleWithInterval:0.1
                                        type:WJFunctionThrottleTypeInvokeOnceInEachInterval
                                     handler:^{
                                         [self handerScrollViewDidScrollWithThrollteOffset:scrollView.contentOffset];
                                     }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 新建标识
    static NSString *ID = @"cell";
    // 创建cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];

    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }

    cell.textLabel.text = [NSString stringWithFormat:@"测试数据 ---- %zd", indexPath.row];

    return cell;
}

#pragma mark - private methods
- (void)handerScrollViewDidScrollWithoutThrollteOffset:(CGPoint)offset {
    NSLog(@"%@ <----> %.0f", NSStringFromSelector(_cmd), offset.y);
}

- (void)handerScrollViewDidScrollWithThrollteOffset:(CGPoint)offset {
    NSLog(@"%@ <----> %.0f", NSStringFromSelector(_cmd), offset.y);
}
@end
