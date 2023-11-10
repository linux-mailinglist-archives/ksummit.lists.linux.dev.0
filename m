Return-Path: <ksummit+bounces-1207-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C33E7E8012
	for <lists@lfdr.de>; Fri, 10 Nov 2023 19:05:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ECF23B20C23
	for <lists@lfdr.de>; Fri, 10 Nov 2023 18:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1648539876;
	Fri, 10 Nov 2023 18:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZDqyNXnx"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BC263B4;
	Fri, 10 Nov 2023 18:04:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59DD3C43395;
	Fri, 10 Nov 2023 18:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699639497;
	bh=0AQWrbC/J2WBMJ3vQLkF/+43k3FzWMsWpAaMlWDzVPQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZDqyNXnxFNS5CY3/tYiDksCc+5iyZ6nlUHEhWvxohZMefUmCIUpnpyEJj0HleYGPE
	 nI/mvhnWpH/qO1D5xmyaKLlGyEfYhDi3KYkYxU4dxRbAiEKTRZjiVSLFmUWabKPQEw
	 BDUuBygTXpL6pPa9Jf6o1xE/ugdl2vHfdtKPucus2dksccnn+Ra5seajO6OdRKNf/n
	 2hyPfTF8tz4fqyxRXS+RfOq8ve7SoQdPe+XDdBqYQNV/qsPhXcZxI+OpIKnXNJsUi5
	 shcIR9Oy1ZC7OgEzMJbUtXhUQ/g3zkAFlJfegly2DpCHtBUIKQmH6vmyS0+Ofjt+MP
	 XaZCEfISmvD1Q==
Date: Fri, 10 Nov 2023 10:04:56 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Rob Herring <robherring2@gmail.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Linus Torvalds
 <torvalds@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, Joe Perches
 <joe@perches.com>, Alex Elder <elder@ieee.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, Mark
 Brown <broonie@kernel.org>, users@linux.kernel.org, ksummit@lists.linux.dev
Subject: Re: [workflows]RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Message-ID: <20231110100456.2e65fa82@kernel.org>
In-Reply-To: <CAL_JsqLjO-vLAX7xCe641=2-ii_RRy4S7277t95GAjGGEmHiPQ@mail.gmail.com>
References: <280f404dcaab5a1cee2cc67f829c1d85aa91d772.camel@perches.com>
	<ZUu68zEzrlDVenA1@finisterre.sirena.org.uk>
	<6737487f097401510c87f38239d2f75e22fca46d.camel@perches.com>
	<20231108140415.46f84baa@gandalf.local.home>
	<eb1befce-af02-4e33-b5f2-f2ae17bf0eec@kadam.mountain>
	<20231109092701.GG21616@pendragon.ideasonboard.com>
	<903adc04-b56f-4b40-b009-4a760b3ff404@ieee.org>
	<ktmwnywdfziwkngd7exd2rmfzf3ozsws6o3u4hzch3r6ckefvs@a7pehvrsz7ii>
	<7ebbd98a64b581b42a93720896dc104398f5d322.camel@perches.com>
	<20231109-soft-anaconda-of-passion-5157c7@nitro>
	<20231109231633.GI4634@ziepe.ca>
	<CAHk-=wgskvYEw3RtsPSkzm=0aQA4hKT2+GOb2u6apcaW=8_i4g@mail.gmail.com>
	<20231110090446.479f4cf5@kernel.org>
	<CAL_JsqLjO-vLAX7xCe641=2-ii_RRy4S7277t95GAjGGEmHiPQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 10 Nov 2023 11:24:19 -0600 Rob Herring wrote:
> I think that's already possible in lei. So it comes down to who runs
> the IMAP server and where. If localhost works for you, then it should
> just be a matter of configuring lei. Though I've not tried any of this
> part of lei myself.

Nod, I've been trying to direct some newcomers towards lei for
subscribing to "manageable portions" of netdev. It's not hard,
but for folks from outside its a bit uncomfortable, and they
get stuck on details.

> And I think there's folks that just want mail delivered to their inbox
> with SMTP regardless of what lore/b4/lei can do.

I actually think that POP3 can do great things.

I know multiple people who don't even work on the kernel(!) but for
whatever reason get warm and fuzzy feelings from netdev getting
dumped into a folder in their gmail. A folder they never open.

If the SMTP gets "accidentally" unsubscribed every now and then
I'm pretty sure they'd happily switch to fetching a POP. 
IDK how representative the people I'm thinking of are, tho.

