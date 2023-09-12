Return-Path: <ksummit+bounces-1130-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5592679CC72
	for <lists@lfdr.de>; Tue, 12 Sep 2023 11:52:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36CA61C20C66
	for <lists@lfdr.de>; Tue, 12 Sep 2023 09:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DAE8168C7;
	Tue, 12 Sep 2023 09:52:33 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DDD13AF4
	for <ksummit@lists.linux.dev>; Tue, 12 Sep 2023 09:52:29 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2bceca8a41aso86485931fa.0
        for <ksummit@lists.linux.dev>; Tue, 12 Sep 2023 02:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694512348; x=1695117148; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTzHMfb2PMnB/WCXfRvRMCtM+zTQXX2oSM6n6ez9S90=;
        b=KalHxvbw4VaMvJozGAKwtFmQ0sEe2PNoep69K7iBtH6DoRLzUacKjT5UFTeAGqd38N
         VbAx+xdwgZ+yohddw0OHyTeIrbaVKUtwq1oQKunbbsM7/kLTMuz7gr8EvTbq9mRkW1Xl
         CpHmBaSmFibnhIli2H0Qb9YPbI8179R5J32gcenEzW1Rr4IXPySJ9MveF8U5gO26xs6e
         V9qiagXR7z1WfBenHuzsXS0nANtTN1T4TelFK8sSIQY/4Socfvg9i2r533yeFg6lwp5D
         jb/rnACUybFQy3+d/PBNAR9MwnStsYdmil4tx/dYutHtm+Me8WmPWBY57Js1JwiPv0Jh
         FO4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694512348; x=1695117148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NTzHMfb2PMnB/WCXfRvRMCtM+zTQXX2oSM6n6ez9S90=;
        b=jzUy6iecqf+g5dM539oZRurT5NhVw6Al8wq34NKGEpAUpvzjZ9c5RMUTqKjLfQHyY1
         4sM7IM2FbZfd+efgOm/NHI4WUipW0tHN87iRnqvqR2mlzBdGgIuQTuLCWdhvsX3foxyb
         xGahVgbZjKNvMEPRF+AHoMFfJe6UFIu4Rlm7GVZXlQ55YEOLMTMrv6Vaj4eqUCUOHVPI
         TGUsAmOWuH0KtaAE3+bDoRHvtgPTBbQq8qbqpPOOd8rualTT1kOyx1HhLXyve+fTPjaD
         se51mePhpTVzOkHdWpQBy1QwrUUqOn1KBjpL/bfUZ0Fp45xpFv0uPBqeHISPZ1qq6qXe
         Vy+g==
X-Gm-Message-State: AOJu0YyBkW/jGAAJwXpVwI82ZZbvUid6miTcYfYnMZyA2aYwXfwtgi3G
	2TfMOH+W5DuZG/QBv8Htuuj1IKhicONtQt2DLKA=
X-Google-Smtp-Source: AGHT+IHBnuM5cZEpJAoHuof7kfZvuMORzseShHCbegClIE/2GKz8q41K15Yj6S+g62o5jnsWxDG/cJnQ8ZWePMLgiNY=
X-Received: by 2002:a2e:8194:0:b0:2b7:117:e54 with SMTP id e20-20020a2e8194000000b002b701170e54mr9901648ljg.4.1694512347465;
 Tue, 12 Sep 2023 02:52:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZO9NK0FchtYjOuIH@infradead.org> <8718a8a3-1e62-0e2b-09d0-7bce3155b045@roeck-us.net>
 <ZPkDLp0jyteubQhh@dread.disaster.area> <20230906215327.18a45c89@gandalf.local.home>
 <4af7c904-ac36-44c9-83c4-2cb30c732672@kadam.mountain> <20230907110409.GH19790@gate.crashing.org>
 <bd1fb81a-6bb7-4ab4-9f8c-55307f3e9590@kadam.mountain> <20230907123016.GJ19790@gate.crashing.org>
In-Reply-To: <20230907123016.GJ19790@gate.crashing.org>
From: Richard Biener <richard.guenther@gmail.com>
Date: Tue, 12 Sep 2023 11:50:26 +0200
Message-ID: <CAFiYyc3mqzH+K+woJpLMtQ4oOWkfq9KFb35pdNhKHOwQQvjJPw@mail.gmail.com>
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Dave Chinner <david@fromorbit.com>, Guenter Roeck <linux@roeck-us.net>, 
	Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	gcc-patches@gcc.gnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 7, 2023 at 2:32=E2=80=AFPM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> On Thu, Sep 07, 2023 at 02:23:00PM +0300, Dan Carpenter wrote:
> > On Thu, Sep 07, 2023 at 06:04:09AM -0500, Segher Boessenkool wrote:
> > > On Thu, Sep 07, 2023 at 12:48:25PM +0300, Dan Carpenter via Gcc-patch=
es wrote:
> > > > I started to hunt
> > > > down all the Makefile which add a -Werror but there are a lot and
> > > > eventually I got bored and gave up.
> > >
> > > I have a patch stack for that, since 2014 or so.  I build Linux with
> > > unreleased GCC versions all the time, so pretty much any new warning =
is
> > > fatal if you unwisely use -Werror.
> > >
> > > > Someone should patch GCC so there it checks an environment variable=
 to
> > > > ignore -Werror.  Somethine like this?
> > >
> > > No.  You should patch your program, instead.
> >
> > There are 2930 Makefiles in the kernel source.
>
> Yes.  And you need patches to about thirty.  Or a bit more, if you want
> to do it more cleanly.  This isn't a guess.
>
> > > One easy way is to add a
> > > -Wno-error at the end of your command lines.  Or even just -w if you
> > > want or need a bigger hammer.
> >
> > I tried that.  Some of the Makefiles check an environemnt variable as
> > well if you want to turn off -Werror.  It's not a complete solution at
> > all.  I have no idea what a complete solution looks like because I gave
> > up.
>
> A solution can not involve changing the compiler.  That is just saying
> the kernel doesn't know how to fix its own problems, so let's give the
> compiler some more unnecessary problems.

You can change the compiler by replacing it with a script that appends
-Wno-error
for example.

> > > Or nicer, put it all in Kconfig, like powerpc already has for example=
.
> > > There is a CONFIG_WERROR as well, so maybe use that in all places?
> >
> > That's a good idea but I'm trying to compile old kernels and not the
> > current kernel.
>
> You can patch older kernels, too, you know :-)
>
> If you need to not make any changes to your source code for some crazy
> reason (political perhaps?), just use a shell script or shell function
> instead of invoking the compiler driver directly?
>
>
> Segher
>
> Segher

