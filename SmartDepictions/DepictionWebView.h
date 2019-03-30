#import "DepictionBaseView.h"

/*  __________________________
   | Key       | Value type   |
   |-----------|--------------|
   | alignment | AlignEnum    |
   | URL       | String (URL) |
   | width     | Number       |
   | height    | Number       |
   '-----------'--------------' */

@interface DepictionWebView : DepictionBaseView {
	@private
	CGFloat _height;
	NSURL *targetURL;
	UIWebView *webView;
	NSArray *widthConstraints;
	NSArray *heightConstraints;
}
@property (nonatomic, assign, setter=setWidth:) CGFloat width;
@property (nonatomic, assign, setter=setAlignment:) AlignEnum alignment;
@property (nonatomic, retain, setter=setURL:) NSString *URL;
- (instancetype)initWithDepictionDelegate:(SmartDepictionDelegate *)delegate reuseIdentifier:(NSString *)reuseIdentifier;
- (void)setHeight:(CGFloat)height;
- (CGFloat)height;
- (void)setWidth:(CGFloat)width;
- (void)setAlignment:(AlignEnum)alignment;
- (void)setURL:(NSString *)URL;
@end

