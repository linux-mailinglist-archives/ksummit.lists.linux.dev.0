Return-Path: <ksummit+bounces-969-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D986377CCD5
	for <lists@lfdr.de>; Tue, 15 Aug 2023 14:43:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19ED2281516
	for <lists@lfdr.de>; Tue, 15 Aug 2023 12:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBD4B111BA;
	Tue, 15 Aug 2023 12:42:55 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA2D100CF
	for <ksummit@lists.linux.dev>; Tue, 15 Aug 2023 12:42:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 189C6C433C7;
	Tue, 15 Aug 2023 12:42:53 +0000 (UTC)
Date: Tue, 15 Aug 2023 08:42:53 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Vegard Nossum <vegard.nossum@oracle.com>, Jiri Kosina <jkosina@suse.cz>,
 ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Handling of embargoed security issues --
 security@korg vs. linux-distros@
Message-ID: <20230815084253.7091083e@gandalf.local.home>
In-Reply-To: <2023081515-lake-spotty-6a3a@gregkh>
References: <nycvar.YFH.7.76.2308150927190.14207@cbobk.fhfr.pm>
	<658e739b-c164-c360-d6a3-eb4fb15ae02e@oracle.com>
	<2023081515-lake-spotty-6a3a@gregkh>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Aug 2023 13:23:36 +0200
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Tue, Aug 15, 2023 at 12:17:03PM +0200, Vegard Nossum wrote:
> > I'll throw in another idea: distros@kernel.org.
> > 
> > A closed list which will be notified by security@kernel.org once they
> > feel patches for a particular issue are ready for testing/consumption by
> > distros (and hopefully before the issue is disclosed publicly, if the
> > reporter still wishes to do that).
> > 
> > The members and list rules would be totally up to the security team to
> > decide.  
> 
> As per the lawyers, and government officials we have worked with in the
> past, having a closed list for preannouncements like this will be
> either:

I guess the question is, what "preannouncements" are the lawyers worried about?

It looks like Jiri's concern is just to make sure that distros have
security patches in. Would just a list of "here's the commits that fix
security issues" be considered a preannouncement, without having any
reference to *what* security issue they fix? It would basically be a subset
of the stable tree. That is, anything that came from security@k.o, and does
not include all the AUTOSEL and other minor fixes that stable pulls in.

> 
>   - deemed illegal in some countries
>   - made to have all "major"[1] Linux users on it.

And if this list only has a list of patches that are already fixed, how
dangerous is it to not be 100% closed?

I mean, it was pretty obvious that the huge churn with spectre/meltdown
patches that were being added to the kernel at the late stage of an -rc
release was fixing "something big".

> 
> Neither of which actually will work out at all, the whole
> "preannouncement" stuff just is not possible, sorry.  I'm amazed that
> other projects have been able to "get away with it" for as long as they
> have without either being infiltrated by "the powers that be" or
> shutdown yet.

Have there been lists shutdown by the powers that be already? Or is this
just a threat made by the power that be?

> 
> Politics is a rough game, the only way to survive is to not play it for
> stuff like this.
> 
> So no, "distros@k.o" isn't going to be possible for the LF to host, and
> any other group that wants to run such a thing will quickly have these
> issues as well, it's amazing that linux-distros has been able to survive
> for as long as it has.

I'll have to talk with some laywers, as I'm curious to what would be
considered illegal about linux-distros. Are you aware of any government
specific laws I could go read? I'm not a lawyer, but I've read quite a bit
of laws that I can usually get an idea of the problem for my own
references (and my experience is that lawyers don't even know until
something is settled in court).

Note, linux-distros is not about "Linux users" but "Linux distributors".
They are not end users but are distributing a product (and having to follow
all the rules of the GPL and such to do so). They are not users, they are
part of a supply chain.

How is security@kernel.org different? If the bug is in the kernel, then the
bug is in the distro. Perhaps if we find a bug in the kernel, we should
send it to the distro we are using, and not to the Linux community? As Jiri
said, most people use a distro kernel, and not the mainline or even the
stable one. Really, if you think about it. The closest product to the user
is the distro. If someone finds a bug in the kernel, they can see if they
can exploit a distro with it. If they can, perhaps they should send it to
the security folks of the distro first. Then the distro can send it to
security@kernel.org. Maybe this already happens?

-- Steve

> 
> greg k-h
> 
> [1] "Major" includes most government agencies in most countries.


