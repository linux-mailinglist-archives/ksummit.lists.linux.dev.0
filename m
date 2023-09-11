Return-Path: <ksummit+bounces-1124-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D48079A84F
	for <lists@lfdr.de>; Mon, 11 Sep 2023 15:35:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42D1E1C208C1
	for <lists@lfdr.de>; Mon, 11 Sep 2023 13:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6584A11706;
	Mon, 11 Sep 2023 13:35:26 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5ECF9F4
	for <ksummit@lists.linux.dev>; Mon, 11 Sep 2023 13:35:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8C06521846;
	Mon, 11 Sep 2023 13:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1694439317; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2y+hyYEH//8rRki7GZja5XdADYE6IfWjNw6k7r7UcwY=;
	b=kb1i8lEoj/nI+2c9PIs9HQqWhRUI59dvUe047Eey+EdNhIYCCZEDRy3R9KSX4l+MVrpa+M
	cxd7uv+v+ERNnQ8TFd5NlTMIabuP5Sybbun3woh3V3lfWxtW/zsE53ErZWTGTuqGoxWMb7
	FjxW9nAhNfXNVCqzTUL+HL4DVbWbOq8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694439317;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2y+hyYEH//8rRki7GZja5XdADYE6IfWjNw6k7r7UcwY=;
	b=iVZPYNlD6tZNIHdj5xnnsd+uqD6tlVmxp2OMGvu8jotE+9wSXz0j8UlyNiY/cuv21zKHiU
	TmYSM4MkIK1maBAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 386C313780;
	Mon, 11 Sep 2023 13:35:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 9GtUDJUX/2Q+MAAAMHmgww
	(envelope-from <ddiss@suse.de>); Mon, 11 Sep 2023 13:35:17 +0000
Date: Mon, 11 Sep 2023 15:35:15 +0200
From: David Disseldorp <ddiss@suse.de>
To: Dave Chinner <david@fromorbit.com>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, Matthew Wilcox
 <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 ksummit@lists.linux.dev, linux-fsdevel@vger.kernel.org, Hajime Tazaki
 <thehajime@gmail.com>, Octavian Purdila <tavi.purdila@gmail.com>
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file
 systems
Message-ID: <20230911153515.2a256856@echidna.fritz.box>
In-Reply-To: <ZP52S8jPsNt0IvQE@dread.disaster.area>
References: <ZO9NK0FchtYjOuIH@infradead.org>
	<ZPe0bSW10Gj7rvAW@dread.disaster.area>
	<ZPe4aqbEuQ7xxJnj@casper.infradead.org>
	<8dd2f626f16b0fc863d6a71561196950da7e893f.camel@HansenPartnership.com>
	<20230909224230.3hm4rqln33qspmma@moria.home.lan>
	<ZP5nxdbazqirMKAA@dread.disaster.area>
	<20230911012914.xoeowcbruxxonw7u@moria.home.lan>
	<ZP52S8jPsNt0IvQE@dread.disaster.area>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Dave,

On Mon, 11 Sep 2023 12:07:07 +1000, Dave Chinner wrote:

> On Sun, Sep 10, 2023 at 09:29:14PM -0400, Kent Overstreet wrote:
> > On Mon, Sep 11, 2023 at 11:05:09AM +1000, Dave Chinner wrote:  
> > > On Sat, Sep 09, 2023 at 06:42:30PM -0400, Kent Overstreet wrote:  
> > > > On Sat, Sep 09, 2023 at 08:50:39AM -0400, James Bottomley wrote:  
> > > > > So why can't we figure out that easier way? What's wrong with trying to
> > > > > figure out if we can do some sort of helper or library set that assists
> > > > > supporting and porting older filesystems. If we can do that it will not
> > > > > only make the job of an old fs maintainer a lot easier, but it might
> > > > > just provide the stepping stones we need to encourage more people climb
> > > > > up into the modern VFS world.  
> > > > 
> > > > What if we could run our existing filesystem code in userspace?  
> > > 
> > > You mean like lklfuse already enables?  
> > 
> > I'm not seeing that it does?
> > 
> > I just had a look at the code, and I don't see anything there related to
> > the VFS - AFAIK, a VFS -> fuse layer doesn't exist yet.  
> 
> Just to repeat what I said on #xfs here...
> 
> It doesn't try to cut in half way through the VFS -> filesystem
> path. It just redirects the fuse operations to "lkl syscalls" and so
> runs the entire kernel VFS->filesystem path.
> 
> https://github.com/lkl/linux/blob/master/tools/lkl/lklfuse.c
> 
> > And that looks a lot heavier than what we'd ideally want, i.e. a _lot_
> > more kernel code would be getting pulled in. The entire block layer,
> > probably the scheduler as well.  

The LKL block layer may also become useful for legacy storage support in
future, e.g. SCSI protocol obsolescence.

> Yes, but arguing that "performance sucks" misses the entire point of
> this discussion: that for the untrusted user mounts of untrusted
> filesystem images we already have a viable method for moving the
> dangerous processing out into userspace that requires almost *zero
> additional work* from anyone.

Indeed. Hajime and Octavian (cc'ed) have also made serious efforts to
get the LKL codebase in shape for mainline:
https://lore.kernel.org/linux-um/cover.1611103406.git.thehajime@gmail.com/

> As long as the performance of the lklfuse implementation doesn't
> totally suck, nobody will really care that much that isn't quite as
> fast as a native implementation. PLuggable drives (e.g. via USB) are
> already going to be much slower than a host installed drive, so I
> don't think performance is even really a consideration for these
> sorts of use cases....
> 
> > What I've got in bcachefs-tools is a much thinner mapping from e.g.
> > kthreads -> pthreads, block layer -> aio, etc.  
> 
> Right, and we've got that in userspace for XFS, too. If we really
> cared that much about XFS-FUSE, I'd be converting userspace to use
> ublk w/ io_uring on top of a port of the kernel XFS buffer cache as
> the basis for a performant fuse implementation. However, there's a
> massive amount of userspace work needed to get a native XFS FUSE
> implementation up and running (even ignoring performance), so it's
> just not a viable short-term - or even medium-term - solution to the
> current problems.
> 
> Indeed, if you do a fuse->fs ops wrapper, I'd argue that lklfuse is
> the place to do it so that there is a single code base that supports
> all kernel filesystems without requiring anyone to support a
> separate userspace code base. Requiring every filesystem to do their
> own FUSE ports and then support them doesn't reduce the overall
> maintenance overhead burden on filesystem developers....

LKL is still implemented as a non-mmu architecture. The only fs specific
downstream change that lklfuse depends on is non-mmu xfs_buf support:
https://lore.kernel.org/linux-xfs/1447800381-20167-1-git-send-email-octavian.purdila@intel.com/

Does your lklfuse enthusiasm here imply that you'd be willing to
reconsider Octavian's earlier proposal for XFS non-mmu support?

Cheers, David

