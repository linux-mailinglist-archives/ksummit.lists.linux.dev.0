Return-Path: <ksummit+bounces-1207-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6B67E726A
	for <lists@lfdr.de>; Thu,  9 Nov 2023 20:39:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CBC82812C8
	for <lists@lfdr.de>; Thu,  9 Nov 2023 19:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9117F3714F;
	Thu,  9 Nov 2023 19:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cPSfFQ+h"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DFA36B05;
	Thu,  9 Nov 2023 19:38:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26C8BC433C8;
	Thu,  9 Nov 2023 19:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1699558739;
	bh=LtlqwO5+06zJCGj+iWBFd4h049vEfDG1a/nPIZyYBEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cPSfFQ+hXOznlC35WIJ4pggT6Ii5WGUFs2QEQrgcirF0rH4qJL5UnHPmrcClJ9lsX
	 ZBCuGLks/grwBoHbGRnWukNOkg4OL2/1Ud+YwVCMCgBcsE1a87sNPGjZhL91039DcO
	 BXkVstR0vANAZX2G5yHrYo34bemwxScrVqyo40Jk=
Date: Thu, 9 Nov 2023 14:38:58 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Joe Perches <joe@perches.com>
Cc: Alex Elder <elder@ieee.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Mark Brown <broonie@kernel.org>, users@linux.kernel.org, 
	ksummit@lists.linux.dev
Subject: Re: [workflows]RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Message-ID: <20231109-soft-anaconda-of-passion-5157c7@nitro>
References: <20231106110547.6956a430@gandalf.local.home>
 <280f404dcaab5a1cee2cc67f829c1d85aa91d772.camel@perches.com>
 <ZUu68zEzrlDVenA1@finisterre.sirena.org.uk>
 <6737487f097401510c87f38239d2f75e22fca46d.camel@perches.com>
 <20231108140415.46f84baa@gandalf.local.home>
 <eb1befce-af02-4e33-b5f2-f2ae17bf0eec@kadam.mountain>
 <20231109092701.GG21616@pendragon.ideasonboard.com>
 <903adc04-b56f-4b40-b009-4a760b3ff404@ieee.org>
 <ktmwnywdfziwkngd7exd2rmfzf3ozsws6o3u4hzch3r6ckefvs@a7pehvrsz7ii>
 <7ebbd98a64b581b42a93720896dc104398f5d322.camel@perches.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7ebbd98a64b581b42a93720896dc104398f5d322.camel@perches.com>

On Thu, Nov 09, 2023 at 11:11:08AM -0800, Joe Perches wrote:
> > > My input is that whatever the outcome of all this discussion, please
> > > define it as policy and have get_maintainer.pl implement it.  I don't
> > > want to have to think too hard about who *should* be included (beyond
> > > people I already know).
> > 
> > Yes, I fully agree with you -- people shouldn't need to know where the patches
> > should be going. The tooling should decide this for them, and I want to change
> > the tooling so that it no longer includes linux-kernel@vger on everything,
> > only on patches without any other mailing list matches.
> 
> Relatively easy to do, but what about your original request/suggestion
> to use patches@lists.linux.dev ?

Happy to go that route, just need to get the buy-in from everyone, which I
intend to bring up at the maintainers summit. My proposed course of action
is:

1. Update get_maintainer.pl so that linux-kernel@vger.kernel.org is no longer
   added on "THE REST" fall-through, unless there are no other L: entries that
   matched.
2. Add functionality to public-inbox to provide RSS feeds for "new topics" and
   "hot topics" that would allow following individual lists and the /all/
   aggregator. This is under discussion on the public-inbox meta list [1], so
   there is no final decision on this being included.
3. Figure out the best way to specify the "always-cc" address that should be
   always included by get_maintainer, either via MAINTAINERS, or via some kind
   of dot-file. Maybe just have this in MAINTAINERS:

   ALWAYS CC
   L: patches@lists.linux.dev

   And have special treatment for that entry.

I think this should gradually improve the linux-kernel mailing list to the
point where most people will start reading it again.

-K

[1] https://public-inbox.org/meta/20231107-skilled-cobra-of-swiftness-a6ff26@meerkat/T/#t

