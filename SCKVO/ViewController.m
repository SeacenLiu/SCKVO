//
//  ViewController.m
//  SCKVO
//
//  Created by SeacenLiu on 2019/4/8.
//  Copyright © 2019 SeacenLiu. All rights reserved.
//

#import "ViewController.h"
#import "SCTest.h"
#import "NSObject+SCKVO.h"

@interface ViewController ()
@property (nonatomic, strong) SCTest *test;
@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touch");
    self.test.name = @"test1";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.test = [SCTest new];
    _test.name = @"Seacen";
    
    //    [self.test addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew|NSKeyValueObservingOptionPrior context:nil];
    [self.test sc_addObserver:self forKeyPath:@"name" options:SCKeyValueObservingOptionOld|SCKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"name"]) {
        NSLog(@"keyPath: %@, object: %@, change: %@, context: %@", keyPath, object, change, context);
    }
}

- (void)sc_observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"name"]) {
        NSLog(@"keyPath: %@, object: %@, change: %@, context: %@", keyPath, object, change, context);
    }
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"name"];
}


@end

