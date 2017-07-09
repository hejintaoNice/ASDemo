//
//  ReadPageLastNode.m
//  LearnASDemo
//
//  Created by hejintao on 2017/7/5.
//  Copyright © 2017年 hither. All rights reserved.
//

#import "ReadPageLastNode.h"
#import "HJTAsKitTool.h"
#import "ReadLastComicCellNode.h"

#define HJTFont(a)  [UIFont systemFontOfSize:(a)]
#define GETSIZE(t,s,d) ([t boundingRectWithSize:s options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:d context:nil].size)
#define FONTWITHSIZE(s) [UIFont systemFontOfSize:s]
#define s_w [UIScreen mainScreen].bounds.size.width
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

@interface ReadPageLastNode ()<ASCollectionDelegate,ASCollectionDataSource>
//小女孩图片
@property (nonatomic,strong) ASImageNode *wawaImgNode;
//提示文字
@property (nonatomic,strong) ASTextNode *upTipNode;
//上线条
@property (nonatomic,strong) ASDisplayNode *upLineNode;
//上方粗线条
@property (nonatomic,strong) ASDisplayNode *upBoldLineNode;
//下方粗线条
@property (nonatomic,strong) ASDisplayNode *downBoldLineNode;
//容器
@property (nonatomic,strong) ASDisplayNode *containNode;
//返回
@property (nonatomic,strong) ASButtonNode *backNode;
//收藏
@property (nonatomic,strong) ASButtonNode *collectNode;
//分享
@property (nonatomic,strong) ASButtonNode *shareNode;
//评论
@property (nonatomic,strong) ASButtonNode *commentNode;
//下线条
@property (nonatomic,strong) ASDisplayNode *downLineNode;
//下方提示文字
@property (nonatomic,strong) ASTextNode *downTipNode;
//刷新按钮
@property (nonatomic,strong) ASButtonNode *refreshBtn;
//collection
@property (nonatomic,strong) ASCollectionNode *mainCollectionNode;
@end

@implementation ReadPageLastNode

-(instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self configData];
    }
    return self;
}

-(void)configData{
    [self configImg:[UIImage imageNamed:@"形象卡通（有底色）末页"]];
    [self configLightLine];
    [self configUpTip];
    [self configBtnContain];
    [self configBoldLine];
    [self configToolBar];
    [self configCollectionNode];
}

-(void)configImg:(UIImage *)image{
    ASImageNode *imageNode = [HJTAsKitTool nodeImageNodeAddNode:self ClipsToBounds:NO ContentMode:UIViewContentModeScaleToFill];
    imageNode.image = image;
    imageNode.style.layoutPosition = CGPointMake(30, 0);
    imageNode.style.preferredSize = CGSizeMake(113, 95);
    _wawaImgNode = imageNode;

}

-(void)configLightLine{
    ASDisplayNode *upLineNode = [HJTAsKitTool nodeDisplayNodeAddNode:self BackgroundColor:[UIColor cyanColor]];
    upLineNode.style.preferredSize = CGSizeMake(s_w,1);
    _upLineNode = upLineNode;
    
    ASDisplayNode *downLineNode = [HJTAsKitTool nodeDisplayNodeAddNode:self BackgroundColor:[UIColor cyanColor]];
    downLineNode.style.preferredSize = CGSizeMake(s_w, 1);
    _downLineNode = downLineNode;
}

-(void)configUpTip{
    ASTextNode *textNode = [HJTAsKitTool nodeTextNodeAddNode:self];
    textNode.attributedText = [HJTAsKitTool nodeAttributesStringText:@"测试测试测试" TextColor:[UIColor cyanColor] Font:HJTFont(14)];
    _upTipNode = textNode;
}

-(void)configBtnContain{

    ASButtonNode *buttonNode1 = [HJTAsKitTool nodeSpecialButtonAddNode:self Title:@"返回" TitleColor:[UIColor whiteColor] Font:HJTFont(14) Image:[UIImage imageNamed:@"返回（底色"] BackgroundColor:[UIColor grayColor]];
        buttonNode1.style.preferredSize = CGSizeMake(s_w/4, 70);
    _backNode = buttonNode1;
    
    ASButtonNode *buttonNode2 = [HJTAsKitTool nodeSpecialButtonAddNode:self Title:@"收藏" TitleColor:[UIColor whiteColor] Font:HJTFont(14) Image:[UIImage imageNamed:@"收藏（底色"] BackgroundColor:[UIColor grayColor]];
    buttonNode2.style.preferredSize = CGSizeMake(s_w/4, 70);
    _collectNode = buttonNode2;
    
    ASButtonNode *buttonNode3 = [HJTAsKitTool nodeSpecialButtonAddNode:self Title:@"分享" TitleColor:[UIColor whiteColor] Font:HJTFont(14) Image:[UIImage imageNamed:@"分享（底色"] BackgroundColor:[UIColor grayColor]];
    buttonNode3.style.preferredSize = CGSizeMake(s_w/4, 70);
    _shareNode = buttonNode3;
    
    ASButtonNode *buttonNode4 = [HJTAsKitTool nodeSpecialButtonAddNode:self Title:@"评论" TitleColor:[UIColor whiteColor] Font:HJTFont(14) Image:[UIImage imageNamed:@"评论（底色"] BackgroundColor:[UIColor grayColor]];
    buttonNode4.style.preferredSize = CGSizeMake(s_w/4, 70);
    _commentNode = buttonNode4;
    
}

-(void)configBoldLine{
    ASDisplayNode *upLine = [HJTAsKitTool nodeDisplayNodeAddNode:self BackgroundColor:[UIColor grayColor]];
    upLine.style.preferredSize = CGSizeMake(s_w, 17);
    _upBoldLineNode = upLine;
    
    ASDisplayNode *downLine = [HJTAsKitTool nodeDisplayNodeAddNode:self BackgroundColor:[UIColor grayColor]];
    downLine.style.preferredSize = CGSizeMake(s_w, 17);
    _downBoldLineNode = downLine;
}

-(void)configToolBar{
    ASTextNode *textNode = [HJTAsKitTool nodeTextNodeAddNode:self];
    textNode.attributedText = [HJTAsKitTool nodeAttributesStringText:@"测试测试测试下面下面" TextColor:[UIColor cyanColor] Font:HJTFont(14)];
    textNode.style.layoutPosition = CGPointMake(20, 20);
    _downTipNode = textNode;

    ASButtonNode *buttonNode = [HJTAsKitTool nodeButtonNodeAddNode:self Title:nil TitleColor:nil Font:nil Image:[UIImage imageNamed:@"更新（末页）"] ImageAlignment:ASButtonNodeImageAlignmentBeginning CornerRadius:0 BackgroundColor:nil ContentVerticalAlignment:ASVerticalAlignmentCenter ContentHorizontalAlignment:ASHorizontalAlignmentMiddle];
    buttonNode.style.layoutPosition = CGPointMake(s_w-40, 20);
    buttonNode.style.preferredSize = CGSizeMake(20, 18);
    _refreshBtn  = buttonNode;
}

-(void)configCollectionNode{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    layout.minimumInteritemSpacing = 10;
    
    CGFloat ww = IS_IPHONE ? (s_w - 40) / 3 : (s_w - 60) / 5;
    CGFloat h = ww + ww / 3 + 24 ; // 宽高 3:4
    layout.itemSize = CGSizeMake(ww, h);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    ASCollectionNode *collectionNode = [[ASCollectionNode alloc]initWithCollectionViewLayout:layout];
    collectionNode.delegate = self;
    collectionNode.dataSource = self;
    collectionNode.style.preferredSize = CGSizeMake(s_w, 2 * h + 35);
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [collectionNode reloadData];
    });
    _mainCollectionNode = collectionNode;
    [self addSubnode:self.mainCollectionNode];
}

- (ASCellNodeBlock)collectionNode:(ASCollectionNode *)collectionNode nodeBlockForItemAtIndexPath:(NSIndexPath *)indexPath{
    ASCellNode *(^readPageLastBlock)() = ^ASCellNode *(){
        ReadLastComicCellNode *cellNode = [[ReadLastComicCellNode alloc]init];
        return cellNode;
    };
    return readPageLastBlock;
}

- (NSInteger)numberOfSectionsInCollectionNode:(ASCollectionNode *)collectionNode{
    return 1;
}

- (NSInteger)collectionNode:(ASCollectionNode *)collectionNode numberOfItemsInSection:(NSInteger)section{
    return 6;
}

- (ASSizeRange)collectionNode:(ASCollectionNode *)collectionNode constrainedSizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat ww = IS_IPHONE ? (s_w - 40) / 3 : (s_w - 60) / 5;
    CGFloat h = ww + ww / 3 + 24 ;
    CGSize max = CGSizeMake(ww, h);
    return  ASSizeRangeMake(max, max);
}

-(ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{
    //娃娃图片
    ASAbsoluteLayoutSpec *wawaAbsolute = [ASAbsoluteLayoutSpec absoluteLayoutSpecWithSizing:ASAbsoluteLayoutSpecSizingDefault children:@[_wawaImgNode]];
    
    ASStackLayoutSpec *upTipStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:5 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsCenter children:@[wawaAbsolute,_upTipNode]];
    
    ASStackLayoutSpec *upLineStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:0 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsStart children:@[upTipStack,_upLineNode]];
    
    ASStackLayoutSpec *upBoldLineStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:0 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsStart children:@[_upBoldLineNode]];
    
    ASStackLayoutSpec *containStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:0 justifyContent:ASStackLayoutJustifyContentSpaceBetween alignItems:ASStackLayoutAlignItemsStart children:@[_backNode,_collectNode,_shareNode,_commentNode]];
    
    ASStackLayoutSpec *downBoldLineStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:0 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsStart children:@[_downBoldLineNode]];
    
    ASStackLayoutSpec *downLineStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:0 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsStart children:@[_downLineNode]];
    
    
    ASAbsoluteLayoutSpec *downTipAbsoluteStack = [ASAbsoluteLayoutSpec absoluteLayoutSpecWithSizing:ASAbsoluteLayoutSpecSizingDefault children:@[_downTipNode]];
    
    ASAbsoluteLayoutSpec *refreshAbsoluteStack = [ASAbsoluteLayoutSpec absoluteLayoutSpecWithSizing:ASAbsoluteLayoutSpecSizingDefault children:@[_refreshBtn]];
    
    ASAbsoluteLayoutSpec *toolBarStack = [ASAbsoluteLayoutSpec absoluteLayoutSpecWithChildren:@[downTipAbsoluteStack,refreshAbsoluteStack]];
    
    ASStackLayoutSpec *collctionStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:0 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsStart children:@[_mainCollectionNode]];
    
    ASStackLayoutSpec *upstairsStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:0 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsStart children:@[upLineStack,upBoldLineStack,containStack,downBoldLineStack,downLineStack,toolBarStack,collctionStack]];
    
    
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(10, 0, 0, 0) child:upstairsStack];
}

@end
