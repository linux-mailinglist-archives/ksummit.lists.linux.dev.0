Return-Path: <ksummit+bounces-14-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFCE3673CC
	for <lists@lfdr.de>; Wed, 21 Apr 2021 21:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 746A01C1904
	for <lists@lfdr.de>; Wed, 21 Apr 2021 19:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D22D2FA0;
	Wed, 21 Apr 2021 19:55:23 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03902F83
	for <ksummit@lists.linux.dev>; Wed, 21 Apr 2021 19:55:20 +0000 (UTC)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3ATyAAeqo2bEJ4UAlHLmGWYaMaV5rKeYIsi2QD?=
 =?us-ascii?q?101hICF9WMqeisyogbAnxQb54QxhPE0ItNicNMC7Kk/02oVy5eAqV4uKfA6jg2?=
 =?us-ascii?q?ewKZEn0I2K+VzdMgnf0sIY6qt6aah5D7TLfD1HpOL3+hOxHdpl4PTvysCVrNzT?=
 =?us-ascii?q?xXtsUg1mApsIhztRMQqVHlZ7QwNLH/MCZfmhz/BarDmtc2l/VKqGL0QCNtKum/?=
 =?us-ascii?q?T2jp78JTYJCxk7gTP+7w+A2frKVyKV2RoTSFp0rIsK+2KtqWPE2pk=3D?=
X-IronPort-AV: E=Sophos;i="5.82,240,1613430000"; 
   d="scan'208";a="379308939"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Apr 2021 21:55:09 +0200
Date: Wed, 21 Apr 2021 21:55:09 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Roland Dreier <roland@kernel.org>
cc: Steven Rostedt <rostedt@goodmis.org>, 
    James Bottomley <James.Bottomley@hansenpartnership.com>, 
    ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for "trivial"
 patches
In-Reply-To: <CAG4TOxNOHRexUoKTo7ndViNtss0_BDeh4YCVHexvdQhQWF+vaw@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2104212150230.20674@hadrien>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com> <20210421152209.68075314@gandalf.local.home> <CAG4TOxNOHRexUoKTo7ndViNtss0_BDeh4YCVHexvdQhQWF+vaw@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1733717962-1619034910=:20674"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1733717962-1619034910=:20674
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Wed, 21 Apr 2021, Roland Dreier wrote:

> On Wed, Apr 21, 2021 at 12:22 PM Steven Rostedt <rostedt@goodmis.org> wrote:
> > I have no problem with taking a trivial patch if they are really fixing a
> > bug. I think what needs to be done here is look at the patches that got in
> > that were buggy, and see why they got in.
> >
> > Perhaps the answer is to scrutinize trivial patches more. To me, the only
> > "trivial" patch is a comment fix, or update to documentation. And even
> > then, I spend time reviewing it.
> >
> > If you don't have time to review a patch, then by all means, don't accept
> > it. Perhaps the answer is simply have a higher bar on what you do accept.
> >
> > There are a few people that I will accept patches from with out review. But
> > anyone else, I scrutinize the code before taking it in.
>
> I agree with this.  And indeed to me perhaps what needs to be
> calibrated is our definition of a trivial patch.
>
> If someone sends a patch that changes "speling" to "spelling" in a
> comment, then I think that's fine to apply without much scrutiny.  If
> someone sends a patch that changes reference counting on an error
> path, then that absolutely needs to be looked at to ensure
> correctness.  There are enough people sending wrong patches without
> even thinking about malicious actors.
>
> I also think there does need to be a strong sanction against this UMN
> research group, since we need to make sure there are strong incentives
> against wasting everyone's time with stunts like this.  Hopefully on
> the academic side it can be made clear that this is not ethical
> research - for example, why did IEEE think this was an acceptable
> paper?

The author's web page (https://www-users.cs.umn.edu/~kjlu/) says:

On the Feasibility of Stealthily Introducing Vulnerabilities in
Open-Source Software via Hypocrite Commits
Qiushi Wu, and Kangjie Lu.
To appear in Proceedings of the 42nd IEEE Symposium on Security and
Privacy (Oakland'21). Virtual conference, May 2021.
★ Note: The experiment did not introduce any bug or bug-introducing
commit into OSS. It demonstrated weaknesses in the patching process in a
safe way. No user was affected, and IRB exempt was issued. The experiment
actually fixed three real bugs. Please see the clarifications.
https://www-users.cs.umn.edu/~kjlu/papers/clarifications-hc.pdf

He's on the program committee of the conference for next year...

[I'm just providing information, not implying that I agree with it]

julia
--8323329-1733717962-1619034910=:20674--

