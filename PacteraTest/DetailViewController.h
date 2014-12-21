//
//  DetailViewController.h
//  PacteraTest
//
//  Created by Farrukh Javeid on 12/21/14.
//
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

