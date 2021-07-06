Return-Path: <ksummit+bounces-265-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 735003BDE27
	for <lists@lfdr.de>; Tue,  6 Jul 2021 21:45:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 9E1961C0ECD
	for <lists@lfdr.de>; Tue,  6 Jul 2021 19:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0551F2F80;
	Tue,  6 Jul 2021 19:45:23 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A1070
	for <ksummit@lists.linux.dev>; Tue,  6 Jul 2021 19:45:21 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 15C4E61A36;
	Tue,  6 Jul 2021 19:45:21 +0000 (UTC)
Date: Tue, 6 Jul 2021 15:45:19 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Sasha Levin
 <sashal@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Leon
 Romanovsky <leon@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <20210706154519.6f378c34@gandalf.local.home>
In-Reply-To: <YOSjETKWhuRz0Poq@pendragon.ideasonboard.com>
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
	<CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
	<YOPcZE+WjlwNueTa@unreal>
	<CACRpkdYDF-7=O1gc=Fh_mywtAgAtEVZhvoZXDFsAHMZe4FPGHQ@mail.gmail.com>
	<CANiq72m3dkUOoAfQz8vY2UR3uaUkFD8rs=95k7sEm0KEqU8Zxw@mail.gmail.com>
	<YORwwQJfrpNQsGT4@sashalap>
	<CANiq72n=_LG3z8-JYVSiNeM8PgxauPh5_xjfY1hY_gnJaGsYng@mail.gmail.com>
	<YOR52oSIGkNA03jf@pendragon.ideasonboard.com>
	<CANiq72=vjXYN-A1gZysXzKvR+NgmxpSGOiOGro0S6tMhYAwR6Q@mail.gmail.com>
	<YOSjETKWhuRz0Poq@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 6 Jul 2021 21:38:09 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> I agree with you here, it's a honest way to look at it: adopting Rust as
> a second language in the kernel isn't just a technical decision with
> limited impact, but also a process decision that will create a
> requirement for most kernel developers to learn Rust. Whether that
> should and will happen is what we're debating, but regardless of the
> outcome, it's important to phrase the question correctly, with a broad
> view of the implications.

I for one, welcome our new Rust overlords!

-- Steve

