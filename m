Return-Path: <ksummit+bounces-245-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id D79543BD929
	for <lists@lfdr.de>; Tue,  6 Jul 2021 16:56:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 064831C0ED8
	for <lists@lfdr.de>; Tue,  6 Jul 2021 14:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 484AC2FB0;
	Tue,  6 Jul 2021 14:56:24 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB312F80
	for <ksummit@lists.linux.dev>; Tue,  6 Jul 2021 14:56:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4E95461107;
	Tue,  6 Jul 2021 14:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625583383;
	bh=L/hYQjdVc52IAUtxtT0II2T0960ouJZmQW4g1U59ulM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l1ymubTdGTncAETlPNKpO+qlyQfx9H0xMQnf+U5G2HcijEHkOGy8sMy0vaJJpGL2L
	 DioLVDDcuJ9BDPDLMaaDG/yaMLoOrjT9f2xKi90rHpmMkoZuQlPIOal7j3yJHqJQ8C
	 XnthhV+vpG8lOakalYGj8OeITUszYczGI09diOMMgNCsaFvONqo1bmpBl4vtKXgrDA
	 J36BmQuVzqp5fbF7WXZWuJDm4NytAN0PMYS09YFWlguQc0Lei2+kaTozerl1ncBK0m
	 fRSJlJ233iqh0OysD2rkbmdm7v5C3RnBqPFFVtphzdz7CKc/7uT21BgEBmPeS5ngIk
	 gwUA7L5M9O3mg==
Date: Tue, 6 Jul 2021 17:56:19 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YORvE7Oe8fiJkjTh@unreal>
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
Content-Type: text/plain; charset=us-ascii
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

In such case, I see no easy way to do refactoring. Many (at least for me)
refactoring changes are not simple sed commands, but more comprehensive
deep dive into the code which requires to see the actual API usage.

Even for the simple cases, where someone changes return value type, he/she
will need to update the logic in the driver. How will abstractions help us here?

IMHO, even worse, people will be less willing to change in-kernel APIs
because of such abstractions.

> 
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

My point is that we have a customers who run upstream/stable/distro kernels
on old systems which we need to support. The default CONFIG_RUST=y in .config
is nice, but most users won't get it or enable it.

So we will need CONFIG_RUST=n to make sure that code for the customers
work and we will need CONFIG_RUST=y to make sure that at least
compilation passes.

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

Thanks for the summary, I just disagree with the punch line:
 "the advantages of using Rust outweighs the cost".

Thanks

> 
> Cheers,
> Miguel

