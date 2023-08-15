Return-Path: <ksummit+bounces-986-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D30ED77D370
	for <lists@lfdr.de>; Tue, 15 Aug 2023 21:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A2E5281473
	for <lists@lfdr.de>; Tue, 15 Aug 2023 19:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D1BC1805E;
	Tue, 15 Aug 2023 19:41:10 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF90154B8
	for <ksummit@lists.linux.dev>; Tue, 15 Aug 2023 19:41:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E1DEC433C7;
	Tue, 15 Aug 2023 19:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1692128468;
	bh=qnCzGHCUg2VdzU8ac6T1yHSAaQuFoNYsZ4dibLsIpG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t9j3mZThUPaHsuQUnJ09ORl4+hPSiZdyT703mPYM66+FXGwgT1FSCAwZvW0hNnjth
	 80OGdIkRjWVRwuhbOv0vWf5KqnioENan6OC4vy2z7QJ7AowPbihZBgJi5MQOXzyPBq
	 z04X1uTJk6j0bzPg+mt4ixw2znU4wH6dXUDcupgo=
Date: Tue, 15 Aug 2023 21:41:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Jiri Kosina <jkosina@suse.cz>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Handling of embargoed security issues --
 security@korg vs. linux-distros@
Message-ID: <2023081512-worshiper-donor-371f@gregkh>
References: <nycvar.YFH.7.76.2308150927190.14207@cbobk.fhfr.pm>
 <658e739b-c164-c360-d6a3-eb4fb15ae02e@oracle.com>
 <2023081515-lake-spotty-6a3a@gregkh>
 <20230815084253.7091083e@gandalf.local.home>
 <2023081540-vindicate-caterer-33c6@gregkh>
 <ZNvGKEDS2CBlUliR@char.us.oracle.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZNvGKEDS2CBlUliR@char.us.oracle.com>

On Tue, Aug 15, 2023 at 02:46:27PM -0400, Konrad Rzeszutek Wilk wrote:
> ..snip..
> > 
> > We used to have someone on security@k.o that would notify linux-distros
> > about problems when we had fixed them, but I think they got tired of
> > constantly keeping on top of this and stopped doing it.  It's a
> > thankless job, just like being on the security@k.o alias is, and I don't
> > blame them for stopping.
> 
> Hi Greg,
> 
> Oracle will happily pay someone this "thankless job" (actually I think it
> is a pretty exciting job as you get to learn and try your hand on
> everything) to do this and also help with the security fixes.

The thing is, people on security@k.o are there on their own recognition,
and can not represent, nor notify, their employer of things discussed
there (otherwise the group can't really be called independent.)  We have
had to remove members in the past who were only using access there for
their employer so I'm a bit hesitant to only add someone for the single
reason to funnel stuff from the list elsewhere for obvious reasons.

Others in the group are free to disagree with me about this, it's run as
a "collective" by those doing the work there, not by fiat.

Note, the people on security@k.o almost always do NOT fix the issue
reported, they are there to triage and drag in the correct maintainers
and then help review proposed changes.  If you as a maintainer are drug
into the list enough times, you're asked if you want to join to save the
round-trip emails.  So when people are added, it's because of problems
in their kernel area, or because they have done lots of reviews of
subsystems in ways relating to security issues, not because they are
there to fix issues in other parts of the kernel.

And again, if only the issues that are reported to security@k.o are sent
to linux-distros, the distros will only get a tiny tiny subset of the
actual bugs being fixed in the kernel on a weekly basis.  Trying to get
access to this tiny feed does not solve the real issue of distros not
properly updating to get all of the needed fixes.

Also remember that some subsystems refuse to participate in
security@k.o, their fixes come in through the "normal" stable releases,
with work done on mailing lists.  So again, if you only see the
security@k.o issues, you will miss major problems being resolved.

Work on solving the root problem here for your distro please, don't
fixate on the CVE nonsense dance, that provides a false sense of
security and not actual security at all.

thanks,

greg k-h

