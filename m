Return-Path: <ksummit+bounces-536-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CA1407EB4
	for <lists@lfdr.de>; Sun, 12 Sep 2021 18:43:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id D31781C0964
	for <lists@lfdr.de>; Sun, 12 Sep 2021 16:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEBAE3FD8;
	Sun, 12 Sep 2021 16:43:42 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4578E3FCF
	for <ksummit@lists.linux.dev>; Sun, 12 Sep 2021 16:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1631465020;
	bh=Ikw9ID/vCkKCWDb5ya9wXGIYMH77InXLE5NptRzZXGI=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=nMVCbsbClW1mwQQUFBzyBQEhTlW1P0abJPZJSnxV4WNoSa7mQUWJLeqrV862D7ksi
	 bQuOrVXEJ2SfdNDtWa/41x01sx479dudrolrD6Kejt7kxPonaVmioTBQRBmlEX8Yew
	 nQgXsDARS1g2H0gFyHiXyIiy4wcdrW7FmfGCeGqI=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 759071280304;
	Sun, 12 Sep 2021 09:43:40 -0700 (PDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ull4XA1iVZZJ; Sun, 12 Sep 2021 09:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1631465020;
	bh=Ikw9ID/vCkKCWDb5ya9wXGIYMH77InXLE5NptRzZXGI=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=nMVCbsbClW1mwQQUFBzyBQEhTlW1P0abJPZJSnxV4WNoSa7mQUWJLeqrV862D7ksi
	 bQuOrVXEJ2SfdNDtWa/41x01sx479dudrolrD6Kejt7kxPonaVmioTBQRBmlEX8Yew
	 nQgXsDARS1g2H0gFyHiXyIiy4wcdrW7FmfGCeGqI=
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:600:8280:66d1::527])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id E481412802D9;
	Sun, 12 Sep 2021 09:43:39 -0700 (PDT)
Message-ID: <680a7c9767eb0ddf8035bc90ba1d144fe1f7b4cd.camel@HansenPartnership.com>
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Greg KH
	 <greg@kroah.com>
Cc: Leon Romanovsky <leon@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
  Josh Triplett <josh@joshtriplett.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 ksummit@lists.linux.dev
Date: Sun, 12 Sep 2021 09:43:39 -0700
In-Reply-To: <YT4i4cN4ScWY8Ikf@pendragon.ideasonboard.com>
References: <YTvuDsrUNhg/VXD0@localhost> <87ilz8c7ff.ffs@tglx>
	 <YTyFZufZHu9BSFxk@unreal> <YTyWANV/mSkQbYhj@pendragon.ideasonboard.com>
	 <YTybN5QwAnLfSBZC@unreal> <YT0n0SaWnM8aVr/S@pendragon.ideasonboard.com>
	 <YT2By1+yuo7rcu2D@unreal> <YT2rwbBR6ilHmwSZ@kroah.com>
	 <YT26ebT6xXWsnVMw@unreal> <YT3/5kJuhw/QVqrw@kroah.com>
	 <YT4i4cN4ScWY8Ikf@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Sun, 2021-09-12 at 18:55 +0300, Laurent Pinchart wrote:
> As mentioned in another part of the mail thread, requiring code being
> merged in upstream userspace projects and/or packaged by
> distributions will cause deadlocks, but requiring code to be
> submitted and (pre-)approved is workable. That's what DRM/KMS does.
> To upstream a new KMS property for instance, you need to show how
> it's going to be used in Weston/Xorg/Android/... by submitting
> patches, and have the overall architecture approved by the
> corresponding maintainers.

This is no different from interlocks required in pretty much every
other project crossing open source feature, so it seems like the right
approach to me.  We already use this for confidential computing, which
often requires interlocking changes to QEMU, edk2 and other tools. 
Usually, for confidential computing, the evaluation is on either the
QEMU or edk2 list which then accepts the patch and the rest of the
projects follow.  We do, occasionally, get a late objection to the API
from one of the other projects after part of the enabling code has gone
upstream in the others, but we handle this like a bug fix.

James




