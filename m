Return-Path: <ksummit+bounces-1056-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E144784254
	for <lists@lfdr.de>; Tue, 22 Aug 2023 15:48:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 291D1280F9E
	for <lists@lfdr.de>; Tue, 22 Aug 2023 13:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B16F41CA02;
	Tue, 22 Aug 2023 13:47:53 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B77C7F
	for <ksummit@lists.linux.dev>; Tue, 22 Aug 2023 13:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F736C433C7;
	Tue, 22 Aug 2023 13:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692712071;
	bh=VFpzY3oFUrBUNENy74/K4zRvkl0uD8rnFeX7VygDOD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R9+gWMDh0LkxITjO5Pp8IczCkh30RarlZjKNH4jrH33MUiCKC+OIisAj+GJ86GAzz
	 MIxzMAzT84P0sk5dEAePNKiuFH1QOLdERCBPEerlaaZ1ecFCKttFIVOJpwuLgWnQGs
	 0yjE+LHZkfTOratKVeVTV5+/UZsTY3TbQTWFP4GGSvIA88tyaVx6EhcujyH+5ZV6q9
	 xCTnyU1c/uln04Y0dJNqxqnnjVq7LhvyHoK5ovbuRDhOT0GIYlmIZpSmplVRwZIw9b
	 VETxj8GkXvOd3vy2MJ8XvoQYMs2cANvhvLBo2ZhMf5VMZ1mC25FwO9UJsqshkMNq1k
	 y5PvVKzp2bPyA==
Date: Tue, 22 Aug 2023 16:47:46 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jan Kara <jack@suse.cz>, Vegard Nossum <vegard.nossum@oracle.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Luis Chamberlain <mcgrof@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, ksummit@lists.linux.dev,
	Jeff Layton <jlayton@kernel.org>, Song Liu <song@kernel.org>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
Message-ID: <20230822134746.GC6029@unreal>
References: <20230817081957.1287b966@kernel.org>
 <CAADnVQ+6=RjVziJG6rXwiC0+dEKGTGFNPUgsa4dyPP66NyTbog@mail.gmail.com>
 <CACRpkdbfSzNwkwnew-5YN4j4yBjgh=fCiaKdPmiRbViTdOcXkw@mail.gmail.com>
 <20230818080949.7b17b0d5@kernel.org>
 <CAHk-=wibRQBp3VyJrUzk4=E_ozHokOM2LsYD9P_0XSN0edD_kw@mail.gmail.com>
 <20230819064537.GM22185@unreal>
 <e7554530-a1a5-216f-9a17-7cf763ee6a9d@oracle.com>
 <20230822094613.bxtsjlnkhaypoflj@quack3>
 <20230822110523.GB6029@unreal>
 <20230822113212.GP10135@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822113212.GP10135@pendragon.ideasonboard.com>

On Tue, Aug 22, 2023 at 02:32:12PM +0300, Laurent Pinchart wrote:
> On Tue, Aug 22, 2023 at 02:05:23PM +0300, Leon Romanovsky wrote:
> > On Tue, Aug 22, 2023 at 11:46:13AM +0200, Jan Kara wrote:
> > > On Mon 21-08-23 21:23:18, Vegard Nossum wrote:
> > > > On 8/19/23 08:45, Leon Romanovsky wrote:
> > > > > It is worth to try to get honest feedback from active developers/contributors/vendors
> > > > > what is their "real" excuse for not doing code review.
> > > > > 
> > > > > I saw in this thread about "have no time to do code review" answers and we
> > > > > all can relate to it, but IMHO it is just an excuse and not the real reason.
> > > > > Especially for a people who are employed by big corporations to do their
> > > > > upstream work.

<...>

> > > > The incentives that remain (as far as I can tell) are:
> > > > 
> > > > 1) you get familiar with a specific part of the kernel, and
> > > > 2) you get goodwill and recognition from other kernel developers.
> > > 
> > > I agree it is good to create positive incentives to provide good review.
> > > But I believe what really makes people do good reviews is the sense of
> > > common responsibility.
> > 
> > Agree as long as "people" word includes whole community together with
> > maintainers to share common responsibility.
> > 
> > Some maintainers feel too much ownership other their subsystems and it
> > causes to the lack of trust from everybody involved in the process and
> > common responsibility can't be built in that subsystems at all.
> 
> Do we need to organize a workshop for maintainers on how to stop
> clinging to power ? I'm sure I could learn something there.

Probably, everyone who will attend that workshop will need to pass a
qualification exam what "maintainer" term means for different groups:
 * Corporate management
 * Community
 * Other kernel developers 

Thanks

> 
> -- 
> Regards,
> 
> Laurent Pinchart

