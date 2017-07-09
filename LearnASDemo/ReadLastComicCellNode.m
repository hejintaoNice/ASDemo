//
//  ReadLastComicCellNode.m
//  LearnASDemo
//
//  Created by hejintao on 2017/7/5.
//  Copyright © 2017年 hither. All rights reserved.
//

#import "ReadLastComicCellNode.h"
#import "HJTAsKitTool.h"
#define s_w [UIScreen mainScreen].bounds.size.width
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define HJTFont(a)  [UIFont systemFontOfSize:(a)]
@interface ReadLastComicCellNode ()

//图片
@property (nonatomic,strong) ASNetworkImageNode *coverNode;
//透明层
@property (nonatomic,strong) ASDisplayNode *alpaViewNode;
//最新章节
@property (nonatomic,strong) ASTextNode *lastChapterNode;
//漫画名字
@property (nonatomic,strong) ASTextNode *comicNameNode;

@end

@implementation ReadLastComicCellNode

-(instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self configUI];
    }
    return self;
}

-(void)configUI{
    [self configCoverWithUrl:@""];
}

-(void)configCoverWithUrl:(NSString *)url{
    ASNetworkImageNode *networkImageNode = [HJTAsKitTool nodeNetworkImageNodeAddNode:self ClipsToBounds:NO ContentMode:UIViewContentModeScaleAspectFill DefaultImage:[UIImage imageNamed:@"home_china_flag"]];
    networkImageNode.URL = [NSURL URLWithString:url];
    _coverNode = networkImageNode;
    
    ASTextNode *aplaNode = [HJTAsKitTool nodeTextNodeAddNode:self];
    aplaNode.attributedText = [HJTAsKitTool nodeAttributesStringText:@"测试测试测试" TextColor:[UIColor cyanColor] Font:HJTFont(14)];
    aplaNode.backgroundColor = [UIColor grayColor];
    CGFloat ww = IS_IPHONE ? (s_w - 40) / 3 : (s_w - 60) / 5;
    
    _lastChapterNode = aplaNode;
    
    ASTextNode *comicNameNode = [HJTAsKitTool nodeTextNodeAddNode:self];
    comicNameNode.attributedText = [HJTAsKitTool nodeAttributesStringText:@"测试测试测试1111" TextColor:[UIColor cyanColor] Font:HJTFont(14)];
    comicNameNode.backgroundColor = [UIColor grayColor];
    _comicNameNode.style.preferredSize = CGSizeMake(ww, 20);
    _comicNameNode = comicNameNode;
    
}

-(ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{
    
    CGFloat ww = IS_IPHONE ? (s_w - 40) / 3 : (s_w - 60) / 5;
    CGFloat h = ww + ww / 3 ;
    
    _coverNode.style.preferredSize = CGSizeMake(ww, h);
    
    UIEdgeInsets insets = UIEdgeInsetsMake(h-20, 0, 0, 0);
    
    ASInsetLayoutSpec *textInsetSpec = [ASInsetLayoutSpec insetLayoutSpecWithInsets:insets child:_lastChapterNode];
    
    ASOverlayLayoutSpec *overStack = [ASOverlayLayoutSpec overlayLayoutSpecWithChild:_coverNode overlay:textInsetSpec];
    
    ASStackLayoutSpec *comicNameStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:0 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsStart children:@[_comicNameNode]];
    
    ASStackLayoutSpec *allContentStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:5 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsStart children:@[overStack,comicNameStack]];

    
  return   [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) child:allContentStack];
}

@end
