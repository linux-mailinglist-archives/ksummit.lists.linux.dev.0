Return-Path: <ksummit+bounces-258-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id EDADD3BDD5D
	for <lists@lfdr.de>; Tue,  6 Jul 2021 20:39:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 3190D1C0E88
	for <lists@lfdr.de>; Tue,  6 Jul 2021 18:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ACEC2FAF;
	Tue,  6 Jul 2021 18:38:57 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B2870
	for <ksummit@lists.linux.dev>; Tue,  6 Jul 2021 18:38:56 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 78002A5E;
	Tue,  6 Jul 2021 20:38:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1625596733;
	bh=w8UXpSwvhF1C7XTU/B1glTXMtEIOrpjTYvtY+yehpHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rLIqnV8b+A17mbWt8GwoX4bfuuo7q96Lz5Y1YPOKa8dxCYedGHTmKVrCAuBU7J66w
	 mi/SoXhaO8AROMDja2MROIsc0FPrH2BAC02qlKCfHJOrN6zi2rUyolKdNMYdZv7dpW
	 2VcH4QbN58YU/SZ4KJG2RgaE1eUR3g7pSIuFDK7U=
Date: Tue, 6 Jul 2021 21:38:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Sasha Levin <sashal@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Leon Romanovsky <leon@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YOSjETKWhuRz0Poq@pendragon.ideasonboard.com>
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <YOPcZE+WjlwNueTa@unreal>
 <CACRpkdYDF-7=O1gc=Fh_mywtAgAtEVZhvoZXDFsAHMZe4FPGHQ@mail.gmail.com>
 <CANiq72m3dkUOoAfQz8vY2UR3uaUkFD8rs=95k7sEm0KEqU8Zxw@mail.gmail.com>
 <YORwwQJfrpNQsGT4@sashalap>
 <CANiq72n=_LG3z8-JYVSiNeM8PgxauPh5_xjfY1hY_gnJaGsYng@mail.gmail.com>
 <YOR52oSIGkNA03jf@pendragon.ideasonboard.com>
 <CANiq72=vjXYN-A1gZysXzKvR+NgmxpSGOiOGro0S6tMhYAwR6Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiq72=vjXYN-A1gZysXzKvR+NgmxpSGOiOGro0S6tMhYAwR6Q@mail.gmail.com>

Hi Miguel,

On Tue, Jul 06, 2021 at 08:29:21PM +0200, Miguel Ojeda wrote:
> On Tue, Jul 6, 2021 at 5:43 PM Laurent Pinchart wrote:
> >
> > There are lots of core APIs that are used by most drivers and that are
> > not subsystem-specific, so those will need to be considered too.
> 
> Yes, but those are maintained in the "common"/shared support, e.g.
> data structures, sync-related facilities, etc.; and hopefully will be
> much better understood by everyone.
> 
> > Additionally, even if there's a subsystem maintainer willing to maintain
> > a Rust abstraction, it also means that someone doing tree-wide or
> > subsystem-wide refactoring will need to pull the maintainer(s) in and
> > make it a team project. I really don't see how that can scale, tree-wide
> > changes are already very painful.
> >
> > I'm afraid that doesn't really match how development is done today :-)
> > Lots of subsystem-wide refactoring is done by developers who are not
> > subsystem maintainers.
> 
> What I was saying is that the changes need to go through the
> maintainers, which then would know Rust and the abstractions they
> maintain.
> 
> Of course, somebody wishing to do tree-wide refactoring needs to know
> at least a bit of Rust to at least know how to refactor and submit the
> code for the maintainers -- but that is a given.
> 
> After all, if we are going to have Rust as a second language in the
> kernel, we should try to have as many people on board as possible, at
> least to some degree, within some reasonable time frame.

I agree with you here, it's a honest way to look at it: adopting Rust as
a second language in the kernel isn't just a technical decision with
limited impact, but also a process decision that will create a
requirement for most kernel developers to learn Rust. Whether that
should and will happen is what we're debating, but regardless of the
outcome, it's important to phrase the question correctly, with a broad
view of the implications.

(That being said, there are also lots of technical challenges of course)

-- 
Regards,

Laurent Pinchart

