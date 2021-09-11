Return-Path: <ksummit+bounces-511-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A6640764D
	for <lists@lfdr.de>; Sat, 11 Sep 2021 13:42:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 883B53E10B3
	for <lists@lfdr.de>; Sat, 11 Sep 2021 11:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 931B43FD7;
	Sat, 11 Sep 2021 11:42:18 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182213FC3
	for <ksummit@lists.linux.dev>; Sat, 11 Sep 2021 11:42:16 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BAE7FDD;
	Sat, 11 Sep 2021 13:42:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1631360534;
	bh=+x33wMsmySy23XlwhuagP3CbYN1bE2ILek9jqpbOpXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V/O+CT8GjMVvvYdmUCYxeBCSbFvlBt8Jcvip1iD4y6xJGLt0+gkPreXDMNDJyq/oM
	 F1J+zJwCquQKpfwypbEqXFmzrT6FeNpWWuj3HhprrKbxTOlkPM1Zub49PG6F3f1s6y
	 0yyJ2y0gIABJC5/Qgb7gc58Z1/uWnZ5MxRMMYoyo=
Date: Sat, 11 Sep 2021 14:41:52 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Josh Triplett <josh@joshtriplett.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
Message-ID: <YTyWANV/mSkQbYhj@pendragon.ideasonboard.com>
References: <877dfop2lx.fsf@meer.lwn.net>
 <20210911005214.71b55ac6@coco.lan>
 <YTvuDsrUNhg/VXD0@localhost>
 <87ilz8c7ff.ffs@tglx>
 <YTyFZufZHu9BSFxk@unreal>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YTyFZufZHu9BSFxk@unreal>

On Sat, Sep 11, 2021 at 01:31:02PM +0300, Leon Romanovsky wrote:
> On Sat, Sep 11, 2021 at 01:55:16AM +0200, Thomas Gleixner wrote:
> > On Fri, Sep 10 2021 at 16:45, Josh Triplett wrote:
> > 
> > > On Sat, Sep 11, 2021 at 12:52:14AM +0200, Mauro Carvalho Chehab wrote:
> > >> On media, enforcing userspace to always be open source would
> > >> have been very bad, as it would prevent several videoconferencing 
> > >> software to exist on Linux.
> > >
> > > I don't think we should enforce that all userspace users of an interface
> > > be Open Source. I do think we should enforce that *some* userspace user
> > > of an interface be Open Source before we add the interface.
> > 
> > The real question is whether the interface is documented in a way that
> > an Open Source implementation is possible. It does not matter whether it
> > exists at that point in time or not. Even if it exists there is no
> > guarantee that it is feature complete.
> > 
> > Freely accessible documentation is really the key.
> 
> I have more radical view than you and think that documentation is far
> from being enough. I would like to see any userspace API used (or to be
> used) in any package which exists in Debiam/Fedora/SuSE.

We probably need to add Android AOSP to that list, as we have
Android-specific APIs (not that I believe we *should* have
Android-specific APIs, there's been lots of efforts over the past years
to develop standard APIs for use cases that stem from Android, slowly
replacing Android-specific APIs in some area, but I don't believe we can
realisticly bridge that gap completely overnight, if ever).

> Only this will give us some sort of confidence that API and device are usable
> to some level. As a side note, we will be able to estimate possible API
> deprecation/fix/extension based on simple search in package databases.

Linux supports devices from very diverse markets, from very tiny
embedded devices to supercomputers. We have drivers for devices that
exist in data centres of a single company only, or for which only a
handful of units exist through the world. The set of rules that we'll
decide on, if any, should take this into account.

> IMHO, github projects to show API usage are the worst possible way to
> allow acceptance for new userspace API.

-- 
Regards,

Laurent Pinchart

