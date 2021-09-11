Return-Path: <ksummit+bounces-522-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id B1954407ABF
	for <lists@lfdr.de>; Sun, 12 Sep 2021 01:11:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 5A9D13E10A6
	for <lists@lfdr.de>; Sat, 11 Sep 2021 23:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9299E3FDA;
	Sat, 11 Sep 2021 23:11:22 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FA03FC3
	for <ksummit@lists.linux.dev>; Sat, 11 Sep 2021 23:11:21 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AFA19DD;
	Sun, 12 Sep 2021 01:11:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1631401878;
	bh=VuX+L9Ggjfpu7rDEaXW1P5wkatlT/LHRMUWboQhYL8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W+qKS5gM3Tbkv+6WRyd4D7Z+zGP0hyPSlCAYsp5bqPN2aOkPeHI6QKM9Y94BEYOpU
	 prbpbLL+cw8rnxf98MQfbhezjFCkfh3LynP4czY6SzsUgWwPHV75794IFvepAuL1FQ
	 PhubIbSZqH9niPZjGU1YQzuoUSKc77dHxA70/hQw=
Date: Sun, 12 Sep 2021 02:10:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Josh Triplett <josh@joshtriplett.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
Message-ID: <YT03gAx6GjiRgrUR@pendragon.ideasonboard.com>
References: <877dfop2lx.fsf@meer.lwn.net>
 <20210911005214.71b55ac6@coco.lan>
 <YTvuDsrUNhg/VXD0@localhost>
 <87ilz8c7ff.ffs@tglx>
 <YTv2YvLmzlJA4+tc@pendragon.ideasonboard.com>
 <20210911102007.77b8a189@rorschach.local.home>
 <YT0o91bQ7+O5yBVu@pendragon.ideasonboard.com>
 <20210911184205.778393d3@rorschach.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210911184205.778393d3@rorschach.local.home>

Hi Steven,

On Sat, Sep 11, 2021 at 06:42:05PM -0400, Steven Rostedt wrote:
> On Sun, 12 Sep 2021 01:08:55 +0300 Laurent Pinchart wrote:
> 
> > If you wanted GPU drivers to have tests in tools/selftests, you'd have
> > to move Mesa to the kernel :-)
> 
> Some selftests have dependencies. It could require that Mesa is
> installed to run the tests, otherwise it just returns "unsupported".

Obviously, I should have considered that.

Projects such as Mesa or libcamera have extensive test suites for the
supported devices. Is that something you'd like to integrate with
selftests ? I'm not really sure how that should be done.

-- 
Regards,

Laurent Pinchart

