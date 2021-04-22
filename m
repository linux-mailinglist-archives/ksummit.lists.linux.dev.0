Return-Path: <ksummit+bounces-130-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F57368924
	for <lists@lfdr.de>; Fri, 23 Apr 2021 00:53:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 5F2663E900E
	for <lists@lfdr.de>; Thu, 22 Apr 2021 22:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 197472FA3;
	Thu, 22 Apr 2021 22:53:11 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C9070
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 22:53:09 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0200B564;
	Fri, 23 Apr 2021 00:53:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1619131987;
	bh=ZzF2erTe3fXQiFhdXkj3DhsmmB3kEFY7iEyzN9UISX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GH5ankGJ915+93U2HsruLrQV7SNmsuhMQDuTrAKTf8AsY1yBEaN6bXnyft4GIfjpa
	 uvh2mvxGhaoOVap6u1zWvEeinPqW+TCGFPMRLR0kaK1LnEOtVNf9EpHSYLLernE8Kd
	 ojEgk6WlGB67UaKUKEKCvbSqGZM77+my2N3ygFA4=
Date: Fri, 23 Apr 2021 01:53:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Al Viro <viro@zeniv.linux.org.uk>,
	Christoph Hellwig <hch@infradead.org>,
	Roland Dreier <roland@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <YIH+Tu7I1pctKSXj@pendragon.ideasonboard.com>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <20210421152209.68075314@gandalf.local.home>
 <CAG4TOxNOHRexUoKTo7ndViNtss0_BDeh4YCVHexvdQhQWF+vaw@mail.gmail.com>
 <20210422055948.GA4171859@infradead.org>
 <YIG6XaUrdt6jUezJ@zeniv-ca.linux.org.uk>
 <87wnsuvtgp.ffs@nanos.tec.linutronix.de>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87wnsuvtgp.ffs@nanos.tec.linutronix.de>

Hi Thomas,

On Fri, Apr 23, 2021 at 12:35:02AM +0200, Thomas Gleixner wrote:
> On Thu, Apr 22 2021 at 18:03, Al Viro wrote:
> > On Thu, Apr 22, 2021 at 06:59:48AM +0100, Christoph Hellwig wrote:
> >> On Wed, Apr 21, 2021 at 12:32:33PM -0700, Roland Dreier wrote:
> >> > I also think there does need to be a strong sanction against this UMN
> >> > research group, since we need to make sure there are strong incentives
> >> > against wasting everyone's time with stunts like this.  Hopefully on
> >> > the academic side it can be made clear that this is not ethical
> >> > research - for example, why did IEEE think this was an acceptable
> >> > paper?
> >> 
> >> I wholeheartedly disagree.  Demonstrating this kind of "attack" has
> >> been long overdue, and kicked off a very important discussion.  Even
> >> more so as in this area malice is almost indistinguishable from normal
> >> incompetence.  I think they deserve a medel of honor.
> >
> > Demonstrating this kind of attack would be very useful, if they bothered to
> > provide the raw data and their protocol.
> >
> > They'd done neither, AFAICS.  There's no way to actually look at how the
> > submissions went, timings, etc.  We are offered what could (very generously)
> > be called aggregate stats illustrating the problems, along with bloody
> > worthless suggestions of improvements.  Use of the technics in question
> > is not limited to introducing UAF bugs; it's certainly possible to use
> > a (real or not) UAF bug as an excuse to get in something designed _not_
> > to be caught by any of their suggested scler^Whardening patches, etc.
> >
> > There certainly are very real problems with review process, and examining
> > their data might provide useful insights - had any of that data been
> > given.
> 
> I agree.
> 
> Though the most important takeaway for me is that this demonstrated the
> problems which the kernel development has - once more.
> 
> What's worse is that it's known for quite some time that the kernel
> development is understaffed and cannot keep up with the influx of
> patches. Of course this has been willfully ignored - similar to other
> completely avoidable horrors like the ssl disaster.
> 
> There is a long list of issues which lead to that situation, but let me
> pick a few really important ones:
> 
>   - The 'features and performance first, correctness maybe' mentality in
>     this industry.
> 
>   - The ignorance which takes the availability and sustainability of
>     FOSS components especially "low-level plumbing" ones for granted,
>     even if their business is built on and depends on these.
> 
>   - The unwillingness to put money on basic "low-level" technology just
>     because it does not come with the 'hype-of-the-day' tag and is
>     therefore useless for marketing and headlines.
> 
> None of these things can be solved at the technical level. There is no
> technical solution which solves problems at the human stupidity and
> even less so at the greed level.
> 
> While in theory the approach of sharing the workload for base technology
> is obviously the right thing to do, the reality tells that sharing is
> interpreted as make sure that someone else pays for it and I can push my
> feature agenda.

I'd like to point out explicitly that this issue isn't limited to
"low-level" or "core" technology. On the driver side, it feels more
often than not that the community is used as a dumping ground for BSP
core of dubious quality, when that code isn't just kept out-of-tree
altogether. I wouldn't necessarily blame greed in all cases, as I've
seen vendors who are willing to do the right thing but don't know what
it would be (what we take for granted as being obvious seems not to be
so for a large number of people who are not all stupid :-)).

While I may not be fully convinced by all the details of the experiment,
I think there's something to be learnt from how DRM/KMS handles
contributors, and how they've managed to get many contributors from the
industry to get and stay involved at the subsystem level in the longer
term. I'm sure there can be other initiatives I'm not aware of.

> As long as that does not change, nothing will change.
> 
> We can put technical countermeasures (as discussed elsewhere in this
> thread) in place as much as we want, they are just futile attempts which
> try to cure the symptoms.
> 
> As technical people we all know how useful the approach of curing the
> symptoms instead of the root cause is. But still we try to do that
> because we think it's our only option.
> 
> It's about time to rethink that approach.

Amen. Incentives to contribute in the right way need to be higher, and
depending on the vendors, this can be carrot, stick, or both.

-- 
Regards,

Laurent Pinchart

