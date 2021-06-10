Return-Path: <ksummit+bounces-190-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B61823A34E4
	for <lists@lfdr.de>; Thu, 10 Jun 2021 22:32:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id A75791C0E5C
	for <lists@lfdr.de>; Thu, 10 Jun 2021 20:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72A9F2FB9;
	Thu, 10 Jun 2021 20:32:03 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBE52F80
	for <ksummit@lists.linux.dev>; Thu, 10 Jun 2021 20:32:02 +0000 (UTC)
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 391D761287;
	Thu, 10 Jun 2021 20:32:00 +0000 (UTC)
Date: Thu, 10 Jun 2021 16:31:58 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, "Enrico Weigelt, metux IT consult"
 <lkml@metux.net>, David Hildenbrand <david@redhat.com>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, Greg KH <greg@kroah.com>,
 Christoph Lameter <cl@gentwo.de>, Theodore Ts'o <tytso@mit.edu>, Jiri
 Kosina <jikos@kernel.org>, ksummit@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-api@vger.kernel.org
Subject: Re: Maintainers / Kernel Summit 2021 planning kick-off
Message-ID: <20210610163158.017a9721@oasis.local.home>
In-Reply-To: <YMJ0IlYGHzwBNz2t@casper.infradead.org>
References: <alpine.DEB.2.22.394.2105271522320.172088@gentwo.de>
	<YK+esqGjKaPb+b/Q@kroah.com>
	<c46dbda64558ab884af060f405e3f067112b9c8a.camel@HansenPartnership.com>
	<b32c8672-06ee-bf68-7963-10aeabc0596c@redhat.com>
	<5038827c-463f-232d-4dec-da56c71089bd@metux.net>
	<20210610182318.jrxe3avfhkqq7xqn@nitro.local>
	<YMJcdbRaQYAgI9ER@pendragon.ideasonboard.com>
	<20210610152633.7e4a7304@oasis.local.home>
	<37e8d1a5-7c32-8e77-bb05-f851c87a1004@linuxfoundation.org>
	<20210610160246.13722775@oasis.local.home>
	<YMJ0IlYGHzwBNz2t@casper.infradead.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Jun 2021 21:20:50 +0100
Matthew Wilcox <willy@infradead.org> wrote:

> Perhaps we could actually _enhance_ conferences by forbidding
> direct audience questions and having a moderator select questions /
> "more of a comment actually" from an official live chat platform to
> engage the speaker directly on stage.  It would segue naturally into
> "the speaker is now done with their presentation and here's some good
> followup discussion".  So many times people have come up to me after
> a presentation and asked a question that I really wish I could have
> answered for everybody there.

For presentations, I think this is a very good idea. But it wouldn't
work for a BoF or a microconference.

I also thought about doing this for a presentations. That is, "Please
submit all questions online, and the presenter will answer them".

Of course, if you have someone that didn't bring their laptop or phone
(there are people that do that too). They should have a way to submit a
question as well. Perhaps instead of going in line to a microphone, go
in line to a public laptop to type in your question.

-- Steve

