Return-Path: <ksummit+bounces-251-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BB63BDA65
	for <lists@lfdr.de>; Tue,  6 Jul 2021 17:43:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 1BCF53E10E0
	for <lists@lfdr.de>; Tue,  6 Jul 2021 15:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4FB82F80;
	Tue,  6 Jul 2021 15:43:05 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA3E168
	for <ksummit@lists.linux.dev>; Tue,  6 Jul 2021 15:43:04 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B7256A5E;
	Tue,  6 Jul 2021 17:43:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1625586181;
	bh=AAWavSA22oqEefoaHFLajadc0dZlq4L/tHojjc2loNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HHm0ClxBX/F3TAImiAAFMolSzkp/OTRooG5Ggbp2d1Q1DMn5k+Ej1Dogd8WYrC//I
	 elZmUSVXWC68PCV46wTDFxtl9nbRRaGehq1IVWBhlw1Lk6TgdZHYi05sHCJa31FShB
	 Kf1peqVfhVeFfVCnXFsqyrQE4yEqs+xStSGvjHbU=
Date: Tue, 6 Jul 2021 18:42:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Sasha Levin <sashal@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Leon Romanovsky <leon@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YOR52oSIGkNA03jf@pendragon.ideasonboard.com>
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <YOPcZE+WjlwNueTa@unreal>
 <CACRpkdYDF-7=O1gc=Fh_mywtAgAtEVZhvoZXDFsAHMZe4FPGHQ@mail.gmail.com>
 <CANiq72m3dkUOoAfQz8vY2UR3uaUkFD8rs=95k7sEm0KEqU8Zxw@mail.gmail.com>
 <YORwwQJfrpNQsGT4@sashalap>
 <CANiq72n=_LG3z8-JYVSiNeM8PgxauPh5_xjfY1hY_gnJaGsYng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiq72n=_LG3z8-JYVSiNeM8PgxauPh5_xjfY1hY_gnJaGsYng@mail.gmail.com>

On Tue, Jul 06, 2021 at 05:33:42PM +0200, Miguel Ojeda wrote:
> On Tue, Jul 6, 2021 at 5:03 PM Sasha Levin <sashal@kernel.org> wrote:
> >
> > Does this mean that anyone who wishes to modify these C APIs must also
> > know Rust to fix up those abstractions too?
> 
> Please see my answer to James and Leon, i.e. if we have abstractions
> for a particular subsystem, it should mean somebody is happy to write,
> use and maintain them.

There are lots of core APIs that are used by most drivers and that are
not subsystem-specific, so those will need to be considered too.

Additionally, even if there's a subsystem maintainer willing to maintain
a Rust abstraction, it also means that someone doing tree-wide or
subsystem-wide refactoring will need to pull the maintainer(s) in and
make it a team project. I really don't see how that can scale, tree-wide
changes are already very painful.

> That means that, yes, for subsystems that have Rust abstractions, if
> you want to touch the C API, you also need to do so for the Rust
> abstractions. But for any heavy refactor, I would expect maintainers
> being the ones doing it, or at least helping to do so if somebody else
> wants to change something in the C side and does not know how to
> update the Rust side.

I'm afraid that doesn't really match how development is done today :-)
Lots of subsystem-wide refactoring is done by developers who are not
subsystem maintainers.

-- 
Regards,

Laurent Pinchart

