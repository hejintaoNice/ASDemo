//
//  HJTAsKitTool.m
//  LearnASDemo
//
//  Created by hejintao on 2017/7/4.
//  Copyright © 2017年 hither. All rights reserved.
//

#import "HJTAsKitTool.h"
#import "JXButton.h"
@implementation HJTAsKitTool

#pragma mark -复杂界面流畅性

/**
 Node富文本
 
 @param text 文本
 @param textColor 文本颜色
 @param font 字体
 */
+ (NSAttributedString *)nodeAttributesStringText:(NSString *)text TextColor:(UIColor *)textColor Font:(UIFont *)font{
    
    //快速创建富文本
    NSDictionary *attributesDic = @{NSFontAttributeName: font, NSForegroundColorAttributeName : textColor};
    NSAttributedString *attributesString = [[NSAttributedString alloc] initWithString:text attributes:attributesDic];
    return attributesString;
    
}

/**
 NodeLabel

 @param addNode 待添加的node
 @return nodeLabel
 */
+ (ASTextNode *)nodeTextNodeAddNode:(ASDisplayNode *)addNode{
    
    //只支持富文本显示
    ASTextNode *textNode = [ASTextNode new];
    //textNode.backgroundColor = [UIColor orangeColor];
    [addNode addSubnode:textNode];
    return textNode;
    
}

/**
 nodeView

 @param addNode 待添加的node
 @param backgroundColor 背景色
 @return nodeView
 */
+ (ASDisplayNode *)nodeDisplayNodeAddNode:(ASDisplayNode *)addNode BackgroundColor:(UIColor *)backgroundColor{
    
    ASDisplayNode *displayNode = [ASDisplayNode new];
    displayNode.backgroundColor = backgroundColor;
    [addNode addSubnode:displayNode];
    return displayNode;
    
}

/**
 NodeButton(文本)
 
 @param addNode 添加View
 @param title 标题
 @param titleColor 标题颜色
 @param font 字体
 @param cornerRadius 圆角
 @param backgroundColor 背景颜色
 @param contentVerticalAlignment 内容竖直对齐方式
 @param contentHorizontalAlignment 内容水平对齐方式
 */
+ (ASButtonNode *)nodeButtonNodeAddNode:(ASDisplayNode *)addNode Title:(NSString *)title TitleColor:(UIColor *)titleColor Font:(UIFont *)font CornerRadius:(CGFloat)cornerRadius BackgroundColor:(UIColor *)backgroundColor ContentVerticalAlignment:(ASVerticalAlignment)contentVerticalAlignment ContentHorizontalAlignment:(ASHorizontalAlignment)contentHorizontalAlignment{
    
    ASButtonNode *buttonNode = [ASButtonNode new];
    buttonNode.backgroundColor = backgroundColor;
    if (title) {
        [buttonNode setTitle:title withFont:font withColor:titleColor forState:UIControlStateNormal];
    }
    buttonNode.contentVerticalAlignment = contentVerticalAlignment;
    buttonNode.contentHorizontalAlignment = contentHorizontalAlignment;
    buttonNode.cornerRadius = cornerRadius;
    [addNode addSubnode:buttonNode];
    return buttonNode;
    
}

/**
 NodeButton(图文)
 
 @param addNode 添加View
 @param title 标题
 @param titleColor 标题颜色
 @param font 字体
 @param image 图片
 @param imageAlignment 图片对齐方式(前/后)
 @param cornerRadius 圆角
 @param backgroundColor 背景颜色
 @param contentVerticalAlignment 内容竖直对齐方式
 @param contentHorizontalAlignment 内容水平对齐方式
 */
+ (ASButtonNode *)nodeButtonNodeAddNode:(ASDisplayNode *)addNode Title:(NSString *)title TitleColor:(UIColor *)titleColor Font:(UIFont *)font Image:(UIImage *)image ImageAlignment:(ASButtonNodeImageAlignment)imageAlignment CornerRadius:(CGFloat)cornerRadius BackgroundColor:(UIColor *)backgroundColor ContentVerticalAlignment:(ASVerticalAlignment)contentVerticalAlignment ContentHorizontalAlignment:(ASHorizontalAlignment)contentHorizontalAlignment{
    
    ASButtonNode *buttonNode = [ASButtonNode new];
    buttonNode.backgroundColor = backgroundColor;
    if (title) {
        [buttonNode setTitle:title withFont:font withColor:titleColor forState:UIControlStateNormal];
    }
    if (image) {
        [buttonNode setImage:image forState:UIControlStateNormal];
    }
    [buttonNode setImageAlignment:imageAlignment];
    buttonNode.contentVerticalAlignment = contentVerticalAlignment;
    buttonNode.contentHorizontalAlignment = contentHorizontalAlignment;
    buttonNode.cornerRadius = cornerRadius;
    [addNode addSubnode:buttonNode];
    return buttonNode;
    
}

/**
 添加特殊的buttonNode

 @param addNode <#addNode description#>
 @param title <#title description#>
 @param titleColor <#titleColor description#>
 @param font <#font description#>
 @param image <#image description#>
 @return <#return value description#>
 */
+(ASButtonNode *)nodeSpecialButtonAddNode:(ASDisplayNode *)addNode Title:(NSString *)title
                               TitleColor:(UIColor *)titleColor
                                     Font:(UIFont *)font
                                    Image:(UIImage *)image BackgroundColor:(UIColor *)backgroundColor{
    ASButtonNode *buttonNode = [[ASButtonNode alloc]initWithViewBlock:^UIView * _Nonnull{
        JXButton *button = [[JXButton alloc]init];
        button.imageEdgeInsets = UIEdgeInsetsMake(4, 0, 4, 0);
        [button setTintColor:titleColor];
        [button setTitle:title forState:UIControlStateNormal];
        button.titleLabel.font = font;
        [button setImage:image forState:UIControlStateNormal];
        button.imageEdgeInsets = UIEdgeInsetsMake(-3, 0, 0, 0);
        return button;
    }];
    buttonNode.backgroundColor = backgroundColor;
    if (title) {
        [buttonNode setTitle:title withFont:font withColor:titleColor forState:UIControlStateNormal];
    }
    if (image) {
        [buttonNode setImage:image forState:UIControlStateNormal];
    }
    buttonNode.contentEdgeInsets = UIEdgeInsetsMake(5, 0, 5, 0);
    [buttonNode setImageAlignment:ASButtonNodeImageAlignmentBeginning];
    buttonNode.contentVerticalAlignment = ASVerticalAlignmentCenter;
    buttonNode.contentHorizontalAlignment = ASHorizontalAlignmentMiddle;
    [addNode addSubnode:buttonNode];
    return buttonNode;
}

/**
 NodeImageView(普通)
 
 @param addNode 添加View
 @param clipsToBounds 边界裁剪
 @param contentMode 显示方式(尽量使用枚举名称)
 */
+ (ASImageNode *)nodeImageNodeAddNode:(ASDisplayNode *)addNode ClipsToBounds:(BOOL)clipsToBounds ContentMode:(UIViewContentMode)contentMode{
    
    ASImageNode *imageNode = [ASImageNode new];
    //imageNode.backgroundColor = [UIColor grayColor];
    imageNode.clipsToBounds = clipsToBounds;
    imageNode.contentMode = contentMode;
    [addNode addSubnode:imageNode];
    return imageNode;
    
}

/**
 NodeImageView(网络)
 
 @param addNode 添加View
 @param clipsToBounds 边界裁剪
 @param contentMode 显示方式(尽量使用枚举名称)
 @param defaultImage 占位图
 */
+ (ASNetworkImageNode *)nodeNetworkImageNodeAddNode:(ASDisplayNode *)addNode ClipsToBounds:(BOOL)clipsToBounds ContentMode:(UIViewContentMode)contentMode DefaultImage:(UIImage *)defaultImage{
    
    //网络图片
    ASNetworkImageNode *networkImageNode = [ASNetworkImageNode new];
    networkImageNode.backgroundColor = [UIColor grayColor];
    if (defaultImage) {
        networkImageNode.defaultImage = defaultImage;
    }
    networkImageNode.clipsToBounds = clipsToBounds;
    networkImageNode.contentMode = contentMode;
    [addNode addSubnode:networkImageNode];
    return networkImageNode;
    
}


@end
