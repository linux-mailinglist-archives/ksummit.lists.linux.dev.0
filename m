Return-Path: <ksummit+bounces-2268-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E13DB3FEEA
	for <lists@lfdr.de>; Tue,  2 Sep 2025 14:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E4F54E1DA1
	for <lists@lfdr.de>; Tue,  2 Sep 2025 11:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 637E8283C97;
	Tue,  2 Sep 2025 11:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ef+7awhL"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D921E5B71;
	Tue,  2 Sep 2025 11:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756814128; cv=none; b=XGR8shYEgD47Lb86L+P4ETmY9ePuMpE7hOycb148kP++2U9Dv2Nys5ng7Qf88wxUffPtc2gFNHvKP6qmRHRloKll0KIbHyBd60b4BwioY261ls3vz5e/5TGJwbnyE1IzD2SVHHMZ9rSp8jDS0Z6N7Xq0Ez7CcS9+L/NHbN7fVPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756814128; c=relaxed/simple;
	bh=gSqWkTJBO56jPr151Fe/ahxA7INrL55vY30gRenSK2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UdCXgtUj1fnMkJ8pBkYinXsmB4qJizU5a+pThxGLmtuz/tk/gpoJCsr6Z4o81MgrZMC/Ec9JBNaFWcxyoTFJnLS9zxjOIbiZiFYUEIuOLDK3vrgv99wJb1iqCF6SIf6VkhIBuWNHDzvov6Ah/VLgc6H5UgYG023nDbJ4/dbjXv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ef+7awhL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03639C4CEF7;
	Tue,  2 Sep 2025 11:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756814127;
	bh=gSqWkTJBO56jPr151Fe/ahxA7INrL55vY30gRenSK2Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ef+7awhLqj0A5ooej8L1IdethLMOVqudtnp9KIEnzf7d9FvZMX2EStM25+ve/jCGO
	 CpRmQ8i+5/2FStJRcLRCPh8XBWd4enaiUNY0XnZVCHb6ml4EDJfB0herX6IssfOTC0
	 KKx6uQ3vF0AoH+K+yw/KfDGcXOoaKWJ4+vlG4SiJR8yoOHDDr8/v2FB95sCvSOQ/Zg
	 87iSv1GOfXvjksz4rrHeOHw7iRMU2rY6doBAhTdAXJ0Nd9Fn4L/thm/JqPiIhe+sGL
	 oIsRt2VnX+P8ziVKALnKcjOaE1qZ3Cm38zBP+/MyWxkfou5QMR6Od27MhFhnKP8Ema
	 8yx0+U5trEiIg==
Date: Tue, 2 Sep 2025 13:55:21 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Vegard Nossum
 <vegard.nossum@oracle.com>, ksummit@lists.linux.dev, Linux Documentation
 <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Akira Yokosawa <akiyks@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Matthew Wilcox <willy@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future
 directions
Message-ID: <20250902135521.51482530@foz.lan>
In-Reply-To: <bff2c47623a632609d07f8f2d237d0b40722c2c1@intel.com>
References: <87plcndkzs.fsf@trenco.lwn.net>
	<20250828230104.GB26612@pendragon.ideasonboard.com>
	<87wm6l0w2y.fsf@trenco.lwn.net>
	<930d1b37-a588-43db-9867-4e1a58072601@oracle.com>
	<20250830222351.GA1705@pendragon.ideasonboard.com>
	<87h5xo1k6y.fsf@trenco.lwn.net>
	<20250831160339.2c45506c@foz.lan>
	<b452388b7796bba710790ceb5759b75ec6e57f23@intel.com>
	<b41031ca-b4a4-450d-a833-5affefe958b2@infradead.org>
	<bff2c47623a632609d07f8f2d237d0b40722c2c1@intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue, 02 Sep 2025 13:42:45 +0300
Jani Nikula <jani.nikula@intel.com> escreveu:

> On Mon, 01 Sep 2025, Randy Dunlap <rdunlap@infradead.org> wrote:
> > ISTM that there are lots of non-docs developers who either just don't care
> > about that or never run 'make W=1 htmldocs' to see the problems in their
> > drivers or subsystems. OK, maybe it's just a very low priority for them.
> >
> > Willy had a suggestion that we just make checking kernel-doc during
> > all .c builds a permanent feature instead of a W=1 option.
> > This helps, but still doesn't force 'make htmldocs' to be run.
> >
> > And it causes around 450 build warnings in my testing of an x86_64 allmodconfig
> > build.  
> 
> I think in general the build system lacks proper support for subsystems
> or drivers being ahead of the curve in keeping them W=1 or kernel-doc
> -Wall clean.

It is trivial to add a spinx/kerneldoc parameter to allow setting
-Wall per each .. kernel-doc markup. Yet, one would need to add it
for every markup within the subsystem.

It is probably easier to do something similar to that via a CI.

> 
> We hack around this in parts of drm Makefiles, and it really has helped
> to keep the kernel-doc and W=1 breakage/fix churn down. But it's not
> pretty.
> 
> 
> BR,
> Jani.
> 



Thanks,
Mauro

