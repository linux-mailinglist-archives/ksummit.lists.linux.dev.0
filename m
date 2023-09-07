Return-Path: <ksummit+bounces-1096-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A607971DD
	for <lists@lfdr.de>; Thu,  7 Sep 2023 13:39:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E85D1C20B46
	for <lists@lfdr.de>; Thu,  7 Sep 2023 11:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03D745693;
	Thu,  7 Sep 2023 11:39:32 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 771B9568E
	for <ksummit@lists.linux.dev>; Thu,  7 Sep 2023 11:39:28 +0000 (UTC)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 387B4Ctx017865;
	Thu, 7 Sep 2023 06:04:12 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 387B4Avd017864;
	Thu, 7 Sep 2023 06:04:10 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Thu, 7 Sep 2023 06:04:09 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Dave Chinner <david@fromorbit.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
        linux-fsdevel@vger.kernel.org, gcc-patches@gcc.gnu.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <20230907110409.GH19790@gate.crashing.org>
References: <ZO9NK0FchtYjOuIH@infradead.org> <8718a8a3-1e62-0e2b-09d0-7bce3155b045@roeck-us.net> <ZPkDLp0jyteubQhh@dread.disaster.area> <20230906215327.18a45c89@gandalf.local.home> <4af7c904-ac36-44c9-83c4-2cb30c732672@kadam.mountain>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4af7c904-ac36-44c9-83c4-2cb30c732672@kadam.mountain>
User-Agent: Mutt/1.4.2.3i

On Thu, Sep 07, 2023 at 12:48:25PM +0300, Dan Carpenter via Gcc-patches wrote:
> I started to hunt
> down all the Makefile which add a -Werror but there are a lot and
> eventually I got bored and gave up.

I have a patch stack for that, since 2014 or so.  I build Linux with
unreleased GCC versions all the time, so pretty much any new warning is
fatal if you unwisely use -Werror.

> Someone should patch GCC so there it checks an environment variable to
> ignore -Werror.  Somethine like this?

No.  You should patch your program, instead.  One easy way is to add a
-Wno-error at the end of your command lines.  Or even just -w if you
want or need a bigger hammer.

Or nicer, put it all in Kconfig, like powerpc already has for example.
There is a CONFIG_WERROR as well, so maybe use that in all places?

> +static bool
> +ignore_w_error(void)
> +{
> +  char *str;
> +
> +  str = getenv("IGNORE_WERROR");
> +  if (str && strcmp(str, "1") == 0)

space before (

>      case OPT_Werror:
> +      if (ignore_w_error())
> +	break;
>        dc->warning_as_error_requested = value;
>        break;
>  
>      case OPT_Werror_:
> -      if (lang_mask == CL_DRIVER)
> +     if (ignore_w_error())
> +	break;
> +     if (lang_mask == CL_DRIVER)
>  	break;

The new indentation is messed up.  And please don't move the existing
early-out to later, it make more sense earlier, the way it was.


Segher

