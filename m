Return-Path: <ksummit+bounces-205-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 114113ACD5B
	for <lists@lfdr.de>; Fri, 18 Jun 2021 16:17:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 131C11C0ED1
	for <lists@lfdr.de>; Fri, 18 Jun 2021 14:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CF952FB0;
	Fri, 18 Jun 2021 14:17:13 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A47370
	for <ksummit@lists.linux.dev>; Fri, 18 Jun 2021 14:17:12 +0000 (UTC)
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 542ED610CD;
	Fri, 18 Jun 2021 14:17:10 +0000 (UTC)
Date: Fri, 18 Jun 2021 10:17:08 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Shuah Khan 
 <skhan@linuxfoundation.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, "Enrico Weigelt, metux IT consult"
 <lkml@metux.net>, David Hildenbrand <david@redhat.com>, Greg KH
 <greg@kroah.com>, Christoph Lameter <cl@gentwo.de>, Theodore Ts'o
 <tytso@mit.edu>, Jiri Kosina <jikos@kernel.org>, ksummit@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-api@vger.kernel.org
Subject: Re: Maintainers / Kernel Summit 2021 planning kick-off
Message-ID: <20210618101708.7ff6d67a@oasis.local.home>
In-Reply-To: <cd7ffbe516255c30faab7a3ee3ee48f32e9aa797.camel@HansenPartnership.com>
References: <YIx7R6tmcRRCl/az@mit.edu>
	<alpine.DEB.2.22.394.2105271522320.172088@gentwo.de>
	<YK+esqGjKaPb+b/Q@kroah.com>
	<c46dbda64558ab884af060f405e3f067112b9c8a.camel@HansenPartnership.com>
	<b32c8672-06ee-bf68-7963-10aeabc0596c@redhat.com>
	<5038827c-463f-232d-4dec-da56c71089bd@metux.net>
	<20210610182318.jrxe3avfhkqq7xqn@nitro.local>
	<YMJcdbRaQYAgI9ER@pendragon.ideasonboard.com>
	<20210610152633.7e4a7304@oasis.local.home>
	<37e8d1a5-7c32-8e77-bb05-f851c87a1004@linuxfoundation.org>
	<YMyjryXiAfKgS6BY@pendragon.ideasonboard.com>
	<cd7ffbe516255c30faab7a3ee3ee48f32e9aa797.camel@HansenPartnership.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 18 Jun 2021 07:11:44 -0700
James Bottomley <James.Bottomley@HansenPartnership.com> wrote:

> On Fri, 2021-06-18 at 16:46 +0300, Laurent Pinchart wrote:
> > For workshop or brainstorming types of sessions, the highest barrier
> > to participation for remote attendees is local attendees not speaking
> > in microphones. That's the number one rule that moderators would need
> > to enforce, I think all the rest depends on it. This may require a
> > larger number of microphones in the room than usual.  
> 
> Plumbers has been pretty good at that.  Even before remote
> participation, if people don't speak into the mic, it's not captured on
> the recording, so we've spent ages developing protocols for this. 
> Mostly centred around having someone in the room to remind everyone to
> speak into the mic and easily throwable padded mic boxes.  Ironically,
> this is the detail that meant we couldn't hold Plumbers in person under
> the current hotel protocols ... the mic needs sanitizing after each
> throw.
>

Plumbers also has the advantage of having a throwable mic. And not just
one of them, we have two and a normal mic as well as a lavalier mic.

Having someone running around the audience passing the mic is not very
efficient, and having to get up and stand at a microphone, may be too
intimidating for some.

-- Steve

