Return-Path: <ksummit+bounces-512-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A9640765E
	for <lists@lfdr.de>; Sat, 11 Sep 2021 14:04:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 040931C0B9F
	for <lists@lfdr.de>; Sat, 11 Sep 2021 12:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC8F93FD7;
	Sat, 11 Sep 2021 12:04:12 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845403FC3
	for <ksummit@lists.linux.dev>; Sat, 11 Sep 2021 12:04:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5EB89611AD;
	Sat, 11 Sep 2021 12:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631361851;
	bh=ToboNv5TGhdCO4ZSBEfcjN8LJlSJ6qCv3xFJ76SBSMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pOPsJmmQBdNZPFp4uMYi0HW+QyJO/iFmrIzFmjgS8FVe5lgz8aXeT3zfsRTaJVN4v
	 55rkp4tEW+aznxtX4Oj/3zO9KSC3VT6T6RSLoDLxqO3PqkIINqgFDM5Uw18VtK7mqr
	 7qOQd88/+BMCZzBbJgZpx76ribAi0ksTrZzCOuK/9UTzixe1Wfznw/lflrd1VSW9h/
	 YgRlgCHdN10d4HbQ4DyrlXlMKDxfBzsdquk8ikjNUIOhaefdLidSkqA7RTLG/kLnpx
	 srVp7Tay1PaIdvUIBwLNnJfdeSJ+1Dg0fs6SSNTvkds7VF3/8DuB2p+EU+RnPOQHZF
	 YQAnGFdEUvEBg==
Date: Sat, 11 Sep 2021 15:04:07 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Josh Triplett <josh@joshtriplett.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
Message-ID: <YTybN5QwAnLfSBZC@unreal>
References: <877dfop2lx.fsf@meer.lwn.net>
 <20210911005214.71b55ac6@coco.lan>
 <YTvuDsrUNhg/VXD0@localhost>
 <87ilz8c7ff.ffs@tglx>
 <YTyFZufZHu9BSFxk@unreal>
 <YTyWANV/mSkQbYhj@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YTyWANV/mSkQbYhj@pendragon.ideasonboard.com>

On Sat, Sep 11, 2021 at 02:41:52PM +0300, Laurent Pinchart wrote:
> On Sat, Sep 11, 2021 at 01:31:02PM +0300, Leon Romanovsky wrote:
> > On Sat, Sep 11, 2021 at 01:55:16AM +0200, Thomas Gleixner wrote:
> > > On Fri, Sep 10 2021 at 16:45, Josh Triplett wrote:
> > > 
> > > > On Sat, Sep 11, 2021 at 12:52:14AM +0200, Mauro Carvalho Chehab wrote:
> > > >> On media, enforcing userspace to always be open source would
> > > >> have been very bad, as it would prevent several videoconferencing 
> > > >> software to exist on Linux.
> > > >
> > > > I don't think we should enforce that all userspace users of an interface
> > > > be Open Source. I do think we should enforce that *some* userspace user
> > > > of an interface be Open Source before we add the interface.
> > > 
> > > The real question is whether the interface is documented in a way that
> > > an Open Source implementation is possible. It does not matter whether it
> > > exists at that point in time or not. Even if it exists there is no
> > > guarantee that it is feature complete.
> > > 
> > > Freely accessible documentation is really the key.
> > 
> > I have more radical view than you and think that documentation is far
> > from being enough. I would like to see any userspace API used (or to be
> > used) in any package which exists in Debiam/Fedora/SuSE.
> 
> We probably need to add Android AOSP to that list, as we have
> Android-specific APIs (not that I believe we *should* have
> Android-specific APIs, there's been lots of efforts over the past years
> to develop standard APIs for use cases that stem from Android, slowly
> replacing Android-specific APIs in some area, but I don't believe we can
> realisticly bridge that gap completely overnight, if ever).

Maybe.

> 
> > Only this will give us some sort of confidence that API and device are usable
> > to some level. As a side note, we will be able to estimate possible API
> > deprecation/fix/extension based on simple search in package databases.
> 
> Linux supports devices from very diverse markets, from very tiny
> embedded devices to supercomputers. We have drivers for devices that
> exist in data centres of a single company only, or for which only a
> handful of units exist through the world. The set of rules that we'll
> decide on, if any, should take this into account.

I'm part of that group (RDMA) who cares about enterprise, cloud and supercomputers. :)
So for us, working out-of-the box (distro packages and not github code drops) is
the key to the scalability.

Regarding "embedded devices", I remind that we are talking about
userspace API and most likely busybox will be used for them, which is
also part of larger distro anyway, so fails under category "exists in
Debian/Fedora/SuSE".

> 
> > IMHO, github projects to show API usage are the worst possible way to
> > allow acceptance for new userspace API.
> 
> -- 
> Regards,
> 
> Laurent Pinchart

