Return-Path: <ksummit+bounces-510-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id A8443407614
	for <lists@lfdr.de>; Sat, 11 Sep 2021 12:31:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id C0BDC1C0F5D
	for <lists@lfdr.de>; Sat, 11 Sep 2021 10:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB4CB3FD9;
	Sat, 11 Sep 2021 10:31:07 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D203FC3
	for <ksummit@lists.linux.dev>; Sat, 11 Sep 2021 10:31:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1E4CE611F2;
	Sat, 11 Sep 2021 10:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631356265;
	bh=PL+Q96Lj/YSStr44PCVL64128wg3jkNG9nr15iZfzeY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PbfbfffU0lTHf8FbFlcT8e8YOMMaZJYnXIB/RSWY3vscP9ZReszz5V1AIXbIxSiAJ
	 Ay2JOKHlLFjwpR/YtKQEeSKGxwr1Tahg/GOCV4pPbW8gVDdfBL3faXkf9qB5G3VLw3
	 G4V6DlecKJXdO3ug8VxNZlGkejKJjD92PJkQfQ2ZXAU20CrSKttKBzEgRFzgc1RPfu
	 8V/kC9k+CYxfaVT2UQij1GCPVa5g6IoFk3rwWUlj71sniweEWVIkXereR+EdieYwR5
	 wRh/vSJHOLfIcr2GiYx9eewk6T+p2D+JIK13LDqaovT1jv3PlFBVZXZ+9G8nEAhILl
	 ZPTGvH6HxzDQQ==
Date: Sat, 11 Sep 2021 13:31:02 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Josh Triplett <josh@joshtriplett.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
Message-ID: <YTyFZufZHu9BSFxk@unreal>
References: <877dfop2lx.fsf@meer.lwn.net>
 <20210911005214.71b55ac6@coco.lan>
 <YTvuDsrUNhg/VXD0@localhost>
 <87ilz8c7ff.ffs@tglx>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ilz8c7ff.ffs@tglx>

On Sat, Sep 11, 2021 at 01:55:16AM +0200, Thomas Gleixner wrote:
> On Fri, Sep 10 2021 at 16:45, Josh Triplett wrote:
> 
> > On Sat, Sep 11, 2021 at 12:52:14AM +0200, Mauro Carvalho Chehab wrote:
> >> On media, enforcing userspace to always be open source would
> >> have been very bad, as it would prevent several videoconferencing 
> >> software to exist on Linux.
> >
> > I don't think we should enforce that all userspace users of an interface
> > be Open Source. I do think we should enforce that *some* userspace user
> > of an interface be Open Source before we add the interface.
> 
> The real question is whether the interface is documented in a way that
> an Open Source implementation is possible. It does not matter whether it
> exists at that point in time or not. Even if it exists there is no
> guarantee that it is feature complete.
> 
> Freely accessible documentation is really the key.

I have more radical view than you and think that documentation is far
from being enough. I would like to see any userspace API used (or to be
used) in any package which exists in Debiam/Fedora/SuSE.

Only this will give us some sort of confidence that API and device are usable
to some level. As a side note, we will be able to estimate possible API
deprecation/fix/extension based on simple search in package databases.

IMHO, github projects to show API usage are the worst possible way to
allow acceptance for new userspace API.

Thanks

> 
> Thanks,
> 
>         tglx
> 
> 
> 

