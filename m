Return-Path: <ksummit+bounces-1008-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CDB77F98A
	for <lists@lfdr.de>; Thu, 17 Aug 2023 16:46:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC9991C21448
	for <lists@lfdr.de>; Thu, 17 Aug 2023 14:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92E314290;
	Thu, 17 Aug 2023 14:46:19 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8D1E568
	for <ksummit@lists.linux.dev>; Thu, 17 Aug 2023 14:46:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02B8EC433C7;
	Thu, 17 Aug 2023 14:46:16 +0000 (UTC)
Date: Thu, 17 Aug 2023 10:46:22 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Josef Bacik <josef@toxicpanda.com>
Cc: ksummit@lists.linux.dev, James Bottomley
 <James.Bottomley@HansenPartnership.com>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
Message-ID: <20230817104622.511c61b4@gandalf.local.home>
In-Reply-To: <20230816180808.GB2919664@perftesting>
References: <20230816180808.GB2919664@perftesting>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Aug 2023 14:08:08 -0400
Josef Bacik <josef@toxicpanda.com> wrote:

> Hello,

FYI, James Bottomely posted a very similar topic:

  https://lore.kernel.org/all/ab9cfd857e32635f626a906410ad95877a22f0db.camel@HansenPartnership.com/

> 
> This is a topic we're beating to death but haven't really made decent progress
> on WRT real solutions.  I know I have advocated for adding even more
> responsibilties to maintainers plates, which isn't really helpful.
> 
> There is a lot in this email, so I suppose choose your own adventure when it
> comes to what we think is relevant to discuss.
> 
> Maintainers/long time developers are burning out.  At the same time there's
> frustration from new comers who have trouble getting their patches accepted.  We
> have instances of arguments between longtime developers which leads to more
> frustration because it drags on the development process.

I'm still working on the "Communicaton style" documents (one for
Maintainers to new contributors, and more importantly, one for new/existing
contributors on how to communicate to maintainers and what to expect.)
These documents will focus on looking at the POV of the other side. For the
how to talk to maintainers, it will discuss that maintainers have to make
sure their subsystems works for everyone, and not just for the new
contributor.

But being a maintainer myself with a full-time job that is not to do my
maintainership, I'm struggling to find time to work on this :-p

> 
> I have argued for the last few years that maintainers should be taking a more
> active role in the social side of our development process.  Be the grownups in
> the room and help mitigate these conflicts before they sour relationships.

The "How to talk to contributors" document will try to address some of this.

> 
> But this just adds to the long list of things that maintainers already need to
> do.  Oftentimes they are the only reviewers, testers, and main developers rolled
> into one.  We have an increase of automated testing, which while is a net
> positive, adds to the stress of maintainers who view these reports as their
> personal responsibilty to address.
> 
> We all work differently, so having big sweeping solutions is a non-starter.
> However I think there are things we can learn from eachother to encourage
> different thinking and thus result in a smoother development experience for all
> of us.

I've been advocating in the TAB meetings for a "maintainer 'support
group'". Basically where stressed out maintainers can join to talk to other
stressed out maintainers and hopefully find a way to become less stressed
out.

> 
> Patch review: Obviously more people the better, encouraging review by trading
> reviews for having developers patches reviewed is a good method, but this only
> works for sufficiently large communities.
> 
> Automated testing: This doesn't replace review, but it can help add confidence
> when you're accepting patch reviews from less experienced members.
> 
> De-prioritize automated reports: Syzbot is great, but the failure cases can be
> sporadic and difficult to reproduce.  Things that are bisected to a specific
> patch are obviously easy to tackle, but don't let yourself get overwhelmed by
> syzbot, they're good things to hand to new developers to cut their teeth on.

I ignore pretty much any syzbot report that is not truly bisectable, as I've
spent too much time on them in the past to only find out that the bug is in
another subsystem. I won't totally ignore them. I do look at them to see if
it's obviously a bug in my subsystem, but if not, then it's ignored.

> 
> Maintainer groups, not sole maintainers: We all have things going on, build up
> people you trust and develop a way to spread the maintenance load.

This goes along with my "support group" idea.

> 
> Automate everything: I hate email, that is no secret, but even with email we can
> automate a lot of things.  The btrfs team built out the GH CI so developers can
> drive their own testing, spreading the load.  Eventually I hope to get to the
> point where the merging of patches is automated away so we don't have to deal
> with those mechanics.

I think sharing ideas on how people automate is a good one. Not many people
know that the tip tree has a special branch called "tip" and there's a
directory in the top level called ".tip" which includes all the automated
tooling that the tip tree has.

-- Steve

> 
> Developing strategies to handle the more mundane tasks of managing our projects
> will help free us to engage better with our communities, and guide people to be
> better developers, feeding back into the ecosystem that will help reduce the
> pain.  Thanks,
> 
> Josef


