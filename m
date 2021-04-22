Return-Path: <ksummit+bounces-79-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E68D36820E
	for <lists@lfdr.de>; Thu, 22 Apr 2021 16:02:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id B8DB31C5884
	for <lists@lfdr.de>; Thu, 22 Apr 2021 14:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B05862FA1;
	Thu, 22 Apr 2021 14:00:26 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88E92F9B
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 14:00:25 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 623BB6142F;
	Thu, 22 Apr 2021 14:00:23 +0000 (UTC)
Date: Thu, 22 Apr 2021 10:00:21 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev, Jiri
 Kosina <jikos@kernel.org>
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210422100021.1a3f143c@gandalf.local.home>
In-Reply-To: <CADVatmM8Nrht+nWpP99WQSm8HtHimNkjmUFDjjRTmMjuB+401Q@mail.gmail.com>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
	<20210422123559.1dc647fb@coco.lan>
	<CADVatmM8Nrht+nWpP99WQSm8HtHimNkjmUFDjjRTmMjuB+401Q@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 22 Apr 2021 12:03:24 +0100
Sudip Mukherjee <sudipm.mukherjee@gmail.com> wrote:

> May I suggest that we have a separate tree for trivial patches like
> the trivial.git tree that Jiri has and all trivial patches goes

Funny that you suggest something that we already have and you mention. Yes
Jiri had the trivial tree, but because it ends up being a lot of work, and
if the maintainer of that tree doesn't have the time to maintain it, it
becomes a dead end for those patches.

It requires someone with a good enough reputation to maintain it, and that
means most people who have that reputation do not have the time to maintain
it ;-)

> through that tree. There can be a separate set of reviewers for those
> patches who can work under the guidance of GregKH or others who are
> looking at trivial patches on a daily basis for staging subsystem. But
> I guess the question is where do you draw the boundary of a patch
> being trivial or not.

The way it use to work was that if a patch was deemed trivial by the
maintainer, they could simply Cc the trivial email and say, trivial patch.
And then the trivial maintainer (use to be Jiri) would pull it in. It was
nice, as I didn't have to worry about putting those patches into my full 13
hour test suite ;-)

-- Steve


