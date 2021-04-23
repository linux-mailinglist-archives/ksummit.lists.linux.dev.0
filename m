Return-Path: <ksummit+bounces-141-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA9E368DEF
	for <lists@lfdr.de>; Fri, 23 Apr 2021 09:32:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 733143E9293
	for <lists@lfdr.de>; Fri, 23 Apr 2021 07:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C54422FA5;
	Fri, 23 Apr 2021 07:31:27 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2BB70
	for <ksummit@lists.linux.dev>; Fri, 23 Apr 2021 07:31:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8809861404;
	Fri, 23 Apr 2021 07:31:23 +0000 (UTC)
Date: Fri, 23 Apr 2021 09:31:20 +0200
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Leon Romanovsky <leon@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210423073120.2xm3prdjllpqdhgi@wittgenstein>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <YID5xhy2vv45fnOv@unreal>
 <20210422112001.22c64fe9@coco.lan>
 <20210422125357.uuxprp6rqxewcdsr@nitro.local>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

I do currently have three keybindings:

macro index,pager A "<pipe-message>b4 am -t -l -s -g -c -C -Q <enter>"
macro index,pager S "<pipe-message>b4 am -t -c -Q <enter>"
macro index,pager M "<pipe-message>b4 mbox <enter>"

The -f switch is new, right?

