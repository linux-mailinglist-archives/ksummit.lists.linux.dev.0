Return-Path: <ksummit+bounces-1162-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D700B7A697C
	for <lists@lfdr.de>; Tue, 19 Sep 2023 19:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A61F28181A
	for <lists@lfdr.de>; Tue, 19 Sep 2023 17:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 526E337172;
	Tue, 19 Sep 2023 17:18:41 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027228814
	for <ksummit@lists.linux.dev>; Tue, 19 Sep 2023 17:18:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA217C433C8;
	Tue, 19 Sep 2023 17:18:39 +0000 (UTC)
Date: Tue, 19 Sep 2023 13:19:13 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Shuah <shuah@kernel.org>
Cc: ksummit@lists.linux.dev, tech-board-discuss@lists.linux-foundation.org
Subject: Re: [Tech-board-discuss] [MAINTAINERS SUMMIT] Maintainers Support
 Group
Message-ID: <20230919131913.633974b9@gandalf.local.home>
In-Reply-To: <371cb5d1-9997-a03b-4848-550ac8658021@kernel.org>
References: <20230919121001.7bc610d4@gandalf.local.home>
	<371cb5d1-9997-a03b-4848-550ac8658021@kernel.org>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 19 Sep 2023 10:52:40 -0600
Shuah <shuah@kernel.org> wrote:

> Hi Steve,
> 
> On 9/19/23 10:10, Steven Rostedt wrote:
> > There has been several topics brought up already about maintainer burnout.
> > A while back, I was talking with another maintainer that basically told me
> > that they were ready to quit being a maintainer because it's not fun
> > anymore. There's a lot of requirements and basically have to deal with crap
> > from submitters. The Code of Conduct has been successful in helping to keep
> > a more civil environment, but all the focus has mainly been around telling
> > maintainers how to behave.  
> 
> As a member of the CoC, I respectfully disagree with the statement "but all the
> focus has mainly been around telling maintainers how to behave." This impression
> might have been the result of one unfortunate incident that took place last year.
> is only part of what CoC has been doing.

The reason I stated it this way is because of how the CoC committee came to
be. It was because of the reputation of the Linux kernel maintainers, and
how "toxic" of an environment it was. There's a reason Linus took a hiatus
from being the lead maintainer.

> 
> A majority of reports are related to incorrect understanding of how the community
> works and discusses technical issues. Most of them get resolved without involving
> the community. This is behind the scenes silent work CoC does.

Yes, but they are still reports about Conduct. This has nothing to do with that.

> 
> It is unfortunate that CoC is being viewed as a body that is focused on telling
> maintainers how to behave. I would encourage to not view CoC work based on one
> or two cases that were outliers. CoC worked very hard to resolve them fairly and
> that benefited the community as a whole.

Sorry if that's the impression I made as that was not my intent. But the CoC is
viewed as a result of what came out of maintainers behaving badly.

> 
> But maintainers are humans too, and their work
> > can cause a large amount of frustration to build up with no way to release
> > that pressure.  When that frustration boiled over, it use to come out with
> > a nasty rant to at some unlucky submitter. Although this may have helped
> > the maintainer, but in the long run, this was not healthy for the community
> > in the whole, and the CoC has been created to prevent that from happening.
> > The problem is that there's been no replacement for the maintainer to
> > release their frustration.
> >   
> 
> +1 on maintainers are humans too, and their work can be challenging. I have
> observed maintainers at the receiving end of nasty rants from submitters,
> other developers, and maintainers and experienced it myself. It was helpful
> when one or more people reached out privately to provide support and
> understanding.
> 
> > I brought up to the TAB a suggestion of starting basically a "Maintainer's
> > support group". A place a maintainer, or even a submitter can go to when
> > they are feeling frustrated. This is not a replacement for the Code of
> > Conduct committee. This is more of a preventive measure. Ideally, the Code
> > of Conduct committee members should be very bored where there are no
> > submitted reports.  That would mean our community is running in a very
> > smooth way. But that's currently not the case. There's been a few cases
> > that have come up where if the maintainer had someone to vent to, it could
> > have prevented the violation of the Code of Conduct.
> >
> > The idea is this:
> > 
> > When a maintainer is getting frustrated with a submitter or another
> > maintainer, or even a submitter is getting frustrated with a maintainer,
> > they would have a place to find a list of people that can help. They would
> > pick one of the people and send an email to them with a subject of
> > "[MAINTAINER SUPPORT]" (or something like that). This would let the
> > supporting maintainer know that this email is about support and should be
> > confidential and follow the guidelines. The email will include who and why
> > they are frustrated with the other person. Again, this is *not* a Code of
> > Conduct issue. This is not to point blame, just frustration. Sometimes
> > people just can not work with other people. The supporting maintainer can
> > be an outside POV and can possibly help with explaining why the other
> > person is acting the way they are. Or the supporting maintainer can find
> > another maintainer to work with this person.
> >   
> 
> I am not sure adding one more body whose work overlaps with what CoC does is
> helpful. Creating yet another mailing list for people that are drowning under
> the flood emails might not be productive.

Ah, this is where things differ tremendously. There will be no mailing list!

It will be a list of people and their emails. The submitter will pick from
that list of people to send one of them a personal email. All interactions will
be done on a private 1 to 1 basis. No "committee" involved.

I would expect the guidelines that they follow would come out of the TAB.

> 
> > Several of us already do some of this. But its only a few. I would like to
> > make it a more formal process where those that have not gone to conferences
> > and such would still know who they can talk with.
> > 
> > We discussed this within the TAB, but I would like to bring this up to a
> > more general discussion at Maintainers Summit.
> > 
> > I know some people would just dismiss this as unneeded, but I've talked to
> > others that said this would be very useful. If it's useful for some, then I
> > think it's worth it. If you believe it's unneeded, then you don't need to
> > be involved with it (although someone could be submitting something about
> > their frustrations with you ;)
> >   
> 
> I really can't weigh in on whether this is needed or unneeded until I hear
> more about it and how it would work.
> 

Sure.

> > To recap what I'm asking: We would have a list of volunteers of support
> > group members. There would be guidelines on how to interact.  These guidelines
> > will be public so that the submitter is also aware of them. One of the
> > guidelines we discussed was what happens if the volunteer is just too busy,
> > or they themselves do not want to deal with the individual submitting their
> > frustrations. Both cases would have the same response, and that is to reply
> > saying that they are not available and to please reach out to someone else
> > on the list.  
> 
> - Does our community have bandwidth to create a support group
>    and policies to run it effectively?

It will be up to those that want to help.

> - How does this new body interact and interface with CoC?

Ideally, they would not.

The point of the support group is to keep things from escalating to the
point where there is a CoC complaint. If the support group does not work
and there is an escalation, then the CoC can take over and the support
group will no longer be involved.

-- Steve

> - What happens when CoC and the support group are put in a situation
>    to handle an issue?
> 
> Lot of details to work out. I would encourage inviting CoC committee
> members to the Maintainer Summit if this issue is accepted and added
> to the agenda.
> 
> thanks,
> -- Shuah


