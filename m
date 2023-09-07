Return-Path: <ksummit+bounces-1090-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5270E797157
	for <lists@lfdr.de>; Thu,  7 Sep 2023 11:48:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BCCE28148A
	for <lists@lfdr.de>; Thu,  7 Sep 2023 09:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A22D5663;
	Thu,  7 Sep 2023 09:48:34 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B58720E8
	for <ksummit@lists.linux.dev>; Thu,  7 Sep 2023 09:48:31 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4018af103bcso4379735e9.1
        for <ksummit@lists.linux.dev>; Thu, 07 Sep 2023 02:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694080110; x=1694684910; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+/xavPfeHKkM5Edb1Fs57Ak7muWryzIAsBFEjQC6YKw=;
        b=FP4AY4z0yF1NyW+A6qI8uSvOLnQx/gMXQjzX+dnlnguLup9rL9RhaSIpn3fJRLLPvj
         ajnSKjVj0UAwf8EmzelJORn1SpJhoN70eg27GohfhrKClegCztykTkq8mZjGwhyPWvpS
         F8dIanWoUtb0k6y1ShzHMo6EYw7ZHaITcvOCJdBmF+qRmgpjF6jDZGvEIbGp3S2rI+rJ
         29wo2aTYkY4dBhRt8b20ngaYrfK78yrmfVCXkYXefTLZDK0gbrmkjlXPAAyo8J5d7/eZ
         HvUuWyXiwe0PiJC7dpYNnW5GhCRIeVolHsbCEhf+W3h78y5HkS+ipiVrHzSg8YmsomOH
         xlvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694080110; x=1694684910;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/xavPfeHKkM5Edb1Fs57Ak7muWryzIAsBFEjQC6YKw=;
        b=d/RGPEIRr8rb/1gVyy/fYf7TgLcjSEOdP64pnslM23MSuYpTBFOwGxeFl5zh9Ysj5s
         aLOsyhr+UhI67mFPW5ETCkPdSLgbRTBpYY20aAIBQ7lSvfa2IcWeCr6VM6X0xTv1da+4
         ld0wFVZ0QyDhcy5pXUpv40+wxctxy5Aaucvm/2wZ9T6G9K8o0CAGfK14TASX4/9eXBQB
         ZGpcB07oUImCK6QNy8lP0VXZXbPwiWg5I5/KDUiTWmr4jyCjLCSezfzmx8iVv5HWf5mB
         yiI7gGM6jlmOjFQsDxpupxXCxaVpN7d6R8bnu8J8rjCqm6CkLPa9PYNJe/fedYoxeVYG
         Uo7A==
X-Gm-Message-State: AOJu0YxDZhJw9QvrR06OWWyRris6QHgfQepC/3zoIO1ge+g4oZZ52Z4h
	qE925jHa6mD8Ngj7HAS9H5Lvfw==
X-Google-Smtp-Source: AGHT+IECB9k1RoR69ENUNhn2CpFuTYnYdpxvNiieJ33Nc1+rYNTbtaD4fi9Kzgag3CTTMvD+59exlg==
X-Received: by 2002:a05:600c:492f:b0:401:431e:2d03 with SMTP id f47-20020a05600c492f00b00401431e2d03mr1584782wmp.14.1694080109945;
        Thu, 07 Sep 2023 02:48:29 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e6-20020a05600c218600b003fe1c332810sm1971573wme.33.2023.09.07.02.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 02:48:29 -0700 (PDT)
Date: Thu, 7 Sep 2023 12:48:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Dave Chinner <david@fromorbit.com>, Guenter Roeck <linux@roeck-us.net>,
	Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, gcc-patches@gcc.gnu.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <4af7c904-ac36-44c9-83c4-2cb30c732672@kadam.mountain>
References: <ZO9NK0FchtYjOuIH@infradead.org>
 <8718a8a3-1e62-0e2b-09d0-7bce3155b045@roeck-us.net>
 <ZPkDLp0jyteubQhh@dread.disaster.area>
 <20230906215327.18a45c89@gandalf.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230906215327.18a45c89@gandalf.local.home>

On Wed, Sep 06, 2023 at 09:53:27PM -0400, Steven Rostedt wrote:
> On Thu, 7 Sep 2023 08:54:38 +1000
> Dave Chinner <david@fromorbit.com> wrote:
> 
> > And let's not forget: removing a filesystem from the kernel is not
> > removing end user support for extracting data from old filesystems.
> > We have VMs for that - we can run pretty much any kernel ever built
> > inside a VM, so users that need to extract data from a really old
> > filesystem we no longer support in a modern kernel can simply boot
> > up an old distro that did support it and extract the data that way.
> 
> Of course there's the case of trying to recreate a OS that can run on a
> very old kernel. Just building an old kernel is difficult today because
> today's compilers will refuse to build them (I've hit issues in bisections
> because of that!)

Yeah.  I can't run Smatch on obsolete kernels because I can't build the
tools/ directory etc.  For example, it would be interesting to look at
really ancient kernels to see how buggy they are.  I started to hunt
down all the Makefile which add a -Werror but there are a lot and
eventually I got bored and gave up.

Someone should patch GCC so there it checks an environment variable to
ignore -Werror.  Somethine like this?

diff --git a/gcc/opts.cc b/gcc/opts.cc
index ac81d4e42944..2de69300d4fe 100644
--- a/gcc/opts.cc
+++ b/gcc/opts.cc
@@ -2598,6 +2598,17 @@ print_help (struct gcc_options *opts, unsigned int lang_mask,
 			 lang_mask);
 }
 
+static bool
+ignore_w_error(void)
+{
+  char *str;
+
+  str = getenv("IGNORE_WERROR");
+  if (str && strcmp(str, "1") == 0)
+    return true;
+  return false;
+}
+
 /* Handle target- and language-independent options.  Return zero to
    generate an "unknown option" message.  Only options that need
    extra handling need to be listed here; if you simply want
@@ -2773,11 +2784,15 @@ common_handle_option (struct gcc_options *opts,
       break;
 
     case OPT_Werror:
+      if (ignore_w_error())
+	break;
       dc->warning_as_error_requested = value;
       break;
 
     case OPT_Werror_:
-      if (lang_mask == CL_DRIVER)
+     if (ignore_w_error())
+	break;
+     if (lang_mask == CL_DRIVER)
 	break;
 
       enable_warning_as_error (arg, value, lang_mask, handlers,

