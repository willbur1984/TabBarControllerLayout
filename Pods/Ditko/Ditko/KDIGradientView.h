//
//  KDIGradientView.h
//  Ditko
//
//  Created by William Towe on 3/8/17.
//  Copyright © 2017 Kosoku Interactive, LLC. All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
//  1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
//
//  2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#import <Ditko/KDIDefines.h>

NS_ASSUME_NONNULL_BEGIN

/**
 KDIGradientView is a UIView/NSView subclass that manages a CAGradientLayer and provides convenience methods to access the layer's properties.
 */
#if (TARGET_OS_IPHONE)
@interface KDIGradientView : UIView
#else
@interface KDIGradientView : NSView
#endif

/**
 Set and get the colors of the underlying CAGradientLayer.
 
 The array should contain either UIColor or NSColor instances.
 */
@property (copy,nonatomic,nullable) NSArray<KDIColor *> *colors;

/**
 Set and get the locations of the underlying CAGradientLayer.
 
 The gradient stops are specified as values between 0 and 1. The values must be monotonically increasing. If nil, the stops are spread uniformly across the range. Defaults to nil.
 */
@property (copy,nonatomic,nullable) NSArray<NSNumber *> *locations;

/**
 The start point of the underlying CAGradientLayer.
 
 The point is defined in unit coordinate space.
 */
@property (assign,nonatomic) KDIPoint startPoint;

/**
 The end point of the underlying CAGradientLayer.
 
 The point is defined in the unit coordinate space.
 */
@property (assign,nonatomic) KDIPoint endPoint;

@end

NS_ASSUME_NONNULL_END
