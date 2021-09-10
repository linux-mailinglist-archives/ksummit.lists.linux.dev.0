Return-Path: <ksummit+bounces-497-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF0A40731A
	for <lists@lfdr.de>; Fri, 10 Sep 2021 23:51:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 753323E10D6
	for <lists@lfdr.de>; Fri, 10 Sep 2021 21:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 727582FB6;
	Fri, 10 Sep 2021 21:51:47 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAA42FB2
	for <ksummit@lists.linux.dev>; Fri, 10 Sep 2021 21:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1631310705;
	bh=my6NB/KULJDMVJoSqAx5dQoBHq2Qv8eyOvO+mWEv090=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=d/jCq6d2PgYEjttXWviddLKwBSBbVsuzu2DeyjXw9GHHxfFyrtWpDXV8Hvo+SNCCc
	 Ev6Y/f9ZQmYzK3dbbUZAE7M+XhyyNehAowdMFGKBi7zWmm13r6FU9YtFEzthBhQAlQ
	 +meIARY5bDP0mLLD9zkYdoIpAU49SkY3PHhteYNc=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 212D012805FF;
	Fri, 10 Sep 2021 14:51:45 -0700 (PDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7c6BaHqyyQ68; Fri, 10 Sep 2021 14:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1631310704;
	bh=my6NB/KULJDMVJoSqAx5dQoBHq2Qv8eyOvO+mWEv090=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=vcXIxBrdegYKZS0xEZ0qK9E+5O7Z7wm9f6uKVtXIuiW1Bn4FSHYVqZIFvVz/eRgfe
	 +uDwL0b3ku1C4dcG4Ns56IM4/PYITsv1Ae4g9XPpf0XA36U2SdYbeCsNSO9u2HBWS2
	 WAccWePzVnrbGwJX81ajRA37N+L9AVyLUAiiSXZQ=
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:600:8280:66d1::527])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id C5FBD12805FB;
	Fri, 10 Sep 2021 14:51:44 -0700 (PDT)
Message-ID: <9f380f6b8efecb4bfe39a3d520ff74d8ab07b9c5.camel@HansenPartnership.com>
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Date: Fri, 10 Sep 2021 14:51:43 -0700
In-Reply-To: <877dfop2lx.fsf@meer.lwn.net>
References: <877dfop2lx.fsf@meer.lwn.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Fri, 2021-09-10 at 15:00 -0600, Jonathan Corbet wrote:
>  - Are there internal kernel interfaces, such as DMA-BUF or P2PDMA,
> that are only available to drivers with a free user-space
> implementation? Do we need an EXPORT_SYMBOL_USERSPACE_GPL()?

I don't think reasonably we can do this.  The kernel GPLv2 licence
includes this system exception:

      NOTE! This copyright does *not* cover user programs that use
   kernel services by normal system calls - this is merely considered
   normal use of the kernel, and does *not* fall under the heading of
   "derived work". Also note that the GPL below is copyrighted by the
   Free Software Foundation, but the instance of code that it refers to
   (the Linux kernel) is copyrighted by me and others who actually
   wrote it.

    Also note that the only valid version of the GPL as far as the
   kernel is concerned is _this_ particular version of the license (ie
   v2, not v2.2 or v3.x or whatever), unless explicitly otherwise
   stated.

This means currently that once an API is exposed to user space, we've
given up control of the type of programme (proprietary or open source)
that may use it.

It might be possible legally to try and take back that control by
modifying the system exception (what is a "normal" system call), but I
personally think that would be unwise and create a raft of other
problems for other proprietary user space code running on Linux, which
I really think we don't want to do.

I think our only recourse for user space accelerators is not to export
the interface if we think it would only be used for evil purposes.

James



