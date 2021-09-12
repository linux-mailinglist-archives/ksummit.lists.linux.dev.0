Return-Path: <ksummit+bounces-526-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55019407C3E
	for <lists@lfdr.de>; Sun, 12 Sep 2021 09:47:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 3FE631C0F23
	for <lists@lfdr.de>; Sun, 12 Sep 2021 07:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E10A3FD6;
	Sun, 12 Sep 2021 07:46:54 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117C93FC5
	for <ksummit@lists.linux.dev>; Sun, 12 Sep 2021 07:46:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6024B60295;
	Sun, 12 Sep 2021 07:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631432812;
	bh=T1KWCXepR4fBstlE50/AaJ2H4qqfxwRu1P5zzIF0s9Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HrWtqZDR7CqmIJtRmdCiPTamETrOpWgbBfTZDZslSZmsqG7ixIyRWE+VC8cZDfnPV
	 5AgPjPRaSqY6GSk9H0IVTHbouXvmc+6mUBLTEsi5/fatGCE4rYAbv9KzYBUDpIQyFy
	 O13UmCcwn3zn+E9cdIpq1wnLd1l61Igu7gha7s+Pns4YsHvdLX9E9QKuAkbm5m6iN+
	 CjFfSitfwMXpaowwtkquOs6oa+ScNLINGAOYOcHCMwL8F1WyoO1P7HZYTgGmIKnGAd
	 y6XR86jGiDMvavgRP1wt5v/Mq1jyxBDIVinsNzpixasT17ZCxykzcUuRBYyN7l0KaZ
	 NfCzt/aJJZrUg==
Date: Sun, 12 Sep 2021 09:46:48 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Thomas Gleixner
 <tglx@linutronix.de>, Josh Triplett <josh@joshtriplett.org>, Jonathan
 Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
Message-ID: <20210912094648.3296acfe@coco.lan>
In-Reply-To: <YT2By1+yuo7rcu2D@unreal>
References: <877dfop2lx.fsf@meer.lwn.net>
	<20210911005214.71b55ac6@coco.lan>
	<YTvuDsrUNhg/VXD0@localhost>
	<87ilz8c7ff.ffs@tglx>
	<YTyFZufZHu9BSFxk@unreal>
	<YTyWANV/mSkQbYhj@pendragon.ideasonboard.com>
	<YTybN5QwAnLfSBZC@unreal>
	<YT0n0SaWnM8aVr/S@pendragon.ideasonboard.com>
	<YT2By1+yuo7rcu2D@unreal>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sun, 12 Sep 2021 07:27:55 +0300
Leon Romanovsky <leon@kernel.org> escreveu:

> > What if we're dealing with a device that only exists in a handful of
> > machines though ? Would distributions accept the burden of packaging
> > corresponding userspace code, and maintaining the packages, when only a
> > handful of people in the world will use it ? It's a genuine question.  
> 
> Fedora, Debian and OpenSuSE are volunteer based distributions, they
> accept new packages, which need to be prepared (or asked to be
> prepared) by such vendors.
> 
> There is no "accept the burden of packaging corresponding userspace code,
> and maintaining the packages", it is on package maintainer who can or
> can't be associated with distribution.

There is a dead lock issue, though: if we're willing to have a policy
of only accepting a new Kernel API after Fedora/Debian/openSuse accepts
its userspace counterpart, it would mean, in practice, that no new
APIs will ever be added, as I'm pretty sure most Fedora/Debian/openSuse
maintainers will refuse an application that depends on a non-accepted
Kernel API.

As a maintainer of several Fedora packages myself, I would refuse
any attempts of adding support for a non-accepted kernel API on
the packages I maintain.

-

Also, it makes no sense to add support on such general-purpose
distros for some hardware that will never be supported by it.

See, there are, for instance, some types of hardware that are
specific for some industry, like for instance, the CAN bus.
While CAN buses remain restricted to vehicles, it won't make any 
sense to crowd a general purpose distro with support for such
hardware. Such distros are not certified with ASIL. So, they
aren't allowed by law to be used inside vehicles.

Thanks,
Mauro

