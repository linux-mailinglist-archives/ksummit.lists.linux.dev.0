Return-Path: <ksummit+bounces-2274-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD41B40747
	for <lists@lfdr.de>; Tue,  2 Sep 2025 16:44:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6026A1B65E63
	for <lists@lfdr.de>; Tue,  2 Sep 2025 14:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDA56313553;
	Tue,  2 Sep 2025 14:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EHuBeVU8"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33810286409;
	Tue,  2 Sep 2025 14:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756824125; cv=none; b=WLvfIx2EyR2lKmTh+TUQkZGIPCqqCXAIlXwuzzGGu+BW7W624+JR/ILjeN+vMu4n0VMFNJdaMbOHPqbsXZgLZr1HdEubsU1vJ5qWrizeZDPknj2ktHwF77jtaz293OZWVvRim7GzcmJEEkrTUoKwsRYSPh5rFN4dIgPGe3n7eBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756824125; c=relaxed/simple;
	bh=mOeqG1YaCtcd7kdk9yqX9Q9052dCGn+pbbANVALzqN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XYQVycUZD1tSXIixIGro9Uj9i5QQ3DKDtwf0+Bxlcy/5Pjo8BorOyJrFt6/05+bvSXlvqGkHPvbnA+Kmpa7yzY2cRL7bwypOD9NTSENGxeFAuTYJLqGW4JoRBchCvh0HJmh3tpN/kDT9UlRFPWPI7XTV0r29Um0+pZaxIveZ8Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EHuBeVU8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03F0DC4CEF7;
	Tue,  2 Sep 2025 14:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756824125;
	bh=mOeqG1YaCtcd7kdk9yqX9Q9052dCGn+pbbANVALzqN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EHuBeVU8dWqhLGlqkgCmMDOaWkI+rMLSVOMkTb/nhIEJvphbIOJzT/bTJMB0MPeM0
	 BDzoeAMYpUqEZ/Vp2o97ikaqOiKM4F+LMQ4PLsAma/4kxIPeo+QMsoPo5AXj0OUZlE
	 o691kIDYsLIN/1FXKATSxZqlROLpnaqnFGSufMQBwoSrMR8/iO+T0WviMlKcnjzq6+
	 2/YDkme0PMr4Wfp2k9iXxaKvzmnASMRd43rLxhKzKADfaxNMBAPNwInbx9t7u78bO6
	 4iGEYZddyeBkIcC5x6021mV2ryi2XaadCikyyVQSMCl97DX9/yu8B3wldnoFBMM8rm
	 IGeR6zkBBsB4A==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1utSCv-00000003dK0-4A9Z;
	Tue, 02 Sep 2025 16:42:01 +0200
Date: Tue, 2 Sep 2025 16:42:01 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Mark Brown <mchehab+huawei@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jani Nikula <jani.nikula@intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Vegard Nossum <vegard.nossum@oracle.com>, ksummit@lists.linux.dev, 
	Linux Documentation <linux-doc@vger.kernel.org>, Akira Yokosawa <akiyks@gmail.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Matthew Wilcox <willy@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
Message-ID: <xni5csulan6a3kngfw66okhrea2v2u4cwvfkk5vqy5p4xonowf@ajubzphgygit>
References: <b452388b7796bba710790ceb5759b75ec6e57f23@intel.com>
 <b41031ca-b4a4-450d-a833-5affefe958b2@infradead.org>
 <2f927f53-9af5-4e0c-be8f-f7bdf90e23ff@sirena.org.uk>
 <20250901204635.51b81ffd@foz.lan>
 <1bf8a898-e697-46e2-86b1-4158b021d652@sirena.org.uk>
 <j3iblg4xx4nu64dgaxhl62mtherszeh3jyrskkf7l2jigld7wf@lr7mtq33gbi7>
 <865e583b-4c97-4db1-963c-ed8539fa56dc@sirena.org.uk>
 <20250902135938.35048fbc@foz.lan>
 <20250902141434.3e5b14e4@foz.lan>
 <8339a5dd-446d-4717-9d68-983f5e2354b3@sirena.org.uk>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8339a5dd-446d-4717-9d68-983f5e2354b3@sirena.org.uk>
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

On Tue, Sep 02, 2025 at 02:00:43PM +0100, Mark Brown wrote:
> On Tue, Sep 02, 2025 at 02:14:34PM +0200, Mauro Carvalho Chehab wrote:
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:
> 
> > > > That takes about 90s for me.  
> 
> > > I wander why here is 3 times faster... disk cache? python version?
> > > faster ssd?
> 
> > > What python version are you using?
> 
> > Heh, after running twice or three times to avoid cache issues, I tested
> > running it on my machine with two different python versions:
> 
> > $ time python3.13 scripts/kernel-doc.py . --none
> 
> > real    0m31,660s
> > user    0m30,911s
> > sys     0m0,588s
> 
> For me it's fairly consistent with python 3.11.2, I get some variation
> depending on what else is going on with the system but nothing hugely
> surprising.  It should mostly be running from cache, the underlying disk
> is a reasonable SSD. 

Yeah, it sounds that the huge performance increment was indeed on 3.11:

$ time python3.6 ./scripts/kernel-doc --none .
real	1m17,854s
user	1m16,651s
sys	0m0,707s

$ time python3.9 ./scripts/kernel-doc --none .
real	1m0,193s
user	0m58,942s
sys	0m0,614s

$ time python3.10 ./scripts/kernel-doc --none .
real	0m55,376s
user	0m54,168s
sys	0m0,636s

$ time python3.11 ./scripts/kernel-doc --none .
real	0m34,878s
user	0m33,665s
sys	0m0,661s

$ time python3.12 ./scripts/kernel-doc --none .
real	0m34,590s
user	0m33,844s
sys	0m0,613s

$ time python3.13 ./scripts/kernel-doc --none .
real	0m31,751s
user	0m30,951s
sys	0m0,640s

==============  =============   =============   ================================
Python Version	Real Time (s)	User Time (s)	Performance Increase (Real Time)
==============  =============   =============   ================================
3.6		77.854 s	76.651 s	(baseline)
3.9		60.193 s	58.942 s	22.7% faster
3.10		55.376 s	54.168 s	28.9% faster
3.11		34.878 s	33.665 s	55.2% faster
3.12		34.590 s	33.844 s	55.6% faster
3.13		31.751 s	30.951 s	59.2% faster
==============  =============   =============   ================================

> The single core performance on this machine isn't
> amazing, it's more getting it's speed from having a bunch of cores.

As kernel-doc is currently single threaded, performance for a single
core is what matters most. I suspect that most of kernel-doc time is
spent handling regular expressions, specially when I/O is fast. 

-

To sum-up those discussions, I can propose a patchset for the next
merge window that would:

1. change kernel-doc exec to re-run using the latest available python
   version if version < 3.11, on a similar same way to what
   scripts-pre-install and scripts-build-wrapper does(*);

2. add a command line parameter for kernel-doc to make it pick only
   files that have a .. kernel-doc markup;

3. add a build logic to run it with make all, perhaps inside a Kconfig
   symbol like "config DOC_WARNINGS", disabled by default, but enabled
   with allyesconfig/allmodconfig.

4. with time, add more validations there, like checking for
   EXPORT_SYMBOL without documentation and other neat features.

This needs to be coordinated with some efforts to cleanup warnings,
to avoid having hundreds of new warnings at build time.

This way, even on LTS, we'll have fast kernel-doc check, and will likely
take lot less than 32 seconds, as it will only validate a small set of
files that are pointed by a kernel-doc markup notation inside
Documentation, specially if Python >= 3.11 is installed.

It should be noticed that can generate out of blue lots of new
warnings that are currently there by currently hidden, specially
if we add "-Wall" to the build target.

Comments?

(*) The logic there checks if python version is below a minimal
    version. If it is, it seeks for python 3.x exec files, picking
    the latest one if found, and re-running it with such version.

-- 
Thanks,
Mauro

