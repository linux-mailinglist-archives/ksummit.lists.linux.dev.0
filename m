Return-Path: <ksummit+bounces-712-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from da.mirrors.kernel.org (da.mirrors.kernel.org [139.178.84.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 7494855A9A2
	for <lists@lfdr.de>; Sat, 25 Jun 2022 14:04:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by da.mirrors.kernel.org (Postfix) with ESMTPS id C6C392E0A55
	for <lists@lfdr.de>; Sat, 25 Jun 2022 12:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23AB028E4;
	Sat, 25 Jun 2022 12:04:07 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6B24A19
	for <ksummit@lists.linux.dev>; Sat, 25 Jun 2022 12:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90383C3411C;
	Sat, 25 Jun 2022 12:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656158645;
	bh=vB4In3INtqP94PXlc318Cy8TjI4qj3LdHUmD3OuHnOo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hjumWdOsKd+Mf+gD4eRsrntNAMVqpzBlB39YFRo4n4uF1IKBAd8Qf0ED5+9TOCVq5
	 IcfW0CTTdGT2fw50Rnu817EiYcDEHmgxPp7GeZK1PxbtelWt1HgRBedw4QMghDyd9P
	 4kFIe+S2TOvkkgPQ65gN1e1cXTC+4d67dqiYqWcK4meOhnbAtL+GO17AYH79hpjiqm
	 QQdOKPTgugyJvHL+SsnJdFSZmYcQ5attjXb1GjgeK1Hb2GeCtU4VtGdoG636V0pRDz
	 pRlH9fXNdohhc46tYUbqnpKILPVUJLkvBQEamvDg9z3ZzRIuHbHLmbIRG3R1Ua/KGp
	 wtqXz6XgX6ZtA==
Date: Sat, 25 Jun 2022 13:03:59 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jens Axboe
 <axboe@kernel.dk>, Christoph Hellwig <hch@infradead.org>, Miguel Ojeda
 <miguel.ojeda.sandonis@gmail.com>, ksummit@lists.linux.dev, ksummit
 <ksummit-discuss@lists.linuxfoundation.org>
Subject: Re: [Ksummit-discuss] [MAINTAINER SUMMIT] Are we becoming too
 fearful? [was Re: [TECH TOPIC] Rust]
Message-ID: <20220625130353.6fbc56d2@sal.lan>
In-Reply-To: <ca6243160b36aa42f4d0ad23853b84e57ca366f1.camel@HansenPartnership.com>
References: <CANiq72nNKvFqQs9Euy=_McfcHf0-dC_oPB3r8ZJii2L3sfVjaw@mail.gmail.com>
	<Yq44nyu7P1uhBVGi@pendragon.ideasonboard.com>
	<Yq6+p+aRCjeZ7QsS@infradead.org>
	<Yq70keAYGQQmyJLm@pendragon.ideasonboard.com>
	<2513dc4528c71d34d400c104e91ada6517869886.camel@HansenPartnership.com>
	<d3ba4011-a31d-05fa-b5de-808a1a5ee56f@kernel.dk>
	<Yq8qaqr673UFFG6y@pendragon.ideasonboard.com>
	<cefa5e41b74c96c81003cfd421cf754a03cc7f52.camel@HansenPartnership.com>
	<ca6243160b36aa42f4d0ad23853b84e57ca366f1.camel@HansenPartnership.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sun, 19 Jun 2022 10:45:00 -0400
James Bottomley <James.Bottomley@HansenPartnership.com> escreveu:

> I think there's a growing problem in Linux which is exemplified by this
> Rust debate but which goes way beyond it: We're becoming too fearful of
> making big decisions to sustain innovation in some areas.

I don't think so. Rust is special in the sense that, if it succeeds
and the Kernel ends being Rewritten in Rust, it will affect everyone.
On a huge community like the Kernel, that means that this topic will
surely attract lots of discussions, and that decisions will be tough,
as it is hard to reach consensus. 

Yet, we're experimenting with it, meaning that the community is willing
to try innovating, even when this trying something different from
everything else already tried in the past.

> The biggest area where we currently squelch innovation is around
> anything that touches the user space ABI.  Allegations of having to get
> everything right ab initio because we have to support it "forever" and
> all the subsequent wittering and second guessing are really stifling
> innovation in pretty much anything that could be exposed to user space.

I agree with that. In the past, we have the EXPERIMENTAL kconfig where
we did some experiments even with uAPI/uAPI. Nowadays, lots of such
experiments are actually happening happen outside upstream, as:

1) it is very hard to have maintainers accept APIs that are used only
   by a single driver;

2) nobody wants to carry the costs of adding backward-compatible
   workarounds for APIs that ends requiring changes after new hardware
   devices would require changes on it.

Not sure how to address it without adding an "API staging" support
somehow.

Regards,
Mauro

