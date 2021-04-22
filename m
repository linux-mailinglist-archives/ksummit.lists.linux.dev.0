Return-Path: <ksummit+bounces-128-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0209A368912
	for <lists@lfdr.de>; Fri, 23 Apr 2021 00:37:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 0AFF21C3C4D
	for <lists@lfdr.de>; Thu, 22 Apr 2021 22:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC7862FA3;
	Thu, 22 Apr 2021 22:35:06 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F32870
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 22:35:05 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1619130903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/cZSrQWl+2jK870Y+e1oHzVZ++a36K4sAoTaZfa+z/Q=;
	b=gnfx0d716jONYGudiNYx3iRWTLKz7o06EB5QykUGnAN96/6NclgYDz2q1/u93AjerDtz61
	1NlbPuIgNp8tEbKUBdgvIrEnavMQmFuGswpcej09JNJddiZSGOiwf478w6qh2jtzluPusm
	gE9p9+gJ6oSepUD8TFTx8fy+FWVR7nBoa+FsGw+qjkwpHk1e/LMFDHOX2XqNcq5WEUi21L
	cZYkitTD8rHeRzIIiQpSV9rAI0yjzoUSZNKY5d/XX8q+mGNtfuJ4VK8S7VfZgwvfSm36CU
	hM7zZdmPNHSQsyrZmBlJO5CV/4G+NGpgxGsNRdlCL3lHFl4K5WkCDUsNyj/3kQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1619130903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/cZSrQWl+2jK870Y+e1oHzVZ++a36K4sAoTaZfa+z/Q=;
	b=5HppzuIWVPt6hLoc+PP7nQi4ZUKoemLyvV8dPFBUMXiDhZnp5tff5jYcctQHNoHIF1gbob
	FleczynOCPABggBg==
To: Al Viro <viro@zeniv.linux.org.uk>, Christoph Hellwig <hch@infradead.org>
Cc: Roland Dreier <roland@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, James Bottomley <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for "trivial" patches
In-Reply-To: <YIG6XaUrdt6jUezJ@zeniv-ca.linux.org.uk>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com> <20210421152209.68075314@gandalf.local.home> <CAG4TOxNOHRexUoKTo7ndViNtss0_BDeh4YCVHexvdQhQWF+vaw@mail.gmail.com> <20210422055948.GA4171859@infradead.org> <YIG6XaUrdt6jUezJ@zeniv-ca.linux.org.uk>
Date: Fri, 23 Apr 2021 00:35:02 +0200
Message-ID: <87wnsuvtgp.ffs@nanos.tec.linutronix.de>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Al,

On Thu, Apr 22 2021 at 18:03, Al Viro wrote:
> On Thu, Apr 22, 2021 at 06:59:48AM +0100, Christoph Hellwig wrote:
>> On Wed, Apr 21, 2021 at 12:32:33PM -0700, Roland Dreier wrote:
>> > I also think there does need to be a strong sanction against this UMN
>> > research group, since we need to make sure there are strong incentives
>> > against wasting everyone's time with stunts like this.  Hopefully on
>> > the academic side it can be made clear that this is not ethical
>> > research - for example, why did IEEE think this was an acceptable
>> > paper?
>> 
>> I wholeheartedly disagree.  Demonstrating this kind of "attack" has
>> been long overdue, and kicked off a very important discussion.  Even
>> more so as in this area malice is almost indistinguishable from normal
>> incompetence.  I think they deserve a medel of honor.
>
> Demonstrating this kind of attack would be very useful, if they bothered to
> provide the raw data and their protocol.
>
> They'd done neither, AFAICS.  There's no way to actually look at how the
> submissions went, timings, etc.  We are offered what could (very generously)
> be called aggregate stats illustrating the problems, along with bloody
> worthless suggestions of improvements.  Use of the technics in question
> is not limited to introducing UAF bugs; it's certainly possible to use
> a (real or not) UAF bug as an excuse to get in something designed _not_
> to be caught by any of their suggested scler^Whardening patches, etc.
>
> There certainly are very real problems with review process, and examining
> their data might provide useful insights - had any of that data been
> given.

I agree.

Though the most important takeaway for me is that this demonstrated the
problems which the kernel development has - once more.

What's worse is that it's known for quite some time that the kernel
development is understaffed and cannot keep up with the influx of
patches. Of course this has been willfully ignored - similar to other
completely avoidable horrors like the ssl disaster.

There is a long list of issues which lead to that situation, but let me
pick a few really important ones:

  - The 'features and performance first, correctness maybe' mentality in
    this industry.

  - The ignorance which takes the availability and sustainability of
    FOSS components especially "low-level plumbing" ones for granted,
    even if their business is built on and depends on these.

  - The unwillingness to put money on basic "low-level" technology just
    because it does not come with the 'hype-of-the-day' tag and is
    therefore useless for marketing and headlines.

None of these things can be solved at the technical level. There is no
technical solution which solves problems at the human stupidity and
even less so at the greed level.

While in theory the approach of sharing the workload for base technology
is obviously the right thing to do, the reality tells that sharing is
interpreted as make sure that someone else pays for it and I can push my
feature agenda.

As long as that does not change, nothing will change.

We can put technical countermeasures (as discussed elsewhere in this
thread) in place as much as we want, they are just futile attempts which
try to cure the symptoms.

As technical people we all know how useful the approach of curing the
symptoms instead of the root cause is. But still we try to do that
because we think it's our only option.

It's about time to rethink that approach.

Thanks,

        Thomas








