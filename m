Return-Path: <ksummit+bounces-238-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9143BC970
	for <lists@lfdr.de>; Tue,  6 Jul 2021 12:22:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 5D02F3E1023
	for <lists@lfdr.de>; Tue,  6 Jul 2021 10:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 045262F80;
	Tue,  6 Jul 2021 10:22:07 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7EE168
	for <ksummit@lists.linux.dev>; Tue,  6 Jul 2021 10:22:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0E3B461103;
	Tue,  6 Jul 2021 10:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625566925;
	bh=852IXS+J8f6GW6p2QhTqgvqTrUd4JqVpXvJOMbJMvHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jr8JJJ7/ViMlvOu8T2jKLZPti7vS/56X3hoKYXCPvwhjkz+vWMz4tZbIuTdmGLyEz
	 m67stIB+SrlrXTZggJdcC1e2rN4uRkBoZpqWjuh6fPWyXXYyCs3MeUl9NCF3p6dNBf
	 W5mpE5jDpHx7N3YRwG41VWGOxkrtufwX96wPzG26GJgjO1bvogDzH/aZSIoyVszAoY
	 KZcYZkVwSFZ8lWA5uKqD787JUlwkuIlEFOewckVgs/oD4Um8zh6Q96pVEEVR6k2YYJ
	 wH7/+SpTRdqtp80r9/+zRr17gHGqiDg0qXHqRgqlYv78719f48Y88FuXVA3X2f/wCg
	 7KQfeLJhb/6vg==
Date: Tue, 6 Jul 2021 13:22:01 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "a. Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>,
	ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YOQuyRduQKJuKb6r@unreal>
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <YOPcZE+WjlwNueTa@unreal>
 <CACRpkdYDF-7=O1gc=Fh_mywtAgAtEVZhvoZXDFsAHMZe4FPGHQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYDF-7=O1gc=Fh_mywtAgAtEVZhvoZXDFsAHMZe4FPGHQ@mail.gmail.com>

On Tue, Jul 06, 2021 at 11:55:47AM +0200, Linus Walleij wrote:
> On Tue, Jul 6, 2021 at 6:30 AM Leon Romanovsky <leon@kernel.org> wrote:
> 
> > 1. The addition of another language to the mix will hurt a lot our
> > ability to refactor code for cross-subsystem changes.
> >
> > Just as an example, there are many changes in DMA/SG areas that are
> > applicable for many drivers. Even simple grep->replace pattern will
> > be harder and longer if it is needed for the drivers that are written
> > in different languages.
> 
> This is a fair point.
> 
> > 2. Testing matrix will be duplicated, both in compilation tests and in
> > verification coverage. Even now, there are some kernel subsystems that
> > so much in-love with CONFIG_* options that their combination is slightly
> > tested or not tested at all. So imagine, we will need to recompile
> > everything with Rust too and execute same coverage tests again.
> 
> AFAIU the idea is to replace an entire piece of code in C with the
> same piece in Rust, it's not like we are going to develop a second
> kernel in Rust inside the kernel in C. So both/and not either/or.
> I.e. you have to compile some pieces of the kernel written in
> Rust to even get to a working kernel.

Yeah, it can work.

Thanks

> 
> Yours,
> Linus Walleij

