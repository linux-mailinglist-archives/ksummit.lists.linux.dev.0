Return-Path: <ksummit+bounces-185-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB6E3A3408
	for <lists@lfdr.de>; Thu, 10 Jun 2021 21:26:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 44E073E0F97
	for <lists@lfdr.de>; Thu, 10 Jun 2021 19:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 550B42FB9;
	Thu, 10 Jun 2021 19:26:38 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379D470
	for <ksummit@lists.linux.dev>; Thu, 10 Jun 2021 19:26:37 +0000 (UTC)
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 597D361376;
	Thu, 10 Jun 2021 19:26:35 +0000 (UTC)
Date: Thu, 10 Jun 2021 15:26:33 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, "Enrico Weigelt,
 metux IT consult" <lkml@metux.net>, David Hildenbrand <david@redhat.com>,
 James Bottomley <James.Bottomley@hansenpartnership.com>, Greg KH
 <greg@kroah.com>, Christoph Lameter <cl@gentwo.de>, Theodore Ts'o
 <tytso@mit.edu>, Jiri Kosina <jikos@kernel.org>, ksummit@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-api@vger.kernel.org
Subject: Re: Maintainers / Kernel Summit 2021 planning kick-off
Message-ID: <20210610152633.7e4a7304@oasis.local.home>
In-Reply-To: <YMJcdbRaQYAgI9ER@pendragon.ideasonboard.com>
References: <YH2hs6EsPTpDAqXc@mit.edu>
	<nycvar.YFH.7.76.2104281228350.18270@cbobk.fhfr.pm>
	<YIx7R6tmcRRCl/az@mit.edu>
	<alpine.DEB.2.22.394.2105271522320.172088@gentwo.de>
	<YK+esqGjKaPb+b/Q@kroah.com>
	<c46dbda64558ab884af060f405e3f067112b9c8a.camel@HansenPartnership.com>
	<b32c8672-06ee-bf68-7963-10aeabc0596c@redhat.com>
	<5038827c-463f-232d-4dec-da56c71089bd@metux.net>
	<20210610182318.jrxe3avfhkqq7xqn@nitro.local>
	<YMJcdbRaQYAgI9ER@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Jun 2021 21:39:49 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> There will always be more informal discussions between on-site
> participants. After all, this is one of the benefits of conferences, by
> being all together we can easily organize ad-hoc discussions. This is
> traditionally done by finding a not too noisy corner in the conference
> center, would it be useful to have more break-out rooms with A/V
> equipment than usual ?

I've been giving this quite some thought too, and I've come to the
understanding (and sure I can be wrong, but I don't think that I am),
is that when doing a hybrid event, the remote people will always be
"second class citizens" with respect to the communication that is going
on. Saying that we can make it the same is not going to happen unless
you start restricting what people can do that are present, and that
will just destroy the conference IMO.

That said, I think we should add more to make the communication better
for those that are not present. Maybe an idea is to have break outs
followed by the presentation and evening events that include remote
attendees to discuss with those that are there about what they might
have missed. Have incentives at these break outs (free stacks and
beer?) to encourage the live attendees to attend and have a discussion
with the remote attendees.

The presentations would have remote access, where remote attendees can
at the very least write in some chat their questions or comments. If
video and connectivity is good enough, perhaps have a screen where they
can show up and talk, but that may have logistical limitations.

The evening events (including going out to the bars and just hanging
with other developers) is a lost cause to try and have remote
participation.

Then the last day, perhaps have a bunch of rooms for various topics
where people can come in and continue the conversation from the evening
events but with a remote audience that can ask questions. Again, you
may need to "bribe" the attendees to come to this and interact ;-)

I'm all for making a better remote experience for hybrid events, but
I'm against doing so by making it a worse experience for those that
attend. Not saying that you suggested this, but I have heard of ideas
about limiting what happens so that the live attendees do not have any
advantage over the remote ones.

-- Steve

