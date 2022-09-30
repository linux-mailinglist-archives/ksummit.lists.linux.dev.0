Return-Path: <ksummit+bounces-807-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A585F0EDE
	for <lists@lfdr.de>; Fri, 30 Sep 2022 17:32:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD9C51C209D3
	for <lists@lfdr.de>; Fri, 30 Sep 2022 15:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AEA55A7A;
	Fri, 30 Sep 2022 15:32:09 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2E74C6C;
	Fri, 30 Sep 2022 15:32:06 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 48FB647C;
	Fri, 30 Sep 2022 17:32:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1664551922;
	bh=mTuLYwADIeUGmGPOf0wEJTbdd0piiIq2iVXXQcEBpzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=owlFLKksPQPXE3tX6XlEFkn0KHVB8N63xkjxLNBIl8QWyvS2Nsl+ilDWTbH6+I88+
	 oRn0nKgb/yy1CWQ6EbE6Qh8gnqy4U8PYrWsDu4/2o/a/ayIUMkqqIhU7aH9m1MrrbM
	 /0uyyrkVubXYXBH7y3YUkPGbYA18/nLBbYKJopOQ=
Date: Fri, 30 Sep 2022 18:32:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Artem S. Tashkinov" <aros@gmx.com>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	workflows@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	ksummit@lists.linux.dev
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <YzcL8VLpk00hC1so@pendragon.ideasonboard.com>
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info>
 <93a37d72-9a88-2eec-5125-9db3d67f5b65@gmx.com>
 <20220929130410.hxtmwmoogzkwcey7@meerkat.local>
 <5d15ec50-e0b7-dc90-9060-3583633070e8@leemhuis.info>
 <52d93e6c-c6f0-81dd-07ca-cdae13dffba4@gmx.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <52d93e6c-c6f0-81dd-07ca-cdae13dffba4@gmx.com>

On Fri, Sep 30, 2022 at 09:03:39AM +0000, Artem S. Tashkinov wrote:
> On 9/30/22 08:47, Thorsten Leemhuis wrote:
> > On 29.09.22 15:04, Konstantin Ryabitsev wrote:
> >> On Thu, Sep 29, 2022 at 12:22:35PM +0000, Artem S. Tashkinov wrote:
> >> [...]
> >> We do have ability to fund development efforts -- LF has been the primary
> >> sponsor behind public-inbox.org over the past 3 years. However, there must be
> >> a clear, strong, and well-articulated mandate from the community. From what I
> >> heard, the vast majority of maintainers simply want a web form that would
> >> allow someone to:
> >>
> >> 1. clearly state what kernel version they are using
> >> 2. clearly describe what they were trying to do
> >> 3. explain what they expected vs. what they got
> >> 4. attach any files
> >> 5. give this bug report a unique identifier
> >
> > Sometimes there are days where I think "let's go down the 'do everything
> > by mail' rabbit hole some more and couple a pastebin and a somewhat
> > improved regzbot with an app (usable both locally and on the web) that
> > helps users preparing a report they can then send with their usual
> > mailer". And then there are days "ohh, no, that might be a totally
> > stupid thing to do". :-/
> 
> Emails are absolutely horrible in terms of keeping track of the state of
> the issue. Who has replied? Who has provided the necessary data? Where
> can this data be found? What if a person has forgotten to "Reply All"
> and instead clicked "Reply"?

E-mail *clients* are horrible to keep track of state. E-mail itself, as
in RFC822 (and newer), SMTP and other protocols, only handle transport
of data. As the data within the e-mail body is free-formed, and wasn't
meant to track items and their state, clients never evolved in that
direction. This could (possibly) be (partially) fixed, but likely at a
very high development cost, and getting users on board would be very
hard too. I do agree with Thorsten though, I'm often tempted to go
through the "let's do everything by e-mail" path. More than 10 years
ago, I worked for a large OEM that had an e-mail frontend for
integration and testing. You would send a specially-crafted e-mail to a
bot, with a base image version, plus a list of repositories and
branches, and the bot would build a new image for you, run all the
automated integration tests, and if you requested it (and had permission
to do so), would push the image down a manual testing queue. It was just
magic.

> Hell, no. Then people get swamped with their own emails,

Bugzilla won't solve this. The huge elephant in the room is that most
maintainers are overworked. Whether a bug report arrives in my mailbox
as an e-mail straight from the reporter or from a bug tracker will make
very little difference if I don't have time to look into it (I would
even argue that bug trackers are even worse there: if I'm really short
of time, I'm more likely to prioritize replying to e-mails instead of
having to open a link in a web browser).

As long as we don't address the maintainer bottleneck in the kernel, bug
tracking will suffer.

> the previous email from this discussion went straight
> to SPAM for my email provider. It's too easy to lose track of everything.
> 
> The kernel bugzilla has helped resolve critical issues and add
> impressive features with dozens of people collaborating. This is nearly
> impossible to carry out using email except for dedicated developers
> working on something.
> 
> In the LKML and other Open Source mailing lists I've seen a ton of RFC
> patches with no follow up. Even core developers themselves aren't
> particularly enjoying the format. And those patches often perish and
> work goes to waste.
> 
> >> Then a designated person would look through the bug report and either:
> >>
> >> a. quick-close it (with the usual "talk to your distro" or "don't use a
> >>     tainted kernel" etc)
> >
> > I think having some app would be good here, as it could help gathering
> > everything and catch problems early, to prevent users from spending a
> > lot of time on preparing a report that will be ignored.
> >
> >> b. identify the responsible maintainers and notify them
> >>
> >> The hard part is not technical -- the hard part is that "designated person."
> >
> > +1
> >
> >> Being a bugmaster is a thankless job that leads to burnout, regardless of how
> >> well you are paid. Everyone is constantly irate at you from both ends [...]
> >
> > Tell me about it. Nevertheless I sometimes wonder if I should give it a
> > try once I got all this regression tracking thing established somewhat
> > more, as in the end there I'm kind of a bugmaster for regressions already...
> >
> >> Before we try to fix/replace bugzilla,
> >
> > Just to be sure: I assume you meant "replacing bugzilla or fixing it for
> > real" here, and not my band-aid efforts outlined at the start of this
> > thread? Or do you have a problem with what I proposed to at least make
> > things less bad for now?
> >
> >> we really need to figure out the entire
> >> process and pinpoint who is going to be the one in charge of bug reports. If
> >> you think that LF should establish a fund for a position like that, then you
> >> should probably approach LF fellows (Greg KH, Shuah Khan), who can then talk
> >> to LF management. The IT team will be happy to support you with the tooling,
> >> but tooling should come second to that -- otherwise we'll just be replacing an
> >> old and rusty dumpster on fire with a new and shiny dumpster on fire.
> 
> Bugzilla with all its issues is still super convenient.

-- 
Regards,

Laurent Pinchart

