Return-Path: <ksummit+bounces-235-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9873BC57F
	for <lists@lfdr.de>; Tue,  6 Jul 2021 06:30:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id CDEAC3E0FA5
	for <lists@lfdr.de>; Tue,  6 Jul 2021 04:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4987A2F80;
	Tue,  6 Jul 2021 04:30:34 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6008672
	for <ksummit@lists.linux.dev>; Tue,  6 Jul 2021 04:30:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B4696198B;
	Tue,  6 Jul 2021 04:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625545833;
	bh=2NO1WfoVivIMAfrb5WiyMxTGfdnKlNkebHK4Iufbc4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zu6jKwJcPiJRkA3ubr2yXgzQEPW9sNSAvTWECqM4i5IUVCjQyreE8YpZLliPIplMc
	 WITqBLAmnxSwzdoXtbQX8TpMTJptZeILc1JMtwiec0ZJCIrCODudA7F4t9lQ/HUXfo
	 3bFi1L5wpCh+5VdgHqU40ViFzpzvq6o98njSNJ8MH5axDkl8kYjSz1oA5x8/jNBWVK
	 XAEpT7SI+SUutVW82ZnCXiSfDsdeme3Y5NP86G4BsGQAtqt3alKOtJtD4qpSvLz74m
	 WlR4VYNeVkDSaBDbV7LVgpuwzpx86pLX9d/+rAutdvYt0m7LQBoHk4yzXe32qMyDfs
	 9JyIyqbmGay6Q==
Date: Tue, 6 Jul 2021 07:30:28 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	"a. Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YOPcZE+WjlwNueTa@unreal>
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>

On Tue, Jul 06, 2021 at 01:51:11AM +0200, Linus Walleij wrote:
> On Sat, Jun 26, 2021 at 12:09 AM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> 
> > The Rust for Linux project is adding support for the Rust language to
> > the Linux kernel. This talk describes the work done so far and also
> > serves as an introduction for other kernel developers interested in
> > using Rust in the kernel.
> 
> I think this is a good tech topic.

<...>

> Demonstrate how the Rust code now elegantly avoid
> ever seeing problems A,B,C again.
> 
> From this it is very easy for the kernel community to deduce that
> introducing Rust as an implementation language is worth it.

I don't know about advantages of Rust, but from what I see there are
some disadvantages that no one talks about them.

1. The addition of another language to the mix will hurt a lot our
ability to refactor code for cross-subsystem changes.

Just as an example, there are many changes in DMA/SG areas that are
applicable for many drivers. Even simple grep->replace pattern will
be harder and longer if it is needed for the drivers that are written
in different languages.

2. Testing matrix will be duplicated, both in compilation tests and in
verification coverage. Even now, there are some kernel subsystems that 
so much in-love with CONFIG_* options that their combination is slightly
tested or not tested at all. So imagine, we will need to recompile
everything with Rust too and execute same coverage tests again.

And yes, proper testing costs a lot of money, which IMHO better to
invest in improving coverage/fixing bugs/tooling instead of adding
new language to the pack.

Thanks

> 
> Yours,
> Linus Walleij
> 

