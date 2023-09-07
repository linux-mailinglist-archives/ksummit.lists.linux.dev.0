Return-Path: <ksummit+bounces-1099-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E45A79725A
	for <lists@lfdr.de>; Thu,  7 Sep 2023 14:34:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F8E31C20B2A
	for <lists@lfdr.de>; Thu,  7 Sep 2023 12:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA8C863D5;
	Thu,  7 Sep 2023 12:34:29 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 773BB3C36
	for <ksummit@lists.linux.dev>; Thu,  7 Sep 2023 12:34:27 +0000 (UTC)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 387CUHJ4021715;
	Thu, 7 Sep 2023 07:30:17 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 387CUGIJ021714;
	Thu, 7 Sep 2023 07:30:16 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Thu, 7 Sep 2023 07:30:16 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Dave Chinner <david@fromorbit.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
        linux-fsdevel@vger.kernel.org, gcc-patches@gcc.gnu.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <20230907123016.GJ19790@gate.crashing.org>
References: <ZO9NK0FchtYjOuIH@infradead.org> <8718a8a3-1e62-0e2b-09d0-7bce3155b045@roeck-us.net> <ZPkDLp0jyteubQhh@dread.disaster.area> <20230906215327.18a45c89@gandalf.local.home> <4af7c904-ac36-44c9-83c4-2cb30c732672@kadam.mountain> <20230907110409.GH19790@gate.crashing.org> <bd1fb81a-6bb7-4ab4-9f8c-55307f3e9590@kadam.mountain>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd1fb81a-6bb7-4ab4-9f8c-55307f3e9590@kadam.mountain>
User-Agent: Mutt/1.4.2.3i

On Thu, Sep 07, 2023 at 02:23:00PM +0300, Dan Carpenter wrote:
> On Thu, Sep 07, 2023 at 06:04:09AM -0500, Segher Boessenkool wrote:
> > On Thu, Sep 07, 2023 at 12:48:25PM +0300, Dan Carpenter via Gcc-patches wrote:
> > > I started to hunt
> > > down all the Makefile which add a -Werror but there are a lot and
> > > eventually I got bored and gave up.
> > 
> > I have a patch stack for that, since 2014 or so.  I build Linux with
> > unreleased GCC versions all the time, so pretty much any new warning is
> > fatal if you unwisely use -Werror.
> > 
> > > Someone should patch GCC so there it checks an environment variable to
> > > ignore -Werror.  Somethine like this?
> > 
> > No.  You should patch your program, instead.
> 
> There are 2930 Makefiles in the kernel source.

Yes.  And you need patches to about thirty.  Or a bit more, if you want
to do it more cleanly.  This isn't a guess.

> > One easy way is to add a
> > -Wno-error at the end of your command lines.  Or even just -w if you
> > want or need a bigger hammer.
> 
> I tried that.  Some of the Makefiles check an environemnt variable as
> well if you want to turn off -Werror.  It's not a complete solution at
> all.  I have no idea what a complete solution looks like because I gave
> up.

A solution can not involve changing the compiler.  That is just saying
the kernel doesn't know how to fix its own problems, so let's give the
compiler some more unnecessary problems.

> > Or nicer, put it all in Kconfig, like powerpc already has for example.
> > There is a CONFIG_WERROR as well, so maybe use that in all places?
> 
> That's a good idea but I'm trying to compile old kernels and not the
> current kernel.

You can patch older kernels, too, you know :-)

If you need to not make any changes to your source code for some crazy
reason (political perhaps?), just use a shell script or shell function
instead of invoking the compiler driver directly?


Segher

Segher

