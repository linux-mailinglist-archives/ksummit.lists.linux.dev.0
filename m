Return-Path: <ksummit+bounces-1050-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9048783E90
	for <lists@lfdr.de>; Tue, 22 Aug 2023 13:05:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCC2C281018
	for <lists@lfdr.de>; Tue, 22 Aug 2023 11:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D0B1173C;
	Tue, 22 Aug 2023 11:05:29 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DE19447
	for <ksummit@lists.linux.dev>; Tue, 22 Aug 2023 11:05:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 131C1C433C7;
	Tue, 22 Aug 2023 11:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692702327;
	bh=YBbEW5g3cf6A8z9l+Z3wgazjwmgzzF7KU8n6i+wbIyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=alEV4fmt2TVR92kD/dQ5hCxywLn9N1NHKgda7P+cRIBqKdG1dL2eos179DY6OidJj
	 cNnxo/qJrTLPt5cY1xM6sIRFC3FZtx2VxahwoNpp7G6GOZuIS5E2ImZUu4BNt+pqaL
	 7ewYEoGuELWRVl1VnSE3K3efMg6RhwStuc/n0pGZsJ9DX3GhrnmSDi/67gr7Z8U+U6
	 oHPMUmNQKGIXnbPLDe0KFfrFEcIVNrZ2sVSpqqZDnXKVM1vSH9I4KDCCo53cAM8Iac
	 KQGrG5i1iBgSov1DDBqh/rdb4o86vQe93D62TRvB5RkPAoHvW7VGpUvYJK6yEa0pNB
	 CBcT6kB6hC3SQ==
Date: Tue, 22 Aug 2023 14:05:23 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Jan Kara <jack@suse.cz>
Cc: Vegard Nossum <vegard.nossum@oracle.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, ksummit@lists.linux.dev,
	Jeff Layton <jlayton@kernel.org>, Song Liu <song@kernel.org>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
Message-ID: <20230822110523.GB6029@unreal>
References: <20230817093914.GE21668@pendragon.ideasonboard.com>
 <44814ed5-7bab-4e56-9ca6-189870f97f41@lunn.ch>
 <20230817081957.1287b966@kernel.org>
 <CAADnVQ+6=RjVziJG6rXwiC0+dEKGTGFNPUgsa4dyPP66NyTbog@mail.gmail.com>
 <CACRpkdbfSzNwkwnew-5YN4j4yBjgh=fCiaKdPmiRbViTdOcXkw@mail.gmail.com>
 <20230818080949.7b17b0d5@kernel.org>
 <CAHk-=wibRQBp3VyJrUzk4=E_ozHokOM2LsYD9P_0XSN0edD_kw@mail.gmail.com>
 <20230819064537.GM22185@unreal>
 <e7554530-a1a5-216f-9a17-7cf763ee6a9d@oracle.com>
 <20230822094613.bxtsjlnkhaypoflj@quack3>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822094613.bxtsjlnkhaypoflj@quack3>

On Tue, Aug 22, 2023 at 11:46:13AM +0200, Jan Kara wrote:
> On Mon 21-08-23 21:23:18, Vegard Nossum wrote:
> > On 8/19/23 08:45, Leon Romanovsky wrote:
> > > It is worth to try to get honest feedback from active developers/contributors/vendors
> > > what is their "real" excuse for not doing code review.
> > > 
> > > I saw in this thread about "have no time to do code review" answers and we
> > > all can relate to it, but IMHO it is just an excuse and not the real reason.
> > > Especially for a people who are employed by big corporations to do their
> > > upstream work.
> > 
> > For some drive-by or would-be reviewers, at least, I think part of the
> > problem is perverse or misaligned incentives.
> > 
> > If you write code and your patches are accepted in the kernel, it counts
> > towards your commit count, which is a metric that people look at, for
> > better or worse (probably worse).
> > 
> > When you review a patch and you find some problem with it, the patch
> > will NOT get accepted in the kernel (at least not in that form), and
> > your name will NOT appear in the git log. So in a way, in order for
> > your contribution to get recorded, you have to give the patch a
> > passing grade -OR- you are now on the hook to keep reviewing every
> > following iteration of the patch until it's in a state where you're
> > completely sure it doesn't have any problems.
> > 
> > (Of course, if you just rubber-stamp your Reviewed-by: on everything
> > then you are bound to be found out sooner or later -- or at the very
> > least seen as an unreliable reviewer.)
> > 
> > But let's assume you don't give out your Reviewed-by: without having
> > REALLY checked the patch thoroughly. Even then, mistakes can slip in.
> > In a way, being a reviewer and missing something critical is even
> > worse than being the author and missing something critical. Is it even
> > worth putting your Reviewed-by: on something if you're not 100% sure
> > this patch is not going to cause an issue? Are people going to trust
> > you in the future if you make a mistake in your review?
> > 
> > Let's say you're completely sure you found an issue with the patch. Why
> > not just stay silent, hope that nobody catches it, and then submit your
> > own patch later to fix it? That will get your name in the log. Even
> > worse, if it's a security issue you can maybe write an exploit for it
> > and either get a bounty from Google or sell it for serious $$$ to
> > various malicious actors. [Note that I'm not saying most people would do
> > this; I don't know. I am just using it as an example to show that the
> > incentives are disproportionate.]
> > 
> > The incentives that remain (as far as I can tell) are:
> > 
> > 1) you get familiar with a specific part of the kernel, and
> > 2) you get goodwill and recognition from other kernel developers.
> 
> I agree it is good to create positive incentives to provide good review.
> But I believe what really makes people do good reviews is the sense of
> common responsibility.

Agree as long as "people" word includes whole community together with
maintainers to share common responsibility.

Some maintainers feel too much ownership other their subsystems and it
causes to the lack of trust from everybody involved in the process and
common responsibility can't be built in that subsystems at all.

Thanks

