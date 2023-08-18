Return-Path: <ksummit+bounces-1019-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CFA780E9B
	for <lists@lfdr.de>; Fri, 18 Aug 2023 17:10:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D5C71C21655
	for <lists@lfdr.de>; Fri, 18 Aug 2023 15:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9512818C23;
	Fri, 18 Aug 2023 15:09:52 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01B3374
	for <ksummit@lists.linux.dev>; Fri, 18 Aug 2023 15:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 282E9C433C9;
	Fri, 18 Aug 2023 15:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692371390;
	bh=iOrj2eeOmyanVP59sGHS3/YUpYgbcspj3NPIvjQu9wU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bW1kkD6JuBTBXR4Ls24HBgXl/jR4ueNCk+KcTiZ6JSqvTGhc0PZsHwhZQVslDpv6b
	 xq+X7eQs24GYg/hCh8E5W4Qdcdvwn7KPmc3OnrqS74D2NaHSgiBCZAVoysEv9E2pES
	 D2a6yvgsxU6/VbZbR0oH6hvXHe1QEMOvhC3v2Bm0h9mjavWtkfxEdvM5m06U0/BKlc
	 x1tOc3o4ShXZZGj6zKFJbYOI5dG/8p3aYXIomcvQ2NrLT9Cg+PIjU1aOqa36Kgrd0o
	 o3aYLgZC4c3cpLvATNxt2khoUdjoXgYWBgXVeuNT0XpLf00Egnju3Dwa6UvBQDxqPb
	 ckrAc6q0icVoQ==
Date: Fri, 18 Aug 2023 08:09:49 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Andrew Lunn
 <andrew@lunn.ch>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 ksummit@lists.linux.dev, Jeff Layton <jlayton@kernel.org>, Song Liu
 <song@kernel.org>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
Message-ID: <20230818080949.7b17b0d5@kernel.org>
In-Reply-To: <CACRpkdbfSzNwkwnew-5YN4j4yBjgh=fCiaKdPmiRbViTdOcXkw@mail.gmail.com>
References: <20230816180808.GB2919664@perftesting>
	<ZN0uNrpD8JUtihQE@bombadil.infradead.org>
	<20230817093914.GE21668@pendragon.ideasonboard.com>
	<44814ed5-7bab-4e56-9ca6-189870f97f41@lunn.ch>
	<20230817081957.1287b966@kernel.org>
	<CAADnVQ+6=RjVziJG6rXwiC0+dEKGTGFNPUgsa4dyPP66NyTbog@mail.gmail.com>
	<CACRpkdbfSzNwkwnew-5YN4j4yBjgh=fCiaKdPmiRbViTdOcXkw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 18 Aug 2023 15:55:11 +0200 Linus Walleij wrote:
> > We're trying to encourage active developers to be code reviewers as well
> > via positive/negative scores:
> > https://lore.kernel.org/bpf/ZJx8sBW%2FQPOBswNF@google.com/
> >
> > It doesn't help much yet. All incoming kernel contributors assume
> > that it's a maintainer's job to do code reviews.
> > Developers just send patches and wait. It doesn't occur to them that
> > reviewing other patches will help them land their own.  
> 
> The DRI/DRM community has group maintainership that works a little
> bit.
> Essentially it boils down to ask people to review your stuff and you
> will review and also merge their stuff in return.
> Sometimes this works.
> Especially if you are a circle of acquaintances working full
> time on similar things, yay! So much support.
> When you are a sporadic contributor it doesn't work as well.
> Because you cannot always find some matching contribution to
> review and you feel like begging.
> So different solutions for different contributors may be needed.

I keep bringing this up at the TAB meetings and after the last
maintainer summit to Linus and Ted but I feel like information 
sharing and community building across subsystem is missing.
I was wondering last time if we can do a run of short sessions 
where a few volunteers talk about their subsystems? Let's say
10min talking about
 - current process subsystem uses
 - "realities" / day to day challenges / problems
 - how the subsystem is evolving the process

We keep trying various things in our neck of the woods, I'm can
talk about net, anyone else thinks this would be useful and wants
to volunteer?

