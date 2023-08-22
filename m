Return-Path: <ksummit+bounces-1054-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A94784215
	for <lists@lfdr.de>; Tue, 22 Aug 2023 15:30:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C3021C20B0F
	for <lists@lfdr.de>; Tue, 22 Aug 2023 13:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F611CA06;
	Tue, 22 Aug 2023 13:30:25 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547A37F
	for <ksummit@lists.linux.dev>; Tue, 22 Aug 2023 13:30:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 86AC01F381;
	Tue, 22 Aug 2023 13:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1692711021; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/4mxv6DmIcAAjlGlkOAYX9hyW/Lj6iK+6bkGRcBzcpo=;
	b=rgeYyANAFfHpLfpv7DTCXRKz+KwE8hg5myVD89m8Den75bATXSwMFPea3SoORfaHGBtdW8
	io9dAImEaecDNAfhK3siG7h2zhzYwpGKpBuoBqnu3AtT75BEEnUe7Nk6Fv2f/mswx83rVG
	9hBaUuMjuBhLhrvvPvDjiOvNvGMcMQc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1692711021;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/4mxv6DmIcAAjlGlkOAYX9hyW/Lj6iK+6bkGRcBzcpo=;
	b=6lGIrZeNKYY7RmQ5wgLU0znk8c+sCau3byc3hx2u9NOJ3S6OdjvkTAK2qP4BqxfAPqdZoy
	8t8yr15wKtdSTSDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6802D132B9;
	Tue, 22 Aug 2023 13:30:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id jZ5dGW245GR8BAAAMHmgww
	(envelope-from <jack@suse.cz>); Tue, 22 Aug 2023 13:30:21 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id EC5D9A0774; Tue, 22 Aug 2023 15:30:20 +0200 (CEST)
Date: Tue, 22 Aug 2023 15:30:20 +0200
From: Jan Kara <jack@suse.cz>
To: Leon Romanovsky <leon@kernel.org>
Cc: Jan Kara <jack@suse.cz>, Vegard Nossum <vegard.nossum@oracle.com>,
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
Message-ID: <20230822133020.pndelsocbhqwzn5f@quack3>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822110523.GB6029@unreal>

On Tue 22-08-23 14:05:23, Leon Romanovsky wrote:
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

I agree. People can hardly have common responsibility when they have the
feeling their opinion doesn't really matter for the maintainer.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

