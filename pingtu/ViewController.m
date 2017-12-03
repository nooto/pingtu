//
//  ViewController.m
//  pingtu
//
//  Created by MacBook on 2017/11/28.
//  Copyright © 2017年 MacBook. All rights reserved.
//

#import "ViewController.h"

#import "PieceModel.h"

#define kWidth         [UIScreen mainScreen].bounds.size.width
#define kHeight        [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *back = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 480 * 0.6, 720 * 0.6)];
    back.backgroundColor = [UIColor redColor];
    [self.view addSubview:back];
    
//    NSMutableArray *dataArr = [NSMutableArray array];
    
    for (int i = 0; i < 24; i ++) {
        
        UIImage *maskImg = [UIImage imageNamed:[NSString stringWithFormat:@"%d-",i + 1]];
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];

        switch (i) {
            case 0:
                [dic setValue:@"0" forKey:@"x"];
                [dic setValue:@"0" forKey:@"y"];
                break;
            case 1:
                [dic setValue:@"90" forKey:@"x"];
                [dic setValue:@"0" forKey:@"y"];
                break;
            case 2:
                [dic setValue:@"236" forKey:@"x"];
                [dic setValue:@"0" forKey:@"y"];
                break;
            case 3:
                [dic setValue:@"330" forKey:@"x"];
                [dic setValue:@"0" forKey:@"y"];
                break;
            case 4:
                [dic setValue:@"0" forKey:@"x"];
                [dic setValue:@"90" forKey:@"y"];
                break;
            case 5:
                [dic setValue:@"90" forKey:@"x"];
                [dic setValue:@"90" forKey:@"y"];
                break;
            case 6:
                [dic setValue:@"236" forKey:@"x"];
                [dic setValue:@"90" forKey:@"y"];
                break;
            case 7:
                [dic setValue:@"356" forKey:@"x"];
                [dic setValue:@"90" forKey:@"y"];
                break;
            case 8:
                [dic setValue:@"0" forKey:@"x"];
                [dic setValue:@"236" forKey:@"y"];
                break;
            case 9:
                [dic setValue:@"90" forKey:@"x"];
                [dic setValue:@"236" forKey:@"y"];
                break;
            case 10:
                [dic setValue:@"210" forKey:@"x"];
                [dic setValue:@"210" forKey:@"y"];
                break;
            case 11:
                [dic setValue:@"356" forKey:@"x"];
                [dic setValue:@"210" forKey:@"y"];
                break;
            case 12:
                [dic setValue:@"0" forKey:@"x"];
                [dic setValue:@"330" forKey:@"y"];
                break;
            case 13:
                [dic setValue:@"90" forKey:@"x"];
                [dic setValue:@"356" forKey:@"y"];
                break;
            case 14:
                [dic setValue:@"210" forKey:@"x"];
                [dic setValue:@"330" forKey:@"y"];
                break;
            case 15:
                [dic setValue:@"356" forKey:@"x"];
                [dic setValue:@"330" forKey:@"y"];
                break;
            case 16:
                [dic setValue:@"0" forKey:@"x"];
                [dic setValue:@"476" forKey:@"y"];
                break;
            case 17:
                [dic setValue:@"116" forKey:@"x"];
                [dic setValue:@"450" forKey:@"y"];
                break;
            case 18:
                [dic setValue:@"210" forKey:@"x"];
                [dic setValue:@"450" forKey:@"y"];
                break;
            case 19:
                [dic setValue:@"330" forKey:@"x"];
                [dic setValue:@"450" forKey:@"y"];
                break;
            case 20:
                [dic setValue:@"0" forKey:@"x"];
                [dic setValue:@"596" forKey:@"y"];
                break;
            case 21:
                [dic setValue:@"116" forKey:@"x"];
                [dic setValue:@"596" forKey:@"y"];
                break;
            case 22:
                [dic setValue:@"236" forKey:@"x"];
                [dic setValue:@"596" forKey:@"y"];
                break;
            case 23:
                [dic setValue:@"330" forKey:@"x"];
                [dic setValue:@"596" forKey:@"y"];
                break;
            default:
                break;
        }
        
        [dic setValue:[NSString stringWithFormat:@"%f,",maskImg.size.width * 2] forKey:@"w"];
        [dic setValue:[NSString stringWithFormat:@"%f,",maskImg.size.height * 2] forKey:@"h"];
        
        CGFloat centerX = (maskImg.size.width + [dic[@"x"]floatValue]);
        CGFloat centerY = (maskImg.size.height + [dic[@"y"] floatValue]);
        
        [dic setObject:[NSString stringWithFormat:@"%f,",centerX] forKey:@"centerX"];
        [dic setObject:[NSString stringWithFormat:@"%f",centerY] forKey:@"centerY"];
        [dic setObject:[NSString stringWithFormat:@"%d",i] forKey:@"index"];
        
        PieceModel *model = [[PieceModel alloc]initPieceModelWithDic:dic];
        
        [self.dataArr addObject:model];
    }
    
    
    for (int i = 0 ; i < 24; i ++) {
       
        UIImage *img = [UIImage imageNamed:@"WechatIMG4"];
        img = [self scaleToSize:img size:CGSizeMake(480, 720)];
        UIImage *img3 = [UIImage imageNamed:[NSString stringWithFormat:@"%d-",i + 1]];
        
        PieceModel *model = self.dataArr[i];
        
        CGFloat x = model.x;
        CGFloat y = model.y;
        CGFloat w = model.w;
        CGFloat h = model.h;
        UIImage *img2 =[self CutPartOfImage:img mainimage:img offX:x offY:y Size:CGSizeMake(w, h)];
        img2 = [self maskImage:img2 withMask:img3];
        
//        [self saveImage:img2 withName:[NSString stringWithFormat:@"piece%d",i]];
        
        //随机生成碎片的摆放位置
        x =  arc4random() % (int)kWidth ;
        
        if (x < 480 * 0.6) {
            
            y = 720 * 0.6 + arc4random() % (int)(kHeight - 720 * 0.6);
            y = y > kHeight - h * 0.6 ? kHeight  - h * 0.6 : y;

        }else if (x > kWidth - w * 0.6){
         
            x = kWidth - w * 0.6;
            y =  arc4random() % (int)kHeight;
            y = y > kHeight - h * 0.6 ? kHeight  - h * 0.6 : y;
            
        }else{
            y =  arc4random() % (int)kHeight;
            y = y > kHeight - h * 0.6 ? kHeight  - h * 0.6 : y;
        }


        UIImageView *imgV = [[UIImageView alloc]initWithFrame:CGRectMake(x,y, w* 0.6,h* 0.6)];
        imgV.image = img2;
        imgV.tag = 100 + i;
        [self.view addSubview:imgV];
        
        UIPanGestureRecognizer *pan=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
        [imgV setUserInteractionEnabled:YES];//开启图片控件的用户交互
        [imgV addGestureRecognizer:pan];//给图片添加手势
    }
}


- (NSMutableArray *)dataArr{
    
    if (_dataArr == nil) {
        
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}


//将UIImage缩放到指定大小尺寸：
- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}



- (UIImage *)CutPartOfImage:(UIImage *)image mainimage:(UIImage*)mimage offX:(float)offx offY:(float)offy Size: (CGSize ) size{
    CGSize newsize=size;
    
    UIGraphicsBeginImageContext(newsize);
    
    [image drawInRect:CGRectMake(0, 0, newsize.width, newsize.height)];
    [mimage drawInRect:CGRectMake(-offx, -offy, mimage.size.width, mimage.size.height)];
    
    UIImage *newimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newimg;
}


- (UIImage*) maskImage:(UIImage *)image withMask:(UIImage *)maskImage {
    
    CGSize size = image.size;
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    [image drawInRect:CGRectMake(0,0, size.width, size.height)];

    UIImage* mask = maskImage;
    [mask drawInRect:CGRectMake(0, 0, size.width, size.height) blendMode:kCGBlendModeDestinationIn alpha:1];
    //此处的参数可分为source和destination，分别去共同部分和不同部分。
    UIImage* retImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return retImage;
}

- (void)saveImage:(UIImage *)image withName:(NSString *)name{
    NSArray *paths =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    
    
    NSString *filePath = [[paths objectAtIndex:0]stringByAppendingPathComponent:
                          [NSString stringWithFormat:@"%@", [NSString stringWithFormat:@"%@@3x.png",name]]];  // 保存文件的名称
    
    BOOL result =[UIImagePNGRepresentation(image)writeToFile:filePath   atomically:YES]; // 保存成功会返回YES
    if (result == YES) {
        NSLog(@"保存成功");
    }
    
}

#pragma mark - 手势执行的方法
-(void)handlePan:(UIPanGestureRecognizer *)rec{
    
    NSInteger tag = rec.view.tag;
    
    PieceModel *model = self.dataArr[tag - 100];
    model.isRightP = NO;
    
    //返回在横坐标上、纵坐标上拖动了多少像素
    CGPoint point=[rec translationInView:self.view];
    NSLog(@"%f,%f",point.x,point.y);
    
    rec.view.center=CGPointMake(rec.view.center.x+point.x, rec.view.center.y+point.y);

    if (rec.state==UIGestureRecognizerStateEnded) {
        
        for (PieceModel *model in self.dataArr) {
            
            CGFloat distance = [self distanceFromPointX:CGPointMake(rec.view.center.x+point.x, rec.view.center.y+point.y) distanceToPointY:CGPointMake(model.centerX * 0.6, model.centerY * 0.6)];
            NSLog(@"distance:%f",distance);
            if (distance < 9) {
                rec.view.center=CGPointMake(model.centerX * 0.6, model.centerY * 0.6);
                NSInteger index = [self.dataArr indexOfObject:model];
                if (index == tag - 100) {

                    model.isRightP = YES;
                }
            }
        }
        
        BOOL isWin = [self isAllPieceComplete];
        if (isWin) {
            
            NSLog(@"你赢了");
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"您赢了" preferredStyle:  UIAlertControllerStyleAlert];
            
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                //点击按钮的响应事件；
            }]];
            
            //弹出提示框；
            [self presentViewController:alert animated:true completion:nil];
        }
    }

    //拖动完之后，每次都要用setTranslation:方法制0这样才不至于不受控制般滑动出视图
    [rec setTranslation:CGPointMake(0, 0) inView:self.view];
}


- (BOOL)isAllPieceComplete{
    
    BOOL isWin = YES;
    for (PieceModel *model in self.dataArr) {
        
        if (!model.isRightP) {
            
            isWin = NO;
        }
    }
    
    return isWin;
}

//计算两点之间的距离
-(float)distanceFromPointX:(CGPoint)start distanceToPointY:(CGPoint)end{
    float distance;
    //下面就是高中的数学，不详细解释了
    CGFloat xDist = (end.x - start.x);
    CGFloat yDist = (end.y - start.y);
    distance = sqrt((xDist * xDist) + (yDist * yDist));
    return distance;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
