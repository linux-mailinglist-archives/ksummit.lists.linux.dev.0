Return-Path: <ksummit+bounces-1072-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD69779327D
	for <lists@lfdr.de>; Wed,  6 Sep 2023 01:23:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08C8D1C20944
	for <lists@lfdr.de>; Tue,  5 Sep 2023 23:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75CF6101ED;
	Tue,  5 Sep 2023 23:23:35 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F67DDC2
	for <ksummit@lists.linux.dev>; Tue,  5 Sep 2023 23:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QF0lefaut/7y5ErwShPnn4OJeHvxH9Dxkxy4uPBeatU=; b=nCZjt/AQYCacBPtIsf4wE7x+L7
	so80nKJ4HeZCgNBv/7bQTM9AJZ6TPNE+UpMDtVYHKsdsg+EwLUh70lvsEgFvJ40FAfju06vAWRuDl
	l+kA1/kUWntAGklDmclGsTX8CLGAwRdZTH5S+pG9sZLd0q0/CwW7YZmDXchf+abOgoXPJH4qHlzo2
	ZGVfdmpG3VFiwyVnjLtaCWlnLraoHJP93pq+R0EXUzell5Q1hyAfynAcEd51uBIIA5jo8nh1od2fx
	1/F0k0BvFUlsVpxcLKIjFZK11o3BOxetSL1YzFLVSxfRA+9EcEkh6zzwryiVNUmU8voYAPg5Q+Gxf
	usxkZumg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qdfOE-00EVyZ-6p; Tue, 05 Sep 2023 23:23:22 +0000
Date: Wed, 6 Sep 2023 00:23:22 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Cc: Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <ZPe4aqbEuQ7xxJnj@casper.infradead.org>
References: <ZO9NK0FchtYjOuIH@infradead.org>
 <ZPe0bSW10Gj7rvAW@dread.disaster.area>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZPe0bSW10Gj7rvAW@dread.disaster.area>

On Wed, Sep 06, 2023 at 09:06:21AM +1000, Dave Chinner wrote:
> > Part 2: unmaintained file systems
> > 
> > A lot of our file system drivers are either de facto or formally
> > unmaintained.  If we want to move the kernel forward by finishing
> > API transitions (new mount API, buffer_head removal for the I/O path,
> > ->writepage removal, etc) these file systems need to change as well
> > and need some kind of testing.  The easiest way forward would be
> > to remove everything that is not fully maintained, but that would
> > remove a lot of useful features.
> 
> Linus has explicitly NACKed that approach.
> 
> https://lore.kernel.org/linux-fsdevel/CAHk-=wg7DSNsHY6tWc=WLeqDBYtXges_12fFk1c+-No+fZ0xYQ@mail.gmail.com/
> 
> Which is a problem, because historically we've taken code into
> the kernel without requiring a maintainer, or the people who
> maintained the code have moved on, yet we don't have a policy for
> removing code that is slowly bit-rotting to uselessness.
> 
> > E.g. the hfsplus driver is unmaintained despite collecting odd fixes.
> > It collects odd fixes because it is really useful for interoperating
> > with MacOS and it would be a pity to remove it.  At the same time
> > it is impossible to test changes to hfsplus sanely as there is no
> > mkfs.hfsplus or fsck.hfsplus available for Linux.  We used to have
> > one that was ported from the open source Darwin code drops, and
> > I managed to get xfstests to run on hfsplus with them, but this
> > old version doesn't compile on any modern Linux distribution and
> > new versions of the code aren't trivially portable to Linux.
> > 
> > Do we have volunteers with old enough distros that we can list as
> > testers for this code?  Do we have any other way to proceed?
> >
> > If we don't, are we just going to untested API changes to these
> > code bases, or keep the old APIs around forever?
> 
> We do slowly remove device drivers and platforms as the hardware,
> developers and users disappear. We do also just change driver APIs
> in device drivers for hardware that no-one is actually able to test.
> The assumption is that if it gets broken during API changes,
> someone who needs it to work will fix it and send patches.
> 
> That seems to be the historical model for removing unused/obsolete
> code from the kernel, so why should we treat unmaintained/obsolete
> filesystems any differently?  i.e. Just change the API, mark it
> CONFIG_BROKEN until someone comes along and starts fixing it...

Umm.  If I change ->write_begin and ->write_end to take a folio,
convert only the filesystems I can test via Luis' kdevops and mark the
rest as CONFIG_BROKEN, I can guarantee you that Linus will reject that
pull request.

I really feel we're between a rock and a hard place with our unmaintained
filesystems.  They have users who care passionately, but not the ability
to maintain them.

