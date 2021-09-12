Return-Path: <ksummit+bounces-533-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC85407E10
	for <lists@lfdr.de>; Sun, 12 Sep 2021 17:41:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id B53EF1C0FBD
	for <lists@lfdr.de>; Sun, 12 Sep 2021 15:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 904B53FD8;
	Sun, 12 Sep 2021 15:41:27 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B54D3FC5
	for <ksummit@lists.linux.dev>; Sun, 12 Sep 2021 15:41:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26B2561050;
	Sun, 12 Sep 2021 15:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631461285;
	bh=YjqC0nRHvuFYORgyMmxHBv7H6r9Wu2irugeICVXd41o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mKhUQUmrmpk/Koy4sjyfAzVseM75aM85TB91L+7ukuXwUrLdd8eJ5HbKxD0TcQkg4
	 9IWulZPQkdVshGu8NnQnGP/oPz2PQ6czeLOD0Q7CZ13FKTV3wv2mlYdeUwd+zxV8HM
	 uIaKTzjRxJcpaZSevI64qqCQthPmdrQXBD/NY2Em5qJ177eirwa0wHnNYDj6NcYRzD
	 oSG4ZMQhuTJ6gtfNlSTqdOVdHIUYoBrMFjZVrSOE2+AneKtvb38EKSD50wPECf5Pq8
	 Gs4RLE8MJOSLZtE0EZtNNV2QrR/AqTT9OZ6T+vnoHMcCLF0a310DPlcKscPVac0zKn
	 AmBm8mKKPFKjQ==
Date: Sun, 12 Sep 2021 17:41:21 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Leon Romanovsky <leon@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Josh Triplett <josh@joshtriplett.org>, Jonathan Corbet <corbet@lwn.net>,
 ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
Message-ID: <20210912174121.2c8ebb0f@coco.lan>
In-Reply-To: <YT4Uf0GOwLDxDX5C@pendragon.ideasonboard.com>
References: <20210911005214.71b55ac6@coco.lan>
	<YTvuDsrUNhg/VXD0@localhost>
	<87ilz8c7ff.ffs@tglx>
	<YTyFZufZHu9BSFxk@unreal>
	<YTyWANV/mSkQbYhj@pendragon.ideasonboard.com>
	<YTybN5QwAnLfSBZC@unreal>
	<YT0n0SaWnM8aVr/S@pendragon.ideasonboard.com>
	<YT2By1+yuo7rcu2D@unreal>
	<20210912094648.3296acfe@coco.lan>
	<YT2zryAKHc/5R2IH@unreal>
	<YT4Uf0GOwLDxDX5C@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sun, 12 Sep 2021 17:53:51 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> Hello,
> 
> On Sun, Sep 12, 2021 at 11:00:47AM +0300, Leon Romanovsky wrote:
> > On Sun, Sep 12, 2021 at 09:46:48AM +0200, Mauro Carvalho Chehab wrote:  
> > > Em Sun, 12 Sep 2021 07:27:55 +0300 Leon Romanovsky escreveu:
> > >   
> > > > > What if we're dealing with a device that only exists in a handful of
> > > > > machines though ? Would distributions accept the burden of packaging
> > > > > corresponding userspace code, and maintaining the packages, when only a
> > > > > handful of people in the world will use it ? It's a genuine question.    
> > > > 
> > > > Fedora, Debian and OpenSuSE are volunteer based distributions, they
> > > > accept new packages, which need to be prepared (or asked to be
> > > > prepared) by such vendors.
> > > > 
> > > > There is no "accept the burden of packaging corresponding userspace code,
> > > > and maintaining the packages", it is on package maintainer who can or
> > > > can't be associated with distribution.  
> > > 
> > > There is a dead lock issue, though: if we're willing to have a policy
> > > of only accepting a new Kernel API after Fedora/Debian/openSuse accepts
> > > its userspace counterpart, it would mean, in practice, that no new
> > > APIs will ever be added, as I'm pretty sure most Fedora/Debian/openSuse
> > > maintainers will refuse an application that depends on a non-accepted
> > > Kernel API.  
> > 
> > I said something different - "I would like to see any userspace API used (or to be
> > used)". 
> > https://lore.kernel.org/ksummit/20210912003349.6d2cacb1@coco.lan/T/#m3b7fbbe0959f1b59288dec9afd39f7cda0eeefe9
> > 
> > "To be used" means some open PR to existing package or request for
> > inclusion for new packages.  
> 
> Requiring userspace support to be merged in the appropriate framework or
> accepted as a package by distributions can result in deadlocks, but
> requiring only aa upstream pre-approval is I think a good way to deal
> with the issue.
> 
> > > As a maintainer of several Fedora packages myself, I would refuse
> > > any attempts of adding support for a non-accepted kernel API on
> > > the packages I maintain.
> > > 
> > > -
> > > 
> > > Also, it makes no sense to add support on such general-purpose
> > > distros for some hardware that will never be supported by it.
> > > 
> > > See, there are, for instance, some types of hardware that are
> > > specific for some industry, like for instance, the CAN bus.
> > > While CAN buses remain restricted to vehicles, it won't make any 
> > > sense to crowd a general purpose distro with support for such
> > > hardware. Such distros are not certified with ASIL. So, they
> > > aren't allowed by law to be used inside vehicles.  
> 
> I'm not sure that's the best example, CAN has uses in other types of
> devices, some of which may run a general-purpose distribution.

Surely. That's why I added the "While CAN buses remain restricted to 
vehicles" on the above phrase. This was created for a demand from
one specific industry, by it could be used on other places.

The same happened in the past with cameras that required an ISP
IP block: they started being used only on embedded, but migrated 
to laptops and other devices after some time.

> > And github pile of ... is certified?
> > 
> > In attempt to find general solution for all types of APIs and devices,
> > we won't solve anything.  

A maintainer's summit discussion is the forum for discussing issues
that cross multiple subsystems. AI/ML is not the first case where
new APIs are needed, nor will be the last one. 

So, while I agree that AI/ML should be discussed, it can't stop on
it, as similar issues happen on other subsystems.

> > So I suggest to return and talk about AI/ML devices and APIs that
> > targeted for enterprise/cloud and needs to be supported by major
> > distros.  
> 
> And that I don't :-) I think the issue is the same for at least GPUs and
> AI/ML accelerators, and quite possible camera ISPs too. I'd like to try
> and define clear sets of criteria to address the problem, and that can
> include different alternatives (just as an example, not necessarily
> something I'd advocate for, open userspace vs. documentation) that
> subsystems can then select based on their specific situation.

Agreed.

Thanks,
Mauro

