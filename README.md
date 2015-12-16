# RepeatPlayer
自动循环视图，使用AVPlayerLayer

#使用
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"welcome_video" ofType:@"mp4"];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    
    //类方法。
    self.repeatPlayer = [RepeatPlayer showInView:self.view src:url];
    [self.repeatPlayer play];
    
    //实例方法
    self.repeatPlayer = [[RepeatPlayer alloc] initWithSrc:url];
    //self.repeatPlayer.autoPlay = true;
    [self.repeatPlayer showInView:self.view];

