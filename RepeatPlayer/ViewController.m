//
//  ViewController.m
//  RepeatPlayer
//
//  Created by Shouqiang Wei on 15/12/16.
//  Copyright © 2015年 魏守强. All rights reserved.
//

#import "ViewController.h"
#import "RepeatPlayer.h"

@interface ViewController ()

@property(nonatomic,strong) RepeatPlayer *repeatPlayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"welcome_video" ofType:@"mp4"];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    
    //类方法。
    //self.repeatPlayer = [RepeatPlayer showInView:self.view src:url];
    //[self.repeatPlayer play];
    
    self.repeatPlayer = [[RepeatPlayer alloc] initWithSrc:url];
    //self.repeatPlayer.autoPlay = true;
    [self.repeatPlayer showInView:self.view];
    
}

@end
