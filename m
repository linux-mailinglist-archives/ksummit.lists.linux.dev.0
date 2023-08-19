Return-Path: <ksummit+bounces-1030-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 349687817B5
	for <lists@lfdr.de>; Sat, 19 Aug 2023 08:45:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BB20281D3A
	for <lists@lfdr.de>; Sat, 19 Aug 2023 06:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D349ED2;
	Sat, 19 Aug 2023 06:45:43 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC10363A
	for <ksummit@lists.linux.dev>; Sat, 19 Aug 2023 06:45:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE8ABC433C8;
	Sat, 19 Aug 2023 06:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692427541;
	bh=Tla+qVhYEd5rxxQeMFVvoBTEaHNjHghDVHL/vm1BJPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eBwIMSOPg/shuGSLtLH9I53u+Z/vGyw7Xb1Z50EoRCvOi3cDN/4xOOyDUjspEH6pY
	 OXcwlbrhHW/hGIMPXcIUiTpfEIhkERFJ67TjmAVFIGurK2sbMhhjziLuTkIOoQiatg
	 f2vT8lmP0hI5Wb79+4TmYwJJo5wVxm10sOUOnjwAla5nq3wtboF+nwRTkkVWHBbijZ
	 CaeTDAOKkQDVxG08DNnPGZJfVurhHs3qz9t9lMKINY5FSOuwRqgqEeAokiuPP2u6M5
	 Y9/tbQeB9RYA7F5dGZtSjG2bGKIafHnsW6hOzaUHlRd39XYjV3nC+ZUVJAGblpo1yn
	 Q4iFre4afihiw==
Date: Sat, 19 Aug 2023 09:45:37 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, ksummit@lists.linux.dev,
	Jeff Layton <jlayton@kernel.org>, Song Liu <song@kernel.org>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
Message-ID: <20230819064537.GM22185@unreal>
References: <20230816180808.GB2919664@perftesting>
 <ZN0uNrpD8JUtihQE@bombadil.infradead.org>
 <20230817093914.GE21668@pendragon.ideasonboard.com>
 <44814ed5-7bab-4e56-9ca6-189870f97f41@lunn.ch>
 <20230817081957.1287b966@kernel.org>
 <CAADnVQ+6=RjVziJG6rXwiC0+dEKGTGFNPUgsa4dyPP66NyTbog@mail.gmail.com>
 <CACRpkdbfSzNwkwnew-5YN4j4yBjgh=fCiaKdPmiRbViTdOcXkw@mail.gmail.com>
 <20230818080949.7b17b0d5@kernel.org>
 <CAHk-=wibRQBp3VyJrUzk4=E_ozHokOM2LsYD9P_0XSN0edD_kw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wibRQBp3VyJrUzk4=E_ozHokOM2LsYD9P_0XSN0edD_kw@mail.gmail.com>

On Fri, Aug 18, 2023 at 07:07:24PM +0200, Linus Torvalds wrote:
> On Fri, 18 Aug 2023 at 17:10, Jakub Kicinski <kuba@kernel.org> wrote:
> >
> > I was wondering last time if we can do a run of short sessions
> > where a few volunteers talk about their subsystems? Let's say
> > 10min talking about
> >  - current process subsystem uses
> >  - "realities" / day to day challenges / problems
> >  - how the subsystem is evolving the process
> 
> I feel like we did exactly that a few years in a row, but it was
> probably back before covid times, and probably when it was still
> called the "kernel summit" rather than "maintainer summit".

<...>

> I do think the whole "how to spread the pain of being a maintainer" is
> very much the point of the maintainer summit, though, so I do think we
> should revisit.

It is worth to try to get honest feedback from active developers/contributors/vendors
what is their "real" excuse for not doing code review.

I saw in this thread about "have no time to do code review" answers and we
all can relate to it, but IMHO it is just an excuse and not the real reason.
Especially for a people who are employed by big corporations to do their
upstream work.

From what I personally saw, the reasons can be different from truly
no time upto toxic subsystem behavior with huge variety and gray areas
in between.

It is not clear to me how to get honest answers without fear of loosing
an ability to work with that subsystems later.

Thanks

> 
>               Linus
> 

