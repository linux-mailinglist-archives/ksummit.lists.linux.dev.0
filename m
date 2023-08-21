Return-Path: <ksummit+bounces-1035-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D71D6782D5B
	for <lists@lfdr.de>; Mon, 21 Aug 2023 17:35:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D4D9280E63
	for <lists@lfdr.de>; Mon, 21 Aug 2023 15:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C24DB8481;
	Mon, 21 Aug 2023 15:35:51 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AC679F1
	for <ksummit@lists.linux.dev>; Mon, 21 Aug 2023 15:35:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC9AEF0A;
	Mon, 21 Aug 2023 17:34:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1692632066;
	bh=z/H+0YTpCf0n5BX1GsFLsT5lYe12R/zlE1fizuc20xA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TDHoX6fJYrkfXjfVnDYVowH+uMc6oFQCeVQxTwusU1iEb3O1Uw/TN6TiyE3by8l18
	 iev1cdIJYVdsikWL9O6X6rjw1Ird3PujmAoYYlHXHi+nYv05P74Nhfg2U/mP0kwIsu
	 +Mqt2Q9ULaxExgKyYt0BwSB4b6VrKC+xP5W9MTE0=
Date: Mon, 21 Aug 2023 18:35:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Luis Chamberlain <mcgrof@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, ksummit@lists.linux.dev,
	Jeff Layton <jlayton@kernel.org>, Song Liu <song@kernel.org>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
Message-ID: <20230821153549.GJ10135@pendragon.ideasonboard.com>
References: <20230816180808.GB2919664@perftesting>
 <ZN0uNrpD8JUtihQE@bombadil.infradead.org>
 <20230817093914.GE21668@pendragon.ideasonboard.com>
 <44814ed5-7bab-4e56-9ca6-189870f97f41@lunn.ch>
 <20230817081957.1287b966@kernel.org>
 <CAADnVQ+6=RjVziJG6rXwiC0+dEKGTGFNPUgsa4dyPP66NyTbog@mail.gmail.com>
 <CACRpkdbfSzNwkwnew-5YN4j4yBjgh=fCiaKdPmiRbViTdOcXkw@mail.gmail.com>
 <20230818080949.7b17b0d5@kernel.org>
 <CAHk-=wibRQBp3VyJrUzk4=E_ozHokOM2LsYD9P_0XSN0edD_kw@mail.gmail.com>
 <20230819064537.GM22185@unreal>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230819064537.GM22185@unreal>

On Sat, Aug 19, 2023 at 09:45:37AM +0300, Leon Romanovsky wrote:
> On Fri, Aug 18, 2023 at 07:07:24PM +0200, Linus Torvalds wrote:
> > On Fri, 18 Aug 2023 at 17:10, Jakub Kicinski wrote:
> > >
> > > I was wondering last time if we can do a run of short sessions
> > > where a few volunteers talk about their subsystems? Let's say
> > > 10min talking about
> > >  - current process subsystem uses
> > >  - "realities" / day to day challenges / problems
> > >  - how the subsystem is evolving the process
> > 
> > I feel like we did exactly that a few years in a row, but it was
> > probably back before covid times, and probably when it was still
> > called the "kernel summit" rather than "maintainer summit".
> 
> <...>
> 
> > I do think the whole "how to spread the pain of being a maintainer" is
> > very much the point of the maintainer summit, though, so I do think we
> > should revisit.
> 
> It is worth to try to get honest feedback from active developers/contributors/vendors
> what is their "real" excuse for not doing code review.
> 
> I saw in this thread about "have no time to do code review" answers and we
> all can relate to it, but IMHO it is just an excuse and not the real reason.
> Especially for a people who are employed by big corporations to do their
> upstream work.
> 
> From what I personally saw, the reasons can be different from truly
> no time upto toxic subsystem behavior with huge variety and gray areas
> in between.

That can be the case, but I think that the "no time" excuse is not just
an excuse. Many developers working upstream, even (or perhaps especially
?) those working for large companies, are put under intense time
pressure by their management. If we want to consider the "no time"
reason as an excuse, we should see it as a management excuse, not an
individual contributor excuse.

> It is not clear to me how to get honest answers without fear of loosing
> an ability to work with that subsystems later.

One straightforward (on paper) option is to guarantee anonymity. When I
was in university, students were given the opportunity to provide
feedback on teachers, and the feedback was aggregated into a report that
didn't contain any personal information that could be used to identify
the students.

-- 
Regards,

Laurent Pinchart

