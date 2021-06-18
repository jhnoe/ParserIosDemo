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
    
    [self saveObject];
}

- (void)initParser {
    [Parse initializeWithConfiguration:[ParseClientConfiguration configurationWithBlock:^(id<ParseMutableClientConfiguration> configuration) {
            configuration.applicationId = @"app1";
            configuration.clientKey = @"app1";
            configuration.server = @"http://42.193.41.185:1337/parse/";
        }]];
}

- (void)saveObject {
    PFObject *iosObj = [PFObject objectWithClassName:@"ios"];
    iosObj[@"author"] = [@"jhonexu" dataUsingEncoding:NSUTF8StringEncoding];
    iosObj[@"platform"] = [@"ios" dataUsingEncoding:NSUTF8StringEncoding];
    iosObj[@"devices"] = [@"iphone 5" dataUsingEncoding:NSUTF8StringEncoding];
    [iosObj saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if (succeeded) {
            NSLog(@"jhonexu: saveObject ok");
        } else {
            NSLog(@"jhonexu: saveObject error : %@",error);
        }
    }];
}


@end
