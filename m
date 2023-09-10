Return-Path: <ksummit+bounces-1114-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F196799EFE
	for <lists@lfdr.de>; Sun, 10 Sep 2023 18:35:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AD301C20842
	for <lists@lfdr.de>; Sun, 10 Sep 2023 16:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE2668462;
	Sun, 10 Sep 2023 16:35:42 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from out-211.mta1.migadu.com (out-211.mta1.migadu.com [95.215.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7606B1FDD
	for <ksummit@lists.linux.dev>; Sun, 10 Sep 2023 16:35:40 +0000 (UTC)
Date: Sun, 10 Sep 2023 12:35:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1694363738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IlFgYrgZJBPcAFO2CPQXXZD5SNwruJdgIJyhfYvD4cc=;
	b=iOXHp0FwXSeufxioyD/lw6n4j6DfgwaT3lKncyCUs4kg0bHlxOPZ/TlI1aESJ73dP9AFv1
	6TRsEjuJwRsjiF/k8o+HxnHaMq0kBUO5+i3Kduxyk2Z8iMMSthEsJsSeoOKkGULmEa2kVM
	zLDo5xzZdPeoLDStZysGptdYjN0EjC8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Matthew Wilcox <willy@infradead.org>,
	Dave Chinner <david@fromorbit.com>,
	Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <20230910163533.ysbcztauujywrbk4@moria.home.lan>
References: <ZO9NK0FchtYjOuIH@infradead.org>
 <ZPe0bSW10Gj7rvAW@dread.disaster.area>
 <ZPe4aqbEuQ7xxJnj@casper.infradead.org>
 <8dd2f626f16b0fc863d6a71561196950da7e893f.camel@HansenPartnership.com>
 <20230909224230.3hm4rqln33qspmma@moria.home.lan>
 <CAMuHMdW3waT489ZyUPn-Qp_Nvq_E-N0uimV=iw5Nex+=Tc++xA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdW3waT489ZyUPn-Qp_Nvq_E-N0uimV=iw5Nex+=Tc++xA@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Sun, Sep 10, 2023 at 10:19:30AM +0200, Geert Uytterhoeven wrote:
> Hi Kent,
> 
> On Sun, Sep 10, 2023 at 12:42 AM Kent Overstreet
> <kent.overstreet@linux.dev> wrote:
> > On Sat, Sep 09, 2023 at 08:50:39AM -0400, James Bottomley wrote:
> > > So why can't we figure out that easier way? What's wrong with trying to
> > > figure out if we can do some sort of helper or library set that assists
> > > supporting and porting older filesystems. If we can do that it will not
> > > only make the job of an old fs maintainer a lot easier, but it might
> > > just provide the stepping stones we need to encourage more people climb
> > > up into the modern VFS world.
> >
> > What if we could run our existing filesystem code in userspace?
> >
> > bcachefs has a shim layer (like xfs, but more extensive) to run nearly
> > the entire filesystem - about 90% by loc - in userspace.
> >
> > Right now this is used for e.g. userspace fsck, but one of my goals is
> > to have the entire filesystem available as a FUSE filesystem. I'd been
> > planning on doing the fuse port as a straight fuse implementation, but
> > OTOH if we attempted a sh vfs iops/aops/etc. -> fuse shim, then we would
> > have pretty much everything we need to run any existing fs (e.g.
> > reiserfs) as a fuse filesystem.
> >
> > It'd be a nontrivial project with some open questions (e.g. do we have
> > to lift all of bufferheads to userspace?) but it seems worth
> > investigating.
> 
>   1. https://xkcd.com/1200/ (not an exact match, but you should get the idea),
>   2. Once a file system is removed from the kernel, would the user space
>      implementation be maintained better?

This would be for the filesystems that aren't getting maintained and
tested, to eliminate accidental breakage from in-kernel refactoring and
changing of APIs.

Getting that code out of the kernel would also greatly help with
security concerns.

