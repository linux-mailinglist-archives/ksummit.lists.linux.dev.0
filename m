Return-Path: <ksummit+bounces-2275-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67207B40888
	for <lists@lfdr.de>; Tue,  2 Sep 2025 17:07:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 077831B26112
	for <lists@lfdr.de>; Tue,  2 Sep 2025 15:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 478B3312821;
	Tue,  2 Sep 2025 15:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kwYw0IuC"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAA52DF15B;
	Tue,  2 Sep 2025 15:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756825656; cv=none; b=ElOYivNbWQOP19bDS9hFoHn+8qa3lZTdbBa7Mup9HWLiVRck9nt0U3O8gdcQMXl2oUDP/oB3jMSTi/b8Kzo7nunSXH22lE+BdjBMb5mEA+Lf+Sg9nQ8T3wAavDWuvDtcdi0a9eBn1eAmq4R1/NKx85tEaMMkdgMb4j7nJ/3wJWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756825656; c=relaxed/simple;
	bh=VVXx8+WgldiOQbHxpm/JG+dX7BU8tajscSPkE2wACgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A4RA9tdqq6eajh/yr1bZf9JF5AuDnaeSvhbqfSHWiMLiaFAKeHhP3R3YRIe4nwP5pjDeKshh0cCyPU0AcyAfrJZ+3osnx2D463jw1B++fxto0x88pkdHR7yKRlY38jREilkx3X1LuuJIsaPoHNJ+nh6BJcddQ/DFcAX2SCTkBk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kwYw0IuC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36DE4C4CEED;
	Tue,  2 Sep 2025 15:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756825656;
	bh=VVXx8+WgldiOQbHxpm/JG+dX7BU8tajscSPkE2wACgg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kwYw0IuCK7sFYLhL/dVkOZAtlRXgc2uLb8p81zSEqok6N/psKsqqMGCe5vjGQiAh0
	 9xsXW1fxUVfzsM0AyT4uWAnWlD4VE4/x7VK5rfHLx0bB5ksKHCuXutkA1YSomWiWfX
	 c9Np9KP0l9D0zoMaQHr9Z8n5GiOdj+zJHU4NUwlWrbGSyXjwu/DrGopa2BCqSaw7fl
	 GZJeG4GBhLKN4Q4/zHbQjbiCgF9lqJBAy+DfSUZLV9IzNIDYCFxRUUZRflU0oclkQf
	 mxbz3Fh1bAVugx43+ASM9XvUXaCyhsxuzW5EuatEKnQgDXaiMzaGRgHSp4OtHez4ms
	 SFvQ8P7znE8bQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1utSbe-00000003gOA-0KcG;
	Tue, 02 Sep 2025 17:07:34 +0200
Date: Tue, 2 Sep 2025 17:07:34 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jonathan Corbet <corbet@lwn.net>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Vegard Nossum <vegard.nossum@oracle.com>, 
	ksummit@lists.linux.dev, Linux Documentation <linux-doc@vger.kernel.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Akira Yokosawa <akiyks@gmail.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Matthew Wilcox <willy@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
Message-ID: <n4qixsp23dccgz6mtrmd2xumcngtphkbywjnxkrqpnuf2dbu2p@2sj44sbyga4j>
References: <87wm6l0w2y.fsf@trenco.lwn.net>
 <930d1b37-a588-43db-9867-4e1a58072601@oracle.com>
 <20250830222351.GA1705@pendragon.ideasonboard.com>
 <87h5xo1k6y.fsf@trenco.lwn.net>
 <20250831160339.2c45506c@foz.lan>
 <b452388b7796bba710790ceb5759b75ec6e57f23@intel.com>
 <b41031ca-b4a4-450d-a833-5affefe958b2@infradead.org>
 <bff2c47623a632609d07f8f2d237d0b40722c2c1@intel.com>
 <20250902135521.51482530@foz.lan>
 <d9e917d57be113a3de06dfb099c55bf428be6e33@intel.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9e917d57be113a3de06dfb099c55bf428be6e33@intel.com>
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

On Tue, Sep 02, 2025 at 03:07:53PM +0300, Jani Nikula wrote:
> On Tue, 02 Sep 2025, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > Em Tue, 02 Sep 2025 13:42:45 +0300
> > Jani Nikula <jani.nikula@intel.com> escreveu:
> >
> >> On Mon, 01 Sep 2025, Randy Dunlap <rdunlap@infradead.org> wrote:
> >> > ISTM that there are lots of non-docs developers who either just don't care
> >> > about that or never run 'make W=1 htmldocs' to see the problems in their
> >> > drivers or subsystems. OK, maybe it's just a very low priority for them.
> >> >
> >> > Willy had a suggestion that we just make checking kernel-doc during
> >> > all .c builds a permanent feature instead of a W=1 option.
> >> > This helps, but still doesn't force 'make htmldocs' to be run.
> >> >
> >> > And it causes around 450 build warnings in my testing of an x86_64 allmodconfig
> >> > build.  
> >> 
> >> I think in general the build system lacks proper support for subsystems
> >> or drivers being ahead of the curve in keeping them W=1 or kernel-doc
> >> -Wall clean.
> >
> > It is trivial to add a spinx/kerneldoc parameter to allow setting
> > -Wall per each .. kernel-doc markup. Yet, one would need to add it
> > for every markup within the subsystem.
> 
> I'm not sure how that is relevant to what I'm saying.

You said that the building system lacks support of W=1/-Wall per
subsystem. What I said is that, provided that we add a:

	.. kernel-doc:: drivers/drm/...
	:wall: 

you can set it per file inside a subsystem. Granted: this is doesn't
cover the entire subsystem.

Heh, there is another option. For instance lets assume you want
-Wall for drm subsystem. you could have this on your CI:

	$ ./scripts/kernel-doc -Wall --none drivers/gpu/

On a similar way, the build system can also W=1 inside a subsystem:

	$ make W=1 drivers/gpu/

(This is what we do on media)

In the specific case of the drm subsystem, you could try to modify
dim to run both as a condition to accept a git push - or modify
CI to only actually do the merge after passing both.

-- 
Thanks,
Mauro


