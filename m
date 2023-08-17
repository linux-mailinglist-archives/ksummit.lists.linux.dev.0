Return-Path: <ksummit+bounces-1014-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BBE77FCC6
	for <lists@lfdr.de>; Thu, 17 Aug 2023 19:14:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0302E1C214F5
	for <lists@lfdr.de>; Thu, 17 Aug 2023 17:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55FFA171B9;
	Thu, 17 Aug 2023 17:10:33 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B731AA87
	for <ksummit@lists.linux.dev>; Thu, 17 Aug 2023 17:10:31 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.55.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPSA id 9E32AC433C8;
	Thu, 17 Aug 2023 17:10:29 +0000 (UTC)
Date: Thu, 17 Aug 2023 13:10:27 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Josef Bacik <josef@toxicpanda.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, ksummit@lists.linux.dev,
	James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
Message-ID: <ZN5Ug0sSxbp1l9vL@rdvivi-mobl4>
References: <20230816180808.GB2919664@perftesting>
 <20230817104622.511c61b4@gandalf.local.home>
 <20230817153326.GA2934386@perftesting>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817153326.GA2934386@perftesting>

On Thu, Aug 17, 2023 at 11:33:26AM -0400, Josef Bacik wrote:
> On Thu, Aug 17, 2023 at 10:46:22AM -0400, Steven Rostedt wrote:
> > On Wed, 16 Aug 2023 14:08:08 -0400
> > Josef Bacik <josef@toxicpanda.com> wrote:
> > 
> > > Hello,
> > 
> > FYI, James Bottomely posted a very similar topic:
> > 
> >   https://lore.kernel.org/all/ab9cfd857e32635f626a906410ad95877a22f0db.camel@HansenPartnership.com/
> > 
> 
> Oh good I didn't see this, James and I have similar views on this topic.

Apparently we have yet another related with burnout:
https://lore.kernel.org/all/20230817153326.GA2934386@perftesting/raw

> 
> > > 
> > > This is a topic we're beating to death but haven't really made decent progress
> > > on WRT real solutions.  I know I have advocated for adding even more
> > > responsibilties to maintainers plates, which isn't really helpful.
> > > 
> > > There is a lot in this email, so I suppose choose your own adventure when it
> > > comes to what we think is relevant to discuss.
> > > 
> > > Maintainers/long time developers are burning out.  At the same time there's
> > > frustration from new comers who have trouble getting their patches accepted.  We
> > > have instances of arguments between longtime developers which leads to more
> > > frustration because it drags on the development process.
> > 
> > I'm still working on the "Communicaton style" documents (one for
> > Maintainers to new contributors, and more importantly, one for new/existing
> > contributors on how to communicate to maintainers and what to expect.)
> > These documents will focus on looking at the POV of the other side. For the
> > how to talk to maintainers, it will discuss that maintainers have to make
> > sure their subsystems works for everyone, and not just for the new
> > contributor.
> > 
> > But being a maintainer myself with a full-time job that is not to do my
> > maintainership, I'm struggling to find time to work on this :-p
> > 
> > > 
> > > I have argued for the last few years that maintainers should be taking a more
> > > active role in the social side of our development process.  Be the grownups in
> > > the room and help mitigate these conflicts before they sour relationships.
> > 
> > The "How to talk to contributors" document will try to address some of this.
> > 
> > > 
> > > But this just adds to the long list of things that maintainers already need to
> > > do.  Oftentimes they are the only reviewers, testers, and main developers rolled
> > > into one.  We have an increase of automated testing, which while is a net
> > > positive, adds to the stress of maintainers who view these reports as their
> > > personal responsibilty to address.
> > > 
> > > We all work differently, so having big sweeping solutions is a non-starter.
> > > However I think there are things we can learn from eachother to encourage
> > > different thinking and thus result in a smoother development experience for all
> > > of us.
> > 
> > I've been advocating in the TAB meetings for a "maintainer 'support
> > group'". Basically where stressed out maintainers can join to talk to other
> > stressed out maintainers and hopefully find a way to become less stressed
> > out.
> > 
> > > 
> > > Patch review: Obviously more people the better, encouraging review by trading
> > > reviews for having developers patches reviewed is a good method, but this only
> > > works for sufficiently large communities.
> > > 
> > > Automated testing: This doesn't replace review, but it can help add confidence
> > > when you're accepting patch reviews from less experienced members.
> > > 
> > > De-prioritize automated reports: Syzbot is great, but the failure cases can be
> > > sporadic and difficult to reproduce.  Things that are bisected to a specific
> > > patch are obviously easy to tackle, but don't let yourself get overwhelmed by
> > > syzbot, they're good things to hand to new developers to cut their teeth on.
> > 
> > I ignore pretty much any syzbot report that is not truly bisectable, as I've
> > spent too much time on them in the past to only find out that the bug is in
> > another subsystem. I won't totally ignore them. I do look at them to see if
> > it's obviously a bug in my subsystem, but if not, then it's ignored.
> > 
> > > 
> > > Maintainer groups, not sole maintainers: We all have things going on, build up
> > > people you trust and develop a way to spread the maintenance load.
> > 
> > This goes along with my "support group" idea.
> > 
> 
> Agreed.  Honestly a lot of what I've done has been born out of seeing what other
> projects do, so I feel it's a decent first step towards thinking differently
> about our roles as maintainers.  We don't always stick our heads up and look
> around, so having somebody show up and say "I had this problem and this is how I
> solved it" will hopefully be a good first step towards solving some of these
> problems.

A group of co-maintainers you can trust and rotate is a good idea. Specially
to distribute and rotate the manual cadenced pull requests. But also to spread
the stress on our regular push-backs we need to perform every time. Well, we have
this kind of setup in i915 and I believe it works pretty well for us.

> 
> This thread has sort of wandered off into the "how to do automation" weeds.  I
> think that automation is a good solution for a subset of the problems that
> maintainers face, but it's not my main focus.

Indeed, but kind of yet on the automation lines you mentioned, it also comes
the email and mechanics of getting patches merged.

For that, and on top of having a group of maintainers, a possibility is a
group of committers where you also trust. Of course, you still needs to pay
attention to the CI results and to all the merged patches constantly, and
specially before doing the pull requests. But this at least distributes a
bit of the mechanics of getting patches merged burnout feeling you mentioned.

Yet on this lines it comes the tools. b4 helps a lot. We also use patchwork,
which also helps. But I also wonder if at some point we would be ready
to discuss some interface tools like gitlab flows.

> 
> My main focus is we have a good set of strategies for all of the different
> stresses and challenges we face, and then hopefully as a community we can
> converge on a set of best practices.  Maintainership looks a lot different now
> than it did when I started, and it's been a change for the better IMO.  But
> we're mostly all doing this for a living now, and we need to figure out how to
> make it more sustainable, and easier for us to onboard new maintainers.  Thanks,
> 
> Josef

