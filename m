Return-Path: <ksummit+bounces-1103-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F79798437
	for <lists@lfdr.de>; Fri,  8 Sep 2023 10:38:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28FC61C20BE4
	for <lists@lfdr.de>; Fri,  8 Sep 2023 08:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8508E1FC4;
	Fri,  8 Sep 2023 08:38:35 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2117F7E9
	for <ksummit@lists.linux.dev>; Fri,  8 Sep 2023 08:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ChinuZ0D/WRUzckoC+wb/zuH1mlau7kk6bL8hmrk9RI=; b=PzCN/bxxEMaG4YwIV3uTT57tmZ
	Q/P30D1sec0V1BnS4/5W2ZAabJvKajpABYeGcJygd407ba/NQFJMYs/A28MB4s0sSy5zCmkiuCzMm
	tQC3Dg/AhVBzJXiJqtUWHkjST3wvE2iIQeZXNIHIPzyV5QF7WKm0VlQikLs/fvodH8iV2/GDOUa7m
	EUVqWucZ9TctvcP1QmNpa+jRr1uyNbccZp2n1b1TCfQQXi8i2Kci504OcB99sz8paVRVmBp0y/aIU
	sNUcjn9u1xSNDarsi8VF+kFHceTfoDjo61XZaYrW8F31fjiPcpk6BK1DdaVBs5YZvFHCsHJ+dnNQd
	UXW3NbNw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qeX0V-00DKbA-2z;
	Fri, 08 Sep 2023 08:38:27 +0000
Date: Fri, 8 Sep 2023 01:38:27 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <ZPrdgyy9gam+DdEr@infradead.org>
References: <ZO9NK0FchtYjOuIH@infradead.org>
 <8718a8a3-1e62-0e2b-09d0-7bce3155b045@roeck-us.net>
 <ZPkDLp0jyteubQhh@dread.disaster.area>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZPkDLp0jyteubQhh@dread.disaster.area>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Thu, Sep 07, 2023 at 08:54:38AM +1000, Dave Chinner wrote:
> There's a bigger policy question around that.
> 
> I think that if we are going to have filesystems be "community
> maintained" because they have no explicit maintainer, we need some
> kind of standard policy to be applied.
> 
> I'd argue that the filesystem needs, at minimum, a working mkfs and
> fsck implementation, and that it is supported by fstests so anyone
> changing core infrastructure can simply run fstests against the
> filesystem to smoke test the infrastructure changes they are making.

Yes, that's what I tried to imply above.  We could relax fsck a bit
(even if that is playing fast and lose), but without mkfs there is
no way anyone can verify anything

> 
> I'd suggest that syzbot coverage of such filesystems is not desired,
> because nobody is going to be fixing problems related to on-disk
> format verification. All we really care about is that a user can
> read and write to the filesystem without trashing anything.

Agreed.

> I'd also suggest that we mark filesystem support state via fstype
> flags rather than config options. That way we aren't reliant on
> distros setting config options correctly to include/indicate the
> state of the filesystem implementation. We could also use similar
> flags for indicating deprecation and obsolete state (i.e. pending
> removal) and have code in the high level mount path issue the
> relevant warnings.

Agreed.

> This method of marking would also allow us to document and implement
> a formal policy for removal of unmaintained and/or obsolete
> filesystems without having to be dependent on distros juggling
> config variables to allow users to continue using deprecated, broken
> and/or obsolete filesystem implementations right up to the point
> where they are removed from the kernel.

I'd love to get there, but that might be a harder sell.

