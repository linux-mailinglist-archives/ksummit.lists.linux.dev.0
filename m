Return-Path: <ksummit+bounces-527-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A2B407C54
	for <lists@lfdr.de>; Sun, 12 Sep 2021 10:01:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id ACCDB3E10D9
	for <lists@lfdr.de>; Sun, 12 Sep 2021 08:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4B073FD6;
	Sun, 12 Sep 2021 08:00:52 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3193FC5
	for <ksummit@lists.linux.dev>; Sun, 12 Sep 2021 08:00:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B1DD8610A6;
	Sun, 12 Sep 2021 08:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631433651;
	bh=ESnVt+i4ChmEfZLhzO4mvcsiotqU21JdUSzoZG8Zn5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cQDKS5R8Rm3UTjYH5Z39jzc4nYpDgEQv/4E/XVdaIj3UYDTE0frWjOmQhp0lmO6f7
	 v+3ZBNHigexls6AmnBAi3z/wb4wN661VHF85L6wsXMG+nCq/+L4LW+6h43TBprYXAU
	 UKoZQq1MJE+rB2ZqiPmonSj4ptmjj951x28ZHuw0CYxkAD1e6TdRYuOAVCc+TvsoHa
	 tMakYYASki6sUSZHjnpId8+lZA87MB6KfRRWo2b8VFEUT0313DxDpv72lkFCrwSDdi
	 DEQDb91L/mEgxHiSA+BXNl1iKxiEl9TStqgDN9EdHjOzkOKxNWElgtw/RAZQ3tPRd0
	 xQv42DjzZfGkA==
Date: Sun, 12 Sep 2021 11:00:47 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Josh Triplett <josh@joshtriplett.org>,
	Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
Message-ID: <YT2zryAKHc/5R2IH@unreal>
References: <877dfop2lx.fsf@meer.lwn.net>
 <20210911005214.71b55ac6@coco.lan>
 <YTvuDsrUNhg/VXD0@localhost>
 <87ilz8c7ff.ffs@tglx>
 <YTyFZufZHu9BSFxk@unreal>
 <YTyWANV/mSkQbYhj@pendragon.ideasonboard.com>
 <YTybN5QwAnLfSBZC@unreal>
 <YT0n0SaWnM8aVr/S@pendragon.ideasonboard.com>
 <YT2By1+yuo7rcu2D@unreal>
 <20210912094648.3296acfe@coco.lan>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210912094648.3296acfe@coco.lan>

On Sun, Sep 12, 2021 at 09:46:48AM +0200, Mauro Carvalho Chehab wrote:
> Em Sun, 12 Sep 2021 07:27:55 +0300
> Leon Romanovsky <leon@kernel.org> escreveu:
> 
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
> 
> There is a dead lock issue, though: if we're willing to have a policy
> of only accepting a new Kernel API after Fedora/Debian/openSuse accepts
> its userspace counterpart, it would mean, in practice, that no new
> APIs will ever be added, as I'm pretty sure most Fedora/Debian/openSuse
> maintainers will refuse an application that depends on a non-accepted
> Kernel API.

I said something different - "I would like to see any userspace API used (or to be
used)". 
https://lore.kernel.org/ksummit/20210912003349.6d2cacb1@coco.lan/T/#m3b7fbbe0959f1b59288dec9afd39f7cda0eeefe9

"To be used" means some open PR to existing package or request for
inclusion for new packages.

> 
> As a maintainer of several Fedora packages myself, I would refuse
> any attempts of adding support for a non-accepted kernel API on
> the packages I maintain.
> 
> -
> 
> Also, it makes no sense to add support on such general-purpose
> distros for some hardware that will never be supported by it.
> 
> See, there are, for instance, some types of hardware that are
> specific for some industry, like for instance, the CAN bus.
> While CAN buses remain restricted to vehicles, it won't make any 
> sense to crowd a general purpose distro with support for such
> hardware. Such distros are not certified with ASIL. So, they
> aren't allowed by law to be used inside vehicles.

And github pile of ... is certified?

In attempt to find general solution for all types of APIs and devices,
we won't solve anything.

So I suggest to return and talk about AI/ML devices and APIs that
targeted for enterprise/cloud and needs to be supported by major
distros.

Thanks

> 
> Thanks,
> Mauro

