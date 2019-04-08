//
//  NSObject+SCKVO.h
//  KVO 实现
//
//  Created by SeacenLiu on 2019/3/10.
//  Copyright © 2019 SeacenLiu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_OPTIONS(NSUInteger, SCKeyValueObservingOptions) {
    SCKeyValueObservingOptionNew = 1 << 0,
    SCKeyValueObservingOptionOld = 1 << 1,
    SCKeyValueObservingOptionInitial = 1 << 2,
    SCKeyValueObservingOptionPrior = 1 << 3
};

@interface NSObject (SCKVO)
- (void)sc_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(SCKeyValueObservingOptions)options context:(nullable void *)context;
- (void)sc_removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath context:(nullable void *)context;
- (void)sc_removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath;

- (void)sc_observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary*)change context:(nullable void *)context;

// TODO: - Block 实现
@end

NS_ASSUME_NONNULL_END
