Return-Path: <ksummit+bounces-427-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD333CFF4E
	for <lists@lfdr.de>; Tue, 20 Jul 2021 18:26:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id BC8E51C0F0C
	for <lists@lfdr.de>; Tue, 20 Jul 2021 16:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B3592FB6;
	Tue, 20 Jul 2021 16:26:08 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B266870
	for <ksummit@lists.linux.dev>; Tue, 20 Jul 2021 16:26:06 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id u8-20020a7bcb080000b02901e44e9caa2aso2389368wmj.4
        for <ksummit@lists.linux.dev>; Tue, 20 Jul 2021 09:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=c8tLNmjvmC9v6YyqdOWBq8D6uXOn6DAp1Ib+3uItLik=;
        b=NR2uWw1xmonS5f1DTkbxA2ZC2gu89azKe/2oBHSStDiQ66IyEwJDfnlAmnd3ECflSa
         SEJW2iEp9owDQN3kpmRqbaMP2z/wbDhD1g4YrVL6XapugWkO7UYKPs1lnrYYU5ETYNjd
         3SqSKs7M4lhYnFTb6XEU9CRhN33hKQlTlY7XM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=c8tLNmjvmC9v6YyqdOWBq8D6uXOn6DAp1Ib+3uItLik=;
        b=uAX8Zm9dd87VGDjbx4s+QlIPHF5dRp/AkbXFl9FKtyVK6oxH1JiYnMEeM3L7yqQUIf
         MH4rBWhYMGD8Pji0ecnW72Iub5dpc54Lw9VvtKilS2YCCmIhEqpR4gaFO//eWk0YtYeV
         OiQnND7C9udqhd6gYVyhuOJ5rLAA36afpvuHqXeeNrnYBxCj2xNUJm5li8ZqWQLY006i
         q2dXuQejSI2dvCr9Zc6kQy0H/dms4d8FA7WQ3+SzE5PcVS81WgSCJvQf6TNgU46Cxawj
         74LzqA/XaYPjCdm56AqRrxT+9HqiTQnjfHbTCCSXe2AvWnlqdGTMJYO3afXlNzxg+7Jt
         NpVA==
X-Gm-Message-State: AOAM533hTn6CiSkFxr7enEbknlZ/AOsj83zJMsutp5BdswomOoCuMALo
	N1lyFKoCpmAdcWR7W/Ezy7yqMA==
X-Google-Smtp-Source: ABdhPJzwIhLQ3g2UTCi1tlhcneAomCEyEMkVk+1LIAazqoqSFzSmV0K+o28IGQFx9F5I0Rwk8mk7nA==
X-Received: by 2002:a05:600c:1c08:: with SMTP id j8mr32826006wms.50.1626798364753;
        Tue, 20 Jul 2021 09:26:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id j4sm10319825wrt.24.2021.07.20.09.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 09:26:04 -0700 (PDT)
Date: Tue, 20 Jul 2021 18:26:02 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Al Viro <viro@zeniv.linux.org.uk>,
	Christoph Hellwig <hch@infradead.org>,
	Roland Dreier <roland@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Kernel sustainability (was Re: [MAINTAINER SUMMIT] Rethinking the
 acceptance policy for "trivial" patches)
Message-ID: <CAKMK7uHQyJTHA9V=MwZ4XjQOidsE6KKhJsijoQBKZ9hFUcCQtA@mail.gmail.com>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <20210421152209.68075314@gandalf.local.home>
 <CAG4TOxNOHRexUoKTo7ndViNtss0_BDeh4YCVHexvdQhQWF+vaw@mail.gmail.com>
 <20210422055948.GA4171859@infradead.org>
 <YIG6XaUrdt6jUezJ@zeniv-ca.linux.org.uk>
 <87wnsuvtgp.ffs@nanos.tec.linutronix.de>
 <YIH+Tu7I1pctKSXj@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YIH+Tu7I1pctKSXj@pendragon.ideasonboard.com>

Since I've just made myself popular again with the drivers/gpu merge
criteria I figured good time to dig this out from the big thread as a
separate topic. I entirely missed this interesting topic which was
unfortunately deeply burried in something I don't care a whole lot about
:-)

On Fri, Apr 23, 2021 at 12:53 AM Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Apr 23, 2021 at 12:35:02AM +0200, Thomas Gleixner wrote:
> > On Thu, Apr 22 2021 at 18:03, Al Viro wrote:
> > > On Thu, Apr 22, 2021 at 06:59:48AM +0100, Christoph Hellwig wrote:
> > >> On Wed, Apr 21, 2021 at 12:32:33PM -0700, Roland Dreier wrote:
> > >> > I also think there does need to be a strong sanction against this UMN
> > >> > research group, since we need to make sure there are strong incentives
> > >> > against wasting everyone's time with stunts like this.  Hopefully on
> > >> > the academic side it can be made clear that this is not ethical
> > >> > research - for example, why did IEEE think this was an acceptable
> > >> > paper?
> > >>
> > >> I wholeheartedly disagree.  Demonstrating this kind of "attack" has
> > >> been long overdue, and kicked off a very important discussion.  Even
> > >> more so as in this area malice is almost indistinguishable from normal
> > >> incompetence.  I think they deserve a medel of honor.
> > >
> > > Demonstrating this kind of attack would be very useful, if they bothered to
> > > provide the raw data and their protocol.
> > >
> > > They'd done neither, AFAICS.  There's no way to actually look at how the
> > > submissions went, timings, etc.  We are offered what could (very generously)
> > > be called aggregate stats illustrating the problems, along with bloody
> > > worthless suggestions of improvements.  Use of the technics in question
> > > is not limited to introducing UAF bugs; it's certainly possible to use
> > > a (real or not) UAF bug as an excuse to get in something designed _not_
> > > to be caught by any of their suggested scler^Whardening patches, etc.
> > >
> > > There certainly are very real problems with review process, and examining
> > > their data might provide useful insights - had any of that data been
> > > given.
> >
> > I agree.
> >
> > Though the most important takeaway for me is that this demonstrated the
> > problems which the kernel development has - once more.
> >
> > What's worse is that it's known for quite some time that the kernel
> > development is understaffed and cannot keep up with the influx of
> > patches. Of course this has been willfully ignored - similar to other
> > completely avoidable horrors like the ssl disaster.
> >
> > There is a long list of issues which lead to that situation, but let me
> > pick a few really important ones:
> >
> >   - The 'features and performance first, correctness maybe' mentality in
> >     this industry.
> >
> >   - The ignorance which takes the availability and sustainability of
> >     FOSS components especially "low-level plumbing" ones for granted,
> >     even if their business is built on and depends on these.
> >
> >   - The unwillingness to put money on basic "low-level" technology just
> >     because it does not come with the 'hype-of-the-day' tag and is
> >     therefore useless for marketing and headlines.
> >
> > None of these things can be solved at the technical level. There is no
> > technical solution which solves problems at the human stupidity and
> > even less so at the greed level.
> >
> > While in theory the approach of sharing the workload for base technology
> > is obviously the right thing to do, the reality tells that sharing is
> > interpreted as make sure that someone else pays for it and I can push my
> > feature agenda.
>
> I'd like to point out explicitly that this issue isn't limited to
> "low-level" or "core" technology. On the driver side, it feels more
> often than not that the community is used as a dumping ground for BSP
> core of dubious quality, when that code isn't just kept out-of-tree
> altogether. I wouldn't necessarily blame greed in all cases, as I've
> seen vendors who are willing to do the right thing but don't know what
> it would be (what we take for granted as being obvious seems not to be
> so for a large number of people who are not all stupid :-)).
>
> While I may not be fully convinced by all the details of the experiment,
> I think there's something to be learnt from how DRM/KMS handles
> contributors, and how they've managed to get many contributors from the
> industry to get and stay involved at the subsystem level in the longer
> term. I'm sure there can be other initiatives I'm not aware of.

I'm not sure our commit rights stuff helps a lot with getting vendors in.
It helps maybe with load-balancing the maintainer/review roles better
among volunteers and anyone who can cut away a bit of time here and there
to help out with subsystem stuff.

> > As long as that does not change, nothing will change.
> >
> > We can put technical countermeasures (as discussed elsewhere in this
> > thread) in place as much as we want, they are just futile attempts which
> > try to cure the symptoms.
> >
> > As technical people we all know how useful the approach of curing the
> > symptoms instead of the root cause is. But still we try to do that
> > because we think it's our only option.
> >
> > It's about time to rethink that approach.
>
> Amen. Incentives to contribute in the right way need to be higher, and
> depending on the vendors, this can be carrot, stick, or both.

So much.

Now as much as it's unpopular, the drivers/gpu merge criteria of
"userspace must be open source and ready for merging into relevant
upstream userspace project" is a really big stick here. It keeps all the
dump&run vendor contributions out, and any company that seriously
considers this path will spend a few years building up a team (which means
hiring existing people and consulting companies for training and ramp-up)
or just pay for the work to get done. Because tossing your entire
userspace space and creating a new one based on our upstream stack is not
a light undertaking at all for a gpu driver.

The downside is that there's a continual stream of "if you'd just merge
more gpu drivers it would be so much better for you and help get vendors
on board" style complaints, but I don't buy that. We'd definitely get more
code (some 10x for the same functionality), and it would be a lot more
crap. Plus, there'd be a lot less money floating around  to pay for
maintainance and improvement of the shared code and infrastructure.

It is more or less flat out extortion, but then nothing else seems to
avoid the tragedy of the commons.

I guess the plus side is that it's not extortion by a single entity that
holds the keys to the castle, but it's collective. If a vendor shows up
with a dump&run proposal they can talk to all the various maintainers we
have and try to enlist all the various consulting shops active in this
area, and the answer tends to be the same across the board.

Overall I think to make sure a subsystem is somewhat sustainable you need
a really big stick to force vendors to contribute in the right
(sustainable) way. The important part is to make sure the stick isn't just
bureaucracy to make it painful for everyone, so that you still have a
carrot left for the people who do get it and want to contribute properly.
-Daniel
--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

