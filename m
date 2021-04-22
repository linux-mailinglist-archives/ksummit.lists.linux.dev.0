Return-Path: <ksummit+bounces-115-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CB336863F
	for <lists@lfdr.de>; Thu, 22 Apr 2021 19:56:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 152F43E8458
	for <lists@lfdr.de>; Thu, 22 Apr 2021 17:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42A272FA0;
	Thu, 22 Apr 2021 17:56:51 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656EB71
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 17:56:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 08D6C613AB;
	Thu, 22 Apr 2021 17:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619114209;
	bh=5wS608Y9r38F7SZyLIa2vLLbb5tOrNF6+IoJXViXQ7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dqAsqrGnnyooYsOWBfO1pbOTncP447ySq9hmxhuk5mUN/v16XB245r1GbZ8qmdMWb
	 cfnbhZJcvNWvBxY+lkd28IVILrnVEnJYkam1G4TXTFG/w5WGH2I7OhcKgU/Q2tXHZy
	 bCKj7Duz72lYsBkl8NOT0+G9C6Kvm+w0mkCLHCXNe68MB4LU0LbouGVdMYARQMBRZb
	 JeuYCxm4+wQsvfAL8tgEPbdyfTqAt0raGzFY438b8Gq13s92kEvhFPvvFkSow/HjHi
	 JILd2b1ji6/Hiw364Hj5gFgINXYJbZBM6VfEyFs4NhP6wJCbPJthcifWiK4Bek4umh
	 G65ly0pkbhB+Q==
Date: Thu, 22 Apr 2021 20:56:45 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <YIG43TuqmxU24evq@unreal>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <YID5xhy2vv45fnOv@unreal>
 <20210422112001.22c64fe9@coco.lan>
 <20210422125357.uuxprp6rqxewcdsr@nitro.local>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210422125357.uuxprp6rqxewcdsr@nitro.local>

On Thu, Apr 22, 2021 at 08:53:57AM -0400, Konstantin Ryabitsev wrote:
> On Thu, Apr 22, 2021 at 11:20:01AM +0200, Mauro Carvalho Chehab wrote:
> > Also, nowadays, with lore and b4, it would be easy to retrieve the
> > entire patch series, even for those that aren't subscribed on a 
> > c/c mailing list.
> 
> If you're a mutt user, you can set up a keybinding, e.g.:
> 
>     macro index 4 "<pipe-message>~/work/git/korg/b4/b4.sh mbox -f -o ~/Mail<return>"
> 
> You'll need to adjust it to point at where your maildir lives, of course, but
> that's the general idea. With it in place, you can hit "4" in the index view
> to get the rest of the thread (without duplicating the messages you already
> have).

Konstantin,

I tried the above and here the obstacles which I encounter.
1. My emails are stored in Maildir. The mb2md script half-worked but ok
for the test.
2. b4 didn't work if I tried to use lore link from the middle of discussion,
which is very common pattern to me.
3. b4 didn't grab the discussions, so I got the patches, but didn't get and
won't get any interesting to me responses.

Thanks

