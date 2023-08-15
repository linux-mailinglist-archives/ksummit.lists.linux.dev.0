Return-Path: <ksummit+bounces-972-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 225E677CDF5
	for <lists@lfdr.de>; Tue, 15 Aug 2023 16:20:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 166271C20D55
	for <lists@lfdr.de>; Tue, 15 Aug 2023 14:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34694134CE;
	Tue, 15 Aug 2023 14:20:06 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9FC10978
	for <ksummit@lists.linux.dev>; Tue, 15 Aug 2023 14:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D981C433C7;
	Tue, 15 Aug 2023 14:20:03 +0000 (UTC)
Date: Tue, 15 Aug 2023 15:20:00 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Jiri Kosina <jkosina@suse.cz>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Handling of embargoed security issues --
 security@korg vs. linux-distros@
Message-ID: <ZNuJkCHnaCb95zj/@arm.com>
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

One thing that comes to mind is the hosting location of openwall.org.
For some reason my employer decided to block access to it, though
apparently one-way emails to linux-distros still work. I can see some
politicians wondering why one sends security pre-announcements to a
sanctioned country. For this reason, I'd much prefer an equivalent
hosted by the LF but the foundation may not want to be in a position to
police who's on that list, what qualifies as a Linux distro, which
country they come from, potentially removing them based on the
geopolitical situation of the day.

I guess security@kernel.org can be easier to justify as a closed forum
for fixing the actual bug with the aim to release the fix to the world
as soon as possible. But yeah, from the disclosure perspective, I don't
see much difference other than fewer people (well, the LF could ask for
US gov security clearance to be on this list ;)).

FWIW, Arm does want some official pre-announcement mechanism for
kernel bug-fixes with severe security implications. Some of our partners
(especially those with large cloud deployments or distro vendors
providing them with software) need a bit of time to roll out a fix and
consider that the public disclosure via the kernel stable/linus trees is
too late, pretty much a zero-day for them. So far we pointed them at
linux-distros but there is a growing pressure for private disclosure
mechanisms (only for reports originating from Arm). Maybe your idea of
first reporting to distro security teams is not that bad.

-- 
Catalin

