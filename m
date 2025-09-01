Return-Path: <ksummit+bounces-2264-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEFAB3F14D
	for <lists@lfdr.de>; Tue,  2 Sep 2025 01:15:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08CFB3AD6BD
	for <lists@lfdr.de>; Mon,  1 Sep 2025 23:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FFA121CC59;
	Mon,  1 Sep 2025 23:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CDeCqr5y"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E260F32F771;
	Mon,  1 Sep 2025 23:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756768533; cv=none; b=rjce0WG8Su2Nt0wwPb3GTTai5WDRWzcvj9ODGdk9FS8QtEMzRY5gk4mIIZ6X4Zj8qf8uvbezHjyj+Qj6Gkdqvzpcj0/XlYnpdSJq7PHcO7HKPRzqFFs2k/UAKu6AKpCb5V/aWDnWJIkjJ8KUFch4vEAeEKUr7MSVBczuW59TUeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756768533; c=relaxed/simple;
	bh=yFtEXxOQv5rGqb52kSJRa6mF60J+7Y4g4e8x11IGDHc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I/rxntYcMkJCEAd5j2WvXhAKh4x/SLyfQoHLQ/maxPyG0XzbcXd3hjhSHJAUp3/jbCgB+fvk2pPrqSwppXckA4hB53OHMZXcnIVvKS1Gi+3vcasLQURSZ3F4gRYmc0saf2hzX730Ng5s5sd7fc19lWXHkUcyppWIUUzH8ZdnjfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CDeCqr5y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6A6BC4CEF0;
	Mon,  1 Sep 2025 23:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756768532;
	bh=yFtEXxOQv5rGqb52kSJRa6mF60J+7Y4g4e8x11IGDHc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CDeCqr5yzX47NPcKaucpm04/YayfBHDmCQQWPJH27v0vAmtMgX7iJ7z/9UNW8tb3f
	 MEBqfyrHdktC8MD4kViaIby/kwbuAWN9hdAkAnT6LLU6zkek73s3G6pgKWgEojoZ/b
	 wvsBinK69+Z64sphBPsvD/RuhJKFArEfN2HNC3MOWcpHHhsJkkPw6QiSeeHv9hvqia
	 rS2JODMmx1SQ+x8/IdjF0dtImC64b7DqxYA6D6fsBZlVUyCKBqq15Zz3Gp4YS483mn
	 OulYTLQEs6iN04cpNHrFod9A8f9uMPLBzxtiwQIMNzbd9Tdr+PU4tCQGJj9+OEbVP8
	 LcDUq6XTXKAcw==
Date: Tue, 2 Sep 2025 01:15:27 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Mark Brown <broonie@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Jani Nikula <jani.nikula@intel.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Vegard Nossum
 <vegard.nossum@oracle.com>, ksummit@lists.linux.dev, Linux Documentation
 <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Akira Yokosawa <akiyks@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Matthew Wilcox <willy@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future
 directions
Message-ID: <20250902011527.09568528@foz.lan>
In-Reply-To: <87plcax83e.fsf@trenco.lwn.net>
References: <87plcndkzs.fsf@trenco.lwn.net>
	<20250828230104.GB26612@pendragon.ideasonboard.com>
	<87wm6l0w2y.fsf@trenco.lwn.net>
	<930d1b37-a588-43db-9867-4e1a58072601@oracle.com>
	<20250830222351.GA1705@pendragon.ideasonboard.com>
	<87h5xo1k6y.fsf@trenco.lwn.net>
	<20250831160339.2c45506c@foz.lan>
	<b452388b7796bba710790ceb5759b75ec6e57f23@intel.com>
	<b41031ca-b4a4-450d-a833-5affefe958b2@infradead.org>
	<2f927f53-9af5-4e0c-be8f-f7bdf90e23ff@sirena.org.uk>
	<20250901204635.51b81ffd@foz.lan>
	<87plcax83e.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 01 Sep 2025 13:53:41 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > It should be noticed that kernel-doc doesn't run in parallel. Python
> > still suffers for a global big lock (called GIL). My attempts to run in
> > parallel actually made kernel-doc slower, but this is changing: the
> > next Python version is planning to get rid of GIL. So, maybe within
> > a year we can re-add the patches to run it in parallel.  
> 
> I certainly wouldn't want to discourage work in this area, but I do
> wonder if it would be worth the trouble; kernel-doc is nowhere near
> being the bottleneck in this whole process. 

I know kernel-doc is not a bottleneck. When I wrote it, I wrote to
run in parallel. The original patches supported even both 
multiprocess and multithread, and had command line parameters to
adjust, but I got disappointed with results, so I dropped it.
Re-adding shoudn't be hard, as I tried to ensure that this would
work since the beginning.

This is, btw, one of the main reasons why I created a separate
class to handle files and used an interactor for file names: the
entire parser logic is confined to one instance per file and
multiple instances can run in parallel. This way concurrent.futures
can distribute files to different processes and threads.

> Now, if you could
> multi-thread the Sphinx HTML builder...

Agreed. I suspect that, if Sphinx can run without GIL, in the future,
we'll have huge performance gains, specially on machines with multiple
CPU cores.

Thanks,
Mauro

