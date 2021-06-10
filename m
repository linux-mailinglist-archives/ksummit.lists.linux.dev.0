Return-Path: <ksummit+bounces-189-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id B38653A34C2
	for <lists@lfdr.de>; Thu, 10 Jun 2021 22:22:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 898393E0FA3
	for <lists@lfdr.de>; Thu, 10 Jun 2021 20:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4FBA2FB9;
	Thu, 10 Jun 2021 20:21:53 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1DD70
	for <ksummit@lists.linux.dev>; Thu, 10 Jun 2021 20:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=E+9wDzrj9BbJwTHFJ2lRJPqdmFEoDh08+5yulPmdoEw=; b=K3wrGytOF8eZ3k9jvHPCBVxuOm
	djWi2Q7u10JEDW/bgudT63V4Dp1LFsDhXPI/nSgO/l3YMboHYJ2pD6C1PlIJ1xZGLyfZSp1Wv0uMb
	OW3W+KVumGu83FGLlms02VMP9i/0ZkMUnfQHauRt48kF4i7HXbXyAb1ab6mrJE6hM714FrZN9ia4y
	H6l+RMnrSbMgoqPCvZ8iuzuKWjbOK0ikcItTd2B9eOuJ+iTCDEErECdQdemGWkF1F4gvPUJg3l4uW
	uEwXRrR1U1AStvIceYsz4cuL6wXQfVlRYB9SGzMbaWiuPfBEi7HnN4fbMtU8CrNxoS75z2O3JShUG
	u294D9dA==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
	id 1lrRAY-0024DY-Qo; Thu, 10 Jun 2021 20:20:53 +0000
Date: Thu, 10 Jun 2021 21:20:50 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	"Enrico Weigelt, metux IT consult" <lkml@metux.net>,
	David Hildenbrand <david@redhat.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Greg KH <greg@kroah.com>, Christoph Lameter <cl@gentwo.de>,
	Theodore Ts'o <tytso@mit.edu>, Jiri Kosina <jikos@kernel.org>,
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, netdev@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-api@vger.kernel.org
Subject: Re: Maintainers / Kernel Summit 2021 planning kick-off
Message-ID: <YMJ0IlYGHzwBNz2t@casper.infradead.org>
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
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210610160246.13722775@oasis.local.home>

On Thu, Jun 10, 2021 at 04:02:46PM -0400, Steven Rostedt wrote:
> On Thu, 10 Jun 2021 13:55:23 -0600
> Shuah Khan <skhan@linuxfoundation.org> wrote:
> 
> > You are absolutely right that the remote people will have a hard time
> > participating and keeping up with in-person participants. I have a
> > couple of ideas on how we might be able to improve remote experience
> > without restricting in-person experience.
> > 
> > - Have one or two moderators per session to watch chat and Q&A to enable
> >    remote participants to chime in and participate.
> > - Moderators can make sure remote participation doesn't go unnoticed and
> >    enable taking turns for remote vs. people participating in person.
> > 
> > It will be change in the way we interact in all in-person sessions for
> > sure, however it might enhance the experience for remote attendees.
> 
> I have no problem with the above suggestion, and I envision that this
> may be the norm going forward. What is still missing is the
> interactions of the hallway track and the evening events. I was
> thinking about how we could get the remote folks in on what happened
> there right afterward, which is why I'm suggesting breakout rooms like
> Laurent suggested as well, but at the end of the conference, and
> perhaps the conversations of the previous night could continue with a
> remote presence.

It's relatively common for in-person attendees at conferences to
use instant messaging platforms (whether it be IRC, twitter, Slack or
something else) to share their opinion on something the speaker just said
in a rather less disruptive way than shouting out in the middle of a talk.
If you sit at the back of a talk, most attendees have their laptops open
and at least one chat program running.

Perhaps we could actually _enhance_ conferences by forbidding
direct audience questions and having a moderator select questions /
"more of a comment actually" from an official live chat platform to
engage the speaker directly on stage.  It would segue naturally into
"the speaker is now done with their presentation and here's some good
followup discussion".  So many times people have come up to me after
a presentation and asked a question that I really wish I could have
answered for everybody there.

