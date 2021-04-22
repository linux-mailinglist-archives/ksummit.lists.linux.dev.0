Return-Path: <ksummit+bounces-109-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 168263684CD
	for <lists@lfdr.de>; Thu, 22 Apr 2021 18:28:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id D48F43E7F51
	for <lists@lfdr.de>; Thu, 22 Apr 2021 16:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01CB92FA0;
	Thu, 22 Apr 2021 16:28:22 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.hallyn.com (mail.hallyn.com [178.63.66.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F6E70
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 16:28:19 +0000 (UTC)
Received: by mail.hallyn.com (Postfix, from userid 1001)
	id ADF15B10; Thu, 22 Apr 2021 11:28:11 -0500 (CDT)
Date: Thu, 22 Apr 2021 11:28:11 -0500
From: "Serge E. Hallyn" <serge@hallyn.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Leon Romanovsky <leon@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210422162811.GA28378@mail.hallyn.com>
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
User-Agent: Mutt/1.9.4 (2018-02-28)

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
> 
> -K

That sounds awesome.

