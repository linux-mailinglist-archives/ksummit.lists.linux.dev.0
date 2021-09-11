Return-Path: <ksummit+bounces-521-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A91407AB8
	for <lists@lfdr.de>; Sun, 12 Sep 2021 00:51:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id C4EFA1C0966
	for <lists@lfdr.de>; Sat, 11 Sep 2021 22:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 934583FDA;
	Sat, 11 Sep 2021 22:51:32 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6393FC3
	for <ksummit@lists.linux.dev>; Sat, 11 Sep 2021 22:51:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C6E206108B;
	Sat, 11 Sep 2021 22:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631400690;
	bh=m1W5vK8Lvh18YVXDk9OA6JltHhc6x2MNTr9IUrLuIh8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YH0aSC9coTDcbrm1Xgv0mPxav69mN3G/JeETxbwIJLjd9gyRkA7lGWmyB+EhETt+I
	 rAFnHSIv3T9zFsKSF91Lgz5uKkW0NBBht9te3dIzc3fB1Prm2Wn8OQEcDFLDjlf5Wa
	 67O8fQK9IZleahJlE0d1nse/OeGFwLdUHLtaLEajBZZl2ODahiNX7DaJ6L62KLA4KC
	 /w8ZkEbVg27iudA+Ivf9J1IX8X4KwreK1mX436B/E8cpd4F/BH3l1gHewiA9Hgj/Rd
	 nNZjKxAhxHpdX7qpWdWj6P8l90CD4knjavp1WpKS7lUplCjjpW8qwVthti0TDCwjEz
	 C2T8/1G1ur1rg==
Date: Sun, 12 Sep 2021 00:51:27 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Thomas Gleixner
 <tglx@linutronix.de>, Josh Triplett <josh@joshtriplett.org>, Jonathan
 Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
Message-ID: <20210912005127.7ef6efac@coco.lan>
In-Reply-To: <20210911102007.77b8a189@rorschach.local.home>
References: <877dfop2lx.fsf@meer.lwn.net>
	<20210911005214.71b55ac6@coco.lan>
	<YTvuDsrUNhg/VXD0@localhost>
	<87ilz8c7ff.ffs@tglx>
	<YTv2YvLmzlJA4+tc@pendragon.ideasonboard.com>
	<20210911102007.77b8a189@rorschach.local.home>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sat, 11 Sep 2021 10:20:07 -0400
Steven Rostedt <rostedt@goodmis.org> escreveu:

> On Sat, 11 Sep 2021 03:20:50 +0300
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> 
> > > Freely accessible documentation is really the key.    
> > 
> > In principle I'd agree, but that assumes such documentation would exist
> > in the first place, with a sufficient level of quality. In many cases an
> > open implementation the exercises all device features is a better form
> > of documentation than what vendors have, even internally. Of course, the
> > opposite is true as well, having seen too much vendor code for my own
> > good, there is such a thing as a working for unreadable implementation.
> > 
> > I fully agree with your point about feature completeness by the way,
> > vendors will always find ways to hide pieces of the API if they really
> > want to, but I think that would be true of documentation as well.  
> 
> I would like not only documentation, but also an open source test suite
> that simply tests the interface. Honestly, I believe that all new
> interfaces to the kernel (open or not) should have full documentation
> and a test suite interface before it gets accepted.

Fully agreed.

> We have
> tools/selftests that should be updated with all new interfaces into the
> kernel.
> 
> Even if it's just a smoke test, that would be fine. Obviously if
> there's a driver without hardware, it can't be tested. But if you have
> that hardware, perhaps there could be a simple test suite of the
> interface to let you know it is still functional.

Those days, if a vendor is adding support for a hardware that requires 
a new API, it usually means that it is a new hardware under development.
Only such vendor may have the hardware. A smoke test would mean about
nothing to the ones reviewing the patches, except if the vendor will
also be shipping it to the reviewers.

Thanks,
Mauro

