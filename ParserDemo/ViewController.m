//
//  ViewController.m
//  ParserDemo
//
//  Created by jhone xu on 2021/6/13.
//

#import "ViewController.h"
#import <Masonry.h>
#import <Parse/Parse.h>
@interface ViewController ()
@property (nonatomic, strong) UITextView *titleView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleView = [[UITextView alloc] init];
    self.titleView.font =  [UIFont systemFontOfSize:30.f];;
    self.titleView.text = @"Parse 测试";
    [self.view addSubview:self.titleView];
  
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(15);
        make.top.mas_equalTo(self.view.mas_top).offset(80);
        make.width.height.mas_equalTo(300.0f);
    }];
    
    [self initParser];
}

- (void)initParser {
    [Parse initializeWithConfiguration:[ParseClientConfiguration configurationWithBlock:^(id<ParseMutableClientConfiguration> configuration) {
            configuration.applicationId = @"parseAppId";
            configuration.clientKey = @"parseClientKey";
            configuration.server = @"parseServerUrlString";
        }]];
}


@end
