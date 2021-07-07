Return-Path: <ksummit+bounces-288-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5FC3BE8FA
	for <lists@lfdr.de>; Wed,  7 Jul 2021 15:46:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 64C493E1015
	for <lists@lfdr.de>; Wed,  7 Jul 2021 13:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7E6E2F80;
	Wed,  7 Jul 2021 13:46:15 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD3B70
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 13:46:13 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 24113C688A
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 13:39:10 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 17F7F1BF210;
	Wed,  7 Jul 2021 13:39:01 +0000 (UTC)
Date: Wed, 7 Jul 2021 15:39:00 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Sasha Levin <sashal@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Leon Romanovsky <leon@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YOWudA2OAuifxxzH@piout.net>
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <YOPcZE+WjlwNueTa@unreal>
 <CACRpkdYDF-7=O1gc=Fh_mywtAgAtEVZhvoZXDFsAHMZe4FPGHQ@mail.gmail.com>
 <CANiq72m3dkUOoAfQz8vY2UR3uaUkFD8rs=95k7sEm0KEqU8Zxw@mail.gmail.com>
 <YORwwQJfrpNQsGT4@sashalap>
 <CANiq72n=_LG3z8-JYVSiNeM8PgxauPh5_xjfY1hY_gnJaGsYng@mail.gmail.com>
 <YOSmkgFpSUWtf2ue@sashalap>
 <CANiq72keYwLBY7_nRUN5RTxhQATgsi=LpYsCb59Zv+D4sg=iDg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72keYwLBY7_nRUN5RTxhQATgsi=LpYsCb59Zv+D4sg=iDg@mail.gmail.com>

On 06/07/2021 23:50:51+0200, Miguel Ojeda wrote:
> On Tue, Jul 6, 2021 at 10:47 PM Sasha Levin <sashal@kernel.org> wrote:
> >
> > I strongly disagree. If we have abstractions for a particular subsystem
> > all it means that someone at some point did that work, nothing more than
> > that.
> >
> > That someone might have moved on, working elsewhere, retired, etc, and
> > those abstractions are living orphaned in the kernel.
> 
> That problem is orthogonal to Rust/C. I already acknowledged that if
> you want to refactor Rust code, you will need some bare minimum Rust
> knowledge -- there is no way around that, for any language.
> 
> And indeed, a second language introduces downsides like this -- this
> is also acknowledged in the original RFC.
> 
> What I am saying is that, in the beginning (when most kernel
> developers are not accustomed to Rust), a solution would be that
> subsystem maintainers could step up and help those doing a refactor
> that touches their Rust code. We also discussed a bit of this in the
> original LKML discussion back in April; and we also offered ourselves
> (the Rust support folks) to help as much as we can if anybody is
> having issues on the Rust side.

So that means that if a subsystem maintainer doesn't know Rust, Rust
code should not be merge in that subsystem at all.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

