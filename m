Return-Path: <ksummit+bounces-971-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B801477CDED
	for <lists@lfdr.de>; Tue, 15 Aug 2023 16:19:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E95981C20D6F
	for <lists@lfdr.de>; Tue, 15 Aug 2023 14:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9F5134CB;
	Tue, 15 Aug 2023 14:19:26 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7908832
	for <ksummit@lists.linux.dev>; Tue, 15 Aug 2023 14:19:23 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E5E6F5A4;
	Tue, 15 Aug 2023 16:18:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1692109084;
	bh=BwAZgyQKoPzagywNoI7lmS5HzjKyDywyX0SqLoYCLhs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iq8AGesv8DXFJdGZGJE5ATvRfJIxL2uSOIOmkP4FB45iSkg3N9GtGvI1OTHeLh97H
	 9aSp3j6oB7JvLTjThgH5o7S2wPuD19JRlzV2X1vwGOY6ENjnUX5bFTONtmyxvu1Wyg
	 jh1YePAtN+y6FTXjX/vHHAA9o8DrkebIzQsYhYsg=
Date: Tue, 15 Aug 2023 17:19:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Jiri Kosina <jkosina@suse.cz>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Handling of embargoed security issues --
 security@korg vs. linux-distros@
Message-ID: <20230815141923.GE3128@pendragon.ideasonboard.com>
References: <nycvar.YFH.7.76.2308150927190.14207@cbobk.fhfr.pm>
 <658e739b-c164-c360-d6a3-eb4fb15ae02e@oracle.com>
 <2023081515-lake-spotty-6a3a@gregkh>
 <20230815084253.7091083e@gandalf.local.home>
 <47419913-2a5a-2bc1-ece9-cc371d4fefdf@iogearbox.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <47419913-2a5a-2bc1-ece9-cc371d4fefdf@iogearbox.net>

On Tue, Aug 15, 2023 at 03:17:00PM +0200, Daniel Borkmann wrote:
> On 8/15/23 2:42 PM, Steven Rostedt wrote:
> > On Tue, 15 Aug 2023 13:23:36 +0200 Greg KH wrote:
> >> On Tue, Aug 15, 2023 at 12:17:03PM +0200, Vegard Nossum wrote:
> >>> I'll throw in another idea: distros@kernel.org.
> >>>
> >>> A closed list which will be notified by security@kernel.org once they
> >>> feel patches for a particular issue are ready for testing/consumption by
> >>> distros (and hopefully before the issue is disclosed publicly, if the
> >>> reporter still wishes to do that).
> >>>
> >>> The members and list rules would be totally up to the security team to
> >>> decide.
> >>
> >> As per the lawyers, and government officials we have worked with in the
> >> past, having a closed list for preannouncements like this will be
> >> either:
> > 
> > I guess the question is, what "preannouncements" are the lawyers worried about?
> > 
> > It looks like Jiri's concern is just to make sure that distros have
> > security patches in. Would just a list of "here's the commits that fix
> > security issues" be considered a preannouncement, without having any
> > reference to *what* security issue they fix? It would basically be a subset
> > of the stable tree. That is, anything that came from security@k.o, and does
> > not include all the AUTOSEL and other minor fixes that stable pulls in.
> 
> Not really answering your question, but the above is also a somewhat misleading
> "assurance" for distros. Some security fixes might potentially have come in via
> AUTOSEL, and some others might not have been discussed at security@k.o in the
> first place. How would you classify which ones of the whole set are relevant
> for distros and which ones are not?

*LOTS* of fixes for driver bugs that can cause security-related issues
are never reported to security@k.o. The author of the bug fix may not
even realize that a security issue is fixed. Those issues may have a
narrower area of impact individually as one would need to run Linux on
specific devices, but collectively they should be considered as
important as other security problems.

> Imho, if distros decide to maintain their own trees outside of stable it would
> still require manual triaging of the set of stable patches that went into a minor
> release (and if in doubt, just cherry-pick the patch) - that's just the cost to
> pay for maintaining non-stable base. It's the same issue as discussed in [0].
> 
>    [0] https://kernel-recipes.org/en/2019/talks/cves-are-dead-long-live-the-cve/
> 
> >>    - deemed illegal in some countries
> >>    - made to have all "major"[1] Linux users on it.
> > 
> > And if this list only has a list of patches that are already fixed, how
> > dangerous is it to not be 100% closed?
> > 
> > I mean, it was pretty obvious that the huge churn with spectre/meltdown
> > patches that were being added to the kernel at the late stage of an -rc
> > release was fixing "something big".
> > 
> >> Neither of which actually will work out at all, the whole
> >> "preannouncement" stuff just is not possible, sorry.  I'm amazed that
> >> other projects have been able to "get away with it" for as long as they
> >> have without either being infiltrated by "the powers that be" or
> >> shutdown yet.
> > 
> > Have there been lists shutdown by the powers that be already? Or is this
> > just a threat made by the power that be?
> > 
> >> Politics is a rough game, the only way to survive is to not play it for
> >> stuff like this.
> >>
> >> So no, "distros@k.o" isn't going to be possible for the LF to host, and
> >> any other group that wants to run such a thing will quickly have these
> >> issues as well, it's amazing that linux-distros has been able to survive
> >> for as long as it has.
> > 
> > I'll have to talk with some laywers, as I'm curious to what would be
> > considered illegal about linux-distros. Are you aware of any government
> > specific laws I could go read? I'm not a lawyer, but I've read quite a bit
> > of laws that I can usually get an idea of the problem for my own
> > references (and my experience is that lawyers don't even know until
> > something is settled in court).
> > 
> > Note, linux-distros is not about "Linux users" but "Linux distributors".
> > They are not end users but are distributing a product (and having to follow
> > all the rules of the GPL and such to do so). They are not users, they are
> > part of a supply chain.
> > 
> > How is security@kernel.org different? If the bug is in the kernel, then the
> > bug is in the distro. Perhaps if we find a bug in the kernel, we should
> > send it to the distro we are using, and not to the Linux community? As Jiri
> > said, most people use a distro kernel, and not the mainline or even the
> > stable one. Really, if you think about it. The closest product to the user
> > is the distro. If someone finds a bug in the kernel, they can see if they
> > can exploit a distro with it. If they can, perhaps they should send it to
> > the security folks of the distro first. Then the distro can send it to
> > security@kernel.org. Maybe this already happens?
> 
> I mainly just wanted to chime in on this one and mention that from my past
> experience (at least I've seen it couple of times from RH/Canonical) this
> will not work overly well.
> 
> We had seen users reporting kernel security bugs there and they were stuck
> in the security team's triage/bug queue for 3+ months before someone got in
> contact with upstream. :-(
> 
> Presumably the teams were overloaded when it happened, or the bugs were
> misclassified due to lack of domain specific knowledge or they wanted to fix
> it themselves but didn't get to it yet.
> 
> Had they been reported to s@k.org, then the relevant maintainers/developers
> could have been pulled in and it would have been fixed upstream possibly the
> same day it got reported.
> 
> So my biggest concern with reporting to distro first is that "things get stuck
> in the process", unfortunately. The less additional/artificial hops, the better,
> imho.
> 
> >> [1] "Major" includes most government agencies in most countries.

-- 
Regards,

Laurent Pinchart

