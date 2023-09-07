Return-Path: <ksummit+bounces-1095-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 829EE7971AE
	for <lists@lfdr.de>; Thu,  7 Sep 2023 13:23:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A0F91C20B1F
	for <lists@lfdr.de>; Thu,  7 Sep 2023 11:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1176C5690;
	Thu,  7 Sep 2023 11:23:07 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C01A568B
	for <ksummit@lists.linux.dev>; Thu,  7 Sep 2023 11:23:04 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40078c4855fso9467755e9.3
        for <ksummit@lists.linux.dev>; Thu, 07 Sep 2023 04:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694085783; x=1694690583; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WfXAsmoB4WfS+F7T1nJonWeYIccVQBht5j3GC7Xo5VQ=;
        b=z2wL2dBUu0mqZf5/obTnloal/mlRKE0BOfxBipFV01hdfpql7F9CZssVmlHdwWUzjL
         n8r7SzWDRQZoQMI3nm9WTMPUTebkb0sImGprbSb/GGZOlf8YDJjod1KGuSvqGAo8OJwP
         VlrvB8kjb1gR56DAJ1jJUcxIcR0GqzTfuWFaztaLINntdvAe8jtRbistBims8RSPk2Lt
         osG01awPifOCuZ8dgda1lGU1Lb6GXGI2WwmJ7T9zmUVYBiXoEEkpYgQkbHxpXNyYAJ2u
         CFAST5fcDBxw9VZDcUrlC9q8T7TmNjvDTXDUHjftiMWujHiWdh+goAUg0l8VwcG2wA86
         wdaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694085783; x=1694690583;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WfXAsmoB4WfS+F7T1nJonWeYIccVQBht5j3GC7Xo5VQ=;
        b=L5h4tBDqSNPgILs2mb72SzBK9qTn2jUF/LnjnfTjKG+migP4FZ5nW8Fr3YLw6B/6Dy
         SvL6JYgSLWQU4zbdEMRJNpWLxMpVf7U/3/YAd8ClZHRulXXAvltntE11WnkgAejAFZDP
         innoWyQ+8n6gr5YpCq8MIHgHIHDXCLRyBQ1fJ3NmrSw4B0nk+qfE0cPm9UR8UmGfRdfR
         a3VQprzIa4q7f0B+/BS8Y3cW7y8HiSGS7tVgM9fC0occ2qdpqx8xKsoHF0ic/FcPd3/E
         Z/Q27MH+hNekLo4W383Fa6nQr2CHRNSSzwphxAHJ2WQuzPYEhyWiu/Jkv88SP+MQzEfX
         HROA==
X-Gm-Message-State: AOJu0YzAJDJEh3i11+HPPskrqzFoGxa+Lp+fzgJiJzUQ6mPD14Hzt/oo
	35DEzdnLaLJVZHXm/abwD7wnFg==
X-Google-Smtp-Source: AGHT+IG5FsrtNwEQuNvPmbB9vmAGew+7DEruqR4J6dlaEKAvYhDUHjzzZrxVYkb/967NrsZmUgv7Jw==
X-Received: by 2002:a05:600c:1d09:b0:402:eaae:e6e0 with SMTP id l9-20020a05600c1d0900b00402eaaee6e0mr2224356wms.8.1694085783074;
        Thu, 07 Sep 2023 04:23:03 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y25-20020a7bcd99000000b0040210a27e29sm2221206wmj.32.2023.09.07.04.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 04:23:02 -0700 (PDT)
Date: Thu, 7 Sep 2023 14:23:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Dave Chinner <david@fromorbit.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, gcc-patches@gcc.gnu.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <bd1fb81a-6bb7-4ab4-9f8c-55307f3e9590@kadam.mountain>
References: <ZO9NK0FchtYjOuIH@infradead.org>
 <8718a8a3-1e62-0e2b-09d0-7bce3155b045@roeck-us.net>
 <ZPkDLp0jyteubQhh@dread.disaster.area>
 <20230906215327.18a45c89@gandalf.local.home>
 <4af7c904-ac36-44c9-83c4-2cb30c732672@kadam.mountain>
 <20230907110409.GH19790@gate.crashing.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230907110409.GH19790@gate.crashing.org>

On Thu, Sep 07, 2023 at 06:04:09AM -0500, Segher Boessenkool wrote:
> On Thu, Sep 07, 2023 at 12:48:25PM +0300, Dan Carpenter via Gcc-patches wrote:
> > I started to hunt
> > down all the Makefile which add a -Werror but there are a lot and
> > eventually I got bored and gave up.
> 
> I have a patch stack for that, since 2014 or so.  I build Linux with
> unreleased GCC versions all the time, so pretty much any new warning is
> fatal if you unwisely use -Werror.
> 
> > Someone should patch GCC so there it checks an environment variable to
> > ignore -Werror.  Somethine like this?
> 
> No.  You should patch your program, instead.

There are 2930 Makefiles in the kernel source.

> One easy way is to add a
> -Wno-error at the end of your command lines.  Or even just -w if you
> want or need a bigger hammer.

I tried that.  Some of the Makefiles check an environemnt variable as
well if you want to turn off -Werror.  It's not a complete solution at
all.  I have no idea what a complete solution looks like because I gave
up.

> 
> Or nicer, put it all in Kconfig, like powerpc already has for example.
> There is a CONFIG_WERROR as well, so maybe use that in all places?

That's a good idea but I'm trying to compile old kernels and not the
current kernel.

regards,
dan carpenter


