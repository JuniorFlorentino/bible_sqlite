#import "BibleSqlitePlugin.h"
#if __has_include(<bible_sqlite/bible_sqlite-Swift.h>)
#import <bible_sqlite/bible_sqlite-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "bible_sqlite-Swift.h"
#endif

@implementation BibleSqlitePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBibleSqlitePlugin registerWithRegistrar:registrar];
}
@end
