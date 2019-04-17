//
//  UIColor+Custom.h
//  ShutOut
//
//  Created by 袁秘密 on 2019/3/21.
//  Copyright © 2019年 Yuanmimi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Custom)

/**
 *  16进制转换成color
 *
 *  @param stringToConvert 字体的颜色值
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *) stringToConvert;

@end

NS_ASSUME_NONNULL_END
