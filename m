Return-Path: <ksummit+bounces-513-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 624DE4078C3
	for <lists@lfdr.de>; Sat, 11 Sep 2021 16:20:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 0FC563E1060
	for <lists@lfdr.de>; Sat, 11 Sep 2021 14:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75CE23FDA;
	Sat, 11 Sep 2021 14:20:12 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D6E3FC3
	for <ksummit@lists.linux.dev>; Sat, 11 Sep 2021 14:20:10 +0000 (UTC)
Received: from rorschach.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 55670611CC;
	Sat, 11 Sep 2021 14:20:09 +0000 (UTC)
Date: Sat, 11 Sep 2021 10:20:07 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Josh Triplett
 <josh@joshtriplett.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
Message-ID: <20210911102007.77b8a189@rorschach.local.home>
In-Reply-To: <YTv2YvLmzlJA4+tc@pendragon.ideasonboard.com>
References: <877dfop2lx.fsf@meer.lwn.net>
	<20210911005214.71b55ac6@coco.lan>
	<YTvuDsrUNhg/VXD0@localhost>
	<87ilz8c7ff.ffs@tglx>
	<YTv2YvLmzlJA4+tc@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 11 Sep 2021 03:20:50 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> > Freely accessible documentation is really the key.  
> 
> In principle I'd agree, but that assumes such documentation would exist
> in the first place, with a sufficient level of quality. In many cases an
> open implementation the exercises all device features is a better form
> of documentation than what vendors have, even internally. Of course, the
> opposite is true as well, having seen too much vendor code for my own
> good, there is such a thing as a working for unreadable implementation.
> 
> I fully agree with your point about feature completeness by the way,
> vendors will always find ways to hide pieces of the API if they really
> want to, but I think that would be true of documentation as well.

I would like not only documentation, but also an open source test suite
that simply tests the interface. Honestly, I believe that all new
interfaces to the kernel (open or not) should have full documentation
and a test suite interface before it gets accepted. We have
tools/selftests that should be updated with all new interfaces into the
kernel.

Even if it's just a smoke test, that would be fine. Obviously if
there's a driver without hardware, it can't be tested. But if you have
that hardware, perhaps there could be a simple test suite of the
interface to let you know it is still functional.

-- Steve

