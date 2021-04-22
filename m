Return-Path: <ksummit+bounces-74-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2D136819C
	for <lists@lfdr.de>; Thu, 22 Apr 2021 15:41:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 2452B3E6366
	for <lists@lfdr.de>; Thu, 22 Apr 2021 13:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26C532FA7;
	Thu, 22 Apr 2021 13:41:19 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D152F9B
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 13:41:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 28E556145F;
	Thu, 22 Apr 2021 13:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619098877;
	bh=ilg+GoTgWzGWi7tpswfgfYJNJhEb+K6HcpRSbDmxB8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jqdLQmEJ16N7B4Ak/C+d91ZlrIKcScLCCuDDSEYLdCxodn/U/57vn1oWA0yVnSTxM
	 hfHBGdwDuNEUKoWT6TINoQBLzMuAXvv9XrEgHKSY6oE8c3ZNSakW0fCgUmUgt+ntzN
	 qUb1u2Qefj3Qwk9GVCeayVdm0pvxT6NBXIrYaZKfTdq1qUcY3YP76VMLn1+ZHZE3Oy
	 IbjEZoxjw9niT87McQ34+/934NLwVjmt1zxKbq0PP+RuGkHq7yk34sdYskYpeeOoo0
	 eW4g6WukJ5S2ga0fynfP3gxWqXdpf13sc8JdR/HIFYouiKNwehU70suQnAHvBEJ2Qm
	 Uwm6FB8w5qhjg==
Date: Thu, 22 Apr 2021 16:41:14 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <YIF8+ofC//cxBg8C@unreal>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <YID5xhy2vv45fnOv@unreal>
 <20210422112001.22c64fe9@coco.lan>
 <20210422125357.uuxprp6rqxewcdsr@nitro.local>
 <YIF1XyIqwhTcRjFE@unreal>
 <20210422132736.s2lqinm5ke565ujp@nitro.local>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210422132736.s2lqinm5ke565ujp@nitro.local>

On Thu, Apr 22, 2021 at 09:27:36AM -0400, Konstantin Ryabitsev wrote:
> On Thu, Apr 22, 2021 at 04:08:47PM +0300, Leon Romanovsky wrote:
> > > You'll need to adjust it to point at where your maildir lives, of course, but
> > > that's the general idea. With it in place, you can hit "4" in the index view
> > > to get the rest of the thread (without duplicating the messages you already
> > > have).
> > 
> > Thanks, I'll try it, however it will fit my flow only partially.
> > 
> > This macro will bring the missing patches only when I'm near computer (mutt),
> > while in my flow, I'm reading emails from the phone and only for the replies use
> > the computer.
> 
> You may be better served by the upcoming "lei" tool, then. It can identify
> threads of interest to you (e.g. those on which you are cc'd), put them
> into your local or remote inbox, and continuously update them as new messages
> come in. If you run it as a background process, you'll get the workflow you're
> wanting.

I'm less optimistic than you, for example it is unclear where and how
will I run this background process when I want to read emails during the
trips :).

Thanks

> 
> -K

