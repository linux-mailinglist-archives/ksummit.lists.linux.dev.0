Return-Path: <ksummit+bounces-1111-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCD4799BF7
	for <lists@lfdr.de>; Sun, 10 Sep 2023 00:42:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 833FD281819
	for <lists@lfdr.de>; Sat,  9 Sep 2023 22:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A8B079F5;
	Sat,  9 Sep 2023 22:42:42 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from out-223.mta0.migadu.com (out-223.mta0.migadu.com [91.218.175.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC5217EE
	for <ksummit@lists.linux.dev>; Sat,  9 Sep 2023 22:42:39 +0000 (UTC)
Date: Sat, 9 Sep 2023 18:42:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1694299357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8VhvXg/SuVpK79L/k0XNUnHSaeyg+0ZPf36boqf4A44=;
	b=a1kYkOzvInHlFdiyr07UF8WyMvPe6Ovku+jR/TY0QMQq4+t2GQ2YPs81sp+OVg1NAu4fe1
	WKu3WoT0qbIRRnvYNu+xr7yzcSPBamHOJ4FhcaEd54MxmtSObyVS156NAv+4qBBUpJ5OdB
	61eFHTd9nkjd8veVlzeVbNsBspsuSkc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Matthew Wilcox <willy@infradead.org>,
	Dave Chinner <david@fromorbit.com>,
	Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <20230909224230.3hm4rqln33qspmma@moria.home.lan>
References: <ZO9NK0FchtYjOuIH@infradead.org>
 <ZPe0bSW10Gj7rvAW@dread.disaster.area>
 <ZPe4aqbEuQ7xxJnj@casper.infradead.org>
 <8dd2f626f16b0fc863d6a71561196950da7e893f.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8dd2f626f16b0fc863d6a71561196950da7e893f.camel@HansenPartnership.com>
X-Migadu-Flow: FLOW_OUT

On Sat, Sep 09, 2023 at 08:50:39AM -0400, James Bottomley wrote:
> So why can't we figure out that easier way? What's wrong with trying to
> figure out if we can do some sort of helper or library set that assists
> supporting and porting older filesystems. If we can do that it will not
> only make the job of an old fs maintainer a lot easier, but it might
> just provide the stepping stones we need to encourage more people climb
> up into the modern VFS world.

What if we could run our existing filesystem code in userspace?

bcachefs has a shim layer (like xfs, but more extensive) to run nearly
the entire filesystem - about 90% by loc - in userspace.

Right now this is used for e.g. userspace fsck, but one of my goals is
to have the entire filesystem available as a FUSE filesystem. I'd been
planning on doing the fuse port as a straight fuse implementation, but
OTOH if we attempted a sh vfs iops/aops/etc. -> fuse shim, then we would
have pretty much everything we need to run any existing fs (e.g.
reiserfs) as a fuse filesystem.

It'd be a nontrivial project with some open questions (e.g. do we have
to lift all of bufferheads to userspace?) but it seems worth
investigating.

