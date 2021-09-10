Return-Path: <ksummit+bounces-499-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEA9407369
	for <lists@lfdr.de>; Sat, 11 Sep 2021 00:35:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 27C2A1C0FD8
	for <lists@lfdr.de>; Fri, 10 Sep 2021 22:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 945B22FB6;
	Fri, 10 Sep 2021 22:35:10 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF3F3FC3
	for <ksummit@lists.linux.dev>; Fri, 10 Sep 2021 22:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1631313307;
	bh=eklkYygKMokH82RLWIYjIh+0kuzW+3q0HI1nt2T0xMc=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=Y8ZDFqqJkKAGA3ARfiatc3ByDn8x6hq38JK2czKT8EkKx24Pa0XodagB+hwdEvjAz
	 FJjsISqmrMOfGuYRszAXr1c95aMVINszVWb+I5o6S2IRUbzT9ZThmLE+Wl+4ov5T5y
	 Wvluw4N+u5zOrJ6Za7f+DDbzS8qqzE5+eOGd8mN0=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id B2AB61280E85;
	Fri, 10 Sep 2021 15:35:07 -0700 (PDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hwJi_vrbPdt5; Fri, 10 Sep 2021 15:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1631313307;
	bh=eklkYygKMokH82RLWIYjIh+0kuzW+3q0HI1nt2T0xMc=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=Y8ZDFqqJkKAGA3ARfiatc3ByDn8x6hq38JK2czKT8EkKx24Pa0XodagB+hwdEvjAz
	 FJjsISqmrMOfGuYRszAXr1c95aMVINszVWb+I5o6S2IRUbzT9ZThmLE+Wl+4ov5T5y
	 Wvluw4N+u5zOrJ6Za7f+DDbzS8qqzE5+eOGd8mN0=
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:600:8280:66d1::527])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 62BC51280E79;
	Fri, 10 Sep 2021 15:35:07 -0700 (PDT)
Message-ID: <05c1591b0e3744233e78ae35ba66d2721ee6af5e.camel@HansenPartnership.com>
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Date: Fri, 10 Sep 2021 15:35:06 -0700
In-Reply-To: <YTvVKrfyMc7fKsZx@piout.net>
References: <877dfop2lx.fsf@meer.lwn.net>
	 <9f380f6b8efecb4bfe39a3d520ff74d8ab07b9c5.camel@HansenPartnership.com>
	 <YTvVKrfyMc7fKsZx@piout.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Fri, 2021-09-10 at 23:59 +0200, Alexandre Belloni wrote:
> On 10/09/2021 14:51:43-0700, James Bottomley wrote:
> > On Fri, 2021-09-10 at 15:00 -0600, Jonathan Corbet wrote:
> > >  - Are there internal kernel interfaces, such as DMA-BUF or
> > > P2PDMA, that are only available to drivers with a free user-space
> > > implementation? Do we need an EXPORT_SYMBOL_USERSPACE_GPL()?
> > 
> > I don't think reasonably we can do this.  The kernel GPLv2 licence
> > includes this system exception:
> > 
> >       NOTE! This copyright does *not* cover user programs that use
> >    kernel services by normal system calls - this is merely
> > considered
> >    normal use of the kernel, and does *not* fall under the heading
> > of
> >    "derived work". Also note that the GPL below is copyrighted by
> > the
> >    Free Software Foundation, but the instance of code that it
> > refers to
> >    (the Linux kernel) is copyrighted by me and others who actually
> >    wrote it.
> > 
> >     Also note that the only valid version of the GPL as far as the
> >    kernel is concerned is _this_ particular version of the license
> > (ie
> >    v2, not v2.2 or v3.x or whatever), unless explicitly otherwise
> >    stated.
> > 
> > This means currently that once an API is exposed to user space,
> > we've given up control of the type of programme (proprietary or
> > open source) that may use it.
> > 
> > It might be possible legally to try and take back that control by
> > modifying the system exception (what is a "normal" system call),
> > but I personally think that would be unwise and create a raft of
> > other problems for other proprietary user space code running on
> > Linux, which I really think we don't want to do.
> > 
> > I think our only recourse for user space accelerators is not to
> > export the interface if we think it would only be used for evil
> > purposes.
> > 
> 
> I think the question is not whether we want to forbid proprietary
> user space using an API but whether we want to merge said API so the
> license on the kernel doesn't matter much.

I thought that *was* the statement I made in the last paragraph: we can
choose whether or not to merge the enabling API into the kernel. 
However, if we merge it we can't choose whether a proprietary user
space takes advantage of the API.  My original reply was to the notion
of EXPORT_USERSPACE_GPL, which I think we have no legal basis for
enforcing without modifying the system exception.

James



