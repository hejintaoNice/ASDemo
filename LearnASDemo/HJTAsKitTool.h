//
//  HJTAsKitTool.h
//  LearnASDemo
//
//  Created by hejintao on 2017/7/4.
//  Copyright © 2017年 hither. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AsyncDisplayKit/AsyncDisplayKit.h>

@interface HJTAsKitTool : NSObject

+ (NSAttributedString *)nodeAttributesStringText:(NSString *)text
                                       TextColor:(UIColor *)textColor
                                            Font:(UIFont *)font;
//nodeLabel
+ (ASTextNode *)nodeTextNodeAddNode:(ASDisplayNode *)addNode;
//nodeView
+ (ASDisplayNode *)nodeDisplayNodeAddNode:(ASDisplayNode *)addNode
                          BackgroundColor:(UIColor *)backgroundColor;
//nodeButton 纯文本
+ (ASButtonNode *)nodeButtonNodeAddNode:(ASDisplayNode *)addNode
                                  Title:(NSString *)title
                             TitleColor:(UIColor *)titleColor
                                   Font:(UIFont *)font
                           CornerRadius:(CGFloat)cornerRadius
                        BackgroundColor:(UIColor *)backgroundColor
               ContentVerticalAlignment:(ASVerticalAlignment)contentVerticalAlignment
             ContentHorizontalAlignment:(ASHorizontalAlignment)contentHorizontalAlignment;
//nodeButton 图文
+ (ASButtonNode *)nodeButtonNodeAddNode:(ASDisplayNode *)addNode
                                  Title:(NSString *)title
                             TitleColor:(UIColor *)titleColor
                                   Font:(UIFont *)font
                                  Image:(UIImage *)image
                         ImageAlignment:(ASButtonNodeImageAlignment)imageAlignment
                           CornerRadius:(CGFloat)cornerRadius
                        BackgroundColor:(UIColor *)backgroundColor
               ContentVerticalAlignment:(ASVerticalAlignment)contentVerticalAlignment
             ContentHorizontalAlignment:(ASHorizontalAlignment)contentHorizontalAlignment;
//NodeImageView  本地图片
+ (ASImageNode *)nodeImageNodeAddNode:(ASDisplayNode *)addNode
                        ClipsToBounds:(BOOL)clipsToBounds
                          ContentMode:(UIViewContentMode)contentMode;
//NodeImageView   网络图片
+ (ASNetworkImageNode *)nodeNetworkImageNodeAddNode:(ASDisplayNode *)addNode
                                      ClipsToBounds:(BOOL)clipsToBounds
                                        ContentMode:(UIViewContentMode)contentMode
                                       DefaultImage:(UIImage *)defaultImage;

//nodeButton  图在上 文字在下
+(ASButtonNode *)nodeSpecialButtonAddNode:(ASDisplayNode *)addNode Title:(NSString *)title
                        TitleColor:(UIColor *)titleColor
                              Font:(UIFont *)font
                             Image:(UIImage *)image BackgroundColor:(UIColor *)backgroundColor;

@end
