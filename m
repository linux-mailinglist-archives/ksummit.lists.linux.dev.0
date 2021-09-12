Return-Path: <ksummit+bounces-535-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9B8407EB0
	for <lists@lfdr.de>; Sun, 12 Sep 2021 18:42:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 633EB3E1095
	for <lists@lfdr.de>; Sun, 12 Sep 2021 16:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DD6F3FD8;
	Sun, 12 Sep 2021 16:42:02 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65E53FCF
	for <ksummit@lists.linux.dev>; Sun, 12 Sep 2021 16:42:00 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B1EF19E;
	Sun, 12 Sep 2021 18:41:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1631464918;
	bh=EDXyGMlxxh8zXkQQKKuvS7oWdRlB70/zf7qQSkt5Tm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qDo2SrKCdDY+xegRmAMi90bZy+rWbHYvj+hhzWSx8FX4OUhCCGn6mniAKGqQCLTRq
	 iHhDehRX59N1zFWVEFy6hSnoCW/UvJRHr7Lep7C2cetAGagJ6VwNb6OFhjXc5mX/v2
	 +EUzyiI2LlwiCgDBhIf65e+VVcCAeFE1sYEEcbLA=
Date: Sun, 12 Sep 2021 19:41:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Greg KH <greg@kroah.com>
Cc: Leon Romanovsky <leon@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Josh Triplett <josh@joshtriplett.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
Message-ID: <YT4tv+TXxI9m9WVj@pendragon.ideasonboard.com>
References: <YTyFZufZHu9BSFxk@unreal>
 <YTyWANV/mSkQbYhj@pendragon.ideasonboard.com>
 <YTybN5QwAnLfSBZC@unreal>
 <YT0n0SaWnM8aVr/S@pendragon.ideasonboard.com>
 <YT2By1+yuo7rcu2D@unreal>
 <YT2rwbBR6ilHmwSZ@kroah.com>
 <YT26ebT6xXWsnVMw@unreal>
 <YT3/5kJuhw/QVqrw@kroah.com>
 <YT4LgkK+ejUWljEh@unreal>
 <YT4QCHwnqZL/rl0z@kroah.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YT4QCHwnqZL/rl0z@kroah.com>

Hi Greg,

On Sun, Sep 12, 2021 at 04:34:48PM +0200, Greg KH wrote:
> On Sun, Sep 12, 2021 at 05:15:30PM +0300, Leon Romanovsky wrote:
> > On Sun, Sep 12, 2021 at 03:25:58PM +0200, Greg KH wrote:
> > > > The main idea that I want to see working userspace stack, and being in
> > > > distro sets a certain quality level, am I asking too much?
> > > 
> > > Define "working userspace stack" and "distro" please.  Like others have
> > > said, many distros will not take userspace code unless it's already in
> > > the kernel tree first, as that ensures that the abi will not break.
> > 
> > Like I already answered
> > https://lore.kernel.org/all/YT2zryAKHc%2F5R2IH@unreal/
> > "To be used" means some open PR to existing package or request for
> > inclusion for new packages.
> 
> But again, distros will not take things that are not already in the
> kernel.

It's becoming difficult to follow the discussion as it has branched.
I've replied on this topic separately.

> > > > > > 2. Devices that hits the certain level of adoption - need to be
> > > > > > integrated into certain userspace stack, which needs to be part of
> > > > > > distro.
> > > > > 
> > > > > Distros are a very odd rule to rely on given that they are by far the
> > > > > minority of the usage in raw numbers for Linux in the world.
> > > > 
> > > > You can count Android as another distro, it is just semantics.
> > > 
> > > But how do you define Android's userspace?  Just one vendor?  2 vendors?
> > > 10 vendors?  There is major userspace fragmentation in Android userspace
> > > in many places, the user/kernel boundry being one of the big ones as
> > > many of us have found out over the past years.  And many of us are
> > > working to resolve this, but it's not so simple at times, and I have
> > > many examples if you want specifics.
> > 
> > Lauerent suggested AOSP
> > https://lore.kernel.org/all/YTyWANV%2FmSkQbYhj@pendragon.ideasonboard.com/
> 
> Vendors can not get code into AOSP for various reasons that only Google
> understands.  There are many millions, if not billions of Android
> devices out there with user/kernel apis that are not upstream nor in
> AOSP because Google doesn't want to take them, or because the vendor can
> not go through those hoops (international law is tricky at times...)
> 
> So are we to just not be able to take drivers that add those new apis if
> AOSP can not take the userspace side, yet the userspace side is
> published somewhere else?

"Open userspace" and "packaged in distros" are two criteria that have
been proposed. There are more, such as "open documentation" for
instance. It's up to us to decide what to do (if anything), and I don't
believe we'll be able to find one-size-fits-them-all criteria that can
apply globally. There is however in my opinion value in carefully
designing a set of criteria and document them, to then for instance let
subsystems pick the ones that work best for the type of devices they
handle.

The "packaged in distros" criteria is, as I understand it, an attempt to
avoid code dumps on git..b that would have been so badly designed that
they would be unmaintainable. It's a tricky area, what I think is
required is that vendors publish an open userspace implementation that
is serious enough, and not just a way to tick a box while circumventing
the spirit of the rule. Distro packaging may help achieving that, but
there are certainly other ways too. For me, at the end of the day it's
really about how to create a community starting from a single
implementation.

> > > > > > And AI/ML is no different here, someone just need to start build such
> > > > > > stack. Otherwise, we will continue to see more free riders like HabanaLabs
> > > > > > which don't have any real benefit to the community.
> > > > > 
> > > > > Everyone contributes to Linux in a selfish manner, that's just how the
> > > > > community works.  The work that companies like habanalabs is NOT being a
> > > > > "free rider" at all, they have worked with us and done the hard work of
> > > > > actually getting their code merged into the tree.
> > > > 
> > > > I perfectly remember them trying to bypass netdev and RDMA communities
> > > > by pretending "misc" device.
> > > > 
> > > > https://lore.kernel.org/linux-rdma/20200915133556.21268811@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com/
> > > > https://lore.kernel.org/linux-rdma/20200917171833.GJ8409@ziepe.ca/
> > > > 
> > > > Or DRM
> > > > https://lore.kernel.org/linux-rdma/CAKMK7uFOfoxbD2Z5mb-qHFnUe5rObGKQ6Ygh--HSH9M=9bziGg@mail.gmail.com/
> > > > 
> > > > So I can agree with the statement "worked hard", but not with the
> > > > relevant communities.
> > > 
> > > I point at these as doing exactly what we want vendors to be doing!
> > > Thank you for finding the good examples.  This is a vendor submitting
> > > patches and saying, "here is what we want to do, with a first cut at
> > > doing it."  It's up to us as a community to tell them if they are doing
> > > it the right way or not.
> > > 
> > > If we just let them all go their own ways, they will come up with
> > > horrible apis and interfaces, we have all seen that before.
> > > 
> > > So by working together, we both can learn from, and work together to
> > > solve the issue.  And that is what these driver authors and company has
> > > been doing!  They are part of our community, why are you saying they
> > > should now just go do their own thing away from us?
> > 
> > This is not what I said. I don't see Intel (habanalabs) as a company
> > that can't create proper AI stack and think that this is our
> > responsibility to provide them enough incentive to do it.
> 
> So should we be forcing everyone to follow the IBM standard for
> accelerator drivers because they were in the kernel first all those
> years ago?  Or what other standard do we pick?
> 
> And why are we dictating new industry standards here?  Who are we to do
> that?  Who is going to take that responsibility on?
> 
> > > And as for "bypassing", that feels very mean.  We have had accelerator
> > > code in the char/misc and other parts of the kernel tree since at least
> > > 2018 if not earlier (I didn't look all that hard.)  Just because someone
> > > wanted to use the in-kernel apis that are there (why is dma-buf some
> > > magic thing?) does not mean that they suddenly need to move to a
> > > different subsystem.
> > 
> > Because dma-buf API has specific semantics and was designed with very
> > specific usage model in mind.
> 
> So will the IB patches usage be re-reviewed?
> 
> Anyway, we have apis that are used throughout the kernel all the time
> that don't end up on the various subsystem mailing list because people
> forget, or just do not know.  That's normal and something we have dealt
> with for forever.  As an example, I didn't realise that just using the
> dma-buf api required such a review.
> 
> Can we put that in the MAINTAINERS file somehow for apis?
> 
> > > We get at least 1-2 new subsystems and major drivers that get added to
> > > the kernel tree that do things that have never been done before with
> > > custom user/kernel apis every kernel release.  Not everything can be a
> > > standard api no matter how much I, and others, wish it were.
> > 
> > So when will you draw a line and ask to create proper susbsystem
> > with standard APIs? After 2, 3 ... 100 similar (from our point of view)
> > and different (from vendor point of view) devices with custom API?
> 
> That is a great question and I do not have the answer to that.  Should
> we have done that after the first one went into the kernel all those
> years ago?  Maybe, but I seem to recal the answer being "our hardware
> works much differently, so our user api will be much different", and
> that's a valid answer.

And it's also the answer that all vendors will give, because it's an
easy way to avoid doing extra work. It may sometimes be true, but that's
an exception rather than a rule.

It reminds me of something I've heard in a working group recently, when
someone mentioned a "key differentiating factor" that requires a free
ticket for vendors not to open the implementation, and a few seconds
later went on to say it was "available in all phones in the market
today". I won't call these lies, I believe that in most cases the
vendors actually believe it's true.

> If your standard can not handle new usage models and a way to handle
> that, then it isn't a good standard that companies will follow for new
> types of devices.
> 
> We have loads of char drivers with odd ioctl apis because we have loads
> of odd hardware devices out in the world.  We have been treating these
> accelerators like that for a long time now, except when they try to
> duplicate existing in-kernel code (like crypto or networking).

Going back to the "is an accelerator a GPU?" topic for a bit, DRM
doesn't prevent drivers from exposing custom features with custom API
elements. AI/ML accelerators aren't GPUs in the original sense of 3D
rendering accelerators (maybe that's a cause of misunderstanding, we're
not using the best terminology), but they fit pretty well within the
device model that DRM creates. The side effect of using DRM is that an
open userspace is required, and this is why some people in the community
believe Habanalabs tried to work around that rule by going for
drivers/misc/. I don't know enough about the history to know if they
were behaving in good faith or not, but maybe we could try to turn this
page by deciding on the right path forward together and forget about the
finger pointing and blaming.

> > > As examples, what about the hyperv blob api that was submitted recently
> > > going around the block layer?  What about the new Intel accelerator that
> > > added yet-another-set-of-custom-ioctls?  What about the rpi drivers?
> > > What about the virtualbox drivers?  Should all of those just live
> > > outside of the kernel for forever?
> > > 
> > > Of course not.
> > 
> > So what is your bar? Accept everything?
> 
> It's a hard line to draw, and for some reason, I seem to be the one
> having to review these types of drivers every kernel release.  If people
> wish to help me out, please do so, all the patches are on the lists.

This may be a controversial point, but could it be because vendors
perceive you as less likely to look closely and push back ? If
drivers/misc/ is seen as being free-for-all and other subsystems are
likely to ask for more work, natural laziness will push vendors to
drivers/misc/. 

> Right now I push back where I can and try to get semi-sane apis created
> that are "obviously not wrong" where I notice.  After that, I just need
> to trust that the maintainer of the driver knows what they are doing and
> will maintain the code going forward.  So far, it's worked out.
> 
> Do you have a better idea of what to do instead?

Is there a way we could push those drivers more strongly towards other
subsystems ? There's certainly no way you will be able to foster the
creating of a dozen userspace frameworks and related communities from
drivers/misc/ by yourself.

-- 
Regards,

Laurent Pinchart

