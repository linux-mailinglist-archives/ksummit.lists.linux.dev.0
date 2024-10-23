Return-Path: <ksummit+bounces-1634-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC7C9AD683
	for <lists@lfdr.de>; Wed, 23 Oct 2024 23:20:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AE531C21349
	for <lists@lfdr.de>; Wed, 23 Oct 2024 21:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC8151FBC80;
	Wed, 23 Oct 2024 21:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="OAduKOaI"
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986221FAC2C
	for <ksummit@lists.linux.dev>; Wed, 23 Oct 2024 21:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729718432; cv=none; b=hyy7Uczy3+hNa7aiE0MJEqGO2LmdSK0AXD5RvcQ1EtquraieuEHS2YN4A+B6cHh0oeYoqcq36bMcSDRzIY18Yly2jFtUSmnTZgQ8VZeHdubyi3NLLF1LGcDLWtEG7pJ92fr0vakEvU8G2F6ZZde41qYF7ke57+KWFGB4s9lS9A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729718432; c=relaxed/simple;
	bh=kfFlDE9MPz/0fdClr77dueFnalGhupl4YUXcN2ULA8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R10uH1MAy8tBCjjUXwRwSZRvU/X+58849YYOE6dt9pHzjH88dxaSuQqnd1LBOMbPhFfmjXAByhY0HN9dah6G7ofdTtOEkC+MJHlu+/AuiXW/l8ZwamyR08VWiIKOTkyxU5ic5P/OfxNh+GKmPr9DFboSfjtGtayPB2ucYB2DfS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=OAduKOaI; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from cwcc.thunk.org (pool-173-48-115-113.bstnma.fios.verizon.net [173.48.115.113])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 49NLKD5u028264
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 17:20:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1729718416; bh=xjdsf4snNaltetIhylAgjdsDDEq2yp2mcjN9RQCGVZk=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=OAduKOaI5BzawxUbSLvtaNPKiPu/qiM57S8h+a44fV/6oIqIg/WbRZ/5tLKH3o9Lm
	 pT0v0RDfXwQsB0I80PpI9XZGkxl0/Xrh8eyG/TslE/fX7ILjGzqdlrEQNHT+4uH61I
	 +L2WcdLcYoSZk7hOpweABbaRYLZI0rv8BkEcqrRM2kuyfKCvea/iQkcWsjbWotuVYp
	 C8JJWkd5jiJI3lAtpUzLnLHznMTnKE7O5jWpJQBVW/SalgrPmN2TPCpUe10N9Hlp9b
	 4pktLp4OyBG9fT0a7oiauOILSfS6zn1TWXHaVnhheu7wxzbkOnwIyPrZJYys8BPpxn
	 4kcVN16k0/aew==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 6EF6B15C0329; Wed, 23 Oct 2024 17:20:13 -0400 (EDT)
Date: Wed, 23 Oct 2024 17:20:13 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: paulmck@kernel.org, Christoph Hellwig <hch@infradead.org>,
        Sasha Levin <sashal@kernel.org>, Kees Cook <kees@kernel.org>,
        ksummit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: linus-next: improving functional testing for to-be-merged pull
 requests
Message-ID: <20241023212013.GI3204734@mit.edu>
References: <ZxZ8MStt4e8JXeJb@sashalap>
 <792F4759-EA33-48B8-9AD0-FA14FA69E86E@kernel.org>
 <ZxdKwtTd7LvpieLK@infradead.org>
 <ZxdyYjzxSktk34Zz@sashalap>
 <ZxiOjBRdO6EMAY4H@infradead.org>
 <10b0cb74-2068-4819-ac91-fcf98ca8d96c@paulmck-laptop>
 <CAHk-=wj4aSJsVA6weV7u9KD1yA74JZq3dYZKbUtxp=3o_esnVA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wj4aSJsVA6weV7u9KD1yA74JZq3dYZKbUtxp=3o_esnVA@mail.gmail.com>

On Wed, Oct 23, 2024 at 11:06:59AM -0700, Linus Torvalds wrote:
> 
> So automation that says "this tree does not actually work" would very
> much be appreciated. I'd prefer them to be the same kind of "before
> the pull request has even been sent" situation, of course, but if
> problems _remain_ in linux-next, and pr-bot sees the pull request, I'd
> actually like automation that says "Oh, this tree has these issues:
> ..."

As I think I mentioned at the Maintainer's Summit, for the past 2 or 3
months, I've been running xfstests autmation for ext4, xfs, f2fs, and
btrfs on the fs-next branch of the linux-next tree, and it's actually
been quite stable.  That's because most of the fs developers are
pretty careful about running tests *before* publishing their branches
to linux-next, so it hasn't had the boot failures whichhas caused fs
testing on the full linux-next branch to be more painful.  Yes, I know
that solution doesn't scale but it works for us.  :-)

An example of how this has worked out is a regression which popped up
a few days ago, causing generic/564 to fail for ext4, xfs, f2fs, and
btrfs, and which was fixed by reverting "vfs: Fix implicit conversion
problem when testing overflow case".  I expect Christian will be
dropping that commit (or replacing it with a fixed patch) from the vfs
tree long before he sends a pull request to you.

       	    	    	      	     	- Ted

