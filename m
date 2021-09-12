Return-Path: <ksummit+bounces-528-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF4E407C6E
	for <lists@lfdr.de>; Sun, 12 Sep 2021 10:29:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 7B9EE1C0F18
	for <lists@lfdr.de>; Sun, 12 Sep 2021 08:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE1183FD6;
	Sun, 12 Sep 2021 08:29:50 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947D93FC5
	for <ksummit@lists.linux.dev>; Sun, 12 Sep 2021 08:29:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 58E9C61108;
	Sun, 12 Sep 2021 08:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631435389;
	bh=mq4FJ2jFKeAi7AFilev344Ae8QpUPNd+C2Hd5oQLTfE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dVhAkd4DmOG60jl71R+8qJAYTjxCmPUxhq3HN7T6r85JzUsSsACtrjaIfZyMYN6ag
	 kcRPGiJvHZQEKKNcYnVXoHYvtlbI3Mn4rfIKhOp1pojLSSBRyz/DyIJvIq4CvvzRjV
	 zOv5IpZUoWFCG7MNb+ZJ2snSSLgGEtpehVqS7IY5LroLHNKafX+cHJR8k4FjXXhrbb
	 cRxqGzKbRMeUhoeU8SPG2Rh7kA9mLCJ5mqGAfSkTYW9g0XFaKsmDtBnng7fNse+SHp
	 1Rsv6eteKIFzASm/noA2PV/objE6pxy0UWmoi2szgKKZtARCU3+69XIkrrdsnupHRs
	 6ub/NgllmcP8Q==
Date: Sun, 12 Sep 2021 11:29:45 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Josh Triplett <josh@joshtriplett.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
Message-ID: <YT26ebT6xXWsnVMw@unreal>
References: <877dfop2lx.fsf@meer.lwn.net>
 <20210911005214.71b55ac6@coco.lan>
 <YTvuDsrUNhg/VXD0@localhost>
 <87ilz8c7ff.ffs@tglx>
 <YTyFZufZHu9BSFxk@unreal>
 <YTyWANV/mSkQbYhj@pendragon.ideasonboard.com>
 <YTybN5QwAnLfSBZC@unreal>
 <YT0n0SaWnM8aVr/S@pendragon.ideasonboard.com>
 <YT2By1+yuo7rcu2D@unreal>
 <YT2rwbBR6ilHmwSZ@kroah.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YT2rwbBR6ilHmwSZ@kroah.com>

On Sun, Sep 12, 2021 at 09:26:57AM +0200, Greg KH wrote:
> On Sun, Sep 12, 2021 at 07:27:55AM +0300, Leon Romanovsky wrote:
> > On Sun, Sep 12, 2021 at 01:04:01AM +0300, Laurent Pinchart wrote:
> > > Hi Leon,
> > > 
> > > On Sat, Sep 11, 2021 at 03:04:07PM +0300, Leon Romanovsky wrote:
> > > > On Sat, Sep 11, 2021 at 02:41:52PM +0300, Laurent Pinchart wrote:
> > > > > On Sat, Sep 11, 2021 at 01:31:02PM +0300, Leon Romanovsky wrote:
> > > > > > On Sat, Sep 11, 2021 at 01:55:16AM +0200, Thomas Gleixner wrote:
> > > > > > > On Fri, Sep 10 2021 at 16:45, Josh Triplett wrote:
> > > > > > > 
> > > > > > > > On Sat, Sep 11, 2021 at 12:52:14AM +0200, Mauro Carvalho Chehab wrote:
> > > > > > > >> On media, enforcing userspace to always be open source would
> > > > > > > >> have been very bad, as it would prevent several videoconferencing 
> > > > > > > >> software to exist on Linux.
> > > > > > > >
> > > > > > > > I don't think we should enforce that all userspace users of an interface
> > > > > > > > be Open Source. I do think we should enforce that *some* userspace user
> > > > > > > > of an interface be Open Source before we add the interface.
> > > > > > > 
> > > > > > > The real question is whether the interface is documented in a way that
> > > > > > > an Open Source implementation is possible. It does not matter whether it
> > > > > > > exists at that point in time or not. Even if it exists there is no
> > > > > > > guarantee that it is feature complete.
> > > > > > > 
> > > > > > > Freely accessible documentation is really the key.
> > > > > > 
> > > > > > I have more radical view than you and think that documentation is far
> > > > > > from being enough. I would like to see any userspace API used (or to be
> > > > > > used) in any package which exists in Debiam/Fedora/SuSE.
> > > > > 
> > > > > We probably need to add Android AOSP to that list, as we have
> > > > > Android-specific APIs (not that I believe we *should* have
> > > > > Android-specific APIs, there's been lots of efforts over the past years
> > > > > to develop standard APIs for use cases that stem from Android, slowly
> > > > > replacing Android-specific APIs in some area, but I don't believe we can
> > > > > realisticly bridge that gap completely overnight, if ever).
> > > > 
> > > > Maybe.
> > > > 
> > > > > > Only this will give us some sort of confidence that API and device are usable
> > > > > > to some level. As a side note, we will be able to estimate possible API
> > > > > > deprecation/fix/extension based on simple search in package databases.
> > > > > 
> > > > > Linux supports devices from very diverse markets, from very tiny
> > > > > embedded devices to supercomputers. We have drivers for devices that
> > > > > exist in data centres of a single company only, or for which only a
> > > > > handful of units exist through the world. The set of rules that we'll
> > > > > decide on, if any, should take this into account.
> > > > 
> > > > I'm part of that group (RDMA) who cares about enterprise, cloud and supercomputers. :)
> > > > So for us, working out-of-the box (distro packages and not github code drops) is
> > > > the key to the scalability.
> > > 
> > > What if we're dealing with a device that only exists in a handful of
> > > machines though ? Would distributions accept the burden of packaging
> > > corresponding userspace code, and maintaining the packages, when only a
> > > handful of people in the world will use it ? It's a genuine question.
> > 
> > Fedora, Debian and OpenSuSE are volunteer based distributions, they
> > accept new packages, which need to be prepared (or asked to be
> > prepared) by such vendors.
> > 
> > There is no "accept the burden of packaging corresponding userspace code,
> > and maintaining the packages", it is on package maintainer who can or
> > can't be associated with distribution.
> > 
> > > 
> > > > Regarding "embedded devices", I remind that we are talking about
> > > > userspace API and most likely busybox will be used for them, which is
> > > > also part of larger distro anyway, so fails under category "exists in
> > > > Debian/Fedora/SuSE".
> > > 
> > > We're talking about APIs exposed by drivers, for devices such as GPUs,
> > > cameras or AI/ML accelerators. I don't think busybox will exercise those
> > > :-) We have Masa for GPUs, libcamera for cameras, and other frameworks
> > > I'm less familiar with for AI/ML accelerators, and I expect those to be
> > > packaged by distributions. There are however other kind of devices that
> > > don't fall in existing well-defined categories.
> > 
> > I'm a little bit confused here. IMHO, you are trying to find an universal
> > solution for a problem that doesn't exist.
> > 
> > Above you asked how to deal with niche devices? Here you talk about mass
> > products devices for the enterprise while before you mentioned "embedded
> > devices".
> > 
> > 1. Niche devices - continue to do as they do it now, by supplying
> > out-of-tree solutions for their customers. Such devices and companies
> > rarely need upstream linux kernel support, because the burden to
> > upstream it is very high. We don't want them in the tree either, because
> > once they upstream it, the maintenance burden will be on us.
> 
> {sigh}
> 
> No, that is NOT our rule at all.
> 
> These devices and companies need to be upstream more than anything else
> as that way they become part of our community and are responsible for
> maintaining their code in the tree.  To force them to remain outside is
> to go against everything that many of us have been saying for _decades_
> now.
> 
> And how are you going to judge what is, and is not, a "niche" device?

I will leave to that company to decide. Again this is exactly how they
operate now, there is nothing new here. Every company calculates ROI
for working with upstream and small companies with niche devices are not
different here.

The main idea that I want to see working userspace stack, and being in
distro sets a certain quality level, am I asking too much?

> 
> > 2. Devices that hits the certain level of adoption - need to be
> > integrated into certain userspace stack, which needs to be part of
> > distro.
> 
> Distros are a very odd rule to rely on given that they are by far the
> minority of the usage in raw numbers for Linux in the world.

You can count Android as another distro, it is just semantics.

> 
> > And AI/ML is no different here, someone just need to start build such
> > stack. Otherwise, we will continue to see more free riders like HabanaLabs
> > which don't have any real benefit to the community.
> 
> Everyone contributes to Linux in a selfish manner, that's just how the
> community works.  The work that companies like habanalabs is NOT being a
> "free rider" at all, they have worked with us and done the hard work of
> actually getting their code merged into the tree.

I perfectly remember them trying to bypass netdev and RDMA communities
by pretending "misc" device.

https://lore.kernel.org/linux-rdma/20200915133556.21268811@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com/
https://lore.kernel.org/linux-rdma/20200917171833.GJ8409@ziepe.ca/

Or DRM
https://lore.kernel.org/linux-rdma/CAKMK7uFOfoxbD2Z5mb-qHFnUe5rObGKQ6Ygh--HSH9M=9bziGg@mail.gmail.com/

So I can agree with the statement "worked hard", but not with the
relevant communities.

> code released under an open source license (unlike _ALL_ other AI/ML
> companies, including Intel). 

Yes, they provided user-space library, but didn't release compiler, so till recently,
it wasn't usable at all.

> It would have been much cheaper and
> quicker of them to just ignore upstream entirely, but that would have
> meant that the community would not have any idea of what exactly these
> use-case models were nor what the problems were that they were trying to
> get Linux to do.

The thing is that community talks about AI/ML stack for a long time, but
as long as backdoor to merge code exists, we won't have anything good
for the end users.

> 
> Linux benefits overall by having everyone participate, do NOT make
> arbitrary rules to somehow prevent one company/group from being allowed
> to upstream their code vs. another.  That is NOT how we have worked in
> the past, and would only cause us to slowly die and become irrelevant.

Somehow, we have rules, for example, we require user space part for any
API merged. Should we cancel it too? so all groups and companies will be
able to contribute.

Thanks

> 
> thanks,
> 
> greg k-h

