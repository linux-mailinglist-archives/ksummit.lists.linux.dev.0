Return-Path: <ksummit+bounces-239-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DC33BC9EC
	for <lists@lfdr.de>; Tue,  6 Jul 2021 12:28:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 592131C0EBF
	for <lists@lfdr.de>; Tue,  6 Jul 2021 10:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B472FB0;
	Tue,  6 Jul 2021 10:28:38 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92BE2F80
	for <ksummit@lists.linux.dev>; Tue,  6 Jul 2021 10:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id CF0A6128093E;
	Tue,  6 Jul 2021 03:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1625566833;
	bh=oFoYdK36MaAiqkSmF5bze1Y10/Gp6N/40GM0AMh+WAQ=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=wfSF6vqJUUpB4kCUZ2Kv358xQou80SQNuimZ3G0jpqmgDuQptngJW3fyfvpKTyr3o
	 oMeRc4Zb1+KzNlPyBCVn/cIh5bCgGM4XDy0F9gGFxQVL96NpsPDPq/LjJE1aa6QDoM
	 449zZ7M0pNX28ARscI9rrNugA4/QotzEbHAo6PuQ=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qxOVB9Ea5IIP; Tue,  6 Jul 2021 03:20:33 -0700 (PDT)
Received: from [192.168.0.73] (cpc1-seac25-2-0-cust181.7-2.cable.virginm.net [82.8.18.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id B81FD12808AC;
	Tue,  6 Jul 2021 03:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1625566833;
	bh=oFoYdK36MaAiqkSmF5bze1Y10/Gp6N/40GM0AMh+WAQ=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=wfSF6vqJUUpB4kCUZ2Kv358xQou80SQNuimZ3G0jpqmgDuQptngJW3fyfvpKTyr3o
	 oMeRc4Zb1+KzNlPyBCVn/cIh5bCgGM4XDy0F9gGFxQVL96NpsPDPq/LjJE1aa6QDoM
	 449zZ7M0pNX28ARscI9rrNugA4/QotzEbHAo6PuQ=
Message-ID: <19e0f737a3e58ed32758fb4758393c197437e8de.camel@HansenPartnership.com>
Subject: Re: [TECH TOPIC] Rust for Linux
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Leon Romanovsky <leon@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>,  "a. Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>
Cc: ksummit@lists.linux.dev
Date: Tue, 06 Jul 2021 11:20:30 +0100
In-Reply-To: <YOPcZE+WjlwNueTa@unreal>
References: 
	<CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
	 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
	 <YOPcZE+WjlwNueTa@unreal>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Tue, 2021-07-06 at 07:30 +0300, Leon Romanovsky wrote:
> On Tue, Jul 06, 2021 at 01:51:11AM +0200, Linus Walleij wrote:
> > On Sat, Jun 26, 2021 at 12:09 AM Miguel Ojeda
> > <miguel.ojeda.sandonis@gmail.com> wrote:
> > 
> > > The Rust for Linux project is adding support for the Rust
> > > language to the Linux kernel. This talk describes the work done
> > > so far and also serves as an introduction for other kernel
> > > developers interested in using Rust in the kernel.
> > 
> > I think this is a good tech topic.
> 
> <...>
> 
> > Demonstrate how the Rust code now elegantly avoid
> > ever seeing problems A,B,C again.
> > 
> > From this it is very easy for the kernel community to deduce that
> > introducing Rust as an implementation language is worth it.
> 
> I don't know about advantages of Rust, but from what I see there are
> some disadvantages that no one talks about them.

The main advantage is supposed to be "memory safety":

https://en.wikipedia.org/wiki/Memory_safety

But that's tempered by the fact that all non-rust code is deemed unsafe
and it's hard to write drivers without calling into the core, so
there's a lot of unsafe stuff going on even if you write your driver in
rust.

The other thing that makes comparison with C hard is the fact that
compilers and fuzzers are pretty good at detecting memory problems in
the existing code, so it's unclear what memory safety ab initio
actually buys for the kernel.

> 1. The addition of another language to the mix will hurt a lot our
> ability to refactor code for cross-subsystem changes.
> 
> Just as an example, there are many changes in DMA/SG areas that are
> applicable for many drivers. Even simple grep->replace pattern will
> be harder and longer if it is needed for the drivers that are written
> in different languages.
> 
> 2. Testing matrix will be duplicated, both in compilation tests and
> in verification coverage. Even now, there are some kernel subsystems
> that so much in-love with CONFIG_* options that their combination is
> slightly tested or not tested at all. So imagine, we will need to
> recompile everything with Rust too and execute same coverage tests
> again.

3. Less review: The lack of kernel programmers understanding rust
hampers reviewing.  Since most of our CVE type problems are usually
programming mistakes nowadays, the lack of review could contribute to
an increase in programming fault type bugs which aren't forbidden by
the safer memory model.

James



