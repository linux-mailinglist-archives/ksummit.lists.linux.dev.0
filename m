Return-Path: <ksummit+bounces-448-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE073D47ED
	for <lists@lfdr.de>; Sat, 24 Jul 2021 15:41:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 22DF63E0EFF
	for <lists@lfdr.de>; Sat, 24 Jul 2021 13:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B6AD2FB6;
	Sat, 24 Jul 2021 13:41:39 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57393173
	for <ksummit@lists.linux.dev>; Sat, 24 Jul 2021 13:41:36 +0000 (UTC)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AnB1/yqyaeFGZqnuqktMOKrPxruskLtp133Aq?=
 =?us-ascii?q?2lEZdPUCSL3tqynIpoVo6faUskdjZJhOo7690cW7LE80sKQFkLX5Xo3SKzUO2l?=
 =?us-ascii?q?HYUr2KhLGKq1aLJ8S9zJ8s6U4KScdD4bPLYWRSvILQ/AeqE9MkyJ2u6rqpi+DT?=
 =?us-ascii?q?wjNRS2hRGtxdxjY8IRqUAU1yQQEDL5swE5SR645ppzakdG5/VLXFOlA1G8Peqc?=
 =?us-ascii?q?7KkZfvJTQBAwcg7wWIkFqTmdvHOind9QsRQDNLxL9n3m3MnRaR3NTej9iLjjTB?=
 =?us-ascii?q?2XzS6pFf3Pns2sVEH8GX4/JlTQnEu0KCeIpzW7iGtHQNu+Go81Y2gLD30m0dFv?=
 =?us-ascii?q?U2wG/ebWGxpBOo4hLn3Sol9hbZuD2lqEqmitD2VzI+DsIEvo5QaB3fgnBAgPhM?=
 =?us-ascii?q?lIlW0XGYsp9eSSjNhiL5+8XJURYCrDvOnVMS1cUOgW9eVI4XLIVcsoAF/F5Eea?=
 =?us-ascii?q?1weh7S2cQNDOd8DMTY7LJtbFuGc2qxhBgW/PWcGl8uEASHR00L/vGEyjQ+phBE?=
 =?us-ascii?q?5npd79AQjXcE8Zp4d6Jgjt60R5hApfVkUsEEbad5DKM/TdCsCmrLKCi8VF66EB?=
 =?us-ascii?q?DNCK8VO3fJo9rI6Kg+5aWQdJQTypxaouWjbHpo8UUvdVHvDMiHmKNL9Hn2MRyA?=
 =?us-ascii?q?YQg=3D?=
X-IronPort-AV: E=Sophos;i="5.84,266,1620684000"; 
   d="scan'208";a="388893220"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Jul 2021 15:40:24 +0200
Date: Sat, 24 Jul 2021 15:40:24 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Geert Uytterhoeven <geert@linux-m68k.org>
cc: Dan Carpenter <dan.carpenter@oracle.com>, ksummit@lists.linux.dev
Subject: Re: Potential static analysis ideas
In-Reply-To: <CAMuHMdWwSdXppWo=sYm+ajVdR=zXzNJpP2xZWbCLdxxu55MZoA@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2107241539270.3078@hadrien>
References: <20210723191023.GG25548@kadam> <CAMuHMdWwSdXppWo=sYm+ajVdR=zXzNJpP2xZWbCLdxxu55MZoA@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Sat, 24 Jul 2021, Geert Uytterhoeven wrote:

> Hi Dan,
>
> On Fri, Jul 23, 2021 at 9:11 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > These days we have disabled GCC's uninitialized warnings so it falls
> > to static analysis devs to review all the new warnings.  I sometimes
> > ignore warnings if they look like probably they aren't a bug.  Does this
> > function allow zero size writes?  Does this switch statement really need
> > a default case?  Maybe sometimes I miss bugs.
>
> Yeah, I tended to find a few real bugs every release using the good old
> gcc 4.2, before support for it was dropped.
> I hope someone still runs modern compilers with GCC's uninitialized
> warnings enabled again?
>
> > Here is another example of something which I have a check for but I
> > haven't pushed.
> >
> >         ret = frob();
> >         if (!ret)
> >                 return ret;
> >
> > This code is normally correct but sometimes it means the if statement is
> > reversed and it should be "if (ret) return ret;".  To me returning a
> > literal is always more clear but but clearly the original author felt
> > "ret" was more clear...  It's only a few bugs per year so it's not a big
> > deal either way.
>
> To make it work well, you need to know if frob() and/or the current
> function return an error code or not.  While you can use some heuristics
> (e.g. is there any return -Exxx), perhaps we can add an annotation to
> indicate if a function returns an error code, or an error pointer?

FWIW, the ability of Coccinelle to add and match against annotations is
currently being greatly improved by Keisuke Nishimura.

julia

>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
>

