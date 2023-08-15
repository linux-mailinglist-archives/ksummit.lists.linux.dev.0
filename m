Return-Path: <ksummit+bounces-975-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 795FA77CEB3
	for <lists@lfdr.de>; Tue, 15 Aug 2023 17:08:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA4AC1C20DB6
	for <lists@lfdr.de>; Tue, 15 Aug 2023 15:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7E6914263;
	Tue, 15 Aug 2023 15:08:42 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148561097E
	for <ksummit@lists.linux.dev>; Tue, 15 Aug 2023 15:08:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 308DBC433C8;
	Tue, 15 Aug 2023 15:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1692112120;
	bh=tJvVhaXbcRcQpwmkp61ptkbTMtS6Wq3++ZNedLzfz/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wJULzBq7T4AYXHMqPlsPtLCheZg1QtPRlXriKly5gBpsPNCVgQwCK07ru2b/rzek3
	 zuks6ZsUPTMcXE+Zw8wVvAdU18yMPbs/jrC0yRT8R0rsRjlRb/s9rj6CMy3tgTMogf
	 Sxwoa4iIs+HJsJ+g7nsBP8hZzuRjbuIeUfhYWFjE=
Date: Tue, 15 Aug 2023 17:08:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Vegard Nossum <vegard.nossum@oracle.com>, Jiri Kosina <jkosina@suse.cz>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Handling of embargoed security issues --
 security@korg vs. linux-distros@
Message-ID: <2023081540-vindicate-caterer-33c6@gregkh>
References: <nycvar.YFH.7.76.2308150927190.14207@cbobk.fhfr.pm>
 <658e739b-c164-c360-d6a3-eb4fb15ae02e@oracle.com>
 <2023081515-lake-spotty-6a3a@gregkh>
 <20230815084253.7091083e@gandalf.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230815084253.7091083e@gandalf.local.home>

On Tue, Aug 15, 2023 at 08:42:53AM -0400, Steven Rostedt wrote:
> On Tue, 15 Aug 2023 13:23:36 +0200
> Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> > On Tue, Aug 15, 2023 at 12:17:03PM +0200, Vegard Nossum wrote:
> > > I'll throw in another idea: distros@kernel.org.
> > > 
> > > A closed list which will be notified by security@kernel.org once they
> > > feel patches for a particular issue are ready for testing/consumption by
> > > distros (and hopefully before the issue is disclosed publicly, if the
> > > reporter still wishes to do that).
> > > 
> > > The members and list rules would be totally up to the security team to
> > > decide.  
> > 
> > As per the lawyers, and government officials we have worked with in the
> > past, having a closed list for preannouncements like this will be
> > either:
> 
> I guess the question is, what "preannouncements" are the lawyers worried about?

Access to known security problems before they are fixed for everyone.

> It looks like Jiri's concern is just to make sure that distros have
> security patches in. Would just a list of "here's the commits that fix
> security issues" be considered a preannouncement, without having any
> reference to *what* security issue they fix? It would basically be a subset
> of the stable tree. That is, anything that came from security@k.o, and does
> not include all the AUTOSEL and other minor fixes that stable pulls in.

As Laurent said, and as many who have analyzed the data have proven, the
HUGE majority of "security fixes" flow through the normal stable release
process.  And yet, many distros/companies don't even keep up with that,
why would stuff sent to security@k.o be any different?

We used to have someone on security@k.o that would notify linux-distros
about problems when we had fixed them, but I think they got tired of
constantly keeping on top of this and stopped doing it.  It's a
thankless job, just like being on the security@k.o alias is, and I don't
blame them for stopping.

> >   - deemed illegal in some countries
> >   - made to have all "major"[1] Linux users on it.
> 
> And if this list only has a list of patches that are already fixed, how
> dangerous is it to not be 100% closed?
> 
> I mean, it was pretty obvious that the huge churn with spectre/meltdown
> patches that were being added to the kernel at the late stage of an -rc
> release was fixing "something big".

Hardware embargoes have different "rules" that we have agreed to follow,
based on the lawyers for all companies involved agreeing to those rules,
that's independent of security@k.o which doesn't get involved in this
process at all (despite some of us overlapping both lists, but that's
just an individual person thing, not a "whole group" thing.)

And I would honestly say that everyone involved in the hw-embargo
process currently hates it and I don't think it works well but it's the
best that we have at the moment until it can be re-negotiated OR
hardware companies stop doing stupid things with their CPUs.

> > Neither of which actually will work out at all, the whole
> > "preannouncement" stuff just is not possible, sorry.  I'm amazed that
> > other projects have been able to "get away with it" for as long as they
> > have without either being infiltrated by "the powers that be" or
> > shutdown yet.
> 
> Have there been lists shutdown by the powers that be already? Or is this
> just a threat made by the power that be?

No lists have been stopped that I know of, because we have been told by
governments that our current process is ok and in fact is "the only
reasonable way it can be done that we know of."  See my US Senate
testimony/interview about Spectre/Meltdown for details about this.  I
think it's online somewhere, but don't know where...

> > Politics is a rough game, the only way to survive is to not play it for
> > stuff like this.
> > 
> > So no, "distros@k.o" isn't going to be possible for the LF to host, and
> > any other group that wants to run such a thing will quickly have these
> > issues as well, it's amazing that linux-distros has been able to survive
> > for as long as it has.
> 
> I'll have to talk with some laywers, as I'm curious to what would be
> considered illegal about linux-distros. Are you aware of any government
> specific laws I could go read? I'm not a lawyer, but I've read quite a bit
> of laws that I can usually get an idea of the problem for my own
> references (and my experience is that lawyers don't even know until
> something is settled in court).
> 
> Note, linux-distros is not about "Linux users" but "Linux distributors".
> They are not end users but are distributing a product (and having to follow
> all the rules of the GPL and such to do so). They are not users, they are
> part of a supply chain.
> 
> How is security@kernel.org different? If the bug is in the kernel, then the
> bug is in the distro. Perhaps if we find a bug in the kernel, we should
> send it to the distro we are using, and not to the Linux community? As Jiri
> said, most people use a distro kernel, and not the mainline or even the
> stable one.

security@k.o is very different in that our job is to triage reported
bugs and fix them as soon as possible and get the fix out to the world.
We almost never have embargoes (there is a limited, very very short,
potential embargo we will agree to in some limited situations), but for
the huge majority of what we do, all we are here for is to fix problems.

That's it, no notifications, no delays, nothing else except fix the
issue as soon as we can.  Yes, sometimes this takes a long time, but
once we have a working fix, we get it merged quickly and move on to the
next issue.

> Really, if you think about it. The closest product to the user
> is the distro. If someone finds a bug in the kernel, they can see if they
> can exploit a distro with it. If they can, perhaps they should send it to
> the security folks of the distro first. Then the distro can send it to
> security@kernel.org. Maybe this already happens?

The huge majority of Linux use in the world is Android, everything else
is a rounding error.  Android does now have projects where security bugs
reported to them are required for the reporter to submit the problem to
security@k.o as well.  We fix the issue, get it pushed out, and the
reporter gets the credit.  Sometime in the future Android picks the
fixes up and pushed them out to their users (the delay there is much
argued about, I've worked with many companies over the years about this
and I understand the issues involved, but really, it should be sooner
than the 4-6 months it currently takes, but this is on those companies,
not us.  Governments now know this and are pushing laws to resolve this
delay (i.e. the CRA)).

After Android, Debian is by far the largest Linux user, and the Debian
kernel developers do an awesome job of tracking the stable kernel
releases which have been documented to fix 99% of known security issues
_BEFORE_ they are known (data produced by Google security team for 2
years straight).

After that, the use of Linux tapers off to "roll your own kernel.org
releases" (still a huge number of absolute boxes thanks to many
government instances and corporate clouds) to the various "enterprise"
distros, down to the other community distros (Fedora/openSUSE/Arch/etc.)

So the top end (Android and Debian and kernel.org) are covered today
with stable/LTS releases.  Same for the bottom end
(Fedora/openSUSE/Arch/etc.)  It's that corporate sponsored "middle tier"
(which is still quite small overall) that likes complaining about this
stuff because they don't want to take the stable kernel updates for
various (in my opinion stupid) reasons.

So who would such a "distros@" list help?  Only that middle-tier, small
group of very well financed companies that want to go their own way with
their kernel releases because they want to.

Why are they not just doing what the huge majority of Linux users doing
and taking the "feed of known issues that resolve problems before they
are public knowledge" that we provide today for free to them?  Because
they somehow think that knowing a specific single bugfix is more special
than all of those other bugfixes, which honestly, is just loony.

Anyway, sorry for the long rant, that's my take on the kernel ecosystem
as someone who has been seeing this for a very long time and working
with loads of different companies using the kernel.

As for the legal issues involved in such a preannouncement list, think
about all of those huge government agencies in many many different
countries who use Linux and would insist that they get access to that
feed for their own security reasons.  I would say that they honestly
have a better reason than the smaller "enterprise" distros out there,
and they can back up their request for access with legal measures.[1]

If we do not even have such a list, there's no legal measures that can
be used, which is why kernel.org should not host such a list.

thanks,

greg k-h

[1] Someone who is involved in EU governments told me once that if the
EU were to be setting up a MITRE-like organization to get
pre-announcements of security problems as the CRA recommends, we would
instantly solve the "bugs are kept secret" problem because one thing the
EU governments are really good at is making secret things public :)

