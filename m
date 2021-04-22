Return-Path: <ksummit+bounces-66-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FA336813E
	for <lists@lfdr.de>; Thu, 22 Apr 2021 15:09:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id DF6611C502C
	for <lists@lfdr.de>; Thu, 22 Apr 2021 13:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C03B2FA1;
	Thu, 22 Apr 2021 13:08:52 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EC82F9B
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 13:08:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3A2D360FF1;
	Thu, 22 Apr 2021 13:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619096931;
	bh=dXwUfh4viCaY0KqS7N6MayEVgayTDOBdQodNl6rKvRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YyIv7V3rJW4FQuL1eTw/f6RfY13U5VJ2n8SCr2H8ZMXPKBiBFv4zUBLDHu5E3lYvv
	 EGkLAcz9vWeOrpCoaNz+A4pLTjpSm+BSVIMwu3TZx9fjt9wbVnXMhrjoQjz+9MpyAS
	 ApHIZas/es4IpEt2VGbE71Q48vKAeFyF6kthafF/j7uI5W+7+zhptdX0b5Y4RBIX9V
	 z3Z2gFAbejsdPhnHFo50to/s3BtXyeq6uyjOZVX3UGxSVDt1X7FURo20mcL5vkBAaR
	 95UtxQae28kXmJp7DiYf1QLbyzmOuf5Jf2amxSBugGfxmpiMLyVkWy51ZpOvAmaVIF
	 NTRZ0nLFm5caA==
Date: Thu, 22 Apr 2021 16:08:47 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <YIF1XyIqwhTcRjFE@unreal>
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

Thanks, I'll try it, however it will fit my flow only partially.

This macro will bring the missing patches only when I'm near computer (mutt),
while in my flow, I'm reading emails from the phone and only for the replies use
the computer.

> 
> If you use mbsync, this will also put the thread into your remote imap folder.
> 
> -K

