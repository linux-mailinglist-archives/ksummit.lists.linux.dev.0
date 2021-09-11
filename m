Return-Path: <ksummit+bounces-520-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id C111D407AB6
	for <lists@lfdr.de>; Sun, 12 Sep 2021 00:42:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 3F0473E109B
	for <lists@lfdr.de>; Sat, 11 Sep 2021 22:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B25A3FDA;
	Sat, 11 Sep 2021 22:42:10 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685F53FC3
	for <ksummit@lists.linux.dev>; Sat, 11 Sep 2021 22:42:09 +0000 (UTC)
Received: from rorschach.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id AC00461039;
	Sat, 11 Sep 2021 22:42:07 +0000 (UTC)
Date: Sat, 11 Sep 2021 18:42:05 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Josh Triplett
 <josh@joshtriplett.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
Message-ID: <20210911184205.778393d3@rorschach.local.home>
In-Reply-To: <YT0o91bQ7+O5yBVu@pendragon.ideasonboard.com>
References: <877dfop2lx.fsf@meer.lwn.net>
	<20210911005214.71b55ac6@coco.lan>
	<YTvuDsrUNhg/VXD0@localhost>
	<87ilz8c7ff.ffs@tglx>
	<YTv2YvLmzlJA4+tc@pendragon.ideasonboard.com>
	<20210911102007.77b8a189@rorschach.local.home>
	<YT0o91bQ7+O5yBVu@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 12 Sep 2021 01:08:55 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> If you wanted GPU drivers to have tests in tools/selftests, you'd have
> to move Mesa to the kernel :-)

Some selftests have dependencies. It could require that Mesa is
installed to run the tests, otherwise it just returns "unsupported".

-- Steve

