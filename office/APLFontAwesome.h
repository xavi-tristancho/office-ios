//
//  FontAwesomeUtils.h
//  HabitissimoParticulares
//
//  Created by Jose Oliver Vidal on 7/8/15.
//  Copyright (c) 2015 Apploading. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APLFontAwesome : NSObject

+ (UILabel *)labelFromIcon:(NSString *)name
                      size:(CGFloat)size
                     color:(UIColor *)color
                     frame:(CGRect)frame;

+ (UIImage *)imageFromIcon:(NSString *)text
                      size:(CGFloat)size
                     color:(UIColor *)color
                     frame:(CGRect)frame;
@end
