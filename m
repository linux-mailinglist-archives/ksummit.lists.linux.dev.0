Return-Path: <ksummit+bounces-51-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50484367EC8
	for <lists@lfdr.de>; Thu, 22 Apr 2021 12:37:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id EC9713E4BD1
	for <lists@lfdr.de>; Thu, 22 Apr 2021 10:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC342FA1;
	Thu, 22 Apr 2021 10:36:05 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307512F81
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 10:36:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C0AC61450;
	Thu, 22 Apr 2021 10:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619087763;
	bh=5wNm8Sbjle7gUDhSrhtC7uYY5LVFqLRjaq6HFAhx1qg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tj/HIXLYMZwhEXYgTGoATJGGxKZktzoXc3y4+Lwamnm7dYMZ7b4Eo5ma5PYp0afHj
	 zhdYpnaOW31toj3/0iy5NvvKTVVq01b0UpCv91RUp0nIkJp8VWs7wMFpFpgs+rCyWc
	 9BcE+JUn69NA5HfaoxvAWMPqUbDWgIsQ9NopSJLjfzdju8/zbP53TXmnIBHTHXEERh
	 BsOZ9qcWRGlvQB4uoC5Kr+hT0Qq7XpA7SuYwG5/1ktFAhlWx1m82kEaoKMWMmaTF1J
	 n5wpoRTGZJPtubW7ds9OtrRcDiRD1FVpsnTQPXTkoIzn1BGFPqJIDOs5rPFNSqLyIB
	 5Jc0uBHEfQM2g==
Date: Thu, 22 Apr 2021 12:35:59 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210422123559.1dc647fb@coco.lan>
In-Reply-To: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi James,

Em Wed, 21 Apr 2021 11:35:36 -0700
James Bottomley <James.Bottomley@HansenPartnership.com> escreveu:

> I've long been on record as not really being a fan of trivial patches
> because they can cause merge issues with current patches and introduce
> bugs, particularly in older drivers, that don't get detected for a long
> while.  However, the recent events with the University of Minnesota:
> 
> https://lore.kernel.org/lkml/20210421130105.1226686-1-gregkh@linuxfoundation.org/
> 
> Have elevated the risk factor around trivial patches claiming to fix
> bugs to the point where it looks like there's no such thing as a truly
> trivial patch and they all need reviewing.
> 
> Our policy in SCSI for a long time has been no trivial patches accepted
> to maintained drivers, and I think that would be a good start if
> adopted kernel wide, but I think the next policy should be no trivial
> bug fix without a pointer to the actual bug report or report from a
> trusted static checker.  This would likely mean we have to create a
> list of trusted static checkers ... obviously 0day and coverity but
> what else?

I agree that we should have a "Rethinking the acceptance policy" talk
at the Maintainer Summit, but it should cover a scope wider than just
trivial patches. At least the patches I checked, sent from "@unm.edu" 
to media subsystem, they all looked good enough to be merged[1].

The main question is actually what's the degree of confidence a
maintainer can rely on a patch sent from a random contributor.

That's not an easy task.

I mean, usually, each maintainer develops internally a "trust score"
from subsystem's contributors, but such trustee level is usually not
shared with other maintainers.

When a developer reaches a certain level, maintainers are willing
to merge their work faster as they know that the developer is
there for a while and it is not trying to harm the community.

Perhaps one thing that we could add would be a
scripts/get_developer_trustee_status, which would be returning
a set of indicators that would help the maintainer to know
how much it can trust a random contributor, like:

	- how many drivers and patches a contributor has written;
	- how long and how frequent he's sending Kernel patches;
	- what subsystems received patches from him;
	- if the developer isn't on a blacklist/graylist.


Thanks,
Mauro

