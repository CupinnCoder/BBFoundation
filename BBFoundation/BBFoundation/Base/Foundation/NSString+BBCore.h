//
//  NSString+BBCore.h
//  BBFoundation
//
//  Created by Gary on 3/30/16.
//  Copyright © 2016 BBFoundation. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (BBCore)

#pragma mark - Hash

/**
 Returns a lowercase NSString for md2 hash.
 */
- (nullable NSString *)bb_md2String;

/**
 Returns a lowercase NSString for md4 hash.
 */
- (nullable NSString *)bb_md4String;

/**
 Returns a lowercase NSString for md5 hash.
 */
- (nullable NSString *)bb_md5String;

/**
 Returns a lowercase NSString for sha1 hash.
 */
- (nullable NSString *)bb_sha1String;

/**
 Returns a lowercase NSString for sha224 hash.
 */
- (nullable NSString *)bb_sha224String;

/**
 Returns a lowercase NSString for sha256 hash.
 */
- (nullable NSString *)bb_sha256String;

/**
 Returns a lowercase NSString for sha384 hash.
 */
- (nullable NSString *)bb_sha384String;

/**
 Returns a lowercase NSString for sha512 hash.
 */
- (nullable NSString *)bb_sha512String;

/**
 Returns a lowercase NSString for hmac using algorithm md5 with key.
 @param key The hmac key.
 */
- (nullable NSString *)bb_hmacMD5StringWithKey:(NSString *)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha1 with key.
 @param key The hmac key.
 */
- (nullable NSString *)bb_hmacSHA1StringWithKey:(NSString *)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha224 with key.
 @param key The hmac key.
 */
- (nullable NSString *)bb_hmacSHA224StringWithKey:(NSString *)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha256 with key.
 @param key The hmac key.
 */
- (nullable NSString *)bb_hmacSHA256StringWithKey:(NSString *)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha384 with key.
 @param key The hmac key.
 */
- (nullable NSString *)bb_hmacSHA384StringWithKey:(NSString *)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha512 with key.
 @param key The hmac key.
 */
- (nullable NSString *)bb_hmacSHA512StringWithKey:(NSString *)key;

/**
 Returns a lowercase NSString for crc32 hash.
 */
- (nullable NSString *)bb_crc32String;


#pragma mark - Encode and decode
/**
 Returns an NSString for base64 encoded.
 */
- (nullable NSString *)bb_base64EncodedString;

/**
 Returns an NSString from base64 encoded string.
 @param base64Encoding The encoded string.
 */
+ (nullable NSString *)bb_stringWithBase64EncodedString:(NSString *)base64EncodedString;

/**
 URL encode a string in utf-8.
 @return the encoded string.
 */
- (NSString *)bb_stringByURLEncode;

/**
 URL decode a string in utf-8.
 @return the decoded string.
 */
- (NSString *)bb_stringByURLDecode;

/**
 Escape common HTML to Entity.
 Example: "a<b" will be escape to "a&lt;b".
 */
- (NSString *)bb_stringByEscapingHTML;

#pragma mark - Drawing

- (CGSize)bb_sizeForFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode;
- (CGFloat)bb_widthForFont:(UIFont *)font;
- (CGFloat)bb_heightForFont:(UIFont *)font width:(CGFloat)width;


#pragma mark - Regular Expression

- (BOOL)bb_matchesRegex:(NSString *)regex options:(NSRegularExpressionOptions)options;

- (void)bb_enumerateRegexMatches:(NSString *)regex
                      options:(NSRegularExpressionOptions)options
                   usingBlock:(void (^)(NSString *match, NSRange matchRange, BOOL *stop))block;
- (NSString *)bb_stringByReplacingRegex:(NSString *)regex
                             options:(NSRegularExpressionOptions)options
                          withString:(NSString *)replacement;

@property (readonly) char charValue;
@property (readonly) unsigned char unsignedCharValue;
@property (readonly) short shortValue;
@property (readonly) unsigned short unsignedShortValue;
@property (readonly) unsigned int unsignedIntValue;
@property (readonly) long longValue;
@property (readonly) unsigned long unsignedLongValue;
@property (readonly) unsigned long long unsignedLongLongValue;
@property (readonly) NSUInteger unsignedIntegerValue;

#pragma mark - Utilities
///=============================================================================
/// @name Utilities
///=============================================================================

/**
 Returns a new UUID NSString
 e.g. "D1178E50-2A4D-4F1F-9BD3-F6AAB00E06B1"
 */
+ (NSString *)bb_stringWithUUID;


+ (nullable NSString *)bb_stringWithUTF32Char:(UTF32Char)char32;


+ (nullable NSString *)bb_stringWithUTF32Chars:(const UTF32Char *)char32 length:(NSUInteger)length;


- (void)bb_enumerateUTF32CharInRange:(NSRange)range usingBlock:(void (^)(UTF32Char char32, NSRange range, BOOL *stop))block;

- (NSString *)bb_stringByTrim;

- (NSString *)bb_stringByAppendingNameScale:(CGFloat)scale;

- (NSString *)bb_stringByAppendingPathScale:(CGFloat)scale;

- (CGFloat)bb_pathScale;

- (BOOL)bb_isNotBlank;

- (BOOL)bb_containsCharacterSet:(NSCharacterSet *)set;

- (nullable NSNumber *)bb_numberValue;

- (nullable NSData *)bb_dataValue;

- (NSRange)bb_rangeOfAll;

- (nullable id)bb_jsonValueDecoded;

+ (nullable NSString *)bb_stringNamed:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
