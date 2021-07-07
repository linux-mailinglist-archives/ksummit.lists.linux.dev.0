Return-Path: <ksummit+bounces-313-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 915463BF12A
	for <lists@lfdr.de>; Wed,  7 Jul 2021 23:03:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 067DE3E1011
	for <lists@lfdr.de>; Wed,  7 Jul 2021 21:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D4E2F80;
	Wed,  7 Jul 2021 21:02:52 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC214168
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 21:02:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BBB21CC;
	Wed,  7 Jul 2021 23:02:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1625691767;
	bh=K9GA+cKc4pbfYXBdu7MHQN0TdZBzBvhVIIHZjItIylU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pl4yC/rPvzG/rrhOhVBQBXWcUlJhZhU2QXqjFwu9FbFpksIETj0iBcoB2Nj7kXYcI
	 JM+lOk3YQQil59PhbEWfpu3U086pf9KcRfYwELJt8pdVTvUyNFsE+H6QxxF4PlNIYo
	 5K3kd0NnGuKlKVIzPmgCFeFlo/Wk/4fe160VRE5Y=
Date: Thu, 8 Jul 2021 00:02:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Roland Dreier <roland@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YOYWS+WFBrJt0cbf@pendragon.ideasonboard.com>
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
 <64de6a11-5ff0-9931-d09b-2246cb37b284@acm.org>
 <20210706160857.6d4c63aa@hermes.local>
 <f391c00d-7f4f-a60c-0230-4aca5ea2d4ed@acm.org>
 <CAHk-=wiwZWAo_Ki587FD2BrAQVK71TBN=uKimdBf1Pxg3=+nTw@mail.gmail.com>
 <22460501-fe09-f8e7-1051-b6b692500859@acm.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <22460501-fe09-f8e7-1051-b6b692500859@acm.org>

On Wed, Jul 07, 2021 at 01:32:36PM -0700, Bart Van Assche wrote:
> On 7/7/21 11:57 AM, Linus Torvalds wrote:
> > On Tue, Jul 6, 2021 at 7:41 PM Bart Van Assche <bvanassche@acm.org> wrote:
> >> As a sidenote, I'm surprised that C++ is not supported for Linux kernel
> >> code since C++ supports multiple mechanisms [..]
> > 
> > You'd have to get rid of some of the complete garbage from C++ for it
> > to be usable.
> > 
> > One of the trivial ones is "new" - not only is it a horribly stupid
> > namespace violation, but it depends on exception handling that isn't
> > viable for the kernel, so it's a namespace violation that has no
> > upsides, only downsides.
> > 
> > Could we fix it with some kind of "-Dnew=New" trickery? Yes, but
> > considering all the other issues, it's just not worth the pain. C++ is
> > simply not a good language. It doesn't fix any of the fundamental
> > issues in C (ie no actual safety), and instead it introduces a lot of
> > new problems due to bad designs.
> 
> Hi Linus,
> 
> Thank you for having shared your opinion. You may want to know that
> every C++ project I have worked on so far enabled at least the following
> compiler flags: -fno-exceptions and -fno-rtti.
> 
> What the C++ operator new does if not enough memory is available depends
> on the implementation of that operator. We could e.g. modify the
> behavior of operator new as follows:

Or we could forbid usage of new() and require different memory
allocation primitives. The kernel doesn't use malloc() either :-)

> - Add -fno-builtin-new to the compiler flags.
> - Define a custom version of operator new.
> 
> An example (user space code):
> 
> include <stdlib.h>
> #include <stdio.h>
> 
> void *operator new(size_t size)
> {
>   printf("%s\n", __func__);
>   return malloc(size);
> }
> 
> void operator delete(void *p)
> {
>   printf("%s\n", __func__);
>   free(p);
> }
> 
> void operator delete(void *p, size_t size)
> {
>   printf("%s\n", __func__);
>   free(p);
> }
> 
> void *operator new[](size_t size)
> {
>   printf("%s\n", __func__);
>   return malloc(size);
> }
> 
> void operator delete[](void *p)
> {
>   printf("%s\n", __func__);
>   free(p);
> }
> 
> void operator delete[](void *p, size_t size)
> {
>   printf("%s\n", __func__);
>   free(p);
> }
> 
> int main(int, char **)
> {
>   int *intp = new int;
>   long *arrayp = new long[37];
>   delete[] arrayp;
>   delete intp;
>   return 0;
> }
> 
> The output of the above code:
> 
> operator new
> operator new []
> operator delete []
> operator delete

-- 
Regards,

Laurent Pinchart

