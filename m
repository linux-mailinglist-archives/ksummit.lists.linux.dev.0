Return-Path: <ksummit+bounces-83-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D3136827B
	for <lists@lfdr.de>; Thu, 22 Apr 2021 16:31:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 82B3A3E69B2
	for <lists@lfdr.de>; Thu, 22 Apr 2021 14:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC92C2FA0;
	Thu, 22 Apr 2021 14:31:08 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06D070
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 14:31:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D8AB613E1;
	Thu, 22 Apr 2021 14:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619101867;
	bh=LxzxJXcAoUP5mfMmF7FBpdwrMYgfddWWm8erVEoQ278=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=S+91RxGW1llDdGfs5Q58dQoHqRICXx06A0Bemy9xtj8e/tbiNY7UUrFO916vAoNi+
	 TXPQD1CuIqcKNCzhv2gYNUBNahEdWsM66ea2/kMwSj0WmwG3B41kkS1ysZG2Dgd4dz
	 V4K2UfMTTQLccsX1mgQCeIyzqa9kuRu7bUkXU5bGoAaVOVxB1nK6TiHAz6a2emeZEP
	 aIIguuaI1JMYDnK30nYAOmbDXHBRJl4J/PED5LJhU5TxGaj/yhoA+r9wPgJek1Yp1S
	 fu+hzE81PLfUTvg7DANAmsFjVdxDoeJfZLxjWGP6ZMH7fRzqgwm5iq9nA3Q42yPADL
	 3PjozwAjR4K6Q==
Date: Thu, 22 Apr 2021 16:31:03 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
 ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210422163103.4db095bd@coco.lan>
In-Reply-To: <20210422132401.grykyup37xdz3yly@nitro.local>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
	<20210422123559.1dc647fb@coco.lan>
	<20210422132401.grykyup37xdz3yly@nitro.local>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 22 Apr 2021 09:24:01 -0400
Konstantin Ryabitsev <konstantin@linuxfoundation.org> escreveu:

> On Thu, Apr 22, 2021 at 12:35:59PM +0200, Mauro Carvalho Chehab wrote:
> > I mean, usually, each maintainer develops internally a "trust score"
> > from subsystem's contributors, but such trustee level is usually not
> > shared with other maintainers.
> > 
> > When a developer reaches a certain level, maintainers are willing
> > to merge their work faster as they know that the developer is
> > there for a while and it is not trying to harm the community.  
> 
> > 
> > Perhaps one thing that we could add would be a
> > scripts/get_developer_trustee_status, which would be returning
> > a set of indicators that would help the maintainer to know
> > how much it can trust a random contributor, like:
> > 
> > 	- how many drivers and patches a contributor has written;
> > 	- how long and how frequent he's sending Kernel patches;
> > 	- what subsystems received patches from him;
> > 	- if the developer isn't on a blacklist/graylist.  
> 
> I must point out that "karma" systems are quite ripe for abuse and can create
> negative dynamics within the project. Right now, without an accepted framework
> of cryptographic patch attestation, high-karma accounts will be more likely to
> be targeted for impersonation -- typo spoofing, account hijacking, "From"
> fudging [*], etc.

Good point.

> Even if we do everything right and implement strong cryptographic end-to-end
> attestation,

IMO, it makes sense to improve our workflow towards having gpg-signed patches
that are cross-signed by Kernel maintainers from developers that are regular
contributors.

Of course, a change like that takes time.

> I think karma makes sense within the vertical confines of submaintainer
> hierarchy -- X collects patches and sends a pull request to Y; Y verifies the
> signature on the pull request, gives it a quick review and submits another
> request to Z, etc. Exporting the "karma points" outside of this hierarchy
> doesn't really make sense.

Yeah, it makes a lot sense vertically, but it also makes sense horizontally:
the karma from a long time subsystem maintainer is higher than a random
contributor, even when contributing to a different subsystem. The reason is
that it is unlikely that such contributor would just disappear in the thin
air if something bad comes up from merging his patch.

Thanks,
Mauro

