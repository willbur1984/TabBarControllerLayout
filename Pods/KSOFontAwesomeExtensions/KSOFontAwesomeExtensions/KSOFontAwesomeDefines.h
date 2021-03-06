//
//  KSOFontAwesomeDefines.h
//  KSOFontAwesomeExtensions
//
//  Created by William Towe on 3/27/17.
//  Copyright © 2017 Kosoku Interactive, LLC. All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
//  1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
//
//  2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#ifndef __KSO_FONT_AWESOME_DEFINES__
#define __KSO_FONT_AWESOME_DEFINES__

#import <TargetConditionals.h>
#import <Foundation/Foundation.h>

#if (TARGET_OS_IPHONE)

#ifndef KSOSize
#define KSOSize CGSize
#endif
#ifndef KSORect
#define KSORect CGRect
#endif
#ifndef KSOFont
#define KSOFont UIFont
#endif
#ifndef KSOImage
#define KSOImage UIImage
#endif
#ifndef KSOColor
#define KSOColor UIColor
#endif

#else

#ifndef KSOSize
#define KSOSize NSSize
#endif
#ifndef KSORect
#define KSORect NSRect
#endif
#ifndef KSOFont
#define KSOFont NSFont
#endif
#ifndef KSOImage
#define KSOImage NSImage
#endif
#ifndef KSOColor
#define KSOColor NSColor
#endif

#endif

#endif
