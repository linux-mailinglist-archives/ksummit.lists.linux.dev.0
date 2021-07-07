Return-Path: <ksummit+bounces-315-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CA23BF17A
	for <lists@lfdr.de>; Wed,  7 Jul 2021 23:41:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id CB2303E1036
	for <lists@lfdr.de>; Wed,  7 Jul 2021 21:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 250122F80;
	Wed,  7 Jul 2021 21:41:02 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C84C168
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 21:41:00 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4E4D5E7;
	Wed,  7 Jul 2021 23:40:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1625694058;
	bh=1p0RUZTlqTCTLlQli3MGNEvqPkJjJ142JlDgw0KqnXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rc/FEttPyuCqc5QmGPvIgviLg8sAegYXp9LoHQopRUftQagvPbsIn0jMl+zHzBiwp
	 TI5G24BXwfD/l75efaT+injtDSPRmlbSFaKAp7ZKlTDRzt1UoBnR1KrMpiIlNJIXan
	 KevpECNCylzAOi0rRheAY940pbvoT352g3bkhgYA=
Date: Thu, 8 Jul 2021 00:40:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Bart Van Assche <bvanassche@acm.org>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Roland Dreier <roland@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YOYfPWW1zgrL4DiQ@pendragon.ideasonboard.com>
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
 <64de6a11-5ff0-9931-d09b-2246cb37b284@acm.org>
 <20210706160857.6d4c63aa@hermes.local>
 <f391c00d-7f4f-a60c-0230-4aca5ea2d4ed@acm.org>
 <CAHk-=wiwZWAo_Ki587FD2BrAQVK71TBN=uKimdBf1Pxg3=+nTw@mail.gmail.com>
 <22460501-fe09-f8e7-1051-b6b692500859@acm.org>
 <CAHk-=wjYGDtLafGB6wabjZCyPUiTJSda0c8h5+_8BeFNdCdrNg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wjYGDtLafGB6wabjZCyPUiTJSda0c8h5+_8BeFNdCdrNg@mail.gmail.com>

Hi Linus,

On Wed, Jul 07, 2021 at 01:39:22PM -0700, Linus Torvalds wrote:
> On Wed, Jul 7, 2021 at 1:32 PM Bart Van Assche wrote:
> >
> > Thank you for having shared your opinion. You may want to know that
> > every C++ project I have worked on so far enabled at least the following
> > compiler flags: -fno-exceptions and -fno-rtti.
> >
> > What the C++ operator new does if not enough memory is available depends
> > on the implementation of that operator.
> 
> The point is, C++ really has some fundamental problems. Yes, you can
> work around them, but it doesn't change the fact that it doesn't
> actually *fix* any of the issues that make C problematic.
> 
> For example, do you go as far as to disallow classes because member
> functions are horrible garbage? Maybe newer versions of C++ fixed it,
> but it used to be the case that you couldn't sanely even split a
> member function into multiple functions to make it easier to read,
> because every single helper function that worked on that class then
> had to be declared in the class definition.

That's still the case today.

> Which makes simple things like just re-organizing code to be legible a
> huge pain.
> 
> At the same time, C++ offer no real new type or runtime safety, and
> makes the problem space just bigger. It forces you to use _more_
> casts, which then just make for more problems when it turns out the
> casts were incorrect and hid the real problem.

I beg to differ on that one. There are features of C++ that would be
very helpful for kernel development. Among them is native support for
destructors, which allow implementing RAII idioms. Unique pointers would
also be very helpful to explicitly expose object ownership rules (shared
pointers are a different story though, it's very easy to use them
incorrectly and infect the whole code base as a result). Templates are
another feature that is widely criticized (and often for good reasons),
but when seen as a type-safe implementation of macros, they can bring
increased safety to the code base.

C++ has upsides and fixes real issues. It also causes pain, and it's not
the only language to provide the above features, so I wouldn't call for
its usage in the kernel. I just wish we had objects with destructors in
plain C.

> So no. We're not switching to a new language that causes pain and
> offers no actual upsides.
> 
> At least the argument is that Rust _fixes_ some of the C safety
> issues. C++ would not.

-- 
Regards,

Laurent Pinchart

