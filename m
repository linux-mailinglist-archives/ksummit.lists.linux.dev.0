Return-Path: <ksummit+bounces-1053-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 329E7783F21
	for <lists@lfdr.de>; Tue, 22 Aug 2023 13:33:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFACE281096
	for <lists@lfdr.de>; Tue, 22 Aug 2023 11:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F4F41C2B3;
	Tue, 22 Aug 2023 11:32:09 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178A61BEF6
	for <ksummit@lists.linux.dev>; Tue, 22 Aug 2023 11:32:06 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 092CADD9;
	Tue, 22 Aug 2023 13:30:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1692703848;
	bh=45N7tM1nidTATOaemcXiSWYpukDGHBbZjk/T4bUJj+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YK289l8Xc7cjrL2fTa1Raw63FV7jEKzfoF6VV8tKzqNLwSbykn3CouBF/wJ5o7L+z
	 GH8ENEMBNQRAhcvYnGIcvaB8s6j36ZWTVWQJ/kXZmK8UsrE/80nhK/4wYiTPxV+IWO
	 JR2gP0m2Ea3/NbX6y9wFyMvZ0WdttDB9+g59O+s4=
Date: Tue, 22 Aug 2023 14:32:12 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Jan Kara <jack@suse.cz>, Vegard Nossum <vegard.nossum@oracle.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Luis Chamberlain <mcgrof@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, ksummit@lists.linux.dev,
	Jeff Layton <jlayton@kernel.org>, Song Liu <song@kernel.org>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
Message-ID: <20230822113212.GP10135@pendragon.ideasonboard.com>
References: <44814ed5-7bab-4e56-9ca6-189870f97f41@lunn.ch>
 <20230817081957.1287b966@kernel.org>
 <CAADnVQ+6=RjVziJG6rXwiC0+dEKGTGFNPUgsa4dyPP66NyTbog@mail.gmail.com>
 <CACRpkdbfSzNwkwnew-5YN4j4yBjgh=fCiaKdPmiRbViTdOcXkw@mail.gmail.com>
 <20230818080949.7b17b0d5@kernel.org>
 <CAHk-=wibRQBp3VyJrUzk4=E_ozHokOM2LsYD9P_0XSN0edD_kw@mail.gmail.com>
 <20230819064537.GM22185@unreal>
 <e7554530-a1a5-216f-9a17-7cf763ee6a9d@oracle.com>
 <20230822094613.bxtsjlnkhaypoflj@quack3>
 <20230822110523.GB6029@unreal>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230822110523.GB6029@unreal>

On Tue, Aug 22, 2023 at 02:05:23PM +0300, Leon Romanovsky wrote:
> On Tue, Aug 22, 2023 at 11:46:13AM +0200, Jan Kara wrote:
> > On Mon 21-08-23 21:23:18, Vegard Nossum wrote:
> > > On 8/19/23 08:45, Leon Romanovsky wrote:
> > > > It is worth to try to get honest feedback from active developers/contributors/vendors
> > > > what is their "real" excuse for not doing code review.
> > > > 
> > > > I saw in this thread about "have no time to do code review" answers and we
> > > > all can relate to it, but IMHO it is just an excuse and not the real reason.
> > > > Especially for a people who are employed by big corporations to do their
> > > > upstream work.
> > > 
> > > For some drive-by or would-be reviewers, at least, I think part of the
> > > problem is perverse or misaligned incentives.
> > > 
> > > If you write code and your patches are accepted in the kernel, it counts
> > > towards your commit count, which is a metric that people look at, for
> > > better or worse (probably worse).
> > > 
> > > When you review a patch and you find some problem with it, the patch
> > > will NOT get accepted in the kernel (at least not in that form), and
> > > your name will NOT appear in the git log. So in a way, in order for
> > > your contribution to get recorded, you have to give the patch a
> > > passing grade -OR- you are now on the hook to keep reviewing every
> > > following iteration of the patch until it's in a state where you're
> > > completely sure it doesn't have any problems.
> > > 
> > > (Of course, if you just rubber-stamp your Reviewed-by: on everything
> > > then you are bound to be found out sooner or later -- or at the very
> > > least seen as an unreliable reviewer.)
> > > 
> > > But let's assume you don't give out your Reviewed-by: without having
> > > REALLY checked the patch thoroughly. Even then, mistakes can slip in.
> > > In a way, being a reviewer and missing something critical is even
> > > worse than being the author and missing something critical. Is it even
> > > worth putting your Reviewed-by: on something if you're not 100% sure
> > > this patch is not going to cause an issue? Are people going to trust
> > > you in the future if you make a mistake in your review?
> > > 
> > > Let's say you're completely sure you found an issue with the patch. Why
> > > not just stay silent, hope that nobody catches it, and then submit your
> > > own patch later to fix it? That will get your name in the log. Even
> > > worse, if it's a security issue you can maybe write an exploit for it
> > > and either get a bounty from Google or sell it for serious $$$ to
> > > various malicious actors. [Note that I'm not saying most people would do
> > > this; I don't know. I am just using it as an example to show that the
> > > incentives are disproportionate.]
> > > 
> > > The incentives that remain (as far as I can tell) are:
> > > 
> > > 1) you get familiar with a specific part of the kernel, and
> > > 2) you get goodwill and recognition from other kernel developers.
> > 
> > I agree it is good to create positive incentives to provide good review.
> > But I believe what really makes people do good reviews is the sense of
> > common responsibility.
> 
> Agree as long as "people" word includes whole community together with
> maintainers to share common responsibility.
> 
> Some maintainers feel too much ownership other their subsystems and it
> causes to the lack of trust from everybody involved in the process and
> common responsibility can't be built in that subsystems at all.

Do we need to organize a workshop for maintainers on how to stop
clinging to power ? I'm sure I could learn something there.

-- 
Regards,

Laurent Pinchart

