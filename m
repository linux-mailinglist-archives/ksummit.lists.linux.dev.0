Return-Path: <ksummit+bounces-531-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 7221F407DCA
	for <lists@lfdr.de>; Sun, 12 Sep 2021 16:35:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 5E65B1C0F99
	for <lists@lfdr.de>; Sun, 12 Sep 2021 14:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 320B63FD8;
	Sun, 12 Sep 2021 14:34:56 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com [64.147.123.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942BC3FC5
	for <ksummit@lists.linux.dev>; Sun, 12 Sep 2021 14:34:54 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.west.internal (Postfix) with ESMTP id 2ABBB2B00620;
	Sun, 12 Sep 2021 10:34:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Sun, 12 Sep 2021 10:34:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm1; bh=IqJ64hlJq/2UkMqUjhWeKBan15g
	1RzhHKay4ELPrOgE=; b=xZ0vynrsilbR//MyxBj60JGUMUhNz3RDThS4EoWGfAe
	K9gUFeNiIvr9tuUPs1uhijhHsw4TApdxgQPO9qZnWbWzr9kQOPpJLb7DRBl5v4e8
	0kv681otHRXIObwNXmjGlvSeqkKQqDtsAhAoYFNT7yslfGbU7PadoH80cvqNlGE7
	bQRIsI5MXGZDZTHS+/+NeZDVmHeVIwzYx/4FOqoqXg9piaMkYSxejbjJVRSrnMqh
	5mY1d2wRTUY1kUG65pg1v0NnavgB9HNMq1fjTXtXvdkFIBg+WtuAgEmIiO2xYzMI
	UZRqfmZDxLl8wADbAZHn9k+i4RZtGEB3drgrfw2IUtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=IqJ64h
	lJq/2UkMqUjhWeKBan15g1RzhHKay4ELPrOgE=; b=vUQiHJEoA/jnNvmdplbOj2
	CYXKnlwbL+nqeX5JNOKMucMPiVUSulKhgz7LQyAA5cZeXaoQtmSWn6tkAG8k+bNF
	QjAGot32YGg3fxJG8joN9uuhPvME9Tzbi+eTL74HfyLKc3FHaepJ1AFuDixO8dHf
	Z8sjAsTSpJW08tUDJOtaUrGbdmadVWFed2Dy5LA4b5G870OTDYRZiHSCz/t2TrLu
	zM1meNEJjSXMQ/nUN+BADNmzyrVviN7co/N1c7Ivmq9APT29mds7YVhnZcYKcMXB
	IW6v1QEGySifGI65ypTnUpDAR4qZwO+cLpdy9Um4medAyfHX41q9cKqF6XHlrpjA
	==
X-ME-Sender: <xms:CxA-YcRDGzKxpbRVZ4M7rTLkn7tMAIXwZYGsKWGLM7sd5uB5GBnppg>
    <xme:CxA-YZwOJI0zbomP3kM6iWA_rLdBd0hP46Zok4aH0E-vzbWF6o5s2O-0gfjPS3Q9O
    TmjU22PIEB-uQ>
X-ME-Received: <xmr:CxA-YZ24qjQtzXZY--MXzLQVivInE6h97uULfyF__Um5e0VVzAhxRvc958WETSsgt6i1xvqqQKATCnyqH9L2b7YtH-w8323R>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeghedgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeeuleeltd
    ehkeeltefhleduuddvhfffuedvffduveegheekgeeiffevheegfeetgfenucffohhmrghi
    nhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:DBA-YQAVLWoi7-B_YNwfhaN19TnjBWUL-rTUGtFpuwU5KlsWtU73vg>
    <xmx:DBA-YVi1U07O_FT_Qe6dj0TiAUbRM3of-Ep3s4rJX8QX2nMasnhwpQ>
    <xmx:DBA-Ycril4xCfBf6qxe3X-PQO1gS3_dRmidHgocv4wCdGJcj4d7CWg>
    <xmx:DBA-YeYPcWGtnPy2DN5QIiLIByPY0y-Z6uT27JEaJGwGNuqZxvD878y2rG8>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 12 Sep 2021 10:34:51 -0400 (EDT)
Date: Sun, 12 Sep 2021 16:34:48 +0200
From: Greg KH <greg@kroah.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Josh Triplett <josh@joshtriplett.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
Message-ID: <YT4QCHwnqZL/rl0z@kroah.com>
References: <87ilz8c7ff.ffs@tglx>
 <YTyFZufZHu9BSFxk@unreal>
 <YTyWANV/mSkQbYhj@pendragon.ideasonboard.com>
 <YTybN5QwAnLfSBZC@unreal>
 <YT0n0SaWnM8aVr/S@pendragon.ideasonboard.com>
 <YT2By1+yuo7rcu2D@unreal>
 <YT2rwbBR6ilHmwSZ@kroah.com>
 <YT26ebT6xXWsnVMw@unreal>
 <YT3/5kJuhw/QVqrw@kroah.com>
 <YT4LgkK+ejUWljEh@unreal>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YT4LgkK+ejUWljEh@unreal>

On Sun, Sep 12, 2021 at 05:15:30PM +0300, Leon Romanovsky wrote:
> On Sun, Sep 12, 2021 at 03:25:58PM +0200, Greg KH wrote:
> > > The main idea that I want to see working userspace stack, and being in
> > > distro sets a certain quality level, am I asking too much?
> > 
> > Define "working userspace stack" and "distro" please.  Like others have
> > said, many distros will not take userspace code unless it's already in
> > the kernel tree first, as that ensures that the abi will not break.
> 
> Like I already answered
> https://lore.kernel.org/all/YT2zryAKHc%2F5R2IH@unreal/
> "To be used" means some open PR to existing package or request for
> inclusion for new packages.

But again, distros will not take things that are not already in the
kernel.

> > > > > 2. Devices that hits the certain level of adoption - need to be
> > > > > integrated into certain userspace stack, which needs to be part of
> > > > > distro.
> > > > 
> > > > Distros are a very odd rule to rely on given that they are by far the
> > > > minority of the usage in raw numbers for Linux in the world.
> > > 
> > > You can count Android as another distro, it is just semantics.
> > 
> > But how do you define Android's userspace?  Just one vendor?  2 vendors?
> > 10 vendors?  There is major userspace fragmentation in Android userspace
> > in many places, the user/kernel boundry being one of the big ones as
> > many of us have found out over the past years.  And many of us are
> > working to resolve this, but it's not so simple at times, and I have
> > many examples if you want specifics.
> 
> Lauerent suggested AOSP
> https://lore.kernel.org/all/YTyWANV%2FmSkQbYhj@pendragon.ideasonboard.com/

Vendors can not get code into AOSP for various reasons that only Google
understands.  There are many millions, if not billions of Android
devices out there with user/kernel apis that are not upstream nor in
AOSP because Google doesn't want to take them, or because the vendor can
not go through those hoops (international law is tricky at times...)

So are we to just not be able to take drivers that add those new apis if
AOSP can not take the userspace side, yet the userspace side is
published somewhere else?

> > > > > And AI/ML is no different here, someone just need to start build such
> > > > > stack. Otherwise, we will continue to see more free riders like HabanaLabs
> > > > > which don't have any real benefit to the community.
> > > > 
> > > > Everyone contributes to Linux in a selfish manner, that's just how the
> > > > community works.  The work that companies like habanalabs is NOT being a
> > > > "free rider" at all, they have worked with us and done the hard work of
> > > > actually getting their code merged into the tree.
> > > 
> > > I perfectly remember them trying to bypass netdev and RDMA communities
> > > by pretending "misc" device.
> > > 
> > > https://lore.kernel.org/linux-rdma/20200915133556.21268811@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com/
> > > https://lore.kernel.org/linux-rdma/20200917171833.GJ8409@ziepe.ca/
> > > 
> > > Or DRM
> > > https://lore.kernel.org/linux-rdma/CAKMK7uFOfoxbD2Z5mb-qHFnUe5rObGKQ6Ygh--HSH9M=9bziGg@mail.gmail.com/
> > > 
> > > So I can agree with the statement "worked hard", but not with the
> > > relevant communities.
> > 
> > I point at these as doing exactly what we want vendors to be doing!
> > Thank you for finding the good examples.  This is a vendor submitting
> > patches and saying, "here is what we want to do, with a first cut at
> > doing it."  It's up to us as a community to tell them if they are doing
> > it the right way or not.
> > 
> > If we just let them all go their own ways, they will come up with
> > horrible apis and interfaces, we have all seen that before.
> > 
> > So by working together, we both can learn from, and work together to
> > solve the issue.  And that is what these driver authors and company has
> > been doing!  They are part of our community, why are you saying they
> > should now just go do their own thing away from us?
> 
> This is not what I said. I don't see Intel (habanalabs) as a company
> that can't create proper AI stack and think that this is our
> responsibility to provide them enough incentive to do it.

So should we be forcing everyone to follow the IBM standard for
accelerator drivers because they were in the kernel first all those
years ago?  Or what other standard do we pick?

And why are we dictating new industry standards here?  Who are we to do
that?  Who is going to take that responsibility on?

> > And as for "bypassing", that feels very mean.  We have had accelerator
> > code in the char/misc and other parts of the kernel tree since at least
> > 2018 if not earlier (I didn't look all that hard.)  Just because someone
> > wanted to use the in-kernel apis that are there (why is dma-buf some
> > magic thing?) does not mean that they suddenly need to move to a
> > different subsystem.
> 
> Because dma-buf API has specific semantics and was designed with very
> specific usage model in mind.

So will the IB patches usage be re-reviewed?

Anyway, we have apis that are used throughout the kernel all the time
that don't end up on the various subsystem mailing list because people
forget, or just do not know.  That's normal and something we have dealt
with for forever.  As an example, I didn't realise that just using the
dma-buf api required such a review.

Can we put that in the MAINTAINERS file somehow for apis?

> > We get at least 1-2 new subsystems and major drivers that get added to
> > the kernel tree that do things that have never been done before with
> > custom user/kernel apis every kernel release.  Not everything can be a
> > standard api no matter how much I, and others, wish it were.
> 
> So when will you draw a line and ask to create proper susbsystem
> with standard APIs? After 2, 3 ... 100 similar (from our point of view)
> and different (from vendor point of view) devices with custom API?

That is a great question and I do not have the answer to that.  Should
we have done that after the first one went into the kernel all those
years ago?  Maybe, but I seem to recal the answer being "our hardware
works much differently, so our user api will be much different", and
that's a valid answer.

If your standard can not handle new usage models and a way to handle
that, then it isn't a good standard that companies will follow for new
types of devices.

We have loads of char drivers with odd ioctl apis because we have loads
of odd hardware devices out in the world.  We have been treating these
accelerators like that for a long time now, except when they try to
duplicate existing in-kernel code (like crypto or networking).

> > As examples, what about the hyperv blob api that was submitted recently
> > going around the block layer?  What about the new Intel accelerator that
> > added yet-another-set-of-custom-ioctls?  What about the rpi drivers?
> > What about the virtualbox drivers?  Should all of those just live
> > outside of the kernel for forever?
> > 
> > Of course not.
> 
> So what is your bar? Accept everything?

It's a hard line to draw, and for some reason, I seem to be the one
having to review these types of drivers every kernel release.  If people
wish to help me out, please do so, all the patches are on the lists.

Right now I push back where I can and try to get semi-sane apis created
that are "obviously not wrong" where I notice.  After that, I just need
to trust that the maintainer of the driver knows what they are doing and
will maintain the code going forward.  So far, it's worked out.

Do you have a better idea of what to do instead?

thanks,

greg k-h

