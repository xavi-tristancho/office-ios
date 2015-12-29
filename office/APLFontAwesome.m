//
//  FontAwesomeUtils.m
//  HabitissimoParticulares
//
//  Created by Jose Oliver Vidal on 7/8/15.
//  Copyright (c) 2015 Apploading. All rights reserved.
//

#import "APLFontAwesome.h"

@implementation APLFontAwesome

+ (UIFont *)font:(CGFloat)size
{
    return [UIFont fontWithName:@"FontAwesome" size:size];;
}

+ (UILabel *)labelFromIcon:(NSString *)name
                      size:(CGFloat)size
                     color:(UIColor *)color
                     frame:(CGRect)frame
{
    UILabel *view = [[UILabel alloc] initWithFrame:frame];

    view.text = name;
    view.font = [self font:size];
    
    if (color != nil)
    {
        view.textColor = color;
    }
    
    return view;
}

+ (UIImage*)imageFromIcon:(NSString *)text
                     size:(CGFloat)size
                    color:(UIColor *)color
                    frame:(CGRect)frame
{
    CGRect rect = frame;
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    UIImage *image = [[UIImage alloc] init];
    [image drawInRect:rect];
    
    UIFont *font = [self font:size];
    
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    style.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{NSFontAttributeName            : font,
                                 NSStrokeColorAttributeName     : color,
                                 NSForegroundColorAttributeName : color,
                                 NSParagraphStyleAttributeName  : style
                                 };
    
    [text drawAtPoint:CGPointMake(0,0) withAttributes:attributes];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
