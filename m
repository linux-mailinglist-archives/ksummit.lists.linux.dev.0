Return-Path: <ksummit+bounces-764-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA76D58F942
	for <lists@lfdr.de>; Thu, 11 Aug 2022 10:42:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12997280C5A
	for <lists@lfdr.de>; Thu, 11 Aug 2022 08:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 447352F3F;
	Thu, 11 Aug 2022 08:42:31 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD6028FA
	for <ksummit@lists.linux.dev>; Thu, 11 Aug 2022 08:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6+istbHbvqBCpxTad4FTMUJ0YsJNgVa0m05TfGI1Ayw=; b=UmCoT81uAYmeG9PqgdItxeEsv9
	18z7f+G97CIgJJBgfZMiWiGUkwGXIYnEC23fjKgk+5RvqEB6ifn2uvdy3S+FW0SmFPW9d1rbGSPMJ
	Fy61nD9vjH1qGAGYymx3PgnqzAyTeQMRTIw7+2BJOp2WupIM3Dh9AIVteIObPY+3WGSknA30Zra9a
	xK0pHitu6QRYju0+e7mRMkV7J17p6dMtW96OBOkFZnzx1xiPyk9KKFC4uqtS0CLRSnzn+60vhUMhW
	khGDq80RwoINjF7YJVWG3q54WFcnRLs4ERKEaJUuZDBNUkRztkJXivPvNYNvUuAIXUeI+2jAK90Fs
	sBHEJ6oQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM3ll-00APFH-AB; Thu, 11 Aug 2022 08:42:21 +0000
Date: Thu, 11 Aug 2022 01:42:21 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mark Brown <broonie@kernel.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Lee Jones <lee.jones@linaro.org>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Greg KH <greg@kroah.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	ksummit@lists.linux.dev, Lee Jones <lee@kernel.org>
Subject: Re: Validating MAINTAINERS entries?
Message-ID: <YvTA7RiAx77zTnYc@infradead.org>
References: <20220809171316.1d6ce319@hermes.local>
 <20220810082640.GK3438@kadam>
 <YvNuHXePj53gJPKX@kroah.com>
 <CAKXUXMwOAuqD=o1ryZP4oq2dLvTi+7iwQc6gfBF2DiU+_7NH9A@mail.gmail.com>
 <YvObmmmLiX6z8eA3@google.com>
 <20220810120450.GT3460@kadam>
 <YvOpfQAUFqjeMGWH@sirena.org.uk>
 <CAMuHMdV2Ktw5h3Bvsc6iCq8mxLG+yf5BVXLvJts1MboD=eHgaQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdV2Ktw5h3Bvsc6iCq8mxLG+yf5BVXLvJts1MboD=eHgaQ@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Thu, Aug 11, 2022 at 10:35:52AM +0200, Geert Uytterhoeven wrote:
> Perhaps scripts/get_maintainer.pl can be taught to only consider the
> subsystem maintainer, and ignore git history, for changes to Makefiles
> and Kconfig files?

In general looking at git history is pretty much always the wrong thing,
except maybe for the initial commit.

> Or move the Kconfig/Makefile bits into the driver sources, next to
> the MODULE_*() bits, which I believe was part of Roman Zippel's big
> plan when he wrote the new Kconfig system...

I don't think having Kconfig in source files is a good thing.  Being
able to integrate the Makefile into Kconfig OTOH would be really nice..

config FOOBAR
	tristate 'Foo driver'
	depends on PCI
	help
	   This is the driver for the foo hardware.
	module foo
	sources foo_core.c foo_sysfs.c foo_debugfs.c


