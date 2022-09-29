Return-Path: <ksummit+bounces-784-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9105EF644
	for <lists@lfdr.de>; Thu, 29 Sep 2022 15:21:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 731A81C209D8
	for <lists@lfdr.de>; Thu, 29 Sep 2022 13:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 165DF1C2A;
	Thu, 29 Sep 2022 13:21:13 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F3E139A;
	Thu, 29 Sep 2022 13:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17022C433D6;
	Thu, 29 Sep 2022 13:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1664457671;
	bh=ruOHd60/xBhqVP3BU1wfLtOqiLeRzITwo+Fx8lHKHcU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l1q+LewcfoArFduJB1pct4BSTZtcLo4F/r5NEMo3pekA6nG/TbLVubcUeIuBqBaZ3
	 CvqRkMndQQ786wUMcIX+UFhyRcLd0vnNFHsXflEjwfbWaskFa7pWSNU1gsj8OkFMlS
	 jdDSnaj1+VCUJQrLGiwCzUeLte7YjBWORrmnhiag=
Date: Thu, 29 Sep 2022 15:21:47 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Artem S. Tashkinov" <aros@gmx.com>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	workflows@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	ksummit@lists.linux.dev
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <YzWb6xVBdiMjSfjF@kroah.com>
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info>
 <93a37d72-9a88-2eec-5125-9db3d67f5b65@gmx.com>
 <YzWVJpqNq4UeeaoH@kroah.com>
 <92c43f2b-c89d-cb9b-a7ce-777171258185@gmx.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92c43f2b-c89d-cb9b-a7ce-777171258185@gmx.com>

On Thu, Sep 29, 2022 at 01:09:35PM +0000, Artem S. Tashkinov wrote:
> 
> 
> On 9/29/22 12:52, Greg KH wrote:
> > On Thu, Sep 29, 2022 at 12:22:35PM +0000, Artem S. Tashkinov wrote:
> > > Let me be brutally honest here, if you're working on the kernel,
> > > specially for a large company such as e.g. Intel, you're _expected_ to
> > > address the issues which are related to the kernel component[s] you're
> > > maintaining/developing otherwise it's not "development" it's "I'm
> > > dumping my code because my employer pays me to do that". That also means
> > > you're expected to address bug reports.
> > 
> > I wish that were the case, unfortunately it is quite rare that
> > maintainers of subsystems of the kernel are allowed to work on upstream
> > issues like this all the time.  Heck, part of the time would be
> > wonderful too, but that is also quite rare.  So while maintainers would
> > love to be able to work like this, getting their management to agree to
> > this is not very common, sadly.
> 
> Understood but it's illogical and I cannot/will not accept it.

Wonderful, please work with the companies involved to get them to change
their internal structures to support this.  Have fun! :)

Seriously, many of us have been working with many companies to try to
change this, but it's slow going and requires constant retraining of new
managers when they get moved around.  It's a thankless job, please reach
out to any contacts that you have to help out.

> For
> instance, here's a very common scenario: you work for company X. The
> company tells you to fix a bug/add a new feature/etc. You write the
> code, submit it and it results in a regression for other use cases. Are
> you saying it's alright and shouldn't be addressed? That's _exactly_ how
> many if not _most_ regressions in the kernel are introduced.

True, but the time of a report of a regression is usually much delayed
from the original development, and sometimes the original developers
have moved on.

But the topic here was the maintainers of the subsystems, not the people
who did the original development effort.  That's two totally different
groups of people, with different managers, working for different
companies.  Please don't get them confused.

> > > AFAIK, the kernel bugzilla is a Linux Foundation project and the
> > > organization receives funding from its very rich members including
> > > Google, Meta, Intel, and even Microsoft. The fact that no one is
> > > seriously working on it looks shameful and sad. We are not talking about
> > > a minor odd library with a dozen users we are talking about the kernel.
> > 
> > bugzilla.kernel.org is _hosted_ by the LF, and does a great job of
> > keeping it running and alive.  The LF has nothing to do with the content
> > of the bugs in it, the reporting, the response of people to reported
> > bugs, assigning bugs to anyone, getting them fixed, or anything else
> > related to the content in the database at all.  Please don't get
> > confused with the resources provided to host the system vs. the people
> > who actually do the kernel development itself.
> > 
> > Note, the LF does sponsor a few kernel developers to do work on the
> > kernel, including myself, but we are a tiny drop in the bucket compared
> > to the 4000+ developers who contribute to the kernel every year.
> >
> > thanks,
> >
> > greg k-h
> 
> Keeping the website up and running requires next to zero human
> time/resources, that's not proper maintenance.

Um, no, not at all.  See Konstantin's response for just a small snippet
of what is involved here.

> The
> components/subsystems/developers haven't been updated in over a decade
> which results in a bug tracker which is nearly useless. People often
> file bug reports under "Other/Other" and no one is notified of anything.
> I don't even want to touch on the fact that the  Bugzilla version the
> website is running is terribly outdated.
> 
> That's the issue I thought we're trying to resolve - making bugzilla
> useful. Under no circumstances I want to engage kernel developers or
> blame them for anything. I'm grateful you exist and do your work :-)

I agree, making bugzilla, or something else, useful would be wonderful,
but so far no one has stepped up to do that work except for Thorsten
here.  And it will involve getting 700+ different maintainers to agree
what to do, that's going to be "fun" :)

thanks,

greg k-h

