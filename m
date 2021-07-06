Return-Path: <ksummit+bounces-243-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 662C43BD8A3
	for <lists@lfdr.de>; Tue,  6 Jul 2021 16:43:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 507C21C0EB5
	for <lists@lfdr.de>; Tue,  6 Jul 2021 14:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79F292F80;
	Tue,  6 Jul 2021 14:42:54 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A5C168
	for <ksummit@lists.linux.dev>; Tue,  6 Jul 2021 14:42:52 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6ABE8A5E;
	Tue,  6 Jul 2021 16:33:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1625582038;
	bh=+0B8cz6ZNLfrBLnubQqyJrO3oz63lVdtZmL/bFNLhv0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LmWpj9+mr8e6JfWbaAbWB9LdFpm1Bl7PFimb0F4mCwv/pIW8NiQ0ZoznC/5zVXZ4r
	 ftmtbmmgTaUwRBHe4KgViQjy8LH448EAkIDUB8a7+/XEajoGQd9eF8cFG/nkvvDV13
	 l7/W2/iWhW3Y9ufZsPhWVziuiODVnOYENUhIxNi8=
Date: Tue, 6 Jul 2021 17:33:14 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Leon Romanovsky <leon@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YORpqqzgwwoS2iAy@pendragon.ideasonboard.com>
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <YOPcZE+WjlwNueTa@unreal>
 <CANiq72nCDKQAJaPOjR167FWnrCcqnvovuHEx58Zmur6su897Qw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiq72nCDKQAJaPOjR167FWnrCcqnvovuHEx58Zmur6su897Qw@mail.gmail.com>

On Tue, Jul 06, 2021 at 04:24:07PM +0200, Miguel Ojeda wrote:
> On Tue, Jul 6, 2021 at 6:30 AM Leon Romanovsky <leon@kernel.org> wrote:
> >
> > 1. The addition of another language to the mix will hurt a lot our
> > ability to refactor code for cross-subsystem changes.
> >
> > Just as an example, there are many changes in DMA/SG areas that are
> > applicable for many drivers. Even simple grep->replace pattern will
> > be harder and longer if it is needed for the drivers that are written
> > in different languages.
> 
> In the design we chose, Rust drivers do not call C code directly --
> they go through the abstractions a given subsystem may provide. Thus
> only the abstractions would need to be updated, like any other C
> consumer of the APIs.

I think the point is that if a C API that has a Rust abstraction built
on top changes, then the Rust API exposed by abstraction may have to
change, so all Rust code that use it would need to be updated too. I
dread to think how we could do large refactoring if we can't use
Coccinelle for Rust code.

> > 2. Testing matrix will be duplicated, both in compilation tests and in
> > verification coverage. Even now, there are some kernel subsystems that
> > so much in-love with CONFIG_* options that their combination is slightly
> > tested or not tested at all. So imagine, we will need to recompile
> > everything with Rust too and execute same coverage tests again.
> 
> I am not sure I understand this point.
> 
> On its own, `CONFIG_RUST` only changes 1 single place currently (the
> addition of a `vsprintf` format specifier).
> 
> Moreover, the goal is that Rust is enabled by default for
> architectures that support it. So there would be no need for
> duplication at all.
> 
> > And yes, proper testing costs a lot of money, which IMHO better to
> > invest in improving coverage/fixing bugs/tooling instead of adding
> > new language to the pack.
> 
> The original RFC includes an overview of advantages and disadvantages of Rust:
> 
>   https://lore.kernel.org/lkml/20210414184604.23473-1-ojeda@kernel.org/
> 
> Rust brings things to the table that less-than-100%-coverage and
> tooling cannot. For instance, UBSAN catches UB, but the safe subset of
> Rust forbids UB statically (assuming unsafe code is sound).
> 
> Trying to clarify this sort of thing is why I included the "quick
> introduction of the Rust language" point in the abstract of the tech
> topic -- I think it is worth having a common ground to discuss things
> and getting everybody on the same page.

-- 
Regards,

Laurent Pinchart

